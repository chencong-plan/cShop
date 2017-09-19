package cc.ccoder.model.service.impl;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cc.ccoder.model.dao.ICartDao;
import cc.ccoder.model.dao.IProductDao;
import cc.ccoder.model.entity.Cart;
import cc.ccoder.model.entity.Product;
import cc.ccoder.model.entity.User;
import cc.ccoder.model.entity.vo.CartVo;
import cc.ccoder.model.service.ICartService;
import cc.ccoder.utils.BigDecimalUtil;

/**
 * 购物车服务层接口实现
 * @author chencong
 *
 */
@Service("iCartService")
public class CartServiceImpl implements ICartService{

	@Autowired
	private ICartDao iCartDao;
	
	@Autowired
	private IProductDao iProductDao;
	
	@Override
	public List<CartVo> getCartsByUserId(User user, Integer pageNum,
			Integer pageSize) {
		if (user == null || pageNum == null || pageSize == null) {
			return null;
		}
		List<CartVo> cartVos = new ArrayList<CartVo>();
		for (Cart cart : iCartDao.getCartsByUserId(user, pageNum, pageSize)) {
			CartVo cartVo = new CartVo();
			Product product = iProductDao.getProductById(cart.getProductId());
			cartVo.setCartId(cart.getId());
			cartVo.setProductId(cart.getProductId());
			cartVo.setProductName(product.getName());
			cartVo.setProductTitle(product.getSubtitle());
			cartVo.setMainImage(product.getMainImage());
			cartVo.setProductPrice(product.getPrice());
			cartVo.setQuantity(cart.getQuantity());
			cartVo.setTotalPrice(BigDecimalUtil.mul(product.getPrice(),cart.getQuantity()).doubleValue());
			cartVos.add(cartVo);
		}
		return cartVos;
	}

}
