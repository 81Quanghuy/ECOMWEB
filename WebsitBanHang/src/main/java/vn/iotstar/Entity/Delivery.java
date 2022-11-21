package vn.iotstar.Entity;

import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;


@NoArgsConstructor
@AllArgsConstructor
@Data
@Entity
@Builder
@Table(name = "Delivery")
public class Delivery {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	@Column(name = "name")
    private String name;
	
	@Column(name = "price")
    private int price;
	
	
	@Column(name = "desciption")
    private String desciption;
	
	@Column(name = "is_deleted")
    private  Byte is_deleted;
	
	@Column(name = "createAt")
    private Date createAt;
	
	@Column(name = "updateAt")
    private Date updateAt;
	
	public Delivery(int id, String name, String desciption, int price, Byte is_deleted, Date createAt,
			Date updateAt) {
		super();
		this.id = id;
		this.name = name;
		this.desciption = desciption;
		this.price = price;
		this.is_deleted = is_deleted;
		this.createAt = createAt;
		this.updateAt = updateAt;
	}
	public Delivery() {
		super();
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDesciption() {
		return desciption;
	}
	public void setDesciption(String desciption) {
		this.desciption = desciption;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public Byte getIs_deleted() {
		return is_deleted;
	}
	public void setIs_deleted(Byte is_deleted) {
		this.is_deleted = is_deleted;
	}
	public Date getCreateAt() {
		return createAt;
	}
	public void setCreateAt(Date createAt) {
		this.createAt = createAt;
	}
	public Date getUpdateAt() {
		return updateAt;
	}
	public void setUpdateAt(Date updateAt) {
		this.updateAt = updateAt;
	}

}
