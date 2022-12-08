
package vn.iotstar.Controller.User;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import vn.iotstar.entity.Cart;
import vn.iotstar.entity.CartItem;
import vn.iotstar.entity.Category;
import vn.iotstar.entity.Product;
import vn.iotstar.entity.Store;
import vn.iotstar.entity.User;
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

	@GetMapping("")
	public ModelAndView List(ModelMap model, HttpSession sesson) {

		User user = (User) sesson.getAttribute("user");
		List<Cart> cart = cartService.findByUser(user);
		List<Store> store = storeSerivce.findAll();
		
		List<Product> products = productService.findAll();
		List<Category> categories = categoryService.findAll();
		List<CartItem> cartItem = null;
		if (cart.size() > 0) {

			cartItem = cartItemService.findByCart(cart.get(0));
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

			cartItem = cartItemService.findByCart(cart.get(0));
			model.addAttribute("cartItems", cartItem);
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
}
