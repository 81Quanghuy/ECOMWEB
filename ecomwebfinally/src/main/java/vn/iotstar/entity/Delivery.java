package vn.iotstar.entity;

import java.sql.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "delivery")
public class Delivery {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;

	@Column(length = 200, columnDefinition = "nvarchar(200) not null")
	private String name;
	private Float price;
	
	@Column(name ="desciption",columnDefinition = "nvarchar(255)")
	private String desciption;
	
	private Boolean isdeleted;
	private Date createat;
	private Date updateat;

	@OneToMany(mappedBy = "delivery")
	List<Order> orders;
}
