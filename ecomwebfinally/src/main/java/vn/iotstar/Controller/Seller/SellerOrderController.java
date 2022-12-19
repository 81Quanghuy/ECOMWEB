package vn.iotstar.Controller.Seller;

import java.sql.Date;
import java.util.List;

import java.util.Optional;

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

import vn.iotstar.model.DeliveryModel;
import vn.iotstar.model.StoreModel;
import vn.iotstar.model.UserModel;
import vn.iotstar.model.OrderModel;
import vn.iotstar.entity.Delivery;
import vn.iotstar.entity.Order;
import vn.iotstar.entity.OrderItem;
import vn.iotstar.entity.Store;
import vn.iotstar.entity.User;
import vn.iotstar.service.IDeliveryService;
import vn.iotstar.service.IOrderItemService;
import vn.iotstar.service.IOrderService;
import vn.iotstar.service.IStoreService;
import vn.iotstar.service.IUserService;

@Controller

@RequestMapping("seller/orders")
public class SellerOrderController {
	@Autowired
	IOrderService orderService;

	@Autowired
	IDeliveryService deliveryService;

	@Autowired
	IStoreService storeService;

	@Autowired
	IUserService userService;

	@Autowired
	IOrderItemService orderItemService;

	@Autowired
	HttpSession session;

	// Lấy danh sách delivery trong bảng delivery
	@ModelAttribute("deliveries")
	public List<DeliveryModel> getsellers() {
		return deliveryService.findAll().stream().map(item -> {
			DeliveryModel order = new DeliveryModel();
			BeanUtils.copyProperties(item, order);
			return order;
		}).toList();
	}

	// Lấy danh sách store trong bảng store
	@ModelAttribute("stores")
	public List<StoreModel> getProducts() {
		return storeService.findAll().stream().map(item -> {
			StoreModel order = new StoreModel();
			BeanUtils.copyProperties(item, order);
			return order;
		}).toList();
	}

//	@RequestMapping("")
//	public String list(ModelMap model) {
//
//		User seller = (User) session.getAttribute("user");
//
//		List<Order> orders = orderService.findByUser(seller);
//
//		// List<OrderItem> orderitem = orderItemService.
//
//		model.addAttribute("orders", orders);
//
//		return "seller/orders/list";
//
//	}

	@GetMapping("")
	public String listorderItem(ModelMap model) {
		User seller = (User) session.getAttribute("user");
		List<Store> store = storeService.findByUser(seller);

		if (store.size() > 0) {
			List<OrderItem> orderItems = orderItemService.getOrderItemByStore(store.get(0));
			model.addAttribute("orderItems", orderItems);
		}

		// model.addAttribute("orderItems", null);
		return "seller/orders/oderitem";
	}

	@GetMapping("add")
	public String Add(ModelMap model) {
		OrderModel order = new OrderModel();
		order.setIsEdit(false);
		model.addAttribute("order", order);
		return "seller/orders/add";
	}

	@PostMapping("saveOrUpdate")
	public ModelAndView saveOrUpdate(ModelMap model, @Valid @ModelAttribute("order") OrderModel order,
			BindingResult result) {
		/*
		 * if (result.hasErrors()) { return new ModelAndView("seller/orders/add"); }
		 */
		Order entity = new Order();
		// copy từ Model sang entity
		BeanUtils.copyProperties(order, entity);

		// Xử lý Delivery
		Delivery deEntity = deliveryService.getById(order.getDelivereid());
		entity.setDelivery(deEntity);

		// Xử lý Store
		Store stoEntity = storeService.getById(order.getStoreid());
		entity.setStore(stoEntity);

		// Xử lý user
		User uEntity = userService.getById(order.getUserid());
		entity.setUser(uEntity);
		long millis = System.currentTimeMillis();
		Date date = new Date(millis);

		if (order.getIsEdit()) {
			entity.setUpdateat(date);
		} else {
			entity.setCreateat(date);
			entity.setUpdateat(date);
		}

		orderService.save(entity);

		String message = "";
		if (order.getIsEdit() == true) {
			message = "order đã được cập nhật";
		} else {
			message = "order đã được thêm thành công";
		}
		model.addAttribute("message", message);
		return new ModelAndView("redirect:/seller/orders", model);
	}

	@GetMapping("edit/{id}")
	public ModelAndView edit(ModelMap model, @PathVariable("id") Integer id) {

		Optional<Order> opt = orderService.findById(id);

		OrderModel order = new OrderModel();
		if (opt.isPresent()) {
			Order entity = opt.get();
			BeanUtils.copyProperties(entity, order); // copy từ entity sang model
			order.setIsEdit(true);
			order.setUserid(entity.getUser().getId());
			order.setStoreid(entity.getStore().getId());
			order.setDelivereid(entity.getDelivery().getId());
			model.addAttribute("order", order);
			return new ModelAndView("seller/orders/edit", model);
		}
		// Trả về thông báo
		model.addAttribute("message", "order không tồn tại");
		return new ModelAndView("forward:/seller/orders", model);
	}

	@GetMapping("delete/{id}")
	public ModelAndView delete(ModelMap model, @PathVariable("id") Integer id) {
		orderService.deleteById(id);

		model.addAttribute("message", "order đã được xóa thành công");

		// redirect: chuyển nội dung vào trang mới
		// forward: nhúng nội dung vào một trang nào đó
		return new ModelAndView("redirect:/seller/orders", model);
	}

	// "name" từ phần views truyền xuống
	// required=false: không nhập hiện ra list ban đầu
}
