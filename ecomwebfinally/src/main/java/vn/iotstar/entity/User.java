package vn.iotstar.entity;

import java.sql.Date;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
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
@Table(name = "users")
public class User {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	Integer id;

	private String firstName;
	private String lastName;

	private String email;
	private String phone;
	private String username;
	private String password;// mật khẩu mã hóa
	private String address;
	private String avatar;
	private String role;
	private Boolean isActive;

	private Date createat;
	private Date updateat;

	@OneToMany(mappedBy = "user")
	List<Order> orders;

	@OneToOne(mappedBy = "user")
	private Store stores;

	@OneToMany(mappedBy = "user")
	List<Cart> carts;

	@OneToMany(mappedBy = "user")
	List<Review> reviews;

	@OneToMany(mappedBy = "user")
	List<Transaction> transactions;

	@OneToOne(mappedBy = "user")
	private Filter filter;

}
