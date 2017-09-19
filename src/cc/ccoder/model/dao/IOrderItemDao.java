package cc.ccoder.model.dao;

import cc.ccoder.model.entity.OrderItem;

public interface IOrderItemDao {

	/**
	 * 从购物车中添加进入订单详情表当中
	 * @param orderItem
	 */
	void addOrderItem(OrderItem orderItem);

}
