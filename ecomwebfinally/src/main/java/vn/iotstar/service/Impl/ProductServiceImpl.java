package vn.iotstar.service.Impl;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Example;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import vn.iotstar.Repository.ProductRepository;
import vn.iotstar.entity.CartItem;
import vn.iotstar.entity.Product;
import vn.iotstar.service.IProductService;
@Service
public class ProductServiceImpl implements IProductService{

	@Autowired
	ProductRepository productRepository;

	@Override
	public List<Product> findBynameContaining(String name) {
		return productRepository.findBynameContaining(name);
	}

	@Override
	public <S extends Product> S save(S entity) {
		return productRepository.save(entity);
	}

	@Override
	public List<Product> findAll() {
		return productRepository.findAll();
	}

	@Override
	public Optional<Product> findById(Integer id) {
		return productRepository.findById(id);
	}

	@Override
	public <S extends Product> long count(Example<S> example) {
		return productRepository.count(example);
	}

	@Override
	public <S extends Product> boolean exists(Example<S> example) {
		return productRepository.exists(example);
	}

	@Override
	public long count() {
		return productRepository.count();
	}

	@Override
	public void deleteById(Integer id) {
		productRepository.deleteById(id);
	}

	@SuppressWarnings("deprecation")
	@Override
	public Product getOne(Integer id) {
		return productRepository.getOne(id);
	}

	@Override
	public void delete(Product entity) {
		productRepository.delete(entity);
	}

	@SuppressWarnings("deprecation")
	@Override
	public Product getById(Integer id) {
		return productRepository.getById(id);
	}

	@Override
	public void deleteAll() {
		productRepository.deleteAll();
	}

	@Override
	public List<Product> findByCartItem(CartItem cartItem) {
		return productRepository.findByCartItem(cartItem);
	}
	
	@Override
	public List<Product> findAll(Sort sort) {
		return productRepository.findAll(sort);
	}

	@Override
	public <S extends Product> List<S> findAll(Example<S> example, Sort sort) {
		return productRepository.findAll(example, sort);
	}

	@Override
	public List<Product> findAllByOrderBySoldDesc() {
		// TODO Auto-generated method stub
		return productRepository.findAllByOrderBySoldDesc();
	}



	
}
