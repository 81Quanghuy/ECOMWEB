package Model;

import java.sql.Date;

public class StyleModel {
    private int id;
    private String name;
    private int category_id;
    private Byte is_deleted;
    private Date createAt;
    private Date updateAt;
	public StyleModel(int id, String name, int category_id, Byte is_deleted, Date createAt, Date updateAt) {
		super();
		this.id = id;
		this.name = name;
		this.category_id = category_id;
		this.is_deleted = is_deleted;
		this.createAt = createAt;
		this.updateAt = updateAt;
	}
	public StyleModel() {
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
	public int getCategory_id() {
		return category_id;
	}
	public void setCategory_id(int category_id) {
		this.category_id = category_id;
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
