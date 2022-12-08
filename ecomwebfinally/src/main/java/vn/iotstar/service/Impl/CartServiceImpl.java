package vn.iotstar.service.Impl;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.data.domain.Example;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import vn.iotstar.entity.Cart;
import vn.iotstar.entity.CartItem;
import vn.iotstar.entity.Product;
import vn.iotstar.entity.User;
import vn.iotstar.Repository.CartItemRepository;
import vn.iotstar.Repository.CartRepository;
import vn.iotstar.Repository.ProductRepository;
import vn.iotstar.service.ICartItemService;
import vn.iotstar.service.ICartService;
import vn.iotstar.service.IProductService;

@Service
public class CartServiceImpl implements ICartService {
	@Autowired
	CartRepository CartRepository;

	@Autowired
	ICartItemService cartItemService;

	@Autowired
	IProductService productService;

	@Override
	public <S extends Cart> S save(S entity) {
		return CartRepository.save(entity);
	}

	@Override
	public Float SumCart(List<Cart> cart) {
		List<CartItem> cartItems = cartItemService.findByCart(cart.get(0));
		float Sum = 0;
		if (cartItems.size() > 0) {

			for (CartItem cartItem : cartItems) {
				Sum += cartItem.getCount() * cartItem.getProduct().getPrice();
			}

		}
		return Sum;

	}

	@Override
	public <S extends Cart> Optional<S> findOne(Example<S> example) {
		return CartRepository.findOne(example);
	}

	@Override
	public List<Cart> findByUser(User user) {
		return CartRepository.findByUser(user);
	}

	@Override
	public List<Cart> findAll() {
		return CartRepository.findAll();
	}

	@Override
	public Page<Cart> findAll(Pageable pageable) {
		return CartRepository.findAll(pageable);
	}

	@Override
	public List<Cart> findAll(Sort sort) {
		return CartRepository.findAll(sort);
	}

	@Override
	public List<Cart> findAllById(Iterable<Integer> ids) {
		return CartRepository.findAllById(ids);
	}

	@Override
	public <S extends Cart> Page<S> findAll(Example<S> example, Pageable pageable) {
		return CartRepository.findAll(example, pageable);
	}

	@Override
	public Optional<Cart> findById(Integer id) {
		return CartRepository.findById(id);
	}

	@Override
	public boolean existsById(Integer id) {
		return CartRepository.existsById(id);
	}

	@Override
	public long count() {
		return CartRepository.count();
	}

	@Override
	public void deleteById(Integer id) {
		CartRepository.deleteById(id);
	}

	@Override
	public void delete(Cart entity) {
		CartRepository.delete(entity);
	}

	@SuppressWarnings("deprecation")
	@Override
	public Cart getById(Integer id) {
		return CartRepository.getById(id);
	}

	@Override
	public void deleteAll() {
		CartRepository.deleteAll();
	}

}
