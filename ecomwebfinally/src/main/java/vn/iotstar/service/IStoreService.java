
package vn.iotstar.service;

import java.util.List;
import java.util.Optional;

import org.springframework.data.domain.Example;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;

import vn.iotstar.entity.Store;
import vn.iotstar.entity.User;

public interface IStoreService {

	void deleteAll();

	Store getById(Integer id);

	void delete(Store entity);

	void deleteById(Integer id);

	long count();

	boolean existsById(Integer id);

	Optional<Store> findById(Integer id);

	<S extends Store> Page<S> findAll(Example<S> example, Pageable pageable);

	List<Store> findAllById(Iterable<Integer> ids);

	List<Store> findAll(Sort sort);

	Page<Store> findAll(Pageable pageable);

	List<Store> findAll();

	<S extends Store> Optional<S> findOne(Example<S> example);

	<S extends Store> S save(S entity);

	// List<Store> findByUserContaining(List<User> user);
	Store findByUserContaining(User user);

	Store findByNameContaining(String name);

	String findStoreOfUser(List<Store> stores, Integer id);

	List<Store> getStoreByUser(User user);

	List<Store> findByUser(User user);

}
