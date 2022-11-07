package Model;

import java.sql.Date;

public class StoreModel {
	private int id;
    private String name;
    private String bio;
    private int ownerId;
    private int staffIds;
    private Byte is_active;
    private Byte is_open;
    private String avatar;
    private int rating;
    private float e_wallet;
    private Date createAt;
    private Date updaeAt;
	public StoreModel(int id, String name, String bio, int ownerId, int staffIds, Byte is_active, Byte is_open,
			String avatar, int rating, float e_wallet, Date createAt, Date updaeAt) {
		super();
		this.id = id;
		this.name = name;
		this.bio = bio;
		this.ownerId = ownerId;
		this.staffIds = staffIds;
		this.is_active = is_active;
		this.is_open = is_open;
		this.avatar = avatar;
		this.rating = rating;
		this.e_wallet = e_wallet;
		this.createAt = createAt;
		this.updaeAt = updaeAt;
	}
	public StoreModel() {
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
	public String getBio() {
		return bio;
	}
	public void setBio(String bio) {
		this.bio = bio;
	}
	public int getOwnerId() {
		return ownerId;
	}
	public void setOwnerId(int ownerId) {
		this.ownerId = ownerId;
	}
	public int getStaffIds() {
		return staffIds;
	}
	public void setStaffIds(int staffIds) {
		this.staffIds = staffIds;
	}
	public Byte getIs_active() {
		return is_active;
	}
	public void setIs_active(Byte is_active) {
		this.is_active = is_active;
	}
	public Byte getIs_open() {
		return is_open;
	}
	public void setIs_open(Byte is_open) {
		this.is_open = is_open;
	}
	public String getAvatar() {
		return avatar;
	}
	public void setAvatar(String avatar) {
		this.avatar = avatar;
	}
	public int getRating() {
		return rating;
	}
	public void setRating(int rating) {
		this.rating = rating;
	}
	public float getE_wallet() {
		return e_wallet;
	}
	public void setE_wallet(float e_wallet) {
		this.e_wallet = e_wallet;
	}
	public Date getCreateAt() {
		return createAt;
	}
	public void setCreateAt(Date createAt) {
		this.createAt = createAt;
	}
	public Date getUpdaeAt() {
		return updaeAt;
	}
	public void setUpdaeAt(Date updaeAt) {
		this.updaeAt = updaeAt;
	}
    
    

}
