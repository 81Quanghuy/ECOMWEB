package vn.iotstar.controller.user;

import java.io.IOException;
import java.nio.file.Path;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;

import vn.iotstar.EcomwebfinallyApplication;
import vn.iotstar.entity.Cart;
import vn.iotstar.entity.CartItem;
import vn.iotstar.entity.Category;
import vn.iotstar.entity.Product;
import vn.iotstar.entity.Store;
import vn.iotstar.entity.User;
import vn.iotstar.model.StoreModel;
import vn.iotstar.service.ICartItemService;
import vn.iotstar.service.ICartService;
import vn.iotstar.service.ICategoryService;
import vn.iotstar.service.IProductService;
import vn.iotstar.service.IStoreService;
import vn.iotstar.service.IUserService;

@Controller
public class StoreControllerUser {
	
	private static final Logger log = LoggerFactory.getLogger(EcomwebfinallyApplication.class);


	@Autowired
	IStoreService storeService;

	@Autowired
	IUserService userService;

	@Autowired
	IStoreService storeSerivce;

	@Autowired
	IProductService productService;

	@Autowired
	ICartItemService cartItemService;

	@Autowired
	ICartService cartService;

	@Autowired
	ICategoryService categoryService;

	@Autowired
	ServletContext application;

	@Autowired
	HttpSession session;
	
	@Autowired
	Cloudinary cloudinary;

	@GetMapping("store")
	public ModelAndView Store(ModelMap model, HttpSession sesson) {

		User user = (User) sesson.getAttribute("user");
		List<Cart> cart = cartService.findByUser(user);
		List<CartItem> cartItem;
		if (cart.size() > 0) {

			cartItem = cart.get(0).getCartItems();
			model.addAttribute("cartItems", cartItem);
			model.addAttribute("total", cartService.SumCart(cart));
			model.addAttribute("cart", cart.get(0));
		} else {
			cartItem = cartItemService.findByCart(null);
		}
		model.addAttribute("cartitem", cartItem.size());
		List<Store> store = storeSerivce.findByUser(user);
		if (store.size() < 1) {
			model.addAttribute("store", null);

		} else {
			model.addAttribute("store", store.get(0));
		}

		List<Category> categories = categoryService.findAll();
		model.addAttribute("categories", categories);
		List<Store> stores = storeSerivce.findByIsactive(true);
		model.addAttribute("stores", stores);

		return new ModelAndView("store/list");
	}

	@GetMapping("store/register")
	public String Register(ModelMap model) {
		model.addAttribute("message", session.getAttribute("message"));
		session.removeAttribute("message");
		return "user/store-register";
	}

	@PostMapping("store/register")
	public ModelAndView saveOrUpdate(ModelMap model, @Valid @ModelAttribute("store") StoreModel store,
			BindingResult result) {

		List<Store> stores = storeSerivce.findAll();
		if (stores.size() > 0) {

			for (int i = 0; i < stores.size(); i++) {
				if (store.getName().equals(stores.get(i).getName())) {
					session.setAttribute("message", "Tên shop đã tồn tại trong hệ thống");
					return new ModelAndView("redirect:/store/register", model);
				}
			}
		}
		Store entity = new Store();
		if (result.hasErrors()) {
			model.addAttribute("message", "Có lỗi");
			return new ModelAndView("admin/addOrEdit");
		}

		if (!(store.getAvatarFile().isEmpty() || store.getFeaturedimagesFile().isEmpty())) {
			
			try {
				Map mapAvatar = this.cloudinary.uploader().upload(store.getAvatarFile().getBytes(),
						ObjectUtils.asMap("resource_type", "auto"));
				String imgAvatar = (String) mapAvatar.get("secure_url");
				
				store.setAvatar(imgAvatar);
				
				Map mapFeatured = this.cloudinary.uploader().upload(store.getFeaturedimagesFile().getBytes(),
						ObjectUtils.asMap("resource_type", "auto"));
				
				String imgFeatured = (String) mapFeatured.get("secure_url");
				
				store.setFeaturedimages(imgFeatured);

			} catch (IOException e) {
				log.error("message", e);
			}
		}
		BeanUtils.copyProperties(store, entity);
		long millis = System.currentTimeMillis();
		Date date = new Date(millis);

		entity.setIsactive(true);		
		if (store.getIsEdit()) {
			entity.setUpdaeat(date);
		} else {
			entity.setCreateat(date);
			entity.setUpdaeat(date);
		}

		entity.setRating(0);
		User user = (User) session.getAttribute("user");
		entity.setUser(user);
		storeSerivce.save(entity);
		String message = "";
		if (store.getIsEdit() == true) {
			message = "Store Update succesfull !";
		} else {
			message = "Store Create Successfull !";
		}

		model.addAttribute("message", message);
		return new ModelAndView("redirect:/store", model);

	}

	@RequestMapping(path = "store/{id}", method = RequestMethod.GET)
	public ModelAndView StoreDetail(ModelMap model, @PathVariable("id") Integer id) {
		User user = (User) session.getAttribute("user");
		List<Cart> cart = cartService.findByUser(user);
		List<CartItem> cartItem;
		if (cart.size() > 0) {

			cartItem = cart.get(0).getCartItems();
			model.addAttribute("cartItems", cartItem);
			model.addAttribute("total", cartService.SumCart(cart));
			model.addAttribute("cart", cart.get(0));
		} else {
			cartItem = cartItemService.findByCart(null);
		}
		model.addAttribute("cartitem", cartItem.size());

		List<Category> categories = categoryService.findAll();
		model.addAttribute("categories", categories);

		Store store = storeSerivce.getById(id);
		model.addAttribute("store", store);
		List<Product> products = productService.findProductByStore(store);
		model.addAttribute("products", products);
		return new ModelAndView("store/detail", model);
	}

	@RequestMapping(path = "store/category/{id}", method = RequestMethod.GET)
	public ModelAndView StoreCategory(ModelMap model, @PathVariable("id") Integer id) {
		User user = (User) session.getAttribute("user");
		List<Cart> cart = cartService.findByUser(user);
		List<CartItem> cartItem;
		if (cart.size() > 0) {

			cartItem = cart.get(0).getCartItems();
			model.addAttribute("cartItems", cartItem);
			model.addAttribute("total", cartService.SumCart(cart));
			model.addAttribute("cart", cart.get(0));
		} else {
			cartItem = cartItemService.findByCart(null);
		}
		model.addAttribute("cartitem", cartItem.size());

		List<Category> categories = categoryService.findAll();
		List<Store> stores = storeSerivce.findByIsactive(true);
		List<Store> storeCate = new ArrayList<Store>();
		for (Store store : stores) {
			if (storeSerivce.findStorebyCategory(store, id).equals(true)) {
				storeCate.add(store);
			}
		}
		if (storeCate.size() > 0) {
			model.addAttribute("stores", storeCate);
		}
		model.addAttribute("categories", categories);
		return new ModelAndView("store/store-category", model);
	}
}
