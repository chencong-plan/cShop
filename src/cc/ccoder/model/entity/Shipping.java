package cc.ccoder.model.entity;

/**
 * Shipping entity. @author MyEclipse Persistence Tools
 */

public class Shipping implements java.io.Serializable {

	// Fields

	private Integer id;
	private Integer userId;
	private String name;
	private String phone;
	private String province;
	private String city;
	private String district;
	private String address;
	private String createTime;

	// Constructors

	/** default constructor */
	public Shipping() {
	}

	/** full constructor */
	public Shipping(Integer userId, String name, String phone, String province,
			String city, String district, String address, String createTime) {
		this.userId = userId;
		this.name = name;
		this.phone = phone;
		this.province = province;
		this.city = city;
		this.district = district;
		this.address = address;
		this.createTime = createTime;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getUserId() {
		return this.userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
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

	public String getProvince() {
		return this.province;
	}

	public void setProvince(String province) {
		this.province = province;
	}

	public String getCity() {
		return this.city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getDistrict() {
		return this.district;
	}

	public void setDistrict(String district) {
		this.district = district;
	}

	public String getAddress() {
		return this.address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getCreateTime() {
		return this.createTime;
	}

	public void setCreateTime(String createTime) {
		this.createTime = createTime;
	}

}