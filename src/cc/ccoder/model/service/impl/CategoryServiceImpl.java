package cc.ccoder.model.service.impl;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cc.ccoder.model.dao.ICategoryDao;
import cc.ccoder.model.entity.Category;
import cc.ccoder.model.service.ICategoryService;

@Service("iCategoryService")
public class CategoryServiceImpl implements ICategoryService {
	
	@Autowired
	private ICategoryDao iCategoryDao;

	@Override
	public Category selectById(Integer id) {
		return iCategoryDao.selectById(id);
	}

	@Override
	public List<Category> selectCategoryChildrenByParentId(Integer parentId) {
		return iCategoryDao.selectCategoryChildrenByParentId(parentId);
	}


}
