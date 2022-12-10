package vn.iotstar.service;

import java.util.List;
import java.util.Optional;

import org.springframework.data.domain.Example;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;

import vn.iotstar.entity.Product;
import vn.iotstar.entity.Review;

public interface IReviewService {

	void deleteAll();

	Review getById(Integer id);

	void delete(Review entity);

	void deleteById(Integer id);

	long count();

	boolean existsById(Integer id);

	Optional<Review> findById(Integer id);

	<S extends Review> Page<S> findAll(Example<S> example, Pageable pageable);

	List<Review> findAllById(Iterable<Integer> ids);

	List<Review> findAll(Sort sort);

	Page<Review> findAll(Pageable pageable);

	List<Review> findAll();

	<S extends Review> Optional<S> findOne(Example<S> example);

	<S extends Review> S save(S entity);

	List<Review> findByProduct(Product product);

}
