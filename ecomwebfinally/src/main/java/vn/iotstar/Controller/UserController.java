package vn.iotstar.Controller;

import java.io.IOException;
import java.nio.file.Path;
import java.sql.Date;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;

import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.servlet.ModelAndView;

import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;

import vn.iotstar.entity.User;
import vn.iotstar.model.UserModel;
import vn.iotstar.service.IUserService;

@Controller
@RequestMapping("/admin/user")
public class UserController {

	@Autowired
	IUserService userService;

	@Autowired
	ServletContext application;

	@Autowired
	Cloudinary cloudinary;

	@GetMapping("")
	public String list(ModelMap model) {
		List<User> user = userService.findByRoleContaining("ROLE_USER");
		model.addAttribute("users", user);
		return "admin/user/list";
	}

	@GetMapping("/add")
	public String seachnotify(ModelMap model, HttpSession sesson) {
		UserModel user = new UserModel();
		user.setIsEdit(false);
		model.addAttribute("user", user);
		return "admin/user/addOrEdit";

	}

	@GetMapping("edit/{id}")
	public ModelAndView edit(ModelMap model, @PathVariable("id") Integer id) throws IOException {
		Optional<User> opt = userService.findById(id);
		UserModel user = new UserModel();
		if (opt.isPresent()) {
			User entity = opt.get();
			BeanUtils.copyProperties(entity, user);
			user.setIsEdit(true);
			model.addAttribute("user", user);
			return new ModelAndView("admin/user/addOrEdit", model);
		}
		model.addAttribute("message", "User không tồn tại");
		return new ModelAndView("redirect:/user", model);

	}

	@PostMapping("saveOrUpdate")
	public ModelAndView saveOrUpdate(ModelMap model, @Valid @ModelAttribute("user") UserModel user,
			BindingResult result) {
		User entity = new User();

		if (!user.getAvatarFile().isEmpty()) {

			try {
				Map map = this.cloudinary.uploader().upload(user.getAvatarFile().getBytes(),
						ObjectUtils.asMap("resource_type", "auto"));
				String img = (String) map.get("secure_url");
				
				user.setAvatar(img);

			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		BeanUtils.copyProperties(user, entity);
		long millis = System.currentTimeMillis();
		Date date = new Date(millis);

		if (user.getIsEdit()) {
			entity.setUpdateat(date);
		} else {
			entity.setCreateat(date);
			entity.setUpdateat(date);
		}

		userService.save(entity);
		return new ModelAndView("redirect:/admin/user", model);

	}

	@GetMapping("delete/{id}")
	public ModelAndView delete(ModelMap model, @PathVariable("id") Integer id) {
		userService.deleteById(id);
		return new ModelAndView("redirect:/admin/user", model);
	}
}
