package vn.iotstar.repository;

import java.util.List;
import java.util.Map;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import vn.iotstar.entity.Cart;
import vn.iotstar.entity.CartItem;
import vn.iotstar.entity.Product;

@Repository
public interface CartItemRepository extends JpaRepository<CartItem, Integer> {

	List<CartItem> findByCart(Cart cart);

	List<CartItem> findByProduct(Product product);
	
}