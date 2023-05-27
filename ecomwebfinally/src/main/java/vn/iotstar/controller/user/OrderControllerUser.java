package vn.iotstar.controller.user;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import vn.iotstar.entity.Cart;
import vn.iotstar.entity.CartItem;
import vn.iotstar.entity.Category;
import vn.iotstar.entity.Delivery;
import vn.iotstar.entity.Order;
import vn.iotstar.entity.OrderItem;
import vn.iotstar.entity.Store;
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

	@SuppressWarnings("all")
	private void addCartItemsAtt(List<CartItem> cartItem, ModelMap model) {
		model.addAttribute("cartItems", cartItem);
	}

	@SuppressWarnings("all")
	private void addTotal(Float sum, ModelMap model) {
		model.addAttribute("total", sum);
	}

	@GetMapping(path = "order")
	public ModelAndView order(ModelMap model) {
		User user = (User) session.getAttribute("user");
		if (user == null) {
			return new ModelAndView("common/login", model);
		} else {

			List<Cart> cart = cartService.findByUser(user);
			List<CartItem> cartItem = new ArrayList<>();
			List<Order> orders = orderService.findByUser(user);
			List<Order> orderActive = orderService.findByIsactive(true);

			if (!cart.isEmpty()) {
				cartItem = cart.get(0).getCartItems();
				model.addAttribute("cart", cart.get(0));
				System.out.print("Size cartItem" + cartItem.size());
				addCartItemsAtt(cartItem, model);
			}
			List<Order> orderList = new ArrayList<>();
			for (Order order : orders) {
				for (Order orde : orderActive) {
					if (order.equals(orde)) {
						orderList.add(order);
					}
				}
			}
			List<Store> store = storeSerivce.findByUser(user);
			if (store.isEmpty()) {
				model.addAttribute("store", null);

			} else {
				model.addAttribute("store", store.get(0));
			}

			model.addAttribute("orders", orderList);
			addTotal(orderService.sumOder(orderList), model);

			return new ModelAndView("user/order", model);
		}
	}

	// thêm giỏ hàng vào đơn hàng
	@RequestMapping(value = "order/add")
	public ModelAndView list(ModelMap model, HttpServletRequest req, HttpSession sesson) {

		User user = (User) session.getAttribute("user");
		List<Cart> cart = cartService.findByUser(user);

		long millis = System.currentTimeMillis();
		Date date = new Date(millis);

		List<CartItem> cartItem = null;
		if (!cart.isEmpty()) {

			Float sumTotal = cartService.SumCart(cart);
			int deviveryId = Integer.parseInt(req.getParameter("delivery"));

			String address = req.getParameter("address");
			if (address.equals("")) {
				address = user.getAddress();
			}
			Delivery delivery = deliveryService.getById(deviveryId);

			Order order = new Order();
			order.setPrice((sumTotal + delivery.getPrice()));

			String phone = (req.getParameter("phone"));
			if (phone.equals("")) {
				phone = user.getPhone();
			}
			order.setPhone(phone);
			order.setDelivery(delivery);
			order.setStore(cart.get(0).getStore());

			order.setAddress(address);
			order.setStatus("1");
			// Xử lý Store
			order.setStore(cart.get(0).getStore());
			order.setIsactive(true);
			// Xử lý user
			order.setUser(user);

			order.setCreateat(date);
			order.setUpdateat(date);

			orderService.save(order);

			cartItem = cart.get(0).getCartItems();

			for (int i = 0; i < cartItem.size(); i++) {
				OrderItem orderItem = new OrderItem();
				orderItem.setCount(cartItem.get(i).getCount());
				orderItem.setCreateat(date);
				orderItem.setUpdateat(date);
				orderItem.setProduct(cartItem.get(i).getProduct());
				orderItem.setOrder(order);
				orderItemService.save(orderItem);
			}

			cartItemService.deleteInBatch(cartItem);

			String message = "order đã được thêm thành công";
			model.addAttribute("message", message);
		}
		return new ModelAndView("redirect:/order", model);
	}

	@RequestMapping(value = "/order/detail/{id}")
	public ModelAndView orderDetail(ModelMap model, @PathVariable(name = "id", required = false) Integer id) {
			
		Order order = orderService.getById(id);
		model.addAttribute("order", order);
		List<OrderItem> orderItems = orderItemService.findByOrder(order);
		model.addAttribute("orderItems", orderItems);
		return new ModelAndView("user/orderItems", model);

	}

	@GetMapping("order/delete/{id}")
	public ModelAndView cartDelete(ModelMap model, @PathVariable("id") Integer id) {

		Order order = orderService.getById(id);
		order.setIsactive(false);
		orderService.save(order);
		model.addAttribute("message", "Hủy đơn hàng thành công !!!");

		return new ModelAndView("redirect:/order", model);

	}

	@GetMapping(path = "order/noactive")
	public String noActive(ModelMap model) {
		User user = (User) session.getAttribute("user");
		if (user == null) {
			return "common/login";
		}
		{
//			List<Cart> cart = cartService.findByUser(user);
//			List<Category> categories = categoryService.findAll();
//			List<CartItem> cartItem = new ArrayList<>();
//			
//			if (!cart.isEmpty()) {
//				cartItem = cart.get(0).getCartItems();
//				addCartItemAtt(cartItem, model);
//				addTotal(cartService.SumCart(cart), model);
//				model.addAttribute("cart", cart.get(0));
//			}
//			addCartItemAtt(cartItem, model);
//			model.addAttribute("categories", categories);

			List<Order> orders = orderService.findByUser(user);
			List<Order> orderActive = orderService.findByIsactive(false);
			List<Order> orderList = new ArrayList<>();
			for (Order order : orders) {
				for (Order orde : orderActive) {
					if (order.equals(orde)) {
						orderList.add(order);
					}
				}
			}
			model.addAttribute("orders", orderList);
			return "user/orderNoActive";
		}

	}
}
