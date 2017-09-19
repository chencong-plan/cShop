package cc.ccoder.model.dao;

import java.util.List;

import cc.ccoder.model.entity.Cart;
import cc.ccoder.model.entity.User;

/**
 * 购物车dao层接口方法
 * @author chencong
 *
 */
public interface ICartDao {

	/**
	 * 查找当前用户购物车商品
	 * @param user 当前用户
	 * @param pageSize  每页显示数量 默认5
	 * @param pageNum  当前显示第几页 默认显示第一页0
	 * @return  返回当前购物车数量
	 */
	List<Cart> getCartsByUserId(User user, Integer pageNum, Integer pageSize);

}
