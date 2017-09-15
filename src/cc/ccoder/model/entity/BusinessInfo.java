package cc.ccoder.model.entity;

/**
 * BusinessInfo entity. @author MyEclipse Persistence Tools
 */

public class BusinessInfo implements java.io.Serializable {

	// Fields

	private Integer id;
	private String name;
	private String phone;
	private String address;
	private String describe;
	private String updateTime;

	// Constructors

	/** default constructor */
	public BusinessInfo() {
	}

	/** full constructor */
	public BusinessInfo(String name, String phone, String address,
			String describe, String updateTime) {
		this.name = name;
		this.phone = phone;
		this.address = address;
		this.describe = describe;
		this.updateTime = updateTime;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPhone() {
		return this.phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getAddress() {
		return this.address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getDescribe() {
		return this.describe;
	}

	public void setDescribe(String describe) {
		this.describe = describe;
	}

	public String getUpdateTime() {
		return this.updateTime;
	}

	public void setUpdateTime(String updateTime) {
		this.updateTime = updateTime;
	}

}