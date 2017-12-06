package com.way.learning.model.course.vo;

public class CourseTag {
    private int courseNo;
    private String tag;
	public CourseTag(int courseNo, String tag) {
		super();
		this.courseNo = courseNo;
		this.tag = tag;
	}
    
    public CourseTag() {
		// TODO Auto-generated constructor stub
	}

	public int getCourseNo() {
		return courseNo;
	}

	public void setCourseNo(int courseNo) {
		this.courseNo = courseNo;
	}

	public String getTag() {
		return tag;
	}

	public void setTag(String tag) {
		this.tag = tag;
	}

	@Override
	public String toString() {
		return "CourseTag [courseNo=" + courseNo + ", tag=" + tag + "]";
	}
    
    


}
