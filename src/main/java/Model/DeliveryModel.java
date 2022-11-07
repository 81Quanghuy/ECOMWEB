package Model;

import java.sql.Date;

public class DeliveryModel {
    private int id;
    private String name;
    private String desciption;
    private int price;
    private Byte is_deleted;
    private Date createAt;
    private Date updateAt;
	public DeliveryModel(int id, String name, String desciption, int price, Byte is_deleted, Date createAt,
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
	public DeliveryModel() {
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
