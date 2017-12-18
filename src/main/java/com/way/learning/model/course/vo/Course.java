package com.way.learning.model.course.vo;

import java.util.Date;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.way.learning.model.member.vo.Member;

public class Course {
	private int courseNo;
	private String courseName;
	private String description;
	private String courseImage;
	private Date regDate;
	private Member member;  //string author
	private int isAccept;
	private int cntCourseLike;
	private MultipartFile uploadFile;
	private List<String> tags;
	public Course(int courseNo, String courseName, String description, String courseImage, Date regDate, Member member,
			int isAccept, int cntCourseLike, MultipartFile uploadFile, List<String> tags) {
		super();
		this.courseNo = courseNo;
		this.courseName = courseName;
		this.description = description;
		this.courseImage = courseImage;
		this.regDate = regDate;
		this.member = member;
		this.isAccept = isAccept;
		this.cntCourseLike = cntCourseLike;
		this.uploadFile = uploadFile;
		this.tags = tags;
	}

	
	public Course(int courseNo, String courseName, String description, String courseImage, Date regDate, Member member,
			int isAccept, int cntCourseLike) {
		super();
		this.courseNo = courseNo;
		this.courseName = courseName;
		this.description = description;
		this.courseImage = courseImage;
		this.regDate = regDate;
		this.member = member;
		this.isAccept = isAccept;
		this.cntCourseLike = cntCourseLike;
	}


	public Course() {
		// TODO Auto-generated constructor stub
	}


	public int getCourseNo() {
		return courseNo;
	}


	public void setCourseNo(int courseNo) {
		this.courseNo = courseNo;
	}


	public String getCourseName() {
		return courseName;
	}


	public void setCourseName(String courseName) {
		this.courseName = courseName;
	}


	public String getDescription() {
		return description;
	}


	public void setDescription(String description) {
		this.description = description;
	}


	public String getCourseImage() {
		return courseImage;
	}


	public void setCourseImage(String courseImage) {
		this.courseImage = courseImage;
	}


	public Date getRegDate() {
		return regDate;
	}


	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}


	public Member getMember() {
		return member;
	}


	public void setMember(Member member) {
		this.member = member;
	}


	public int getIsAccept() {
		return isAccept;
	}


	public void setIsAccept(int isAccept) {
		this.isAccept = isAccept;
	}


	public int getCntCourseLike() {
		return cntCourseLike;
	}


	public void setCntCourseLike(int cntCourseLike) {
		this.cntCourseLike = cntCourseLike;
	}


	public MultipartFile getUploadFile() {
		return uploadFile;
	}


	public void setUploadFile(MultipartFile uploadFile) {
		this.uploadFile = uploadFile;
	}


	public List<String> getTags() {
		return tags;
	}


	public void setTags(List<String> tags) {
		this.tags = tags;
	}


	@Override
	public String toString() {
		return "Course [courseNo=" + courseNo + ", courseName=" + courseName + ", description=" + description
				+ ", courseImage=" + courseImage + ", regDate=" + regDate + ", member=" + member + ", isAccept="
				+ isAccept + ", cntCourseLike=" + cntCourseLike + ", uploadFile=" + uploadFile + ", tags=" + tags + "]";
	}
	
	
	

	

	

}
