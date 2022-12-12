package vn.iotstar.Controller.User;

import java.util.List;
import java.util.Optional;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import vn.iotstar.entity.Cart;
import vn.iotstar.entity.CartItem;
import vn.iotstar.entity.Category;
import vn.iotstar.entity.Product;
import vn.iotstar.entity.User;
import vn.iotstar.service.ICartItemService;
import vn.iotstar.service.ICartService;
import vn.iotstar.service.ICategoryService;
import vn.iotstar.service.IProductService;
import vn.iotstar.service.IStoreService;
import vn.iotstar.service.IUserService;

@Controller
public class CategoryControllerUser {

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

	@RequestMapping("category/{id}")
	public String Category(ModelMap model, @PathVariable("id") Integer id) {
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
		
		
		Optional<vn.iotstar.entity.Category> category = categoryService.findById(id);
		if (category.isPresent()) {
			model.addAttribute("category", category.get());
			List<Product> products = productService.findByCategory(category.get());
			model.addAttribute("products", products);
			return "user/category";
		}
		return "user/category";
	}
}
