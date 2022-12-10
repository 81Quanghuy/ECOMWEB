package vn.iotstar.Controller.User;

import java.sql.Date;
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

	@Autowired
	HttpSession session;

	// hiển thị giỏ hàng
	@RequestMapping("cart")
	public ModelAndView Cart(ModelMap model, HttpSession sesson) {
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

	// cập nhật giỏ hàng

	@RequestMapping(value = "/cart/update/{id}", method = RequestMethod.POST)
	public ModelAndView updateTotal(ModelMap model, @PathVariable(name = "id", required = false) Integer id,
			HttpServletRequest req, HttpSession sesson) {

		int count = Integer.parseInt(req.getParameter("count"));

		CartItem cartItem = cartItemService.getById(id);
		cartItem.setCount(count);
		cartItemService.save(cartItem);
		return new ModelAndView("redirect:/cart", model);

	}

	// thêm sản phẩm giỏ hàng
	@GetMapping("store/add/{id}")
	public ModelAndView addCart(ModelMap model, @PathVariable(name = "id", required = false) Integer id) {

		User user = (User) session.getAttribute("user");
		List<Cart> cart = cartService.findByUser(user);
		Product product = productService.getById(id);
		// check product co trong cart chưa
		boolean check = false;

		if (cart.size() > 0) {
			List<CartItem> cartItems = cartItemService.findByCart(cart.get(0));
			// kiểm tra có chưa
			for (CartItem cartitem : cartItems) {
				if (cartitem.getProduct().equals(product))
					check = true;
			}

			// chưa có
			if (!check) {
				CartItem entity = new CartItem();
				entity.setProduct(product);
				entity.setCart(cart.get(0));
				long millis = System.currentTimeMillis();
				Date date = new Date(millis);
				entity.setCreateat(date);
				entity.setUpdateat(date);
				entity.setCount(1);
				cartItemService.save(entity);
				session.setAttribute("message", "Đã thêm sản phẩm thành công");

			}
			// sản phẩm có trong giỏ hàng
			else {

				List<CartItem> cartitems = cartItemService.findByProduct(product);
				CartItem cartitem = cartitems.get(0);
				cartitem.setCount(cartitem.getCount() + 1);
				cartItemService.save(cartitem);
				session.setAttribute("message", "Sản phẩm đã có trong giỏ hàng");

			}

		}
		return new ModelAndView("redirect:/cart", model);
	}

	@GetMapping("cartItem/delete/{id}")
	public ModelAndView delete(ModelMap model, @PathVariable("id") Integer id) {
		User user = (User) session.getAttribute("user");
		List<Cart> cart = cartService.findByUser(user);
		if (cart.size() > 0) {
			cartItemService.deleteById(id);
			session.setAttribute("message", "Xóa thành công");
		}
		return new ModelAndView("redirect:/cart/", model);
	}
}
