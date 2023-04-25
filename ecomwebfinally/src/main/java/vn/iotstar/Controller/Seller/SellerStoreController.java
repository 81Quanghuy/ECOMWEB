package vn.iotstar.Controller.Seller;

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

import vn.iotstar.entity.*;
import vn.iotstar.model.*;
import vn.iotstar.service.IStoreService;

@Controller
@RequestMapping("/seller/store")
public class SellerStoreController {

	@Autowired
	IStoreService storeservice;

	@Autowired
	ServletContext application;

	@Autowired
	HttpSession session;
	
	@Autowired
	Cloudinary cloudinary;

	@GetMapping("")
	public ModelAndView list(ModelMap model) {

		User seller = (User) session.getAttribute("user");
		List<Store> store = storeservice.findByUser(seller);
		// List<Store> page = storeservice.findAll();
		model.addAttribute("stores", store);
		return new ModelAndView("seller/store/listStore", model);
	}

	@GetMapping("add")
	public String add(ModelMap model) {
		StoreModel store = new StoreModel();
		store.setIsEdit(false);// thêm
		model.addAttribute("store", store);
		return "admin/store/addOrEdit";

	}

	@GetMapping("edit/{id}")
	public ModelAndView edit(ModelMap model, @PathVariable("id") Integer id) throws IOException {
		Optional<Store> opt = storeservice.findById(id);
		StoreModel store = new StoreModel();
		// User seller = (User) session.getAttribute("user");
		if (opt.isPresent()) {
			Store entity = opt.get();
			BeanUtils.copyProperties(entity, store);
			store.setIsEdit(true);
			// store.setOwnerid(seller.getId());
			model.addAttribute("store", store);
			return new ModelAndView("seller/store/addOrEdit", model);
		}
		model.addAttribute("message", "cửa hàng không tồn tại");
		return new ModelAndView("forward:/seller/store", model);

	}

	@PostMapping("saveOrUpdate")
	public ModelAndView saveOrUpdate(ModelMap model, @Valid @ModelAttribute("store") StoreModel store,
			BindingResult result) {
		Store entity = new Store();
		if (result.hasErrors()) {
			model.addAttribute("message", "Có lỗi");
			return new ModelAndView("seller/store/addOrEdit");
		}

		if (!(store.getAvatarFile().isEmpty() || store.getFeaturedimagesFile().isEmpty())) {
			
			try {
				Map mapAvatar = this.cloudinary.uploader().upload(store.getAvatarFile().getBytes(),
						ObjectUtils.asMap("resource_type", "auto"));
				String imgAvatar = (String) mapAvatar.get("secure_url");
				
				store.setAvatar(imgAvatar);
				
				Map mapFeatured = this.cloudinary.uploader().upload(store.getFeaturedimagesFile().getBytes(),
						ObjectUtils.asMap("resource_type", "auto"));
				
				String imgFeatured = (String) mapFeatured.get("secure_url");
				
				store.setFeaturedimages(imgFeatured);

			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		BeanUtils.copyProperties(store, entity);
		long millis = System.currentTimeMillis();
		Date date = new Date(millis);

		if (store.getIsEdit()) {
			entity.setUpdaeat(date);
		} else {
			entity.setCreateat(date);
			entity.setUpdaeat(date);
		}

		storeservice.save(entity);
		String message = "";
		if (store.getIsEdit() == true) {
			message = "Store Update succesfull !";
		} else {
			message = "Store Create Successfull !";
		}
		model.addAttribute("message", message);
		return new ModelAndView("redirect:/seller/store", model);
	}

	@GetMapping("delete/{id}")
	public ModelAndView delete(ModelMap model, @PathVariable("id") int id) {
		storeservice.deleteById(id);
		return new ModelAndView("redirect:/seller/store", model);

	}

	@GetMapping("view/{id}")
	public String infoStore(ModelMap model, @PathVariable("id") Integer id) {
		// seller = (User) session.getAttribute("user");
		Optional<Store> store = storeservice.findById(id);
		model.addAttribute("store", store.get());
		return "seller/user/profileStore";
	}
}
