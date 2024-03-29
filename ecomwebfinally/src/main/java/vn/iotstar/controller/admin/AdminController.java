package vn.iotstar.controller.admin;

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
import org.springframework.web.bind.support.SessionStatus;

import vn.iotstar.entity.Filter;
import vn.iotstar.entity.Order;
import vn.iotstar.entity.Product;
import vn.iotstar.entity.Store;
import vn.iotstar.entity.User;
import vn.iotstar.service.IFilterService;
import vn.iotstar.service.IOrderService;
import vn.iotstar.service.IProductService;
import vn.iotstar.service.IStoreService;
import vn.iotstar.service.IUserService;

@Controller
@RequestMapping("/admin")
public class AdminController {

	@Autowired
	IUserService userService;

	@Autowired
	IOrderService orderService;

	@Autowired
	IFilterService filterService;

	@Autowired
	IProductService productService;

	@Autowired
	IStoreService storeService;
	
	@Autowired
	HttpSession session;
	

	@GetMapping("home")
	public String home(ModelMap model, HttpServletRequest request) {
		
		User admin = (User) session.getAttribute("user");
		model.addAttribute("admin", admin);
		
		
		model.addAttribute("user", admin);
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

		List<User> list = userService.getNewUser(userService.findByRoleContaining("ROLE_USER"));

		// Người dùng mới
		model.addAttribute("countnew", list.size());
		// Doanh Thu = số tiền bán được hôm nay

		Float doanhthu = orderService.sumOder(orderService.findAll());
		model.addAttribute("doanhthu", doanhthu);

		List<Filter> filters = filterService.findAll();

		model.addAttribute("filters", filters);
		List<Product> product = productService.findTop3ByOrderBySoldDesc();
		model.addAttribute("products", product);

		// Danh Sách order xếp mới nhất
		List<Order> listoders = orderService.findAllByOrderByIdDesc();
		model.addAttribute("listoder", listoders);
		

		return "admin/include/homeAdmin";
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

	@RequestMapping(path = "/orders", method = RequestMethod.GET)
	public String list(ModelMap model) {

		// gọi hàm findAll() trong service

		List<Order> list = orderService.findAll();
		// chuyển dữ liệu từ list lên biến views

		model.addAttribute("orders", list);
		return "admin/orders/list";
	}

	@RequestMapping(path = "/seller", method = RequestMethod.GET)
	public String listseller(ModelMap model) {

		// gọi hàm findAll() trong service

		List<User> list = userService.findByRoleContaining("ROLE_SELLER");
		// chuyển dữ liệu từ list lên biến views

		model.addAttribute("users", list);
		return "admin/user/list";
	}

	@RequestMapping(path = "/newuser", method = RequestMethod.GET)
	public String listnewuser(ModelMap model) {

		// gọi hàm findAll() trong service

		List<User> list = userService.getNewUser(userService.findByRoleContaining("ROLE_USER"));
		
		model.addAttribute("cnewuser", list.size());

		// Tìm ra người dùng có ngày tạo vào hôm nay
		model.addAttribute("users", list);
		return "admin/user/list";
	}

	@RequestMapping(path = "/newstore", method = RequestMethod.GET)
	public String listnewstore(ModelMap model) {
		// Cửa hàng mới
		List<Store> storenews = storeService.getNewStore(storeService.findAll());
		model.addAttribute("cnewstore", storenews.size());
		model.addAttribute("stores", storenews);
		return "/admin/store/newStore";
	}
	

}
