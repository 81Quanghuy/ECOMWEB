package vn.iotstar.service.Impl;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.data.domain.Example;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import vn.iotstar.entity.Review;
import vn.iotstar.Repository.ReviewRepository;
import vn.iotstar.service.IReviewService;

@Service
public class ReviewServiceImpl implements IReviewService {
	@Autowired
	ReviewRepository ReviewRepository;

	@Override
	public <S extends Review> S save(S entity) {
		return ReviewRepository.save(entity);
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
