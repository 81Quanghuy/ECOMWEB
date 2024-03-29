package vn.iotstar.service.impl;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Example;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import vn.iotstar.entity.CartItem;
import vn.iotstar.entity.Category;
import vn.iotstar.entity.Product;
import vn.iotstar.entity.Review;
import vn.iotstar.entity.Store;
import vn.iotstar.repository.ProductRepository;
import vn.iotstar.repository.ReviewRepository;
import vn.iotstar.service.IProductService;

@Service
public class ProductServiceImpl implements IProductService {

	@Autowired
	ProductRepository productRepository;
	private List<Product> list;

	@Autowired
	ReviewRepository repository;
	
	@Autowired
	IProductService productService;

	@Override
	public List<Product> findBynameContaining(String name) {
		return productRepository.findBynameContaining(name);
	}

	@Override
	public List<Product> findByCategory(Category category) {
		return productRepository.findByCategory(category);
	}

	@Override
	public <S extends Product> S save(S entity) {
		return productRepository.save(entity);
	}

	@Override
	public List<Product> findAll() {
		return productRepository.findAll();
	}

	@Override
	public Optional<Product> findById(Integer id) {
		return productRepository.findById(id);
	}

	@Override
	public <S extends Product> long count(Example<S> example) {
		return productRepository.count(example);
	}

	@Override
	public <S extends Product> boolean exists(Example<S> example) {
		return productRepository.exists(example);
	}

	@Override
	public long count() {
		return productRepository.count();
	}

	@Override
	public void deleteById(Integer id) {
		productRepository.deleteById(id);
	}

	@SuppressWarnings("deprecation")
	@Override
	public Product getOne(Integer id) {
		return productRepository.getOne(id);
	}

	@Override
	public void delete(Product entity) {
		productRepository.delete(entity);
	}

	@SuppressWarnings("deprecation")
	@Override
	public Product getById(Integer id) {
		return productRepository.getById(id);
	}

	@Override
	public void deleteAll() {
		productRepository.deleteAll();
	}

	@Override
	public List<Product> findByCartItem(CartItem cartItem) {
		return productRepository.findByCartItem(cartItem);
	}

	@Override
	public List<Product> findAll(Sort sort) {
		return productRepository.findAll(sort);
	}

	@Override
	public <S extends Product> List<S> findAll(Example<S> example, Sort sort) {
		return productRepository.findAll(example, sort);
	}

	@Override
	public List<Product> findAllByOrderBySoldDesc() {
		// TODO Auto-generated method stub
		return productRepository.findAllByOrderBySoldDesc();
	}

	@Override
	public List<Product> findProductByStore(Store store) {
		// TODO Auto-generated method stub
		return productRepository.findProductByStore(store);
	}

	@Override
	public List<Product> getProductByStore(Store store) {
		// TODO Auto-generated method stub
		return productRepository.getProductByStore(store);
	}

	public List<Product> findTop3BySoldOrderByPriceDesc(Integer sold) {
		return productRepository.findTop3BySoldOrderByPriceDesc(sold);
	}

	@Override
	public List<Product> getTop3(List<Product> product) {
		int i = 1;

		for (Product pro : product) {
			if (i <= 3) {

				list.add(pro);
			}
			i++;
		}
		return list;
	}

	@Override
	public List<Product> getLatestProduct() {
		return productRepository.findFirst12ByCategoryNameContainingIgnoreCaseOrderByIdDesc("Áo");
	}

	@Override
	public List<Product> findTop3ByOrderBySoldDesc() {
		return productRepository.findTop3ByOrderBySoldDesc();
	}

	@Override
	public List<Product> findTop10ByOrderBySoldDesc() {
		// TODO Auto-generated method stub
		return productRepository.findTop10ByOrderBySoldDesc();
	}

	@Override
	public Float getTotalPrice(List<Product> product) {
		// TODO Auto-generated method stub

		Float total = (float) 0;
		for (Product pro : product) {

			total = (float) (total + pro.getPrice() * pro.getSold());

		}
		return null;
	}

	@Override
	public Integer avgRating(Product product) {
		Integer avgRating = 0;

		List<Review> reviews = repository.findByProduct(product);

		for (Review review : reviews) {

			avgRating = avgRating + review.getRating();

		}

		avgRating = avgRating / reviews.size();

		if (avgRating > 0) {
			return avgRating;
		}
		return 0;
	}

//	@Override
//	public Page<Product> getAllSanPhamByFilter(SearchProductObject object, int page, int limit) {
//
//		BooleanBuilder builder = new BooleanBuilder();
//		Double price = object.getPrice();
//		
//
//		// sắp xếp theo giá
//		Sort sort = Sort.by(Direction.ASC, "price"); // mặc định tăng dần
//		if (object.getSapXepTheoGia().equals("desc")) { // giảm dần
//			sort = Sort.by(Direction.DESC, "price");
//		}
//
//		if (!object.getCategoryid().equals("") && object.getCategoryid() != null) {
//			builder.and(QProduct .name.danhMuc.eq(productRepository.findById(Integer.parseInt(object.getCategoryid())).get()));
//		}
//
//		if (!object.getStoreid().equals("") && object.getStoreid() != null) {
//			builder.and(QSanPham.sanPham.hangSanXuat
//					.eq(hangSanXuatRepo.findById(Long.parseLong(object.getHangSXId())).get()));
//		}
//
//		// tim theo don gia
//		switch (price) {
//		case "duoi-2-trieu":
//			builder.and(QSanPham.sanPham.donGia.lt(2000000));
//			break;
//
//		case "2-trieu-den-4-trieu":
//			builder.and(QSanPham.sanPham.donGia.between(2000000, 4000000));
//			break;
//
//		case "4-trieu-den-6-trieu":
//			builder.and(QSanPham.sanPham.donGia.between(4000000, 6000000));
//			break;
//
//		case "6-trieu-den-10-trieu":
//			builder.and(QSanPham.sanPham.donGia.between(6000000, 10000000));
//			break;
//
//		case "tren-10-trieu":
//			builder.and(QSanPham.sanPham.donGia.gt(10000000));
//			break;
//
//		default:
//			break;
//		}
//		return sanPhamRepo.findAll(builder, PageRequest.of(page, limit, sort));
//		return null;
//	}

}
