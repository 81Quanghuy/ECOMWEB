
package vn.iotstar.controller.user;

import java.io.IOException;
import java.sql.Date;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.cloudinary.Cloudinary;
import com.cloudinary.Transformation;
import com.cloudinary.utils.ObjectUtils;

import vn.iotstar.EcomwebfinallyApplication;
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
	
	private static final Logger log = LoggerFactory.getLogger(EcomwebfinallyApplication.class);

	@Autowired
	PasswordEncoder passwordEncoder;
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
	
	@Autowired
	Cloudinary cloudinary;

	@GetMapping("")
	public ModelAndView List(ModelMap model, HttpSession sesson) {
		sesson.removeAttribute("message");

		User user = (User) sesson.getAttribute("user");
		List<Cart> cart = cartService.findByUser(user);
		List<Store> stores = storeSerivce.findAll();

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
		List<Store> store = storeSerivce.findByUser(user);
		if (store.size() < 1) {
			model.addAttribute("store", null);

		} else {
			model.addAttribute("store", store.get(0));
		}

		model.addAttribute("products", products);
		model.addAttribute("categories", categories);
		return new ModelAndView("user/home", model);

	}
	
//	@GetMapping("/notfound")
//    public String notFoundPage() {
//        return "notfound"; // Trả về tên view tương ứng
//    }

	@GetMapping("contact")
	public ModelAndView Contact(ModelMap model, HttpSession sesson) {
		User user = (User) sesson.getAttribute("user");
		List<Cart> cart = cartService.findByUser(user);
		List<Store> stores = storeSerivce.findAll();

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
		List<Store> store = storeSerivce.findByUser(user);
		if (store.size() < 1) {
			model.addAttribute("store", null);

		} else {
			model.addAttribute("store", store.get(0));
		}

		model.addAttribute("stores", stores);
		model.addAttribute("products", products);
		model.addAttribute("categories", categories);
		return new ModelAndView("user/contact", model);
	}

	@GetMapping("user/profile")
	public String profile(ModelMap model,HttpSession session) throws IOException {
		User user = (User) session.getAttribute("user");
		model.addAttribute("message", (String) session.getAttribute("message"));
		session.removeAttribute("message");
		UserModel usermodel = new UserModel();
		BeanUtils.copyProperties(user, usermodel);
		model.addAttribute("user", usermodel);
		List<Cart> cart = cartService.findByUser(user);
		List<Store> stores = storeSerivce.findAll();

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
		List<Store> store = storeSerivce.findByUser(user);
		if (store.size() < 1) {
			model.addAttribute("store", null);

		} else {
			model.addAttribute("store", store.get(0));
		}

		model.addAttribute("stores", stores);
		model.addAttribute("products", products);
		model.addAttribute("categories", categories);
		Optional<User> opt = userService.findById(user.getId());
		System.out.println(Integer.valueOf(opt.get().getId()));
		System.out.println(usermodel.getId());
		if( Integer.valueOf(opt.get().getId()).compareTo(Integer.valueOf(usermodel.getId()))==0 )// kiểm tra id truyền xuống server và id của user hiện tại có  trùng hay không
		{// nếu là 1 user được phép xem
			if (opt.isPresent()) {
			User entity = opt.get();
			BeanUtils.copyProperties(entity, usermodel);
			model.addAttribute("user", usermodel);
			return "user/profile";
			}
		model.addAttribute("message", "User không tồn tại");
		return "user/home";
		}
		// Nếu không trùng, thông báo không có quyền truy cập
		model.addAttribute("message", "Bạn không có quyền truy cập tài khoản này");
		return "user/home";
			

	}

	
	@PostMapping("user/update")
	public ModelAndView saveOrUpdate(ModelMap model, @ModelAttribute("user") UserModel user) {
		User entity = new User();

		/*
		 * if (result.hasErrors()) { model.addAttribute("message", "Có lỗi"); return new
		 * ModelAndView("redirect:/user", model); }
		 */

		if (!user.getAvatarFile().isEmpty()) {
			
			try {
				Map map = this.cloudinary.uploader().upload(user.getAvatarFile().getBytes(),
						ObjectUtils.asMap("resource_type", "auto",
								"transformation", new Transformation().width(50).height(50).crop("fill")));
				String img = (String) map.get("secure_url");
				
				user.setAvatar(img);

			} catch (IOException e) {
				System.out.print(e);
			}
		}
		String userRole = userService.findById(user.getId()).get().getRole();
		BeanUtils.copyProperties(user, entity);
		entity.setRole(userRole);
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
		return new ModelAndView("redirect:/user/profile" , model);

	}

	@PostMapping("changepassword/{id}")
	public ModelAndView ProjectResgiter(ModelMap model, @PathVariable("id") Integer id,
			@RequestParam(name = "password", required = false) String password,
			@RequestParam(name = "newpassword", required = false) String newpassword,
			@RequestParam(name = "renewpassword", required = false) String renewpassword) {
		User user = userService.getById(id);
		if (!passwordEncoder.matches(password, user.getPassword())) {
			session.setAttribute("message", "Mật khẩu không chính xác");
			return new ModelAndView("redirect:/user/profile" );
		} else {
			if (!newpassword.equals(renewpassword)) {
				session.setAttribute("message", "Mật khẩu mới khớp");
				return new ModelAndView("redirect:/user/profile" );

			} else {
				user.setPassword(passwordEncoder.encode(newpassword));
				userService.save(user);
				session.setAttribute("message", "Mật khẩu đã được cập nhập");
				return new ModelAndView("redirect:/user/profile");

			}
		}
	}
}
