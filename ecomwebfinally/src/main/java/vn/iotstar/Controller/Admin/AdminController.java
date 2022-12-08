package vn.iotstar.Controller.Admin;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import vn.iotstar.entity.User;
import vn.iotstar.service.IUserService;

@Controller
@RequestMapping("/admin")
@SessionAttributes("loggedInUser")
public class AdminController {

	@Autowired
	IUserService userService;

	/*
	 * @ModelAttribute("loggedInUser") public User loggedInUser() { Authentication
	 * auth = SecurityContextHolder.getContext().getAuthentication(); return
	 * userService.findOneByUsername(auth.getName()); }
	 */

	@GetMapping("home")
	public String home(ModelMap model, HttpServletRequest request) {
		model.addAttribute("user", getSessionUser(request));

		return "admin/home";
	}

	public User getSessionUser(HttpServletRequest request) {
		return (User) request.getSession().getAttribute("loggedInUser");
	}
}
