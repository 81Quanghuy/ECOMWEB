package vn.iotstar.repository;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import vn.iotstar.entity.Product;
import vn.iotstar.entity.Store;
import vn.iotstar.entity.User;

@Repository
public interface StoreRepository extends JpaRepository<Store, Integer> {

	Store findByUserContaining(User user);

	Store findOneByName(String name);

	// Tìm kiếm và Phân trang

	// Ham phan trang
	Page<Store> findByNameContaining(String name, Pageable pageable);

	Store findByNameContaining(String name);

	List<Store> getStoreByUser(User user);

	List<Store> findByUser(User user);

	List<Store> findByIsactive(Boolean isactive);

	List<Store> findByName(String name);

	// List<Store> findByProducts(Product product);

}
