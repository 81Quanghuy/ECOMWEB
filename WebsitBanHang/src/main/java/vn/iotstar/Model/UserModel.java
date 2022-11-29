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

public class UserModel {

	private long id;
	private String firstName;
	private String lastName;
    private String slug;
    private String email;
    private String phone;
    private Byte is_emailactive;
    private Byte is_phoneactive;
    private String hashed_password;
    private Byte role;
    private String address;
    private String avatar;
    private String cover;
    private int point;
    private int e_wallet; //decimal
    private Date createAt;
    private Date updateAt;
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	public String getFirstName() {
		return firstName;
	}
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	public String getLastName() {
		return lastName;
	}
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	public String getSlug() {
		return slug;
	}
	public void setSlug(String slug) {
		this.slug = slug;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public Byte getIs_emailactive() {
		return is_emailactive;
	}
	public void setIs_emailactive(Byte is_emailactive) {
		this.is_emailactive = is_emailactive;
	}
	public Byte getIs_phoneactive() {
		return is_phoneactive;
	}
	public void setIs_phoneactive(Byte is_phoneactive) {
		this.is_phoneactive = is_phoneactive;
	}
	public String getHashed_password() {
		return hashed_password;
	}
	public void setHashed_password(String hashed_password) {
		this.hashed_password = hashed_password;
	}
	public Byte getRole() {
		return role;
	}
	public void setRole(Byte role) {
		this.role = role;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getAvatar() {
		return avatar;
	}
	public void setAvatar(String avatar) {
		this.avatar = avatar;
	}
	public String getCover() {
		return cover;
	}
	public void setCover(String cover) {
		this.cover = cover;
	}
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
	}
	public int getE_wallet() {
		return e_wallet;
	}
	public void setE_wallet(int e_wallet) {
		this.e_wallet = e_wallet;
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
	public UserModel(int id, String firstName, String lastName, String slug, String email, String phone, Byte is_emailactive,
			Byte is_phoneactive, String hashed_password, Byte role, String address, String avatar, String cover,
			int point, int e_wallet, Date createAt, Date updateAt) {
		super();
		this.id = id;
		this.firstName = firstName;
		this.lastName = lastName;
		this.slug = slug;
		this.email = email;
		this.phone = phone;
		this.is_emailactive = is_emailactive;
		this.is_phoneactive = is_phoneactive;
		this.hashed_password = hashed_password;
		this.role = role;
		this.address = address;
		this.avatar = avatar;
		this.cover = cover;
		this.point = point;
		this.e_wallet = e_wallet;
		this.createAt = createAt;
		this.updateAt = updateAt;
	}
	public UserModel() {
		super();
	}
    
    
}
