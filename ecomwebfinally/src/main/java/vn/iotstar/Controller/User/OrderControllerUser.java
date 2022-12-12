package vn.iotstar.Controller.User;

import java.sql.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import vn.iotstar.entity.Cart;
import vn.iotstar.entity.CartItem;
import vn.iotstar.entity.Delivery;
import vn.iotstar.entity.Order;
import vn.iotstar.entity.OrderItem;
import vn.iotstar.entity.User;
import vn.iotstar.service.ICartItemService;
import vn.iotstar.service.ICartService;
import vn.iotstar.service.ICategoryService;
import vn.iotstar.service.IDeliveryService;
import vn.iotstar.service.IOrderItemService;
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
	IOrderItemService orderItemService;
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

		return new ModelAndView("user/order", model);
	}

	// thêm giỏ hàng vào đơn hàng
	@RequestMapping(value = "order/add")
	public ModelAndView list(ModelMap model, HttpServletRequest req, HttpSession sesson) {

		User user = (User) session.getAttribute("user");
		List<Cart> cart = cartService.findByUser(user);
		List<Order> orders = orderService.findByUser(user);

		long millis = System.currentTimeMillis();
		Date date = new Date(millis);

		List<CartItem> cartItem = null;
		if (cart.size() > 0) {

			Float sumTotal = cartService.SumCart(cart);
			int deviveryId = Integer.parseInt(req.getParameter("delivery"));

			String address = req.getParameter("address");
			Delivery delivery = deliveryService.getById(deviveryId);

			Order order = orders.get(0);
			order.setPrice((sumTotal + delivery.getPrice()));

			order.setDelivery(delivery);
			order.setStore(cart.get(0).getStore());

			order.setAddress(address);
			order.setStatus("Đang xác nhận");
			// Xử lý Store
			order.setStore(cart.get(0).getStore());

			// Xử lý user
			order.setUser(user);

			order.setCreateat(date);
			order.setUpdateat(date);

			orderService.save(order);

			OrderItem orderItem = new OrderItem();
			cartItem = cart.get(0).getCartItems();
			for (int i = 0; i < cartItem.size(); i++) {
				orderItem.setCount(cartItem.get(i).getCount());
				orderItem.setCreateat(date);
				orderItem.setUpdateat(date);
				orderItem.setProduct(cartItem.get(i).getProduct());
				orderItem.setOrder(orders.get(0));
				orderItemService.save(orderItem);
			}

			String message = "order đã được thêm thành công";
			model.addAttribute("message", message);
			return new ModelAndView("redirect:/order", model);
		}
		return null;
	}

}
