package com.way.learning.model.course.vo;

import java.util.Date;
import java.util.List;

public class Course {
	private String courseNo;
	private String courseName;
	private String description;
	private String couseImage;
	private Date regDate;
	private String author;
	private int isAccept;
	private int cntGood;
	private List<String> tags;
	public Course(String courseNo, String courseName, String description, String couseImage, Date regDate,
			String author, int isAccept, int cntGood, List<String> tags) {
		super();
		this.courseNo = courseNo;
		this.courseName = courseName;
		this.description = description;
		this.couseImage = couseImage;
		this.regDate = regDate;
		this.author = author;
		this.isAccept = isAccept;
		this.cntGood = cntGood;
		this.tags = tags;
	}
	
	public Course() {
		// TODO Auto-generated constructor stub
	}

	public String getCourseNo() {
		return courseNo;
	}

	public void setCourseNo(String courseNo) {
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

	public String getCouseImage() {
		return couseImage;
	}

	public void setCouseImage(String couseImage) {
		this.couseImage = couseImage;
	}

	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public int getIsAccept() {
		return isAccept;
	}

	public void setIsAccept(int isAccept) {
		this.isAccept = isAccept;
	}

	public int getCntGood() {
		return cntGood;
	}

	public void setCntGood(int cntGood) {
		this.cntGood = cntGood;
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
				+ ", couseImage=" + couseImage + ", regDate=" + regDate + ", author=" + author + ", isAccept="
				+ isAccept + ", cntGood=" + cntGood + ", tags=" + tags + "]";
	}
	
	

	

}
