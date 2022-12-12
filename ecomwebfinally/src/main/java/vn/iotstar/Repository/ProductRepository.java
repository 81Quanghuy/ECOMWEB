package vn.iotstar.Repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import vn.iotstar.entity.CartItem;
import vn.iotstar.entity.Category;
import vn.iotstar.entity.Product;
import vn.iotstar.entity.Store;

@Repository
public interface ProductRepository extends JpaRepository<Product, Integer> {

	List<Product> findBynameContaining(String name);

	List<Product> findByCartItem(CartItem cartItem);

	public List<Product> findAllByOrderBySoldDesc();

	List<Product> findProductByStore(Store store);

	List<Product> getProductByStore(Store store);

	List<Product> findTop3BySoldOrderByPriceDesc(Integer sold);

	List<Product> findFirst12ByCategoryNameContainingIgnoreCaseOrderByIdDesc(String dm);

	List<Product> findTop3ByOrderBySoldDesc();

	List<Product> findTop10ByOrderBySoldDesc();

	List<Product> findByCategory(Category category);

	@Query(value = "SELECT e FROM Product e ORDER BY name")
	List<Product> findAllSortedByName();

}
