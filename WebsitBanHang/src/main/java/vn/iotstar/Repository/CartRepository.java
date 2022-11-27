package vn.iotstar.Repository;

import org.springframework.data.jpa.repository.JpaRepository;

import vn.iotstar.Entity.Cart;

public interface CartRepository extends JpaRepository<Cart, Long> {

}
