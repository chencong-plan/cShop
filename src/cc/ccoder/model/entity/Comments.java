package cc.ccoder.model.entity;

import java.util.HashSet;
import java.util.Set;

/**
 * Comments entity. @author MyEclipse Persistence Tools
 */

public class Comments implements java.io.Serializable {

	// Fields

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Integer id;
	private User user;
	private Comments comments;
	private Product product;
	private String comment;
	private Integer status;
	private String createTime;
	private Set commentses = new HashSet(0);

	// Constructors

	/** default constructor */
	public Comments() {
	}

	/** full constructor */
	public Comments(User user, Comments comments, Product product,
			String comment, Integer status, String createTime, Set commentses) {
		this.user = user;
		this.comments = comments;
		this.product = product;
		this.comment = comment;
		this.status = status;
		this.createTime = createTime;
		this.commentses = commentses;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public User getUser() {
		return this.user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Comments getComments() {
		return this.comments;
	}

	public void setComments(Comments comments) {
		this.comments = comments;
	}

	public Product getProduct() {
		return this.product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	public String getComment() {
		return this.comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
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

}