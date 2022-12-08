package vn.iotstar.service.Impl;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Example;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import vn.iotstar.Repository.IFilterRepository;
import vn.iotstar.entity.Delivery;
import vn.iotstar.service.IFilterService;

@Service
@Data
@AllArgsConstructor
@NoArgsConstructor
public class FilterServiceImpl implements IFilterService {

	@Autowired
	IFilterRepository filterRepository;

	public <S extends Delivery> S save(S entity) {
		return filterRepository.save(entity);
	}

	public <S extends Delivery> Optional<S> findOne(Example<S> example) {
		return filterRepository.findOne(example);
	}

	public List<Delivery> findAll() {
		return filterRepository.findAll();
	}

	public Page<Delivery> findAll(Pageable pageable) {
		return filterRepository.findAll(pageable);
	}

	public List<Delivery> findAll(Sort sort) {
		return filterRepository.findAll(sort);
	}

	public List<Delivery> findAllById(Iterable<Integer> ids) {
		return filterRepository.findAllById(ids);
	}

	public Optional<Delivery> findById(Integer id) {
		return filterRepository.findById(id);
	}

	public long count() {
		return filterRepository.count();
	}

	@SuppressWarnings("deprecation")
	public Delivery getOne(Integer id) {
		return filterRepository.getOne(id);
	}

	@SuppressWarnings("deprecation")
	public Delivery getById(Integer id) {
		return filterRepository.getById(id);
	}
	
	

}
