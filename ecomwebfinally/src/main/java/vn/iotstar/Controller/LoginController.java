
package vn.iotstar.Controller;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import vn.iotstar.entity.User;
import vn.iotstar.model.UserModel;
import vn.iotstar.service.IUserService;

@Controller

public class LoginController {

	@Autowired
	IUserService userService;

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
			return new ModelAndView("redirect:/admin", model);
		}
		if (user.getRole().equals("ROLE_SELLER")) {
			return new ModelAndView("redirect:/seller", model);
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
}
