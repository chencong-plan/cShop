package cc.ccoder.model.service.impl;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

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
	public List<Category> selectCategories() {
		return iCategoryDao.selectCategories();
	}

	@Override
	public List<Integer> selectCategoryAndChildrenById(Integer categoryId) {
		 Set<Category> categorySet = new HashSet();
	        findChildCategory(categorySet, categoryId);

	        List<Integer> categoryIdList = new ArrayList();
	        if (categoryId != null) {
	            for (Category categoryItem : categorySet) {
	                categoryIdList.add(categoryItem.getId());
	            }
	        }
	      return  categoryIdList;
	}

	private  Set<Category> findChildCategory(Set<Category> categorySet, Integer categoryId) {
		Category category = iCategoryDao.selectById(categoryId);
        if (category != null) {
            categorySet.add(category);
        }
        //查找子节点 mybatis返回的list中不会存在null 也就不必要进行null判断
        List<Category> categoryList = iCategoryDao.selectCategoryChildrenByParentId(categoryId);
        for (Category categoryItem : categoryList) {
            findChildCategory(categorySet, categoryItem.getId());
        }
        return categorySet;
		
	}

}
