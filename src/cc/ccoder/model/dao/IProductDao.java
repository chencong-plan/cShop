package cc.ccoder.model.dao;

import java.util.List;

import cc.ccoder.model.entity.Product;

public interface IProductDao {

	/**
	 * 根据分类id查询当前分类下面的所有商品的信息
	 * 
	 * @param categoryId
	 *            将要查询商品信息的分类id
	 * @param pageNum
	 *            当前显示第几页数据
	 * @param pageSize
	 *            每一页显示的数量
	 * @return 返回商品集合
	 */
	List<Product> getProductsByCategoryId(Integer categoryId, Integer pageNum,
			Integer pageSize);

	/**
	 * 通过关键字查询所有匹配的结果
	 * 
	 * @param keyword
	 *            关键字
	 * @param pageNum
	 *            当前显示第几页
	 * @param pageSize
	 *            每一页显示的数据
	 * @return 返回结果集
	 */
	List<Product> getProductsByKeyword(String keyword, Integer pageNum,
			Integer pageSize);

	/**
	 * 通过商品id查找该商品实体信息
	 * 
	 * @param productId
	 *            将要查找的商品的id
	 * @return 返回该商品的详细信息实体
	 */
	Product getProductById(Integer productId);
}
