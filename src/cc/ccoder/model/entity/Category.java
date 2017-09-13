package cc.ccoder.model.entity;

import java.util.HashSet;
import java.util.Set;

/**
 * Category entity. @author MyEclipse Persistence Tools
 */

public class Category implements java.io.Serializable {

	private static final long serialVersionUID = 1L;
	private Integer id;
	private Category category;
	private String name;
	private Integer status;
	private String createTime;
	private Set categories = new HashSet(0);
	private Set products = new HashSet(0);

	// Constructors

	/** default constructor */
	public Category() {
	}

	/** full constructor */
	public Category(Category category, String name, Integer status,
			String createTime, Set categories, Set products) {
		this.category = category;
		this.name = name;
		this.status = status;
		this.createTime = createTime;
		this.categories = categories;
		this.products = products;
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

	public Set getCategories() {
		return this.categories;
	}

	public void setCategories(Set categories) {
		this.categories = categories;
	}

	public Set getProducts() {
		return this.products;
	}

	public void setProducts(Set products) {
		this.products = products;
	}

}