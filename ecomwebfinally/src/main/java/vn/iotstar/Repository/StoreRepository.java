package vn.iotstar.Repository;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import vn.iotstar.entity.Store;

@Repository
public interface StoreRepository extends JpaRepository<Store, Integer> {

	// Tìm Kiếm theo nội dung tên from Store where Storename

	List<Store> findByNameContaining(String name);

	//
	Store findOneByName(String name);

	// Tìm kiếm và Phân trang

	// Ham phan trang
	Page<Store> findByNameContaining(String name, Pageable pageable);

}
