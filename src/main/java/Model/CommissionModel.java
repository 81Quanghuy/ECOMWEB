package Model;

import java.sql.Date;

public class CommissionModel {
    private int id;
    private String name;
    private float cost;
    private String desciption;
    private  Byte is_deleted;
    private Date createAt;
    private Date updateAt;
	public CommissionModel(int id, String name, float cost, String desciption, Byte is_deleted, Date createAt,
			Date updateAt) {
		super();
		this.id = id;
		this.name = name;
		this.cost = cost;
		this.desciption = desciption;
		this.is_deleted = is_deleted;
		this.createAt = createAt;
		this.updateAt = updateAt;
	}
	
	
	public CommissionModel() {
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
	public float getCost() {
		return cost;
	}
	public void setCost(float cost) {
		this.cost = cost;
	}
	public String getDesciption() {
		return desciption;
	}
	public void setDesciption(String desciption) {
		this.desciption = desciption;
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
