
package vn.iotstar.controller;

import java.lang.reflect.InvocationTargetException;
import java.sql.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import vn.iotstar.entity.Cart;
import vn.iotstar.entity.Filter;
import vn.iotstar.entity.User;
import vn.iotstar.model.UserModel;
import vn.iotstar.service.ICartService;
import vn.iotstar.service.IFilterService;
import vn.iotstar.service.IOrderService;
import vn.iotstar.service.IUserService;

@Controller
public class LoginController {

	@Autowired
	IUserService userService;
	
	@Autowired
	private PasswordEncoder passwordEncoder;

	@Autowired
	ICartService cartService;

	@Autowired
	IOrderService orderSerivce;

	@Autowired
	IFilterService filterService;

	@Autowired
	HttpSession session;
	
	@GetMapping("access-denied")
	public ModelAndView denied(ModelMap model) {
		return new ModelAndView("common/unaccess", model);
	}
	
	@RequestMapping(path = "login", method = RequestMethod.GET)
	public String home(ModelMap model) {

		model.addAttribute("user", new UserModel());
		return "common/login";
	}

	
	@PostMapping("login")
	public ModelAndView login(ModelMap model, @RequestParam(name = "username", required = false) String username,
			@RequestParam(name = "password", required = false) String password) {
        
		List<User> user = userService.findByUsername(username);
		if(user.size()>0) {
			session.setAttribute("user", user.get(0));
			model.addAttribute("user", user.get(0));
			if (user.get(0).getRole().equals("ROLE_ADMIN")) {
				return new ModelAndView("redirect:/admin/home", model);
			}
			if (user.get(0).getRole().equals("ROLE_USER")) {
				User filter = user.get(0);
				Filter login = new Filter();
				long millis = System.currentTimeMillis();
				Date date = new java.sql.Date(millis);
				login.setTimelogin(date);
				login.setUser(filter);
				filterService.save(login);
				return new ModelAndView("redirect:/", model);
			}
		}
		
		return null;
	}

	@RequestMapping(path = "logout", method = RequestMethod.GET)
	public String logout(HttpSession sesson) {
		sesson.removeAttribute("user");
		return "redirect:/login";
	}

	@RequestMapping(path = "resgiter", method = RequestMethod.GET)
	public String Resgiter(ModelMap model) {
		return "common/resgiter";
	}

	@PostMapping("resgiter")
	public ModelAndView resgiter(ModelMap model, @RequestParam(name = "username", required = false) String username,
			@RequestParam(name = "password", required = false) String password) {
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
			user.setPassword(passwordEncoder.encode(password));
			user.setRole("ROLE_USER");
			user.setFirstName("Nguyễn");
			user.setLastName("A");
			long millis = System.currentTimeMillis();
			Date date = new Date(millis);
			user.setCreateat(date);
			user.setUpdateat(date);

			userService.save(user);
			// tao cart cho user
			Cart cart = new Cart();
			cart.setUser(user);
			cart.setCreateat(date);
			cart.setUpdateat(date);
			cartService.save(cart);

			model.addAttribute("message", "Tạo tài khoản thành công!");
			return new ModelAndView("common/resgiter", model);
		}
	}
}
