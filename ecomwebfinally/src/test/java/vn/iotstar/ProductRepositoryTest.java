package vn.iotstar;

import static org.junit.jupiter.api.Assertions.assertEquals;

import java.util.List;

import javax.transaction.Transactional;

import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit.jupiter.SpringExtension;

import vn.iotstar.Repository.ProductRepository;
import vn.iotstar.entity.Product;

@ExtendWith(SpringExtension.class)
@Transactional
@SpringBootTest(classes = EcomwebfinallyApplication.class)
public class ProductRepositoryTest {
	@Autowired
	private ProductRepository productRepository;

	@Test
	public void testFindAllSortedByName() {
		Product employee = getPrduct();
		Product employee1 = new Product();
		employee1.setId(2);
		employee1.setName("Aarav");
		employee1.setPrice(20.0);
		employee1.setQuantity(50);
		productRepository.save(employee);
		productRepository.save(employee1);
		List<Product> result = productRepository.findAllSortedByName();
		assertEquals(employee1.getName(), result.get(0).getName());
	}

	private Product getPrduct() {
		Product employee = new Product();
		employee.setId(1);
		employee.setName("Mahesh");
		employee.setPrice(30.0);
		employee.setQuantity(10);
		return employee;
	}

}
