package vn.iotstar.service;

import java.util.List;
import java.util.Optional;

import org.springframework.data.domain.Example;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;

import vn.iotstar.entity.Order;
import vn.iotstar.entity.Store;
import vn.iotstar.entity.User;

public interface IOrderService {

	void deleteAll();

	Order getById(Integer id);

	void delete(Order entity);

	void deleteById(Integer id);

	long count();

	boolean existsById(Integer id);

	Optional<Order> findById(Integer id);

	<S extends Order> Page<S> findAll(Example<S> example, Pageable pageable);

	List<Order> findAllById(Iterable<Integer> ids);

	List<Order> findAll(Sort sort);

	Page<Order> findAll(Pageable pageable);

	List<Order> findAll();

	<S extends Order> Optional<S> findOne(Example<S> example);

	<S extends Order> S save(S entity);

	Float sumOder(List<Order> oders);

	List<Order> getOrderByStore(Store store);

	List<Order> findByUser(User user);

	Float getTotalPrice(List<Order> orders, Integer id);

	Float getTotalPriceMonth(List<Order> orders, Integer id);

	Float getPrice12Month(List<Order> oders, Integer id, Integer limit);

	List<Order> findAllByOrderByCreateatDesc();

	List<Order> findAllByOrderByIdDesc();

}
