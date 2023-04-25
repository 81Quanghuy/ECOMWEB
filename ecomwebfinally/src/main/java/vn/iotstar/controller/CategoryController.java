package vn.iotstar.controller;

import java.io.IOException;
import java.nio.file.Path;
import java.sql.Date;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.stream.Collectors;
import java.util.stream.IntStream;

import javax.servlet.ServletContext;
import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.StringUtils; //co the lay sai thu vien
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;

import vn.iotstar.EcomwebfinallyApplication;
import vn.iotstar.entity.Category;
import vn.iotstar.entity.User;
import vn.iotstar.model.CategoryModel;
import vn.iotstar.model.UserModel;
import vn.iotstar.service.ICategoryService;

@Controller
@RequestMapping("admin/categories")
public class CategoryController {
	
	private static final Logger log = LoggerFactory.getLogger(EcomwebfinallyApplication.class);

	@Autowired
	ICategoryService categoryService;

	@Autowired
	ServletContext application;

	@Autowired
	Cloudinary cloudinary;
	
	@RequestMapping(path = "", method = RequestMethod.GET)
	public String list(ModelMap model) {

		// gọi hàm findAll() trong service

		List<Category> list = categoryService.findAll();

		// chuyển dữ liệu từ list lên biến categories

		model.addAttribute("categories", list);

		return "admin/categories/list";

	}

	@GetMapping("add")
	public String add(ModelMap model) {
		CategoryModel cate = new CategoryModel();
		cate.setIsEdit(false);
		model.addAttribute("categories", cate);

		return "admin/categories/addOrEdit";

	}

	@PostMapping("saveOrUpdate")
	public ModelAndView saveOrUpdate(ModelMap model, @Valid @ModelAttribute("category") CategoryModel cate,
			BindingResult result) {
		Category entity = new Category();

		if (!cate.getImageFile().isEmpty()) {
			try {
				Map map = this.cloudinary.uploader().upload(cate.getImageFile().getBytes(),
						ObjectUtils.asMap("resource_type", "auto"));
				String img = (String) map.get("secure_url");
				
				cate.setImage(img);

			} catch (IOException e) {
				log.error("message", e);
			}
		}
		BeanUtils.copyProperties(cate, entity);
		long millis = System.currentTimeMillis();
		Date date = new Date(millis);

		if (cate.getIsEdit()) {
			entity.setUpdateat(date);
		} else {
			entity.setCreateat(date);
			entity.setUpdateat(date);
		}

		categoryService.save(entity);
		return new ModelAndView("redirect:/admin/categories", model);

	}
//
//	@PostMapping("saveOrUpdate")
//	public ModelAndView saveOrUpdate(ModelMap model, @Valid @ModelAttribute("category") CategoryModel cate,
//			BindingResult result) // Tra ve chuoi result
//	{
//
//		Category entity = new Category();
//		if (!(cate.getImageFile().isEmpty())) {
//			String path = application.getRealPath("/");
//
//			try {
//
//				cate.setImage(cate.getImageFile().getOriginalFilename());
//				String filePath = path + "/resources/images/admin/" + cate.getImage();
//				cate.getImageFile().transferTo(Path.of(filePath));
//				cate.setImageFile(null);
//
//			} catch (Exception e) {
//				e.printStackTrace();
//			}
//		}
//		BeanUtils.copyProperties(cate, entity); // do du lieu tu model sang entity
//		long millis = System.currentTimeMillis();
//		Date datet = new Date(millis);
//		if (cate.getIsEdit().equals(true)) {
//			entity.setUpdateat(datet);
//
//		} else {
//			entity.setCreateat(datet);
//			entity.setUpdateat(datet);
//		}
//
//		categoryService.save(entity);
//
//		String message = "";
//		if (cate.getIsEdit() == true) {
//			message = "Category Update succesfull !";
//		} else {
//			message = "Category Create Successfull !";
//		}
//
//		model.addAttribute("message", message);
//		return new ModelAndView("redirect:/admin/categories", model);
//
//	}

	@GetMapping("edit/{id}")
	public ModelAndView edit(ModelMap model, @PathVariable("id") Integer categoryId) {
		// xet category ton tai hay chua coppoy du lieu tu entity => model
		Optional<Category> opt = categoryService.findById(categoryId);
		CategoryModel cate = new CategoryModel();
		if (opt.isPresent()) {
			Category entity = opt.get();
			BeanUtils.copyProperties(entity, cate);
			cate.setIsEdit(true);
			model.addAttribute("category", cate);
			return new ModelAndView("/admin/categories/addOrEdit", model);
		}
		model.addAttribute("message", "Category is not vaild !!!");
		return new ModelAndView("redirect:/admin/categories", model);

	}

	@GetMapping("delete/{id}")
	public ModelAndView delete(ModelMap model, @PathVariable("id") Integer id) {
		categoryService.deleteById(id);
		model.addAttribute("message", "Category Delete Succesfull !!!");

		return new ModelAndView("redirect:/admin/categories", model);

	}

	@GetMapping("search")
	public String search(ModelMap model, @RequestParam(name = "name", required = false) String name) // lay len tat ca
	{
		List<Category> list = null;
		if (StringUtils.hasText(name)) {
			list = categoryService.findByNameContaining(name);
		} else {
			list = categoryService.findAll();
		}
		model.addAttribute("categories", list);
		return "admin/categories/search";

	}

	@GetMapping("searchpagenated")
	public String search(ModelMap model, @RequestParam(name = "name1", required = false) String name,
			@RequestParam("page") Optional<Integer> page, @RequestParam("size") Optional<Integer> size) {

		// Tong mau tin trong category services

		int count = (int) categoryService.count();
		int currentpage = page.orElse(1);
		int pageSize = size.orElse(3); // load len 3 mau tin
		Pageable pageable = PageRequest.of(currentpage - 1, pageSize, Sort.by("id"));
		Page<Category> resultPage = null;
		if (StringUtils.hasText(name)) {
			resultPage = categoryService.findByNameContaining(name, pageable);

			model.addAttribute("name1", name);
		} else {
			resultPage = categoryService.findAll(pageable);
		}

		int totalPages = resultPage.getTotalPages();
		if (totalPages > 0) {
			int start = Math.max(1, currentpage - 2);
			int end = Math.min(currentpage + 2, totalPages);
			if (totalPages > count) {
				if (end == totalPages) {
					start = end - count;
				} else if (start == 1)
					end = start + count;
			}
			List<Integer> pageNumbers = IntStream.rangeClosed(start, end).boxed().collect(Collectors.toList());
			model.addAttribute("pageNumbers", pageNumbers);

		}

		model.addAttribute("categoryPage", resultPage);
		return "admin/categories/list";

	}

}
