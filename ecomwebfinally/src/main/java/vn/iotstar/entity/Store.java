package vn.iotstar.entity;

import java.sql.Date;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
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
@Table(name = "store")
public class Store {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;

	private String name;

	private String bio;// mô tả
	// private Integer ownerId;// từ user nào id user
	@OneToOne
	@JoinColumn(name = "ownerid")
	private User user;

	@OneToMany(mappedBy = "store")
	List<Order> order;

	private Boolean isactive;// được duyệt đưa vào bán

	private String avatar;// ảnh của shop

	private String featuredimages;

	private Integer rating;

	private Date createat;

	private Date updaeat;

	@OneToMany(mappedBy = "store")
	List<Cart> carts;

	@OneToMany(mappedBy = "store")
	List<Product> products;

	@OneToMany(mappedBy = "store")
	List<Transaction> transactions;

}
