package cc.ccoder.model.service;

import java.util.List;

import cc.ccoder.model.entity.Shipping;

/**
 * 服务层接口 用户地址
 * 
 * @author chencong
 *
 */
public interface IShippingService {

	/**
	 * 添加用户收货地址进入购物车
	 * 
	 * @param shipping
	 *            将要添加入库的地址信息
	 * @return 返回此次操作是否成功
	 */
	boolean addShipping(Shipping shipping);

	/**
	 * 通过用户id 查找当前用户的所有地址信息
	 * @param userId 
	 * @param pageSize 
	 * @param pageNum 
 	 * @return 
	 */
	List<Shipping> getShippingByUserId(Integer userId, Integer pageNum, Integer pageSize);

	/**
	 * 通过id删除目标用户下面的指定收货地址信息
	 * @param shippingId
	 * @param integer 
	 * @return
	 */
	boolean deleteShippingById(Integer shippingId, Integer userId);

	/**
	 * 通过收货地址id 获取到收货地址信息
	 * @param shippingId  将要获取的收货地址信息
	 * @return
	 */ 
	Shipping getShippingById(Integer shippingId);

}
