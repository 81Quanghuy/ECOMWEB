package vn.iotstar.Controller.Admin;

import java.sql.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import vn.iotstar.entity.User;
import vn.iotstar.service.ICartService;
import vn.iotstar.service.IOrderService;
import vn.iotstar.service.IUserService;

@Controller
@RequestMapping("/admin")
@SessionAttributes("loggedInUser")
public class HomeController {

	@Autowired
	IUserService userService;

	@Autowired
	IOrderService oderService;

	@ModelAttribute("loggedInUser")
	public User loggedInUser() {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		return userService.findOneByUsername(auth.getName());
	}

	@GetMapping("home")
	public String home(ModelMap model, HttpServletRequest request) {
		model.addAttribute("user", getSessionUser(request));
		long millis = System.currentTimeMillis();
		Date date = new Date(millis);
		long count = oderService.count();

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

		// Role = 1 là user tùy chỉnh sau này
		List<User> entity = userService.findByRoleContaining("1");
		int countuser = entity.size();
		model.addAttribute("countuser", countuser);
		// Doanh Thu = số tiền bán được hôm nay

		Float doanhthu = oderService.sumOder(oderService.findAll());
		model.addAttribute("doanhthu", doanhthu);
		return "admin/include/homeAdmin";
	}

	public User getSessionUser(HttpServletRequest request) {
		return (User) request.getSession().getAttribute("loggedInUser");
	}
}
