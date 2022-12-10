
package vn.iotstar.Controller;

import java.lang.reflect.InvocationTargetException;
import java.sql.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import vn.iotstar.entity.Cart;
import vn.iotstar.entity.Order;
import vn.iotstar.entity.User;
import vn.iotstar.model.UserModel;
import vn.iotstar.service.ICartService;
import vn.iotstar.service.IOrderService;
import vn.iotstar.service.IUserService;

@Controller

public class LoginController {

	@Autowired
	IUserService userService;

	@Autowired
	ICartService cartService;

	@Autowired
	IOrderService orderSerivce;

	@Autowired
	HttpSession session;

	@RequestMapping("login")
	public String home(ModelMap model) {
		model.addAttribute("user", new UserModel());
		return "common/login";
	}

	@PostMapping("login")
	public ModelAndView login(ModelMap model, @RequestParam(name = "username", required = false) String username,
			@RequestParam(name = "password", required = false) String password) {
		/*
		 * if (result.hasErrors()) { model.addAttribute("message","loi"); return new
		 * ModelAndView("common/demologin", model); }
		 */
		User user = userService.login(username, password);
		if (user == null) {
			model.addAttribute("message", "Tài khoản hoặc mật khẩu không chính xác");
			return new ModelAndView("common/login", model);
		}
		session.setAttribute("user", user);
		model.addAttribute("user", user);
		if (user.getRole().equals("ROLE_ADMIN")) {
			return new ModelAndView("redirect:/admin/home", model);
		}
		if (user.getRole().equals("ROLE_SELLER")) {
			return new ModelAndView("redirect:/seller/home", model);
		}
		if (user.getRole().equals("ROLE_USER")) {
			return new ModelAndView("redirect:/", model);
		}
		return null;
	}

	@RequestMapping("logout")
	public String logout(HttpSession sesson) {
		sesson.removeAttribute("user");
		return "redirect:/login";
	}

	@RequestMapping("resgiter")
	public String Resgiter(ModelMap model) {
		return "common/resgiter";
	}

	@PostMapping("resgiter")
	public ModelAndView resgiter(ModelMap model, @RequestParam(name = "username", required = false) String username,
			@RequestParam(name = "password", required = false) String password)
			throws IllegalAccessException, InvocationTargetException {
		boolean check = false;
		UserModel usermodel = new UserModel(username, password);
		List<User> users = userService.findAll();
		for (User user : users) {
			if (user.getUsername().equals(usermodel.getUsername()))
				check = true;

		}
		if (check == true) {
			model.addAttribute("message", "Tên đăng nhập đã tồn tại");
			return new ModelAndView("common/resgiter", model);
		} else {
			// tao user moi
			User user = new User();
			user.setUsername(username);
			user.setPassword(password);
			user.setRole("ROLE_USER");
			long millis = System.currentTimeMillis();
			Date date = new Date(millis);
			user.setCreateat(date);
			user.setUpdateat(date);

			userService.save(user);
			// tao cart va order cho user
			Cart cart = new Cart();
			Order order = new Order();
			cart.setUser(user);
			cart.setCreateat(date);
			cart.setUpdateat(date);
			cartService.save(cart);
			order.setUser(user);
			order.setCreateat(date);
			order.setUpdateat(date);
			orderSerivce.save(order);
			model.addAttribute("message", "Tạo tài khoản thành công!");
			return new ModelAndView("common/resgiter", model);
		}
	}
}
