package cc.ccoder.model.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import cc.ccoder.common.Const;
import cc.ccoder.model.dao.IOrderDao;
import cc.ccoder.model.dao.IOrderItemDao;
import cc.ccoder.model.entity.Order;
import cc.ccoder.model.entity.OrderItem;
import cc.ccoder.model.entity.Shipping;
import cc.ccoder.model.entity.User;
import cc.ccoder.model.entity.vo.CartVo;
import cc.ccoder.model.entity.vo.OrderVo;
import cc.ccoder.model.service.ICartService;
import cc.ccoder.model.service.IOrderService;
import cc.ccoder.model.service.IShippingService;
import cc.ccoder.utils.DateUtils;

@Service("iOrderService")
public class OrderServiceImpl implements IOrderService {

	@Autowired
	private IOrderDao iOrderDao;

	@Autowired
	private IOrderItemDao iOrderItemDao;

	@Autowired
	private ICartService iCartService;
	
	@Autowired 
	private IShippingService iShippingService;
	


	private Order getOrderInf(User user, Integer shippingId, double totalprice) {
		Order order = new Order();
		order.setOrderNo(Long.parseLong(DateUtils
				.getCurrentTime("yyyyMMddHHmms")));
		order.setUserId(user.getId());
		order.setShippingId(shippingId);
		order.setPayment(totalprice);
		order.setStatus(Const.NO_PAY);
		order.setCreateTime(DateUtils.getCurrentTime());
		return order;
	}

	/**
	 * 添加商品进入商品详情页面
	 * 
	 * @param cartIds
	 * @param orderNo
	 * @param userId
	 */
	private void insertOrderItem(String[] cartIds, Long orderNo, int userId) {
		List<CartVo> cartVos = iCartService.getCarById(cartIds);
		for (CartVo cartVo : cartVos) {
			OrderItem orderItem = new OrderItem();
			orderItem.setUserId(userId);
			orderItem.setOrderNo(orderNo);
			orderItem.setProductId(cartVo.getProductId());
			orderItem.setProductName(cartVo.getProductName());
			orderItem.setProductImage(cartVo.getMainImage());
			orderItem.setUnitPrice(cartVo.getProductPrice());
			orderItem.setQuantity(cartVo.getQuantity());
			orderItem.setTotalPrice(cartVo.getTotalPrice());
			orderItem.setCreateTime(DateUtils.getCurrentTime());
			iOrderItemDao.addOrderItem(orderItem);
		}
	}

	@Override
	public boolean addOrder(String[] cartIds, Integer shippingId, User user,
			double totalPrice) {
		Order order = getOrderInf(user, shippingId, totalPrice);
		if (iOrderDao.insertOrderInfo(order)) {
			try {
				// 产生orderNo后 再向orderItem当中插入数据 遍历id数组
				insertOrderItem(cartIds, order.getOrderNo(), user.getId());
				// 删除该商品从购物车当中
				iCartService.deleteCartById(cartIds);
				return true;
			} catch (Exception e) {
				e.printStackTrace();
				return false;
			}
		} else {
			return false;
		}
	}

	@Override
	public List<OrderVo> getOrders(User user) {
		List<Order> orders = iOrderDao.getOrders(user);
		List<OrderVo> orderVos = new ArrayList<OrderVo>();
		for(Order order : orders){
			OrderVo orderVo = new OrderVo();
			orderVo.setOrderId(order.getId());
			orderVo.setOrderNo(order.getOrderNo());
			orderVo.setOrderStatus(order.getStatus());
			Shipping shipping = iShippingService.getShippingById(order.getShippingId());
			orderVo.setReviceName(shipping.getName());
			orderVo.setOrderTotalPrice(order.getPayment());
			orderVo.setCreateTime(order.getCreateTime());
			//设置orderItem-->list
			orderVo.setOrderItemVos(null);
		}
		return null;
	}

}
