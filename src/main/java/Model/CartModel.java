package Model;

import java.sql.Date;

import javafx.scene.chart.PieChart.Data;

public class CartModel {
    private int id;
    private int user_id;
    private int store_id;
    private Date createAt;
    private Date updateAt;
	public CartModel(int id, int user_id, int store_id, Date createAt, Date updateAt) {
		super();
		this.id = id;
		this.user_id = user_id;
		this.store_id = store_id;
		this.createAt = createAt;
		this.updateAt = updateAt;
	}
	public CartModel() {
		super();
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	public int getStore_id() {
		return store_id;
	}
	public void setStore_id(int store_id) {
		this.store_id = store_id;
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
