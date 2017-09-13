package cc.ccoder.model.entity;

/**
 * OrderItem entity. @author MyEclipse Persistence Tools
 */

public class OrderItem implements java.io.Serializable {

	// Fields

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Integer id;
	private User user;
	private Order order;
	private Integer productId;
	private String productName;
	private String productImage;
	private Double unitPrice;
	private Integer quantity;
	private Double totalPrice;
	private String createTime;

	// Constructors

	/** default constructor */
	public OrderItem() {
	}

	/** full constructor */
	public OrderItem(User user, Order order, Integer productId,
			String productName, String productImage, Double unitPrice,
			Integer quantity, Double totalPrice, String createTime) {
		this.user = user;
		this.order = order;
		this.productId = productId;
		this.productName = productName;
		this.productImage = productImage;
		this.unitPrice = unitPrice;
		this.quantity = quantity;
		this.totalPrice = totalPrice;
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

	public Order getOrder() {
		return this.order;
	}

	public void setOrder(Order order) {
		this.order = order;
	}

	public Integer getProductId() {
		return this.productId;
	}

	public void setProductId(Integer productId) {
		this.productId = productId;
	}

	public String getProductName() {
		return this.productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public String getProductImage() {
		return this.productImage;
	}

	public void setProductImage(String productImage) {
		this.productImage = productImage;
	}

	public Double getUnitPrice() {
		return this.unitPrice;
	}

	public void setUnitPrice(Double unitPrice) {
		this.unitPrice = unitPrice;
	}

	public Integer getQuantity() {
		return this.quantity;
	}

	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}

	public Double getTotalPrice() {
		return this.totalPrice;
	}

	public void setTotalPrice(Double totalPrice) {
		this.totalPrice = totalPrice;
	}

	public String getCreateTime() {
		return this.createTime;
	}

	public void setCreateTime(String createTime) {
		this.createTime = createTime;
	}

}