package vn.iotstar.Controller.Seller;

import java.sql.Date;
import java.util.List;
import java.util.Optional;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import vn.iotstar.entity.Filter;
import vn.iotstar.entity.Product;
import vn.iotstar.entity.Review;
import vn.iotstar.entity.Store;
import vn.iotstar.entity.User;
import vn.iotstar.model.UserModel;
import vn.iotstar.service.IFilterService;
import vn.iotstar.service.IOrderService;
import vn.iotstar.service.IProductService;
import vn.iotstar.service.IReviewService;
import vn.iotstar.service.IStoreService;
import vn.iotstar.service.IUserService;

@Controller
@RequestMapping("/seller")
@SessionAttributes("loggedInUser")
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
	@GetMapping("home")
	public String home(ModelMap model, HttpServletRequest request) {
		model.addAttribute("user", getSessionUser(request));
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
		model.addAttribute("odercount", count); //

		model.addAttribute("countuser", countUser());
		model.addAttribute("countadmin", countAdmin());
		model.addAttribute("countseller", countSeller());
		// Doanh Thu = số tiền bán được hôm nay

		Float doanhthu = orderService.sumOder(orderService.findAll());
		model.addAttribute("doanhthu", doanhthu);

		List<Filter> filters = filterService.findAll();

		model.addAttribute("filters", filters);
		List<Product> product = productService.findAllByOrderBySoldDesc();
		model.addAttribute("products", product);

		return "seller/include/homeSeller";
	}

	public User getSessionUser(HttpServletRequest request) {
		return (User) request.getSession().getAttribute("loggedInUser");
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

	@GetMapping("/reviews")
	public String list(ModelMap model) {

		// gọi hàm findAll() trong service

		List<Review> list = reviewService.findAll();

		// chuyển dữ liệu từ list lên biến views

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
	
	@GetMapping("/infoSore/{id}")
	public String infoStore(ModelMap model, HttpSession session, @PathVariable("id") Integer id) {
		//Optional<User> seller = userService.findById(id);
		String nameStore = storeService.findStoreOfUser(storeService.findAll(), id);
		Store store = storeService.findByNameContaining(nameStore);
		model.addAttribute("store", store);
		return "seller/user/profileStore";
	}
	@RequestMapping("profile/{id}")
	public String proifile(ModelMap model, HttpSession session, @PathVariable("id") Integer id) {
		//String username = (String) session.getAttribute("user");
		Optional<User> seller = userService.findById(id);
		String nameStore = storeService.findStoreOfUser(storeService.findAll(), id);
		UserModel user = new UserModel();
		if(seller.isPresent())
		{
			User entity = seller.get();
			BeanUtils.copyProperties(entity, user);
			model.addAttribute("seller", user);
			model.addAttribute("store", nameStore);
			return "/seller/user/profile";
		}
		
		return "/seller/home";
	}
}
