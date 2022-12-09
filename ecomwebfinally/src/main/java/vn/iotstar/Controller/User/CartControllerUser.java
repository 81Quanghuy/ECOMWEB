package vn.iotstar.Controller.User;

import java.sql.Date;
import java.util.List;
import java.util.Optional;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import vn.iotstar.entity.Cart;
import vn.iotstar.entity.CartItem;
import vn.iotstar.entity.Category;
import vn.iotstar.entity.Delivery;
import vn.iotstar.entity.Order;
import vn.iotstar.entity.Product;
import vn.iotstar.entity.Store;
import vn.iotstar.entity.User;
import vn.iotstar.model.OrderModel;
import vn.iotstar.service.ICartItemService;
import vn.iotstar.service.ICartService;
import vn.iotstar.service.ICategoryService;
import vn.iotstar.service.IDeliveryService;
import vn.iotstar.service.IOrderService;
import vn.iotstar.service.IProductService;
import vn.iotstar.service.IStoreService;
import vn.iotstar.service.IUserService;

@Controller

public class CartControllerUser {
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

	@RequestMapping("cart/{id}")
	public ModelAndView Cart(ModelMap model, HttpSession sesson,
			@PathVariable(name = "id", required = false) Integer id) {
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

		List<Delivery> deliveries = deliveryService.findAll();
		model.addAttribute("deliveries", deliveries);
		model.addAttribute("stores", store);
		model.addAttribute("products", products);
		model.addAttribute("categories", categories);

		return new ModelAndView("user/cart", model);
	}

	@RequestMapping("cart/update/{id}")
	public ModelAndView CartUpdate(ModelMap model, HttpSession sesson,
			@PathVariable(name = "id", required = false) Integer id,
			@RequestParam(name = "count", required = false) Integer count,
			@RequestParam(name = "delivery", required = false) String delivery) {

		Cart cart = cartService.getById(id);
		List<CartItem> cartItems = cart.getCartItems();

		return new ModelAndView("user/cart", model);
	}

	@RequestMapping(value = "/cart/update/{id}", method = RequestMethod.POST)
	public ModelAndView updateTotal(ModelMap model, @Valid @ModelAttribute("id") Integer id, HttpServletRequest req) {
		int count = Integer.parseInt(req.getParameter("count"));
		System.out.print(count);
		Optional<vn.iotstar.entity.Cart> cart = cartService.findById(id);

		return new ModelAndView("redirect:/cart" + cart.get().getId(), model);

	}

	@RequestMapping(value = "order/add", method = RequestMethod.POST)
	public ModelAndView saveOrUpdate(ModelMap model, @Valid @ModelAttribute("order") OrderModel order,
			BindingResult result) {
		/*
		 * if (result.hasErrors()) { return new ModelAndView("seller/orders/add"); }
		 */
		Order entity = new Order();
		// copy từ Model sang entity
		BeanUtils.copyProperties(order, entity);

		// Xử lý Delivery
		Delivery deEntity = deliveryService.getById(order.getDelivereid());
		entity.setDelivery(deEntity);

		// Xử lý Store
		Store stoEntity = storeSerivce.getById(order.getStoreid());
		entity.setStore(stoEntity);

		// Xử lý user
		User uEntity = userService.getById(order.getUserid());
		entity.setUser(uEntity);
		long millis = System.currentTimeMillis();
		Date date = new Date(millis);

		if (order.getIsEdit()) {
			entity.setUpdateat(date);
		} else {
			entity.setCreateat(date);
			entity.setUpdateat(date);
		}

		orderService.save(entity);

		String message = "";
		if (order.getIsEdit() == true) {
			message = "order đã được cập nhật";
		} else {
			message = "order đã được thêm thành công";
		}
		model.addAttribute("message", message);
		return new ModelAndView("redirect:/seller/orders", model);
	}

}
