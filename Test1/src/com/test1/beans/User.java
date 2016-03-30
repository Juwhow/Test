package com.test1.beans;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

@Entity
@Table(name = "t_user")
public class User {

	private int id;
	// 身份证号
	private String IDCard;
	// 姓名
	private String name;
	// 密码
	private String password;
	// 性别
	private String sex;
	// 手机号
	private String number;
	// 邮箱
	private String email;
	// 驾驶证编号
	private String licenseNumber;
	// 证件照片
	private String photo;
	// 用户类型：运营商 司机 普通用户
	private String userType;
	// 激活状态
	private int status;
	// 昵称
	private String nickname;
	// 身份证截止时间
	private String IDCardEndTime;
	// 驾驶证截止时间
	private String licenseEndTime;
	// 激活邮箱
	private String emailKey;

	@Id
	@GeneratedValue(generator = "_native")
	@GenericGenerator(name = "_native", strategy = "native")
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	@Column(length = 20)
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Column(length = 50)
	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	@Column(length = 20)
	public String getIDCard() {
		return IDCard;
	}

	public void setIDCard(String iDCard) {
		IDCard = iDCard;
	}

	@Column(length = 10)
	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	@Column(length = 20)
	public String getNumber() {
		return number;
	}

	public void setNumber(String number) {
		this.number = number;
	}

	@Column(length = 20)
	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	@Column(length = 20)
	public String getLicenseNumber() {
		return licenseNumber;
	}

	public void setLicenseNumber(String licenseNumber) {
		this.licenseNumber = licenseNumber;
	}

	@Column(length = 50)
	public String getPhoto() {
		return photo;
	}

	public void setPhoto(String photo) {
		this.photo = photo;
	}

	@Column(length = 10)
	public String getUserType() {
		return userType;
	}

	public void setUserType(String userType) {
		this.userType = userType;
	}

	@Column
	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	@Column(length = 20)
	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	@Column(length = 20)
	public String getIDCardEndTime() {
		return IDCardEndTime;
	}

	public void setIDCardEndTime(String iDCardEndTime) {
		IDCardEndTime = iDCardEndTime;
	}

	@Column(length = 20)
	public String getLicenseEndTime() {
		return licenseEndTime;
	}

	public void setLicenseEndTime(String licenseEndTime) {
		this.licenseEndTime = licenseEndTime;
	}

	@Column(length = 20)
	public String getEmailKey() {
		return emailKey;
	}

	public void setEmailKey(String emailKey) {
		this.emailKey = emailKey;
	}

	public User() {
		super();
	}

	public User(String iDCard, String name, String password, String sex,
			String number, String email, String licenseNumber, String photo,
			String userType, int status, String nickname, String iDCardEndTime,
			String licenseEndTime, String emailKey) {
		super();
		IDCard = iDCard;
		this.name = name;
		this.password = password;
		this.sex = sex;
		this.number = number;
		this.email = email;
		this.licenseNumber = licenseNumber;
		this.photo = photo;
		this.userType = userType;
		this.status = status;
		this.nickname = nickname;
		IDCardEndTime = iDCardEndTime;
		this.licenseEndTime = licenseEndTime;
		this.emailKey = emailKey;
	}

}
