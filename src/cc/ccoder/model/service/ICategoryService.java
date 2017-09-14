package cc.ccoder.model.service;

import java.util.List;

import cc.ccoder.model.entity.Category;

public interface ICategoryService {

	/**
	 * 通过主键查询当前分类信息
	 * 
	 * @param id
	 *            待查询主键
	 * @return 返回查询到的实体
	 */
	Category selectById(Integer id);

	/**
	 * 通过categoryId查询当前id下的所有子分类的信息
	 * 
	 * @param parentId
	 *            将要查询的父分类id
	 * @return 返回所有子分类信息集合
	 */
	List<Category> selectCategoryChildrenByParentId(Integer parentId);

	/**
	 * 查询分类详细信息及其子分类详细信息
	 * 
	 * @return
	 */
	List<Category> selectCategories();

	/**
	 * 根据给定id查找出该id对应的所有子分类id
	 * @param id
	 * @return
	 */
	List<Integer> selectCategoryAndChildrenById(Integer categoryId);
}
