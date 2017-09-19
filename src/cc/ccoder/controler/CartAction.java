package cc.ccoder.controler;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import cc.ccoder.common.Const;
import cc.ccoder.model.entity.Cart;
import cc.ccoder.model.entity.Product;
import cc.ccoder.model.entity.User;
import cc.ccoder.model.entity.vo.CartMap;
import cc.ccoder.model.entity.vo.CartVo;
import cc.ccoder.model.service.ICartService;
import cc.ccoder.model.service.IProductService;
import cc.ccoder.utils.DateUtils;

/**
 * 购物车处理请求Controler
 * 
 * @author chencong
 *
 */
@Controller("cartAction")
public class CartAction {

	// 注入productService层接口
	@Autowired
	private IProductService iProductService;
	@Autowired
	private ICartService iCartService;

	private Integer productId; // 添加进入购物车的商品id
	private Integer count; // 该商品添加进入购物车的数量
	private CartMap cartMap = new CartMap();
	private String result;

	private Integer pageNum;
	private Integer pageSize;

	/**
	 * 添加进入购物车，首先判断用户是否登录了
	 * 
	 * @return
	 */
	public String addCart() {
		System.out.println("进入cartAction:" + productId + " : " + count);
		HttpSession session = ServletActionContext.getRequest().getSession();
		User user = (User) session.getAttribute(Const.CURRENT_USER);
		// 通过商品id获得到该商品
		Product product = null;
		if (productId != null) {
			product = iProductService.getProductById(productId);
		}
		if (user == null) {
			// 用户没有登录 直接将购车放入session 强制用户前去登录
			// cartMap.addCart(product, count);
			result = "no_login_cart";
		} else {
			// 将购物车入库
			// 登录之后直接入库
			Cart cart = new Cart();
			cart.setProductId(productId);
			cart.setQuantity(count);
			cart.setUserId(user.getId());
			cart.setCreateTime(DateUtils.getCurrentTime());
			if (iProductService.addCart(cart)) {
				result = "addcart_success";
			} else {
				result = "addcart_fail";
			}
		}
		session.setAttribute("result", result);
		return "success";
	}

	/**
	 * 查看当前用户的购物车
	 * 
	 * @return
	 */
	public String getCartByUserId() {
		HttpSession session = ServletActionContext.getRequest().getSession();
		User user = (User) session.getAttribute(Const.CURRENT_USER);

		if (pageNum == null || pageSize == null) {
			pageNum = 0;
			pageSize = 5;
		}
		List<CartVo> cartVos = null;
		if (user != null) {
			cartVos = iCartService.getCartsByUserId(user, pageNum, pageSize);
			result ="get_cart_success";
		}
		session.setAttribute("cartVos", cartVos);
		session.setAttribute("cart_result", result);
		return "success";

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

	public String getResult() {
		return result;
	}

	public void setResult(String result) {
		this.result = result;
	}

	public Integer getPageNum() {
		return pageNum;
	}

	public void setPageNum(Integer pageNum) {
		this.pageNum = pageNum;
	}

	public Integer getPageSize() {
		return pageSize;
	}

	public void setPageSize(Integer pageSize) {
		this.pageSize = pageSize;
	}

}
