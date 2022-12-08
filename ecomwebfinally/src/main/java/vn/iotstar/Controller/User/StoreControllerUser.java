package vn.iotstar.Controller.User;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import vn.iotstar.service.IStoreService;
import vn.iotstar.entity.Store;

@Controller
@RequestMapping("store")
public class StoreControllerUser {

	@Autowired
	IStoreService storeService;

	@GetMapping("")
	public ModelAndView Store(ModelMap model, HttpSession sesson) {
		List<Store> store = storeService.findAll();
		model.addAttribute("stores",store);
		return new ModelAndView("store/list");
	}
}
