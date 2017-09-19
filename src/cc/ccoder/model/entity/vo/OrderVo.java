package cc.ccoder.model.entity.vo;

import java.util.List;

import cc.ccoder.model.entity.OrderItem;

public class OrderVo {

	private Integer orderId;
	private Long orderNo;
	private String reviceName;
	private Integer orderStatus;
	private Double orderTotalPrice;
	private String createTime;
	private List<OrderItemVo> orderItemVos;

	public Integer getOrderId() {
		return orderId;
	}

	public void setOrderId(Integer orderId) {
		this.orderId = orderId;
	}

	public Long getOrderNo() {
		return orderNo;
	}

	public void setOrderNo(Long orderNo) {
		this.orderNo = orderNo;
	}

	public String getReviceName() {
		return reviceName;
	}

	public void setReviceName(String reviceName) {
		this.reviceName = reviceName;
	}

	public Integer getOrderStatus() {
		return orderStatus;
	}

	public void setOrderStatus(Integer orderStatus) {
		this.orderStatus = orderStatus;
	}

	public Double getOrderTotalPrice() {
		return orderTotalPrice;
	}

	public void setOrderTotalPrice(Double orderTotalPrice) {
		this.orderTotalPrice = orderTotalPrice;
	}

	public String getCreateTime() {
		return createTime;
	}

	public void setCreateTime(String createTime) {
		this.createTime = createTime;
	}

	
	

	public List<OrderItemVo> getOrderItemVos() {
		return orderItemVos;
	}

	public void setOrderItemVos(List<OrderItemVo> orderItemVos) {
		this.orderItemVos = orderItemVos;
	}



	public OrderVo(Integer orderId, Long orderNo, String reviceName,
			Integer orderStatus, Double orderTotalPrice, String createTime,
			List<OrderItemVo> orderItemVos) {
		super();
		this.orderId = orderId;
		this.orderNo = orderNo;
		this.reviceName = reviceName;
		this.orderStatus = orderStatus;
		this.orderTotalPrice = orderTotalPrice;
		this.createTime = createTime;
		this.orderItemVos = orderItemVos;
	}

	public OrderVo() {
		super();
	}

	@Override
	public String toString() {
		return "OrderVo [orderId=" + orderId + ", orderNo=" + orderNo
				+ ", reviceName=" + reviceName + ", orderStatus=" + orderStatus
				+ ", orderTotalPrice=" + orderTotalPrice + ", createTime="
				+ createTime + ", orderItemVos=" + orderItemVos + "]";
	}



}
