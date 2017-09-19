package cc.ccoder.model.service;

import java.util.List;

import cc.ccoder.model.entity.Cart;
import cc.ccoder.model.entity.User;
import cc.ccoder.model.entity.vo.CartVo;

/**
 * 购物车操作实体服务层
 * 
 * @author chencong
 *
 */
public interface ICartService {

	/**
	 * 查找当前用户的购物车Vo商品数量，默认显示前五条数据
	 * 
	 * @param user
	 * @param pageNum
	 * @param pageSize
	 * @return
	 */
	List<CartVo> getCartsByUserId(User user, Integer pageNum, Integer pageSize);

	/**
	 * 根据购物车id 删除当前购物车
	 * 
	 * @param cartIds
	 *            将要删除的商品
	 * @return 返回此次操作是否成功
	 */
	boolean deleteCartById(String[] cartIds);

	/**
	 * 计算当前用户购物车当中商品总价
	 * @return
	 */
	Double calTotalPrice(User user, Integer pageNum, Integer pageSize);

	/**
	 * 通过选中的id 组装CartVo
	 * @param cartIds
	 * @return
	 */
	List<CartVo> getCarById(String[] cartIds);

}
