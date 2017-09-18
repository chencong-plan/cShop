package cc.ccoder.model.entity.vo;

import java.util.HashMap;
import java.util.Map;

import cc.ccoder.model.entity.Product;

public class CartMap {

	private Map<Product, Integer> productMap;
	private double totalPricce;

	public Map<Product, Integer> getProductMap() {
		return productMap;
	}

	public void setProductMap(Map<Product, Integer> productMap) {
		this.productMap = productMap;
	}

	public double getTotalPricce() {
		return totalPricce;
	}

	public void setTotalPricce(double totalPricce) {
		this.totalPricce = totalPricce;
	}

	public CartMap() {
		this.productMap = new HashMap<Product, Integer>();
		this.totalPricce = 0.0;
	}

	/**
	 * 添加指定数量商品进入购物
	 * 
	 * @param product
	 *            将要添加的商品
	 * @param count
	 *            将要添加进入购物车的商品数量
	 */
	public void addCart(Product product, Integer count) {
		int number = count;
		if (productMap.containsKey(product)) {
			// 如果已经存在了此商品，则增加数量
			number = productMap.get(product) + count;
		}
		productMap.put(product, number);
		calcuTotalPrice();
	}

	/**
	 * 删除购物车当中某一件商品
	 * 
	 * @param product
	 *            将要从购物车中删除的商品
	 */
	public void deleteCart(Product product) {
		productMap.remove(product);
		//删除之后计算一遍购车的商品总价
		calcuTotalPrice();
	}
	
	/**
	 * 直接清空购车
	 */
	public void clearCart(){
		productMap.clear();
		calcuTotalPrice();
	}

	/**
	 * 计算当前购物车当中的商品详情
	 * 
	 * @return 返回当前购物车当中商品的总价格
	 */
	public double calcuTotalPrice() {
		double sum = 0.0;
		for (Map.Entry<Product, Integer> entry : productMap.entrySet()) {
			sum = entry.getKey().getPrice() * entry.getValue();
		}
		this.totalPricce = sum;
		return this.totalPricce;
	}
	
	

}
