package vn.iotstar.Repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import vn.iotstar.entity.Cart;
import vn.iotstar.entity.CartItem;

@Repository
public interface CartItemRepository extends JpaRepository<CartItem, Integer> {

	List<CartItem> findByCart(Cart cart);
}
