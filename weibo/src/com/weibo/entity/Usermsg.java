package com.weibo.entity;

/**
 * Usermsg entity. @author MyEclipse Persistence Tools
 */

public class Usermsg implements java.io.Serializable {

	// Fields

	private Integer id;
	private String username;
	private String password;
	private String phone;
	private String sex;
	private String img;

	// Constructors

	/** default constructor */
	public Usermsg() {
	}

	/** minimal constructor */
	public Usermsg(String username, String password, String img) {
		this.username = username;
		this.password = password;
		this.img = img;
	}

	/** full constructor */
	public Usermsg(String username, String password, String phone, String sex,
			String img) {
		this.username = username;
		this.password = password;
		this.phone = phone;
		this.sex = sex;
		this.img = img;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getUsername() {
		return this.username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return this.password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getPhone() {
		return this.phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getSex() {
		return this.sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public String getImg() {
		return this.img;
	}

	public void setImg(String img) {
		this.img = img;
	}

}