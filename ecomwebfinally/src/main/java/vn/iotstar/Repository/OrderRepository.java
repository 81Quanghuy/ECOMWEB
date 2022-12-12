package vn.iotstar.Repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import vn.iotstar.entity.Order;
import vn.iotstar.entity.Store;
import vn.iotstar.entity.User;

@Repository
public interface OrderRepository extends JpaRepository<Order, Integer> {

	List<Order> getOrderByStore(Store store);

	List<Order> findByUser(User user);

	List<Order> findAllByOrderByCreateatDesc();

	List<Order> findByIsactive(Boolean isactive);
}
