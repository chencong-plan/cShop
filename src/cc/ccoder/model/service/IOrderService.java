package cc.ccoder.model.service;

import java.util.List;

import cc.ccoder.model.entity.User;
import cc.ccoder.model.entity.vo.OrderVo;

public interface IOrderService {

	/**
	 * 添加订单
	 * 
	 * @param cardIds
	 *            将要往订单详情里面插入的购物车id数组
	 * @param shippingId 
	 * @param user 
	 * @param totalPrice 
	 * @return 返回此次操作是否成功
	 */
	boolean addOrder(String[] cartIds, Integer shippingId, User user, double totalPrice);

	List<OrderVo> getOrders(User user);

}
