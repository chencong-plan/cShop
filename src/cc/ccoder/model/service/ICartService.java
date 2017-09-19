package cc.ccoder.model.service;

import java.util.List;

import cc.ccoder.model.entity.Cart;
import cc.ccoder.model.entity.User;
import cc.ccoder.model.entity.vo.CartVo;

/**
 * 购物车操作实体服务层
 * @author chencong
 *
 */
public interface ICartService {

	/**
	 * 查找当前用户的购物车Vo商品数量，默认显示前五条数据
	 * @param user
	 * @param pageNum
	 * @param pageSize
	 * @return
	 */
	List<CartVo> getCartsByUserId(User user, Integer pageNum, Integer pageSize);

}
