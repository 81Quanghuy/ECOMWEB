package vn.iotstar.service.Impl;

import java.sql.Date;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Example;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import vn.iotstar.Repository.OrderRepository;
import vn.iotstar.entity.Order;
import vn.iotstar.entity.Store;
import vn.iotstar.entity.User;
import vn.iotstar.service.IOrderService;

@Service
public class OrderServiceImpl implements IOrderService {
	@Autowired
	OrderRepository orderRepository;

	@Override
	public <S extends Order> S save(S entity) {
		return orderRepository.save(entity);
	}

	@Override
	public <S extends Order> Optional<S> findOne(Example<S> example) {
		return orderRepository.findOne(example);
	}

	@Override
	public List<Order> findByUser(User user) {
		return orderRepository.findByUser(user);
	}

	@Override
	public List<Order> findAll() {
		return orderRepository.findAll();
	}

	@Override
	public Page<Order> findAll(Pageable pageable) {
		return orderRepository.findAll(pageable);
	}

	@Override
	public List<Order> findAll(Sort sort) {
		return orderRepository.findAll(sort);
	}

	@Override
	public List<Order> findAllById(Iterable<Integer> ids) {
		return orderRepository.findAllById(ids);
	}

	@Override
	public <S extends Order> Page<S> findAll(Example<S> example, Pageable pageable) {
		return orderRepository.findAll(example, pageable);
	}

	@Override
	public Optional<Order> findById(Integer id) {
		return orderRepository.findById(id);
	}

	@Override
	public boolean existsById(Integer id) {
		return orderRepository.existsById(id);
	}

	@Override
	public long count() {
		return orderRepository.count();
	}

	@Override
	public void deleteById(Integer id) {
		orderRepository.deleteById(id);
	}

	@Override
	public void delete(Order entity) {
		orderRepository.delete(entity);
	}

	@SuppressWarnings("deprecation")
	@Override
	public Order getById(Integer id) {
		return orderRepository.getById(id);
	}

	@Override
	public void deleteAll() {
		orderRepository.deleteAll();
	}

	@Override
	public Float sumOder(List<Order> oders) {
		Float price = (float) 0;
		for (Order order : oders) {
			price = price + order.getPrice();
		}
		return price;
	}

	// Hàm lấy order theo store
	public List<Order> getOrderByStore(Store store) {
		return orderRepository.getOrderByStore(store);
	}

	@SuppressWarnings("deprecation")
	@Override
	public Float getTotalPrice(List<Order> orders, Integer id) {

		Float total = (float) 0;

		long millis = System.currentTimeMillis();
		Date date = new java.sql.Date(millis);

		for (Order oder : orders) {
			if (Math.abs(date.getDate() - oder.getCreateat().getDate()) < 7 && oder.getStore().getId() == id) {
				total = total + oder.getPrice();
			}

		}
		return total;
	}

	@Override
	public Float getTotalPriceMonth(List<Order> orders, Integer id) {

		Float total = (float) 0;

		long millis = System.currentTimeMillis();
		Date date = new java.sql.Date(millis);

		for (Order oder : orders) {
			if (date.getYear() == oder.getCreateat().getYear()) {

			}
//			if (Math.abs(date.getDate() - oder.getCreateat().getDate()) < 7 && oder.getStore().getId() == id) {
//				total = total + oder.getPrice();
//			}

		}
		return total;
	}

	@SuppressWarnings("deprecation")
	@Override
	public Float getPrice12Month(List<Order> oders, Integer id, Integer limit) {

		Float totalPrice = (float) 0;

		long millis = System.currentTimeMillis();
		Date date = new Date(millis);
		//date.setYear(2021);

		int y = 12;
		for (Order order : oders) {

			if (order.getCreateat().getMonth() == (date.getMonth()-limit)) {
				totalPrice = totalPrice + order.getPrice();
			}
		}
		return totalPrice;
	}

	@Override
	public List<Order> findAllByOrderByCreateatDesc() {
		// TODO Auto-generated method stub
		return (List<Order>) orderRepository.findAllByOrderByCreateatDesc();
	}

}
