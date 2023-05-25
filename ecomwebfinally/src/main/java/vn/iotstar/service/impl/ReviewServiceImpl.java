package vn.iotstar.service.impl;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.data.domain.Example;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import vn.iotstar.entity.Product;
import vn.iotstar.entity.Review;
import vn.iotstar.entity.Store;
import vn.iotstar.repository.ProductRepository;
import vn.iotstar.repository.ReviewRepository;
import vn.iotstar.repository.StoreRepository;
import vn.iotstar.service.IReviewService;

@Service
public class ReviewServiceImpl implements IReviewService {
	@Autowired
	ReviewRepository ReviewRepository;

	@Autowired
	ProductRepository productRepository;

	@Autowired
	StoreRepository storeRepository;

	@Override
	public <S extends Review> S save(S entity) {

		// Khi thêm hoặc sửa 1 review sẽ tự động update rating cho product liên quan và
		// up date lại rating cho shop
		Optional<Product> product = productRepository.findById(entity.getProduct().getId());
		Product product2 = new Product();
		if (product.isPresent()) {
			product2 = product.get();
		}

		Integer n = product2.getReviews().size();

		Integer rating = 0;

		// rating là kiểu integer

		// rating =

		// List<Store> stores = storeRepository.get

		return ReviewRepository.save(entity);
	}

	@Override
	public List<Review> findByProduct(Product product) {
		return ReviewRepository.findByProduct(product);
	}

	@Override
	public <S extends Review> Optional<S> findOne(Example<S> example) {
		return ReviewRepository.findOne(example);
	}

	@Override
	public List<Review> findAll() {
		return ReviewRepository.findAll();
	}

	@Override
	public Page<Review> findAll(Pageable pageable) {
		return ReviewRepository.findAll(pageable);
	}

	@Override
	public List<Review> findAll(Sort sort) {
		return ReviewRepository.findAll(sort);
	}

	@Override
	public List<Review> findAllById(Iterable<Integer> ids) {
		return ReviewRepository.findAllById(ids);
	}

	@Override
	public <S extends Review> Page<S> findAll(Example<S> example, Pageable pageable) {
		return ReviewRepository.findAll(example, pageable);
	}

	@Override
	public Optional<Review> findById(Integer id) {
		return ReviewRepository.findById(id);
	}

	@Override
	public boolean existsById(Integer id) {
		return ReviewRepository.existsById(id);
	}

	@Override
	public long count() {
		return ReviewRepository.count();
	}

	@Override
	public void deleteById(Integer id) {
		ReviewRepository.deleteById(id);
	}

	@Override
	public void delete(Review entity) {
		ReviewRepository.delete(entity);
	}

	@SuppressWarnings("deprecation")
	@Override
	public Review getById(Integer id) {
		return ReviewRepository.getById(id);
	}

	@Override
	public void deleteAll() {
		ReviewRepository.deleteAll();
	}

}
