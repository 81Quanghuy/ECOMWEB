package vn.iotstar.controller.seller;

import java.io.IOException;
import java.nio.file.Path;
import java.sql.Date;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.StringUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;

import vn.iotstar.EcomwebfinallyApplication;
import vn.iotstar.entity.Category;
import vn.iotstar.entity.Product;
import vn.iotstar.entity.Store;
import vn.iotstar.entity.User;
import vn.iotstar.model.CategoryModel;
import vn.iotstar.model.ProductModel;
import vn.iotstar.model.StoreModel;
import vn.iotstar.service.ICategoryService;
import vn.iotstar.service.IProductService;
import vn.iotstar.service.IStoreService;
import vn.iotstar.service.IUserService;

@Controller
@RequestMapping("seller/product")
public class SellerProductController {
	
	private static final Logger log = LoggerFactory.getLogger(EcomwebfinallyApplication.class);
	
	@Autowired
	IProductService productService;
	@Autowired
	ServletContext application;

	@Autowired
	ICategoryService categoryService;

	@Autowired
	IStoreService storeService;

	@Autowired
	IUserService userService;

	@Autowired
	HttpSession session;
	
	@Autowired
	Cloudinary cloudinary;

	@ModelAttribute("categories")
	public List<CategoryModel> getCategories() {
		return categoryService.findAll().stream().map(item -> {
			CategoryModel cate = new CategoryModel();
			BeanUtils.copyProperties(item, cate);
			return cate;
		}).toList();
	}

	@ModelAttribute("stores")
	public List<StoreModel> getStores() {
		return storeService.findAll().stream().map(item -> {
			StoreModel cate = new StoreModel();
			BeanUtils.copyProperties(item, cate);
			return cate;
		}).toList();
	}

	@GetMapping("")
	public String list(ModelMap model) {
		User nguoiban = (User) session.getAttribute("user");
		List<Store> stores = storeService.findByUser(nguoiban);

		if (stores.size() > 0) {
			List<Product> page = productService.findProductByStore(stores.get(0));

			if (page != null) {
				model.addAttribute("sanpham", page);
			}
		}

		return "seller/product/list";
	}

	@GetMapping("add")
	public String add(ModelMap model, HttpSession session) {
		ProductModel product = new ProductModel();
		product.setIsEdit(false);

		model.addAttribute("product", product);
		return "seller/product/addOrEdit";
	}

	@GetMapping("edit/{id}")
	public ModelAndView edit(ModelMap model, @PathVariable("id") int id) throws IOException {
		Optional<Product> opt = productService.findById(id);
		ProductModel product = new ProductModel();
		if (opt.isPresent()) {
			Product entity = opt.get();
			BeanUtils.copyProperties(entity, product);
			product.setIsEdit(true);
			product.setCategoryid(entity.getCategory().getId());
			product.setStoreid(entity.getStore().getId());
			model.addAttribute("product", product);
			return new ModelAndView("seller/product/addOrEdit", model);
		}
		model.addAttribute("error", "Product không tồn tại");
		return new ModelAndView("redirec:/seller/product", model);

	}

	@PostMapping("saveofUpdate")
	public ModelAndView saveOrUpdate(ModelMap model, @Valid @ModelAttribute("product") ProductModel product,
			BindingResult result) {
		Product entity = new Product();

		if (!product.getListImageFile().isEmpty()) {
			
			try {
				Map map = this.cloudinary.uploader().upload(product.getListImageFile().getBytes(),
						ObjectUtils.asMap("resource_type", "auto"));
				String img = (String) map.get("secure_url");
				
				product.setListimage(img);

			} catch (IOException e) {
				log.error("message", e);
			}
		}
		BeanUtils.copyProperties(product, entity);

		// Xử lý Category
		Category uEntity = categoryService.getById(product.getCategoryid());
		entity.setCategory(uEntity);
		// Xử lý Store
		Store proEntity = storeService.getById(product.getStoreid());
		entity.setStore(proEntity);

		long millis = System.currentTimeMillis();
		Date date = new Date(millis);

		if (product.getIsEdit()) {
			entity.setUpdateat(date);
		} else {
			entity.setCreateat(date);
			entity.setUpdateat(date);
		}

		productService.save(entity);
		return new ModelAndView("redirect:/seller/product", model);
	}

	@GetMapping("delete/{id}")
	public ModelAndView delete(ModelMap model, @PathVariable("id") int id) {
		productService.deleteById(id);
		return new ModelAndView("redirect:/seller/product", model);

	}

	@GetMapping("Search")
	public String search(ModelMap model, @RequestParam(name = "name", required = false) String name) {
		List<Product> list = null;
		if (StringUtils.hasText(name)) {
			list = productService.findBynameContaining(name);
		} else {
			list = productService.findAll();
		}
		model.addAttribute("product", list);

		return "seller/product/list";
	}

}
