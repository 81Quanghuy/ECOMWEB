package vn.iotstar.service;

import java.util.List;
import java.util.Optional;

import org.springframework.data.domain.Example;
import org.springframework.data.domain.Sort;

import vn.iotstar.entity.CartItem;
import vn.iotstar.entity.Product;

public interface IProductService {

	void deleteAll();

	Product getById(Integer id);

	void delete(Product entity);

	Product getOne(Integer id);

	void deleteById(Integer id);

	long count();

	<S extends Product> boolean exists(Example<S> example);

	<S extends Product> long count(Example<S> example);

	Optional<Product> findById(Integer id);

	List<Product> findAll();

	<S extends Product> S save(S entity);

	List<Product> findBynameContaining(String name);

	List<Product> findByCartItem(CartItem cartItem);

	<S extends Product> List<S> findAll(Example<S> example, Sort sort);

	List<Product> findAll(Sort sort);

	List<Product> findAllByOrderBySoldDesc();

}
