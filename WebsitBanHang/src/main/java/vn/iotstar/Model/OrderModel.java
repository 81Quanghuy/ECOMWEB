package vn.iotstar.Model;

import java.sql.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

public class OrderModel {

	private long id;
	
	private long user_id;
	private int delivere_id;
	private int commission_id;
	private String address;
	private int phone;
	private int status;
	private Byte id_paidbefore;
	private float amountBefore;
	private float amountFromStore;
	private float amountToStore;
	private float amountToGD;
	private Date createAt;
	private Date updateAt;

	public OrderModel(long id, int user_id, int delivere_id, int commission_id, String address, int phone, int status,
			Byte id_paidbefore, float amountBefore, float amountFromStore, float amountToStore, float amountToGD,
			Date createAt, Date updateAt) {
		super();
		this.id = id;
		this.user_id = user_id;
		this.delivere_id = delivere_id;
		this.commission_id = commission_id;
		this.address = address;
		this.phone = phone;
		this.status = status;
		this.id_paidbefore = id_paidbefore;
		this.amountBefore = amountBefore;
		this.amountFromStore = amountFromStore;
		this.amountToStore = amountToStore;
		this.amountToGD = amountToGD;
		this.createAt = createAt;
		this.updateAt = updateAt;
	}

	public OrderModel() {
		super();
	}

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public long getUser_id() {
		return user_id;
	}

	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}

	public int getDelivere_id() {
		return delivere_id;
	}

	public void setDelivere_id(int delivere_id) {
		this.delivere_id = delivere_id;
	}

	public int getCommission_id() {
		return commission_id;
	}

	public void setCommission_id(int commission_id) {
		this.commission_id = commission_id;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public int getPhone() {
		return phone;
	}

	public void setPhone(int phone) {
		this.phone = phone;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public Byte getId_paidbefore() {
		return id_paidbefore;
	}

	public void setId_paidbefore(Byte id_paidbefore) {
		this.id_paidbefore = id_paidbefore;
	}

	public float getAmountBefore() {
		return amountBefore;
	}

	public void setAmountBefore(float amountBefore) {
		this.amountBefore = amountBefore;
	}

	public float getAmountFromStore() {
		return amountFromStore;
	}

	public void setAmountFromStore(float amountFromStore) {
		this.amountFromStore = amountFromStore;
	}

	public float getAmountToStore() {
		return amountToStore;
	}

	public void setAmountToStore(float amountToStore) {
		this.amountToStore = amountToStore;
	}

	public float getAmountToGD() {
		return amountToGD;
	}

	public void setAmountToGD(float amountToGD) {
		this.amountToGD = amountToGD;
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
