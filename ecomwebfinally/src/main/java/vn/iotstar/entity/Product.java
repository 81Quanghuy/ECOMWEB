package vn.iotstar.entity;

import java.sql.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "product")
public class Product {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;

	@Column(length = 200, columnDefinition = "nvarchar(200) not null")
	private String name;
	private String desciption;
	private Double price;
	private Double promotionaprice;
	private Integer quantity;
	private Integer sold;
	private Boolean isselling;
	private String listimage;
	// private Integer styleids;//kiểu của sản phẩm

	// private Integer category đổi khóa ngoại bằng 1 thực thể kết hợp
	@ManyToOne
	@JoinColumn(name = "categoryid")
	private Category category;

	@ManyToOne
	@JoinColumn(name = "storeid")
	private Store store;

	private Integer rating;
	
	private Date createat;
	private Date updateat;

	@OneToOne(mappedBy = "product")
	OrderItem orderItem;

	@OneToMany(mappedBy = "product")
	List<Review> reviews;

	@OneToOne(mappedBy = "product")
	private CartItem cartItem;

}
