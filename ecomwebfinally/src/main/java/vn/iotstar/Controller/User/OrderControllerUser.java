package vn.iotstar.Controller.User;

import java.util.List;
import java.util.Optional;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import vn.iotstar.entity.Cart;
import vn.iotstar.entity.CartItem;
import vn.iotstar.entity.Category;
import vn.iotstar.entity.Order;
import vn.iotstar.entity.OrderItem;
import vn.iotstar.entity.Product;
import vn.iotstar.entity.Store;
import vn.iotstar.entity.User;
import vn.iotstar.service.ICartItemService;
import vn.iotstar.service.ICartService;
import vn.iotstar.service.ICategoryService;
import vn.iotstar.service.IDeliveryService;
import vn.iotstar.service.IOrderService;
import vn.iotstar.service.IProductService;
import vn.iotstar.service.IStoreService;
import vn.iotstar.service.IUserService;

@Controller
public class OrderControllerUser {
	@Autowired
	IUserService userService;

	@Autowired
	IStoreService storeSerivce;

	@Autowired
	IProductService productService;

	@Autowired
	ICartItemService cartItemService;

	@Autowired
	IDeliveryService deliveryService;

	@Autowired
	ICartService cartService;

	@Autowired
	IOrderService orderService;

	@Autowired
	ICategoryService categoryService;
	@Autowired
	HttpSession session;

	@RequestMapping("order")
	public ModelAndView Order(ModelMap model) {
		User user = (User) session.getAttribute("user");
		List<Cart> cart = cartService.findByUser(user);
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

		List<Order> order = orderService.findByUser(user);
		if (order.size() > 0) {

			model.addAttribute("order", order.get(0));
			List<OrderItem> orderItems = order.get(0).getOrderitems();
			model.addAttribute("orderItems", orderItems);

		}
		model.addAttribute("order", null);
		return new ModelAndView("user/order", model);
	}
}
