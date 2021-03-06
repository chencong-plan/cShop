package cc.ccoder.controler;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.alibaba.fastjson.JSON;

import cc.ccoder.common.ServerResponse;
import cc.ccoder.model.entity.Product;
import cc.ccoder.model.service.IProductService;

@Controller("productAction")
public class ProductAction {

	@Autowired
	private IProductService iProductService;
	private Integer categoryId;
	private Integer pageNum;
	private Integer pageSize;
	private String keyword = null;
	private String result;
	private Integer productId;

	/**
	 * 通过分类id加载该分类下面所有商品信息，如果没有指定pageNum及其pageSize，默认加载5条数据
	 * 
	 * @return 返回是否加载成功，加载成功则将数据放入session当中
	 */
	public String categories() {
		if (pageNum == null || pageSize == null) {
			pageNum = 0;
			pageSize = 5;
		}
		List<Product> productLists = null;
		if (categoryId != null) {
			// 通过categoryId查询该分了下的商品信息列表
			productLists = iProductService.getProductsByCategoryId(categoryId,
					pageNum, pageSize);
		}
		if (!"".equals(keyword)) {
			// 通过关键字查询该分类下的商品信息
			productLists = iProductService.getProductsByKeyword(keyword,
					pageNum, pageSize);
		}
		if (categoryId == null || keyword == null) {
			// 修改地址栏 没有参数的情况下 直接放回所有的商品
			productLists = iProductService.getProductsByKeyword("", pageNum,
					pageSize);
		}
		if (productLists.isEmpty()) {
			result = JSON.toJSONString(ServerResponse
					.createByErrorMessage("很抱歉，没有找到您需要的商品。"));
		} else {
			result = JSON.toJSONString(ServerResponse
					.createBySuccessMessage("查找成功"));
		}
		System.out.println(result);
		System.out.println(productLists);
		HttpSession session = ServletActionContext.getRequest().getSession();
		session.setAttribute("productLists", productLists);
		return "success";
	}

	/**
	 * 通过商品id查找该商品的详细信息
	 * @return  返回该商品的详细信息实体
	 */
	public String getProductById() {
		Product resultProduct = iProductService.getProductById(productId);
		HttpSession session = ServletActionContext.getRequest().getSession();
		session.setAttribute("product", resultProduct);
		return "success";
	}

	public Integer getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(Integer categoryId) {
		this.categoryId = categoryId;
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

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public String getResult() {
		return result;
	}

	public void setResult(String result) {
		this.result = result;
	}

	public Integer getProductId() {
		return productId;
	}

	public void setProductId(Integer productId) {
		this.productId = productId;
	}

}
