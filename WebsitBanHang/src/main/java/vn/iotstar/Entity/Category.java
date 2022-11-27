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
@Table(name = "Category")
public class Category {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private long id;
	
	@Column(name = "name")
    private String name;
	
	@Column(name = "category_id")
    private int category_id;
	
	@Column(name = "image")
    private String image;
	
	@Column(name = "is_delete")
    private Byte is_delete;
	
	@Column(name = "createAt")
    private Date createAt;
	
	@Column(name = "updateAt")
    private Date updateAt;
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getCategory_id() {
		return category_id;
	}
	public void setCategory_id(int category_id) {
		this.category_id = category_id;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public Byte getIs_delete() {
		return is_delete;
	}
	public void setIs_delete(Byte is_delete) {
		this.is_delete = is_delete;
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
	public Category(long id, String name, int category_id, String image, Byte is_delete, Date createAt, Date updateAt) {
		super();
		this.id = id;
		this.name = name;
		this.category_id = category_id;
		this.image = image;
		this.is_delete = is_delete;
		this.createAt = createAt;
		this.updateAt = updateAt;
	}
	public Category() {
		super();
	}
    
    
}
