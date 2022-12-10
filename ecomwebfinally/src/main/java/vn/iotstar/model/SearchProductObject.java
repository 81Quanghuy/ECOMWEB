package vn.iotstar.model;

public class SearchProductObject {

	private Integer categoryid ;
	private Integer storeid;
	 private Double price;
	
	//Sắp xếp theo giá
	private String sapXepTheoGia;
	private String[] keyword;
	private String sort;

	//Sẵp xếp theo danh mục 
	private Integer quantity;
	private Integer sold;
	private Boolean isselling;
	private Integer rating ;
	
	public SearchProductObject()
	{
		categoryid = 0;
		storeid = 0;
		price = 0.0;
		sapXepTheoGia = "ASC";
	}

	public Integer getCategoryid() {
		return categoryid;
	}

	public void setCategoryid(Integer categoryid) {
		this.categoryid = categoryid;
	}

	public Integer getStoreid() {
		return storeid;
	}

	public void setStoreid(Integer storeid) {
		this.storeid = storeid;
	}

	public Double getPrice() {
		return price;
	}

	public void setPrice(Double price) {
		this.price = price;
	}

	public String getSapXepTheoGia() {
		return sapXepTheoGia;
	}

	public void setSapXepTheoGia(String sapXepTheoGia) {
		this.sapXepTheoGia = sapXepTheoGia;
	}

	public String[] getKeyword() {
		return keyword;
	}

	public void setKeyword(String[] keyword) {
		this.keyword = keyword;
	}

	public String getSort() {
		return sort;
	}

	public void setSort(String sort) {
		this.sort = sort;
	}

	public Integer getQuantity() {
		return quantity;
	}

	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}

	public Integer getSold() {
		return sold;
	}

	public void setSold(Integer sold) {
		this.sold = sold;
	}

	public Boolean getIsselling() {
		return isselling;
	}

	public void setIsselling(Boolean isselling) {
		this.isselling = isselling;
	}

	public Integer getRating() {
		return rating;
	}

	public void setRating(Integer rating) {
		this.rating = rating;
	}
	@Override
	public String toString() {
		return "SearchObject [danhMucId=" + categoryid + ", hangSXId=" + storeid + ", price=" + price + "]";
	}
	
}

