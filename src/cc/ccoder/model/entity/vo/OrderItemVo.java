package cc.ccoder.model.entity.vo;

public class OrderItemVo {

	private Integer orderItemId;
	private Integer productId;
	private String mainImage;
	private String subTitle;
	private Integer quantity;
	private Double productPrice;
	private Double totalPrice;

	public Integer getOrderItemId() {
		return orderItemId;
	}

	public void setOrderItemId(Integer orderItemId) {
		this.orderItemId = orderItemId;
	}

	public Integer getProductId() {
		return productId;
	}

	public void setProductId(Integer productId) {
		this.productId = productId;
	}

	public String getMainImage() {
		return mainImage;
	}

	public void setMainImage(String mainImage) {
		this.mainImage = mainImage;
	}

	public String getSubTitle() {
		return subTitle;
	}

	public void setSubTitle(String subTitle) {
		this.subTitle = subTitle;
	}

	public Integer getQuantity() {
		return quantity;
	}

	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}

	public Double getProductPrice() {
		return productPrice;
	}

	public void setProductPrice(Double productPrice) {
		this.productPrice = productPrice;
	}

	public Double getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(Double totalPrice) {
		this.totalPrice = totalPrice;
	}

	public OrderItemVo(Integer orderItemId, Integer productId,
			String mainImage, String subTitle, Integer quantity,
			Double productPrice, Double totalPrice) {
		super();
		this.orderItemId = orderItemId;
		this.productId = productId;
		this.mainImage = mainImage;
		this.subTitle = subTitle;
		this.quantity = quantity;
		this.productPrice = productPrice;
		this.totalPrice = totalPrice;
	}

	public OrderItemVo() {
		super();
	}

	@Override
	public String toString() {
		return "OrderItemVo [orderItemId=" + orderItemId + ", productId="
				+ productId + ", mainImage=" + mainImage + ", subTitle="
				+ subTitle + ", quantity=" + quantity + ", productPrice="
				+ productPrice + ", totalPrice=" + totalPrice + "]";
	}

}
