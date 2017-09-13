package cc.ccoder.model.entity;

import java.util.HashSet;
import java.util.Set;

/**
 * Order entity. @author MyEclipse Persistence Tools
 */

public class Order implements java.io.Serializable {

	// Fields

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Integer id;
	private User user;
	private Shipping shipping;
	private Long orderNo;
	private Double payment;
	private Integer status;
	private String paymentTime;
	private String sendTime;
	private String endTime;
	private String createTime;
	private Set orderItems = new HashSet(0);

	// Constructors

	/** default constructor */
	public Order() {
	}

	/** full constructor */
	public Order(User user, Shipping shipping, Long orderNo, Double payment,
			Integer status, String paymentTime, String sendTime,
			String endTime, String createTime, Set orderItems) {
		this.user = user;
		this.shipping = shipping;
		this.orderNo = orderNo;
		this.payment = payment;
		this.status = status;
		this.paymentTime = paymentTime;
		this.sendTime = sendTime;
		this.endTime = endTime;
		this.createTime = createTime;
		this.orderItems = orderItems;
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

	public Shipping getShipping() {
		return this.shipping;
	}

	public void setShipping(Shipping shipping) {
		this.shipping = shipping;
	}

	public Long getOrderNo() {
		return this.orderNo;
	}

	public void setOrderNo(Long orderNo) {
		this.orderNo = orderNo;
	}

	public Double getPayment() {
		return this.payment;
	}

	public void setPayment(Double payment) {
		this.payment = payment;
	}

	public Integer getStatus() {
		return this.status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public String getPaymentTime() {
		return this.paymentTime;
	}

	public void setPaymentTime(String paymentTime) {
		this.paymentTime = paymentTime;
	}

	public String getSendTime() {
		return this.sendTime;
	}

	public void setSendTime(String sendTime) {
		this.sendTime = sendTime;
	}

	public String getEndTime() {
		return this.endTime;
	}

	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}

	public String getCreateTime() {
		return this.createTime;
	}

	public void setCreateTime(String createTime) {
		this.createTime = createTime;
	}

	public Set getOrderItems() {
		return this.orderItems;
	}

	public void setOrderItems(Set orderItems) {
		this.orderItems = orderItems;
	}

}