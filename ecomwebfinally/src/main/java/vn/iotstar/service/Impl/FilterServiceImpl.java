package vn.iotstar.service.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import vn.iotstar.Repository.IFilterRepository;
import vn.iotstar.entity.Filter;
import vn.iotstar.service.IFilterService;

@Data
@Service
@AllArgsConstructor
@NoArgsConstructor
public class FilterServiceImpl implements IFilterService {

	@Autowired
	IFilterRepository filterRepository;

	@Override
	public List<Filter> findAll() {
		return filterRepository.findAll();
	}

	@Override
	public long count() {
		return filterRepository.count();
	}

	@Override
	public <S extends Filter> S save(S entity) {
		return filterRepository.save(entity);
	}

}
