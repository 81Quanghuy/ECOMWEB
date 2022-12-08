package vn.iotstar.Repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import vn.iotstar.entity.CartItem;

@Repository
public interface CartItemRepository extends JpaRepository<CartItem, Integer> {

}
