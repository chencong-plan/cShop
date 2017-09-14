package cc.ccoder.controler;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.alibaba.fastjson.JSON;

import cc.ccoder.common.ServerResponse;
import cc.ccoder.model.entity.Category;
import cc.ccoder.model.service.ICategoryService;

@Controller("categoryAction")
public class CategoryAction {

	private String result;

	@Autowired
	private ICategoryService iCategoryService;

	public String getCategories() {
		List<Category> categories = iCategoryService.selectCategories();
		for(Category category : categories){
			System.out.println(category);
		}
		result = JSON.toJSONString(ServerResponse.createBySuccess("分类信息",
				categories));
		return "success";
	}
	
//	public String getAllCategories(){
//		List<Integer> categoriesId = iCategoryService.selectCategoryAndChildrenById(1);
//		result = JSON.toJSONString(ServerResponse.createBySuccess("查询成功", categoriesId));
//		return "success";
//	}

	
	public String getResult() {
		return result;
	}

	public void setResult(String result) {
		this.result = result;
	}

}
