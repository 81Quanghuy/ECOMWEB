
package vn.iotstar.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import vn.iotstar.entity.User;
import vn.iotstar.service.IUserService;

@Controller

@RequestMapping("login")
public class LoginController {

	@Autowired
	IUserService userService;
	@GetMapping("")
	public String home(ModelMap model) {
		User user = userService.findOneByUsername("admin");
		System.out.print(user.getAvatar());
		return "common/login";
	}
}
