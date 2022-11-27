package vn.iotstar.Repository;

import org.springframework.data.jpa.repository.JpaRepository;

import vn.iotstar.Entity.Order;

public interface OrderRepository  extends JpaRepository<Order, Long>{

}
