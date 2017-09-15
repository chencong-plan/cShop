package cc.ccoder.model.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

	@Override
	public Map<Category, List<Category>> getCategories(Integer parentId) {
		//当前parentId下面的子分类信息
		List<Category> categories = selectCategoryChildrenByParentId(parentId);
		System.out.println("parentId分类 ： "+categories);
		Map<Category, List<Category>> categoryMap = new HashMap<Category, List<Category>>();
		for(Category categoryItem : categories){
			categoryMap.put(categoryItem,selectCategoryChildrenByParentId(categoryItem.getId()));
		}
		return categoryMap;
	}

}
