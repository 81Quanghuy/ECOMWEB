package vn.iotstar.controller.seller;

import java.sql.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import vn.iotstar.entity.Filter;
import vn.iotstar.entity.Order;
import vn.iotstar.entity.OrderItem;
import vn.iotstar.entity.Product;
import vn.iotstar.entity.Review;
import vn.iotstar.entity.Store;
import vn.iotstar.entity.User;
import vn.iotstar.service.IFilterService;
import vn.iotstar.service.IOrderItemService;
import vn.iotstar.service.IOrderService;
import vn.iotstar.service.IProductService;
import vn.iotstar.service.IReviewService;
import vn.iotstar.service.IStoreService;
import vn.iotstar.service.IUserService;

@Controller
@RequestMapping("/seller")
public class SellerController {

	@Autowired
	IUserService userService;

	@Autowired
	IOrderService orderService;

	@Autowired
	IFilterService filterService;

	@Autowired
	IProductService productService;

	@Autowired
	IReviewService reviewService;

	@Autowired
	IStoreService storeService;

	@Autowired
	IOrderItemService orderItemService;

	@Autowired
	HttpSession session;

//	@ModelAttribute("seller")
//	public User getSeller() {
//		User seller = (User) session.getAttribute("user");
//		return seller;
//	}

	@GetMapping("home")
	public String home(ModelMap model, HttpServletRequest request) {

		User seller = (User) session.getAttribute("user");
		model.addAttribute("admin", seller);
		long millis = System.currentTimeMillis();
		Date date = new Date(millis);

		long count = orderService.count();

		// Ngày tháng năm hiện tại
		@SuppressWarnings("deprecation")
		int day = date.getDay();
		@SuppressWarnings("deprecation")
		int month = date.getMonth();
		@SuppressWarnings("deprecation")
		int year = date.getYear();

		model.addAttribute("day", day);
		model.addAttribute("month", month);
		model.addAttribute("year", year);

		// truyền lên số lượng đơn hàng.
		// model.addAttribute("odercountodercount", count); //

		model.addAttribute("countuser", countUser());
		model.addAttribute("countadmin", countAdmin());
		model.addAttribute("countseller", countSeller());
		// Doanh Thu = số tiền bán được hôm nay

		List<Store> store = storeService.findByUser(seller);
		if (store.size() > 0) {
			List<OrderItem> orderItems = orderItemService.getOrderItemByStore(store.get(0));
			Double doanhthu = 0.0;
			if (orderItems != null) {
				doanhthu = orderItemService.doanhThu(orderItems);
			}

			List<Order> listo = orderService.getOrderByStore(store.get(0));
			if (listo.size() > 0) {
				model.addAttribute("odercount", listo.size());
			}

			model.addAttribute("doanhthu", doanhthu);
		}

		// Float doanhthu = orderService.getTotalPrice(orders,

		// seller.getStores().getId());

		if (orderService.findByStore(store.get(0)) != null) {
			List<Order> listoders = orderService.findAllByOrderByCreateatDesc();
			model.addAttribute("listoder", listoders);

			List<Filter> filters = filterService.findAll();

			model.addAttribute("filters", filters);
			List<Product> product = productService.findAllByOrderBySoldDesc();
			model.addAttribute("products", product);

			List<Order> orders = orderService.findByStore(store.get(0));

			if (orders.size() > 0) {

				Float doanhthu12 = orderService.getPrice12Month(orders, seller.getStores().getId(), 0);
				model.addAttribute("doanhthu12", doanhthu12);

				Float doanhthu11 = orderService.getPrice12Month(orders, seller.getStores().getId(), 1);
				model.addAttribute("doanhthu11", doanhthu11);

				Float doanhthu10 = orderService.getPrice12Month(orders, seller.getStores().getId(), 2);
				model.addAttribute("doanhthu10", doanhthu10);

				Float doanhthu9 = orderService.getPrice12Month(orders, seller.getStores().getId(), 3);
				model.addAttribute("doanhthu9", doanhthu9);

				Float doanhthu8 = orderService.getPrice12Month(orders, seller.getStores().getId(), 4);
				model.addAttribute("doanhthu8", doanhthu8);

				Float doanhthu7 = orderService.getPrice12Month(orders, seller.getStores().getId(), 5);
				model.addAttribute("doanhthu7", doanhthu7);

				Float doanhthu6 = orderService.getPrice12Month(orders, seller.getStores().getId(), 6);
				model.addAttribute("doanhthu6", doanhthu6);

				Float doanhthu5 = orderService.getPrice12Month(orders, seller.getStores().getId(), 7);
				model.addAttribute("doanhthu5", doanhthu5);

				Float doanhthu4 = orderService.getPrice12Month(orders, seller.getStores().getId(), 8);
				model.addAttribute("doanhthu4", doanhthu4);

				Float doanhthu3 = orderService.getPrice12Month(orders, seller.getStores().getId(), 9);
				model.addAttribute("doanhthu3", doanhthu3);

				Float doanhthu2 = orderService.getPrice12Month(orders, seller.getStores().getId(), 10);
				model.addAttribute("doanhthu2", doanhthu2);

				Float doanhthu1 = orderService.getPrice12Month(orders, seller.getStores().getId(), 11);
				model.addAttribute("doanhthu1", doanhthu1);
			}
		}

		return "seller/include/homeSeller";

	}

	

	public Integer countUser() {
		Integer count = 0;
		// Role = 1 là user tùy chỉnh sau này
		List<User> entity = userService.findByRoleContaining("ROLE_USER");
		count = entity.size();
		return count;
	}

	public Integer countAdmin() {
		Integer count = 0;
		// Role = 1 là user tùy chỉnh sau này
		List<User> entity = userService.findByRoleContaining("ROLE_ADMIN");
		count = entity.size();
		return count;
	}

	public Integer countSeller() {
		Integer count = 0;
		// Role = 1 là user tùy chỉnh sau này
		List<User> entity = userService.findByRoleContaining("ROLE_SELLER");
		count = entity.size();
		return count;
	}

	// Hiển thị danh sách đánh giá sản phẩm của cửa hàng đó
	@GetMapping("/reviews")
	public String list(ModelMap model) {

		// gọi hàm findAll() trong service

		List<Review> list = reviewService.findAll();

		// chuyển dữ liệu từ list lên biến views

		model.addAttribute("review", getReview(list.get(0)));

		model.addAttribute("reviews", list);

		return "seller/reviews/list";

	}

	@GetMapping("user")
	public String myInfo(ModelMap model) {

		// gọi hàm findAll() trong service

		List<Review> list = reviewService.findAll();

		// chuyển dữ liệu từ list lên biến views

		model.addAttribute("reviews", list);

		return "seller/reviews/list";

	}

	@GetMapping("infoSore")
	public String infoStore(ModelMap model) {
		User seller = (User) session.getAttribute("user");
		model.addAttribute("admin", seller);
		List<Store> store = storeService.findByUser(seller);
		model.addAttribute("store", store.get(0));
		return "seller/user/profileStore";
	}

	@RequestMapping(path = "profile", method = RequestMethod.GET)
	public String proifile(ModelMap model) {
		User seller = (User) session.getAttribute("user");
		
		List<Store> store = storeService.findByUser(seller);
		model.addAttribute("store", store.get(0));
		model.addAttribute("seller", seller);
		model.addAttribute("admin", seller);
		return "/seller/user/profile";
	}

	public String getReview(Review review) {
		return "Khách hàng " + review.getUser().getLastName() + "Đã đánh giá " + review.getRating().toString()
				+ " cho sản phẩm " + review.getProduct().getName();

	}
}
