package com.way.learning.model.member.vo;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

public class Member {
	private String userId;
	private String email;
	private String password;
	private int activity;
	private String imgProfile;
	private Date regDate;
	private String userType;
	private MultipartFile uploadFile;
	public Member(String userId, String email, String password, int activity, String imgProfile, Date regDate,
			String userType, MultipartFile uploadFile) {
		super();
		this.userId = userId;
		this.email = email;
		this.password = password;
		this.activity = activity;
		this.imgProfile = imgProfile;
		this.regDate = regDate;
		this.userType = userType;
		this.uploadFile = uploadFile;
	}
	//메일전송용 생성자
	public Member(String userId, String password) {
		super();
		this.userId = userId;
		this.password = password;
	}

	public Member() {
		// TODO Auto-generated constructor stub
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public int getActivity() {
		return activity;
	}

	public void setActivity(int activity) {
		this.activity = activity;
	}

	public String getImgProfile() {
		return imgProfile;
	}

	public void setImgProfile(String imgProfile) {
		this.imgProfile = imgProfile;
	}

	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}

	public String getUserType() {
		return userType;
	}

	public void setUserType(String userType) {
		this.userType = userType;
	}

	public MultipartFile getUploadFile() {
		return uploadFile;
	}

	public void setUploadFile(MultipartFile uploadFile) {
		this.uploadFile = uploadFile;
	}

	@Override
	public String toString() {
		return "Member [userId=" + userId + ", email=" + email + ", password=" + password + ", activity=" + activity
				+ ", imgProfile=" + imgProfile + ", regDate=" + regDate + ", userType=" + userType + ", uploadFile="
				+ uploadFile + "]";
	}
	
	
	

}
