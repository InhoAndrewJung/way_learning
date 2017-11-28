package com.way.learning.model.member.vo;

public class Authority {
	private String userId;
	private String role;
	public Authority(String userId, String role) {
		super();
		this.userId = userId;
		this.role = role;
	}
	
	public Authority() {
		// TODO Auto-generated constructor stub
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	@Override
	public String toString() {
		return "Authority [userId=" + userId + ", role=" + role + "]";
	}
	
	
	
}
