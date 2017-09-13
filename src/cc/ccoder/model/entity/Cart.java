package cc.ccoder.model.entity;

public class Cart implements java.io.Serializable {

	private static final long serialVersionUID = 1L;
	private Integer id;
	private User user;
	private Product product;
	private Integer quantity;
	private String createTime;

	public Cart() {
	}

	public Cart(User user) {
		this.user = user;
	}

	/** full constructor */
	public Cart(User user, Product product, Integer quantity, String createTime) {
		this.user = user;
		this.product = product;
		this.quantity = quantity;
		this.createTime = createTime;
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

	public Product getProduct() {
		return this.product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	public Integer getQuantity() {
		return this.quantity;
	}

	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}

	public String getCreateTime() {
		return this.createTime;
	}

	public void setCreateTime(String createTime) {
		this.createTime = createTime;
	}

}