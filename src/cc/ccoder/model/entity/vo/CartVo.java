package cc.ccoder.model.entity.vo;

public class CartVo {

	private Integer cartId;
	private Integer productId;
	private String mainImage;
	private String productName;
	private String productTitle;
	private Double productPrice;
	private Integer quantity;
	private Double totalPrice;

	public Integer getCartId() {
		return cartId;
	}

	public void setCartId(Integer cartId) {
		this.cartId = cartId;
	}

	public Integer getProductId() {
		return productId;
	}

	public void setProductId(Integer productId) {
		this.productId = productId;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public Double getProductPrice() {
		return productPrice;
	}

	public void setProductPrice(Double productPrice) {
		this.productPrice = productPrice;
	}

	public Integer getQuantity() {
		return quantity;
	}

	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}

	public Double getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(Double totalPrice) {
		this.totalPrice = totalPrice;
	}

	public String getMainImage() {
		return mainImage;
	}

	public void setMainImage(String mainImage) {
		this.mainImage = mainImage;
	}

	public CartVo() {
		super();
	}

	public String getProductTitle() {
		return productTitle;
	}

	public void setProductTitle(String productTitle) {
		this.productTitle = productTitle;
	}

	@Override
	public String toString() {
		return "CartVo [cartId=" + cartId + ", productId=" + productId
				+ ", mainImage=" + mainImage + ", productName=" + productName
				+ ", productTitle=" + productTitle + ", productPrice="
				+ productPrice + ", quantity=" + quantity + ", totalPrice="
				+ totalPrice + "]";
	}

}
