package cc.ccoder.model.dao;

import java.util.List;

import cc.ccoder.model.entity.Shipping;
import cc.ccoder.model.entity.User;

public interface IShippingDao {

	/**
	 * 添加用户收货地址进入购物车
	 * 
	 * @param shipping
	 *            将要添加入库的地址信息
	 * @return 返回此次操作是否成功
	 */
	boolean addShipping(Shipping shipping);

	/**
	 * 通过目标用户id 查找该用户id下面的地址信息
	 * @param userId
	 * @param pageNum
	 * @param pageSize
	 * @return
	 */
	List<Shipping> getShippingByUserId(Integer userId, Integer pageNum,
			Integer pageSize);

	/**
	 * 通过收货地址id删除指定用户下面的收货地址
	 * @param shippingId
	 * @param userId
	 * @return
	 */
	boolean deleteShippingById(Integer shippingId, Integer userId);

	/**
	 * 通过收货地址id 获取到当前收货地址信息
	 * @param shippingId  将要获取的收货地址信息
	 * @return
	 */
	Shipping getShippingById(Integer shippingId);

}
