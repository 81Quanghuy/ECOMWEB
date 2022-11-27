package vn.iotstar.Repository;

import org.springframework.data.jpa.repository.JpaRepository;

import vn.iotstar.Entity.Category;

public interface CategoryRepository extends JpaRepository<Category, Long>{

}
