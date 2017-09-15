package cc.ccoder.model.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cc.ccoder.model.dao.IProductDao;
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

}
