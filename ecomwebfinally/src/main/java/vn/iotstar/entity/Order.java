package vn.iotstar.entity;

import java.sql.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "orders")
public class Order {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;

	@ManyToOne()
	@JoinColumn(name = "userid")
	private User user;

	@ManyToOne()
	@JoinColumn(name = "storeid")
	private Store store;

	@ManyToOne(cascade = CascadeType.PERSIST)
	@JoinColumn(name = "deliveryid")
	private Delivery delivery;

	private String address;
	private String phone;
	private String status; // Trang thai don hang
	private Float price;
	private Date createat;
	private Date updateat;
	private Boolean isactive;

	@OneToMany(mappedBy = "order")
	List<OrderItem> orderitems;
}
