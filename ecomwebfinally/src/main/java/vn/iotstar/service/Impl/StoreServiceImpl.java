package vn.iotstar.service.Impl;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Example;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import vn.iotstar.Repository.StoreRepository;
import vn.iotstar.entity.Category;
import vn.iotstar.entity.Product;
import vn.iotstar.entity.Store;
import vn.iotstar.entity.User;
import vn.iotstar.service.ICategoryService;
import vn.iotstar.service.IProductService;
import vn.iotstar.service.IStoreService;

@Service
public class StoreServiceImpl implements IStoreService {
	@Autowired
	StoreRepository StoreRepository;

	@Autowired
	ICategoryService categorySerivce;

	@Autowired
	IProductService productService;

	@Override
	public <S extends Store> S save(S entity) {
		return StoreRepository.save(entity);
	}

	@Override
	public List<Store> findByIsactive(Boolean isactive) {
		return StoreRepository.findByIsactive(isactive);
	}

	@Override
	public List<Store> findByUser(User user) {
		return StoreRepository.findByUser(user);
	}

	@Override
	public <S extends Store> Optional<S> findOne(Example<S> example) {
		return StoreRepository.findOne(example);
	}

	@Override
	public List<Store> findAll() {
		return StoreRepository.findAll();
	}

	@Override
	public Page<Store> findAll(Pageable pageable) {
		return StoreRepository.findAll(pageable);
	}

	@Override
	public List<Store> findAll(Sort sort) {
		return StoreRepository.findAll(sort);
	}

	@Override
	public List<Store> findAllById(Iterable<Integer> ids) {
		return StoreRepository.findAllById(ids);
	}

	@Override
	public <S extends Store> Page<S> findAll(Example<S> example, Pageable pageable) {
		return StoreRepository.findAll(example, pageable);
	}

	@Override
	public Optional<Store> findById(Integer id) {
		return StoreRepository.findById(id);
	}

	@Override
	public boolean existsById(Integer id) {
		return StoreRepository.existsById(id);
	}

	@Override
	public long count() {
		return StoreRepository.count();
	}

	@Override
	public void deleteById(Integer id) {
		StoreRepository.deleteById(id);
	}

	@Override
	public void delete(Store entity) {
		StoreRepository.delete(entity);
	}

	@SuppressWarnings("deprecation")
	@Override
	public Store getById(Integer id) {
		return StoreRepository.getById(id);
	}

	@Override
	public void deleteAll() {
		StoreRepository.deleteAll();
	}

	@Override
	public Store findByUserContaining(User user) {
		// TODO Auto-generated method stub
		return (Store) StoreRepository.findByUserContaining(user);
	}

	@Override
	public String findStoreOfUser(List<Store> stores, Integer id) {

		for (Store store : stores) {
			if (store.getUser().getId().equals(id)) {
				return store.getName();
			}
		}
		return null;
	}

	@Override
	public Boolean findStorebyCategory(Store store, Integer id) {
		boolean check = false;
		List<Product> products = productService.findProductByStore(store);
		Category category = categorySerivce.getById(id);
		List<Product> product = productService.findByCategory(category);
		for (Product pro : product) {
			for (Product productStore : products) {
				if (pro.equals(productStore)) {
					check = true;
					break;
				}
			}
		}
		return check;
	}

	@Override
	public Store findByNameContaining(String name) {
		return StoreRepository.findByNameContaining(name);
	}

	@Override
	public List<Store> getStoreByUser(User user) {
		return StoreRepository.getStoreByUser(user);
	}

	@Override
	public List<Store> getNewStore(List<Store> stores) {

		List<Store> temp = new ArrayList<Store>();

		long millis = System.currentTimeMillis();
		Date date = new Date(millis);

		for (Store store : stores) {

			if (store.getCreateat().getDate() == date.getDate()) {
				temp.add(store);
			}
		}
		return temp;
	}

	@Override
	public List<Store> findByName(String name) {
		// TODO Auto-generated method stub
		return StoreRepository.findByName(name);
	}

}
