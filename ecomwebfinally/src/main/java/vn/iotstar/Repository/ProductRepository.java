package vn.iotstar.Repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import vn.iotstar.entity.CartItem;
import vn.iotstar.entity.Product;

@Repository
public interface ProductRepository extends JpaRepository <Product,Integer>{

	List<Product> findBynameContaining(String name);
	List<Product> findByCartItem(CartItem cartItem);
}
