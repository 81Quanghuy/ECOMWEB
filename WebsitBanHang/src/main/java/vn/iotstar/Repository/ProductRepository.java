package vn.iotstar.Repository;

import org.springframework.data.jpa.repository.JpaRepository;

import vn.iotstar.Entity.Product;

public interface ProductRepository extends JpaRepository<Product, Long>{

}
