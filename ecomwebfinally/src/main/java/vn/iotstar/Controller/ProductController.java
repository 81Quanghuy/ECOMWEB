package vn.iotstar.Controller;

import java.io.IOException;
import java.nio.file.Path;
import java.sql.Date;
import java.util.List;
import java.util.Optional;

import javax.servlet.ServletContext;
import javax.validation.Valid;

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

import vn.iotstar.entity.Category;
import vn.iotstar.entity.OrderItem;
import vn.iotstar.entity.Product;
import vn.iotstar.entity.Store;
import vn.iotstar.model.CategoryModel;
import vn.iotstar.model.ProductModel;
import vn.iotstar.model.StoreModel;
import vn.iotstar.service.ICategoryService;
import vn.iotstar.service.IOrderItemService;
import vn.iotstar.service.IProductService;
import vn.iotstar.service.IStoreService;

@Controller
@RequestMapping("admin/product")
public class ProductController {
	@Autowired
	IProductService productService;
	@Autowired
	ServletContext application;

	@Autowired
	ICategoryService categoryService;

	@Autowired
	IStoreService storeService;

	@Autowired
	IOrderItemService orderItemService;

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
		List<Product> page = productService.findAll();
		model.addAttribute("product", page);
		return "admin/product/list";
	}

	@GetMapping("add")
	public String add(ModelMap model) {
		ProductModel product = new ProductModel();
		product.setIsEdit(false);
		model.addAttribute("product", product);
		return "admin/product/addOrEdit";
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
			return new ModelAndView("admin/product/addOrEdit", model);
		}
		model.addAttribute("error", "Product kh??ng t???n t???i");
		return new ModelAndView("redirec:/admin/product", model);

	}

	@PostMapping("saveofUpdate")
	public ModelAndView saveOrUpdate(ModelMap model, @Valid @ModelAttribute("product") ProductModel product,
			BindingResult result) {
		Product entity = new Product();

		/*
		 * // N???u ko c?? gi?? tr??? g?? l???i if (result.hasErrors()) {
		 * model.addAttribute("error", "C?? l???i"); return new
		 * ModelAndView("product/addOrEdit"); }
		 */

		if (!product.getListImageFile().isEmpty()) {
			String path = application.getRealPath("/");

			try {
				product.setListimage(product.getListImageFile().getOriginalFilename());
				String filePath = path + "/resources/images/admin/product/" + product.getListimage();
				product.getListImageFile().transferTo(Path.of(filePath));
				product.setListImageFile(null);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		BeanUtils.copyProperties(product, entity);

		// X??? l?? Category
		Category uEntity = categoryService.getById(product.getCategoryid());
		entity.setCategory(uEntity);
		// X??? l?? Store
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
		return new ModelAndView("redirect:/admin/product", model);
	}

	@GetMapping("delete/{id}")
	public ModelAndView delete(ModelMap model, @PathVariable("id") int id) {

		Optional<Product> products = productService.findById(id);
		List<OrderItem> orderItems = orderItemService.findByProduct(products.get());
		if (orderItems.size() > 0) {
			model.addAttribute("error", "Kh??ng th??? x??a v?? s???n ph???m ??ang ???????c b??n. X??a C?? th??? ???nh h?????ng ?????n doanh thu.");
			return new ModelAndView("redirect:/admin/product", model);
		}
		productService.deleteById(id);
		model.addAttribute("message", "X??a th??nh c??ng");
		return new ModelAndView("redirect:/admin/product", model);

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

		return "admin/product/list";
	}

}
