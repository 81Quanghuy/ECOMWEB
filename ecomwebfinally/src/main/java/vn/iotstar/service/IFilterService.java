package vn.iotstar.service;

import java.util.List;
import java.util.Optional;

import org.springframework.data.domain.Example;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;

import vn.iotstar.Repository.IFilterRepository;
import vn.iotstar.entity.Delivery;
import vn.iotstar.entity.Filter;

public interface IFilterService {

	long count();

	List<Filter> findAll();

	<S extends Filter> S save(S entity);

}
