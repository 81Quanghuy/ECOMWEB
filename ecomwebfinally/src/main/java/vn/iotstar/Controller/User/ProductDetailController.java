package vn.iotstar.Controller.User;

import java.sql.Date;
import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import vn.iotstar.entity.Cart;
import vn.iotstar.entity.CartItem;
import vn.iotstar.entity.Order;
import vn.iotstar.entity.OrderItem;
import vn.iotstar.entity.Product;
import vn.iotstar.entity.Review;
import vn.iotstar.entity.User;
import vn.iotstar.model.ReviewModel;
import vn.iotstar.service.ICartItemService;
import vn.iotstar.service.ICartService;
import vn.iotstar.service.ICategoryService;
import vn.iotstar.service.IDeliveryService;
import vn.iotstar.service.IOrderService;
import vn.iotstar.service.IProductService;
import vn.iotstar.service.IReviewService;
import vn.iotstar.service.IStoreService;
import vn.iotstar.service.IUserService;

@Controller
@RequestMapping("product")
public class ProductDetailController {
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
	IReviewService reviewService;
	@Autowired
	HttpSession session;

	@GetMapping("detail/{id}")
	public ModelAndView updateTotal(ModelMap model, @Valid @ModelAttribute("id") Integer id) {
		User user = (User) session.getAttribute("user");
		List<Cart> cart = cartService.findByUser(user);
		session.setAttribute("productid", id);
		List<Order> order = orderService.findByUser(user);
		boolean check = false;
		Product product = productService.getById(id);
		List<Product> products = productService.findByCategory(product.getCategory());
		List<CartItem> cartItems = null;
		List<OrderItem> orderItems = null;
		if (cart.size() > 0) {

			cartItems = cart.get(0).getCartItems();
			model.addAttribute("cartItems", cartItems);

			model.addAttribute("total", cartService.SumCart(cart));
			model.addAttribute("cart", cart.get(0));
		} else {
			cartItems = cartItemService.findByCart(null);
		}
		if (order.size() > 0) {
			orderItems = order.get(0).getOrderitems();
			for (OrderItem cartItem : orderItems) {
				if (cartItem.getProduct().getId().equals(product.getId()))
					check = true;
			}
		}
		// List review
		List<Review> reviews = reviewService.findByProduct(product);
		model.addAttribute("reviews", reviews);
		model.addAttribute("checkreview", check);
		model.addAttribute("cartitem", cartItems.size());
		model.addAttribute("product", product);
		model.addAttribute("products", products);

		return new ModelAndView("user/product-detail", model);

	}

	@PostMapping("review")
	public ModelAndView Review(ModelMap model, @Valid @ModelAttribute("review") ReviewModel review) {
		Review entity = new Review();
		// copy từ Model sang entity
		BeanUtils.copyProperties(review, entity);

		// Xử lý User
		User user = (User) session.getAttribute("user");
		Integer productid = (Integer) session.getAttribute("productid");
		entity.setUser(user);
		// Xử lý Product
		Product proEntity = productService.getById(productid);
		entity.setProduct(proEntity);

		long millis = System.currentTimeMillis();
		Date date = new Date(millis);

		if (review.getIsEdit()) {
			entity.setUpdateat(date);
		} else {
			entity.setCreateat(date);
			entity.setUpdateat(date);
		}

		reviewService.save(entity);

		String message = "";
		if (review.getIsEdit() == true) {
			message = "Review đã được cập nhật";
		} else {
			message = "Review đã được thêm thành công";
		}
		model.addAttribute("message", message);
		session.removeAttribute("productid");
		return new ModelAndView("redirect:/product/detail/" + productid, model);

	}

	@RequestMapping("hot")
	public String getProducthot(ModelMap model) {

		// gọi hàm findAll() trong service

		List<Product> list = productService.findTop10ByOrderBySoldDesc();
		// chuyển dữ liệu từ list lên biến views

		model.addAttribute("products", list);
		return "admin/orders/list";
	}
}
