package cc.ccoder.controler;

import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import cc.ccoder.common.Const;
import cc.ccoder.model.entity.Product;
import cc.ccoder.model.entity.User;
import cc.ccoder.model.entity.vo.CartMap;
import cc.ccoder.model.service.IProductService;

/**
 * 购物车处理请求Controler
 * @author chencong
 *
 */
@Controller("cartAction")
public class CartAction {
	
	//注入productService层接口
	@Autowired
	private IProductService iProductService;

	private Integer productId;  //添加进入购物车的商品id
	private Integer count;  // 该商品添加进入购物车的数量
	private CartMap cartMap = new CartMap();
	
	/**
	 * 添加进入购物车，首先判断用户是否登录了
	 * @return  
	 */
	public String addCart(){
		HttpSession session = ServletActionContext.getRequest().getSession();
		User user = (User) session.getAttribute(Const.CURRENT_USER);
		//通过商品id获得到该商品
		Product product = null;
		if (productId != null) {
			product = iProductService.getProductById(productId);
		}
		if (user == null) {
			//用户没有登录 直接将购车放入session
			cartMap.addCart(product, count);
		}else{
			//将购物车入库
		}
		session.setAttribute("cartMap", cartMap);
		return "success";
	}
	
	/**
	 * 清空购物车
	 * @return
	 */
	public String clearCart(){
		return null;
	}

	public Integer getProductId() {
		return productId;
	}

	public void setProductId(Integer productId) {
		this.productId = productId;
	}

	public Integer getCount() {
		return count;
	}

	public void setCount(Integer count) {
		this.count = count;
	}
	
	
}
