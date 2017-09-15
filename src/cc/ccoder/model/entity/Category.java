package cc.ccoder.model.entity;

/**
 * Category entity. @author MyEclipse Persistence Tools
 */

public class Category implements java.io.Serializable {

	// Fields

	private Integer id;
	private Integer parentId;
	private String name;
	private Integer status;
	private String createTime;

	// Constructors

	/** default constructor */
	public Category() {
	}

	/** full constructor */
	public Category(Integer parentId, String name, Integer status,
			String createTime) {
		this.parentId = parentId;
		this.name = name;
		this.status = status;
		this.createTime = createTime;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getParentId() {
		return this.parentId;
	}

	public void setParentId(Integer parentId) {
		this.parentId = parentId;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Integer getStatus() {
		return this.status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public String getCreateTime() {
		return this.createTime;
	}

	public void setCreateTime(String createTime) {
		this.createTime = createTime;
	}

	@Override
	public String toString() {
		return "Category [id=" + id + ", parentId=" + parentId + ", name="
				+ name + ", status=" + status + ", createTime=" + createTime
				+ "]";
	}
	
	

}