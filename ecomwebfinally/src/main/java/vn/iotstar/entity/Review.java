package vn.iotstar.entity;

import java.sql.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "review")
public class Review {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	// private Integer user_id;

	@ManyToOne()
	@JoinColumn(name = "userid")
	private User user;

	@ManyToOne()
	@JoinColumn(name = "productid")
	private Product product;

	private String content;
	private Integer rating;
	private Date createat;
	private Date updateat;

}
