package cc.ccoder.model.dao;

import java.util.List;

import cc.ccoder.model.entity.Order;
import cc.ccoder.model.entity.User;

public interface IOrderDao {

	boolean insertOrderInfo(Order order);

	List<Order> getOrders(User user);

}
