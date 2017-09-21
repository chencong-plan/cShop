package cc.ccoder.model.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cc.ccoder.model.dao.IProductDao;
import cc.ccoder.model.entity.Cart;
import cc.ccoder.model.entity.Product;
import cc.ccoder.model.service.IProductService;

@Service("iProductService")
public class ProductServiceImpl implements IProductService  {
	
	@Autowired
	private IProductDao iProductDao;

	@Override
	public List<Product> getProductsByCategoryId(Integer categoryId, Integer pageNum, Integer pageSize) {
		return iProductDao.getProductsByCategoryId(categoryId, pageNum, pageSize);
	}

	@Override
	public List<Product> getProductsByKeyword(String keyword, Integer pageNum,
			Integer pageSize) {
		return iProductDao.getProductsByKeyword(keyword, pageNum, pageSize);
	}

	@Override
	public Product getProductById(Integer productId) {
		return iProductDao.getProductById(productId);
	}

	@Override
	public boolean addCart(Cart cart) {
		Cart resultCart = iProductDao.getCartById(cart.getUserId(), cart.getProductId());
		if(resultCart != null){
			//该商品已经存在与数据库当中 不属于新增
			cart.setId(resultCart.getId());  //更新主键
			cart.setQuantity(resultCart.getQuantity() + cart.getQuantity());  //更新商品数量
		}
		return iProductDao.addCart(cart);
		
	}

}
