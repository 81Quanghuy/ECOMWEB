
package vn.iotstar.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import vn.iotstar.entity.Order;
import vn.iotstar.entity.OrderItem;
import vn.iotstar.entity.Product;

@Repository
public interface OrderItemRepository extends JpaRepository<OrderItem, Integer> {
	List<OrderItem> findByOrder(Order Order);
	
	List<OrderItem> findByProduct(Product product);
}
