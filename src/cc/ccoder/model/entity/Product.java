package cc.ccoder.model.entity;

import java.util.HashSet;
import java.util.Set;

/**
 * Product entity. @author MyEclipse Persistence Tools
 */

public class Product implements java.io.Serializable {

	// Fields

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Integer id;
	private Category category;
	private String name;
	private String subtitle;
	private String mainImage;
	private String subImages;
	private String detail;
	private Double price;
	private Integer stock;
	private Integer status;
	private String createTime;
	private Set commentses = new HashSet(0);
	private Set carts = new HashSet(0);

	// Constructors

	/** default constructor */
	public Product() {
	}

	/** minimal constructor */
	public Product(Category category, String name, Double price, Integer stock) {
		this.category = category;
		this.name = name;
		this.price = price;
		this.stock = stock;
	}

	/** full constructor */
	public Product(Category category, String name, String subtitle,
			String mainImage, String subImages, String detail, Double price,
			Integer stock, Integer status, String createTime, Set commentses,
			Set carts) {
		this.category = category;
		this.name = name;
		this.subtitle = subtitle;
		this.mainImage = mainImage;
		this.subImages = subImages;
		this.detail = detail;
		this.price = price;
		this.stock = stock;
		this.status = status;
		this.createTime = createTime;
		this.commentses = commentses;
		this.carts = carts;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Category getCategory() {
		return this.category;
	}

	public void setCategory(Category category) {
		this.category = category;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getSubtitle() {
		return this.subtitle;
	}

	public void setSubtitle(String subtitle) {
		this.subtitle = subtitle;
	}

	public String getMainImage() {
		return this.mainImage;
	}

	public void setMainImage(String mainImage) {
		this.mainImage = mainImage;
	}

	public String getSubImages() {
		return this.subImages;
	}

	public void setSubImages(String subImages) {
		this.subImages = subImages;
	}

	public String getDetail() {
		return this.detail;
	}

	public void setDetail(String detail) {
		this.detail = detail;
	}

	public Double getPrice() {
		return this.price;
	}

	public void setPrice(Double price) {
		this.price = price;
	}

	public Integer getStock() {
		return this.stock;
	}

	public void setStock(Integer stock) {
		this.stock = stock;
	}

	public Integer getStatus() {
		return this.status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public String getCreateTime() {
		return this.createTime;
	}

	public void setCreateTime(String createTime) {
		this.createTime = createTime;
	}

	public Set getCommentses() {
		return this.commentses;
	}

	public void setCommentses(Set commentses) {
		this.commentses = commentses;
	}

	public Set getCarts() {
		return this.carts;
	}

	public void setCarts(Set carts) {
		this.carts = carts;
	}

}