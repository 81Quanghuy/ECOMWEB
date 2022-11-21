package vn.iotstar.Entity;

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


@NoArgsConstructor
@AllArgsConstructor
@Data
@Entity
@Builder
@Table(name = "Product")
public class Product {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
    private String name;
    private String slug;
    private String desciption;
    private float price;
    private float promotionaPrice;
    private int quantity;
    private int slod;
    private Byte is_active;
    private Byte is_selling;
    private String listImage;
    private int categoryId;
    private String style_Values;
    private int storeid;
    private int rating;
    private Date createAt;
    private Date updateAt;
	public Product(int id, String name, String slug, String desciption, float price, float promotionaPrice,
			int quantity, int slod, Byte is_active, Byte is_selling, String listImage, int categoryId,
			String style_Values, int storeid, int rating, Date createAt, Date updateAt) {
		super();
		this.id = id;
		this.name = name;
		this.slug = slug;
		this.desciption = desciption;
		this.price = price;
		this.promotionaPrice = promotionaPrice;
		this.quantity = quantity;
		this.slod = slod;
		this.is_active = is_active;
		this.is_selling = is_selling;
		this.listImage = listImage;
		this.categoryId = categoryId;
		this.style_Values = style_Values;
		this.storeid = storeid;
		this.rating = rating;
		this.createAt = createAt;
		this.updateAt = updateAt;
	}
	public Product() {
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
	public String getSlug() {
		return slug;
	}
	public void setSlug(String slug) {
		this.slug = slug;
	}
	public String getDesciption() {
		return desciption;
	}
	public void setDesciption(String desciption) {
		this.desciption = desciption;
	}
	public float getPrice() {
		return price;
	}
	public void setPrice(float price) {
		this.price = price;
	}
	public float getPromotionaPrice() {
		return promotionaPrice;
	}
	public void setPromotionaPrice(float promotionaPrice) {
		this.promotionaPrice = promotionaPrice;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public int getSlod() {
		return slod;
	}
	public void setSlod(int slod) {
		this.slod = slod;
	}
	public Byte getIs_active() {
		return is_active;
	}
	public void setIs_active(Byte is_active) {
		this.is_active = is_active;
	}
	public Byte getIs_selling() {
		return is_selling;
	}
	public void setIs_selling(Byte is_selling) {
		this.is_selling = is_selling;
	}
	public String getListImage() {
		return listImage;
	}
	public void setListImage(String listImage) {
		this.listImage = listImage;
	}
	public int getCategoryId() {
		return categoryId;
	}
	public void setCategoryId(int categoryId) {
		this.categoryId = categoryId;
	}
	public String getStyle_Values() {
		return style_Values;
	}
	public void setStyle_Values(String style_Values) {
		this.style_Values = style_Values;
	}
	public int getStoreid() {
		return storeid;
	}
	public void setStoreid(int storeid) {
		this.storeid = storeid;
	}
	public int getRating() {
		return rating;
	}
	public void setRating(int rating) {
		this.rating = rating;
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
