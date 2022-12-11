package vn.iotstar.Controller.Admin;

import java.sql.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import vn.iotstar.Repository.IFilterRepository;
import vn.iotstar.entity.Filter;
import vn.iotstar.entity.Order;
import vn.iotstar.entity.Product;
import vn.iotstar.entity.User;
import vn.iotstar.service.IFilterService;
import vn.iotstar.service.IOrderService;
import vn.iotstar.service.IProductService;
import vn.iotstar.service.IUserService;

@Controller
@RequestMapping("/admin")
@SessionAttributes("loggedInUser")
public class AdminController {

	@Autowired
	IUserService userService;

	@Autowired
	IOrderService orderService;

	@Autowired
	IFilterService filterService;

	@Autowired
	IProductService productService;

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
		List<Product> product = productService.findTop3ByOrderBySoldDesc();
		model.addAttribute("products", product);

		return "admin/include/homeAdmin";
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

	@RequestMapping("orders") 
	public String list(ModelMap model) {

		// gọi hàm findAll() trong service

		List<Order> list = orderService.findAll();
		// chuyển dữ liệu từ list lên biến views

		model.addAttribute("orders", list);
		return "admin/orders/list";
	}
	
	
}
