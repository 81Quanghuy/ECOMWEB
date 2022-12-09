
package vn.iotstar.Controller.User;

import java.io.IOException;
import java.nio.file.Path;
import java.sql.Date;
import java.util.List;
import java.util.Optional;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import vn.iotstar.entity.Cart;
import vn.iotstar.entity.CartItem;
import vn.iotstar.entity.Category;
import vn.iotstar.entity.Product;
import vn.iotstar.entity.Store;
import vn.iotstar.entity.User;
import vn.iotstar.model.UserModel;
import vn.iotstar.service.ICartItemService;
import vn.iotstar.service.ICartService;
import vn.iotstar.service.ICategoryService;
import vn.iotstar.service.IProductService;
import vn.iotstar.service.IStoreService;
import vn.iotstar.service.IUserService;

@Controller

@RequestMapping("")
public class HomeController {

	@Autowired
	HttpSession session;

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

	@GetMapping("")
	public ModelAndView List(ModelMap model, HttpSession sesson) {
		sesson.removeAttribute("message");

		User user = (User) sesson.getAttribute("user");
		List<Cart> cart = cartService.findByUser(user);
		List<Store> stores = storeSerivce.findAll();
		List<Store> store = storeSerivce.findByUser(user);
		List<Product> products = productService.findAll();
		List<Category> categories = categoryService.findAll();
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
		model.addAttribute("stores", stores);
		if (store.size() < 1) {
			model.addAttribute("store", null);

		} else {
			model.addAttribute("store", store.get(0));
		}

		model.addAttribute("products", products);
		model.addAttribute("categories", categories);
		return new ModelAndView("user/home", model);

	}

	@GetMapping("contact")
	public ModelAndView Contact(ModelMap model, HttpSession sesson) {
		User user = (User) sesson.getAttribute("user");
		List<Cart> cart = cartService.findByUser(user);
		List<Store> store = storeSerivce.findAll();

		List<Product> products = productService.findAll();
		List<Category> categories = categoryService.findAll();
		List<CartItem> cartItem = null;
		if (cart.size() > 0) {

			cartItem = cart.get(0).getCartItems();
			model.addAttribute("cartItems", cartItem);
			model.addAttribute("total", cartService.SumCart(cart));
			model.addAttribute("cart", cart.get(0));
		} else {
			cartItem = cartItemService.findByCart(null);
		}
		model.addAttribute("cartitem", cartItem.size());

		model.addAttribute("stores", store);
		model.addAttribute("products", products);
		model.addAttribute("categories", categories);
		return new ModelAndView("user/contact", model);
	}

	@GetMapping("user/profile/{id}")
	public ModelAndView profile(ModelMap model, @PathVariable("id") Integer id) throws IOException {
		User user = (User) session.getAttribute("user");
		model.addAttribute("message", (String) session.getAttribute("message"));
		session.removeAttribute("message");
		List<Cart> cart = cartService.findByUser(user);
		List<Store> store = storeSerivce.findAll();

		List<Product> products = productService.findAll();
		List<Category> categories = categoryService.findAll();
		List<CartItem> cartItem = null;
		if (cart.size() > 0) {

			cartItem = cart.get(0).getCartItems();
			model.addAttribute("cartItems", cartItem);
			model.addAttribute("total", cartService.SumCart(cart));
			model.addAttribute("cart", cart.get(0));
		} else {
			cartItem = cartItemService.findByCart(null);
		}
		model.addAttribute("cartitem", cartItem.size());

		model.addAttribute("stores", store);
		model.addAttribute("products", products);
		model.addAttribute("categories", categories);
		Optional<User> opt = userService.findById(id);
		UserModel usermodel = new UserModel();
		if (opt.isPresent()) {
			User entity = opt.get();
			BeanUtils.copyProperties(entity, usermodel);
			model.addAttribute("user", usermodel);
			return new ModelAndView("user/profile", model);
		}
		model.addAttribute("message", "User không tồn tại");
		return new ModelAndView("redirect:/", model);

	}

	@PostMapping("user/Update")
	public ModelAndView saveOrUpdate(ModelMap model, @Valid @ModelAttribute("user") UserModel user,
			BindingResult result) {
		User entity = new User();

		/*
		 * if (result.hasErrors()) { model.addAttribute("message", "Có lỗi"); return new
		 * ModelAndView("redirect:/user", model); }
		 */

		if (!user.getAvatarFile().isEmpty()) {
			String path = application.getRealPath("/");

			try {
				user.setAvatar(user.getAvatarFile().getOriginalFilename());
				String filePath = path + "/resources/images/user/" + user.getAvatar();
				user.getAvatarFile().transferTo(Path.of(filePath));
				user.setAvatarFile(null);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		BeanUtils.copyProperties(user, entity);
		long millis = System.currentTimeMillis();
		Date date = new Date(millis);

		if (user.getIsEdit()) {
			entity.setUpdateat(date);
		} else {
			entity.setCreateat(date);
			entity.setUpdateat(date);
		}

		userService.save(entity);
		session.setAttribute("message", "Cập nhật tài khoản thành công");
		return new ModelAndView("redirect:/user/profile/" + user.getId(), model);

	}

	@PostMapping("changepassword/{id}")
	public ModelAndView ProjectResgiter(ModelMap model, @PathVariable("id") Integer id,
			@RequestParam(name = "password", required = false) String password,
			@RequestParam(name = "newpassword", required = false) String newpassword,
			@RequestParam(name = "renewpassword", required = false) String renewpassword) {
		User user = userService.getById(id);
		if (!password.equals(user.getPassword())) {
			session.setAttribute("message", "Mật khẩu không chính xác");
			return new ModelAndView("redirect:/user/profile/" + user.getId(), model);
		} else {
			if (!newpassword.equals(renewpassword)) {
				session.setAttribute("message", "Mật khẩu mới khớp");
				return new ModelAndView("redirect:/user/profile/" + user.getId(), model);

			} else {
				user.setPassword(newpassword);
				userService.save(user);
				session.setAttribute("message", "Mật khẩu đã được cập nhập");
				return new ModelAndView("redirect:/user/profile/" + user.getId(), model);

			}
		}
	}

}
