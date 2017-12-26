package com.way.learning.service.course;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.way.learning.model.course.dao.CourseDAO;
import com.way.learning.model.course.vo.Course;
import com.way.learning.model.member.vo.Member;

@Service
public class CourseServiceImpl implements CourseService {

	@Autowired
	private CourseDAO courseDAO;

	public int insertCourse(Course cvo,HttpServletRequest request ) throws Exception{
		System.out.println("Before cvo :: "+cvo.getCourseNo());
		// 파일 업로드 로직을 추가
		HttpSession session = request.getSession();
		MultipartFile mFile = cvo.getUploadFile();
		System.out.println(mFile.getSize() + "============" + mFile.isEmpty());
		if (mFile.isEmpty() == false) { // 파일 업로드를 했다면

			String fileName = mFile.getOriginalFilename();

			Date today = new Date();
			SimpleDateFormat df = new SimpleDateFormat("YYYYMMddHHmmssSSS");
			String now = df.format(today);

			String newfilename = now + "_" + fileName;
			cvo.setCourseImage(newfilename); // vo의 완벽한 세팅이 완료

			String root = session.getServletContext().getRealPath("/");
			String path = root + "\\resources\\upload\\";

			File copyFile = new File(path + newfilename);
			mFile.transferTo(copyFile); // upload 폴더에 newfilename이 저장

		} else {
			String defaultImg = "coding.jpg";
			cvo.setCourseImage(defaultImg);

		}

		int result=courseDAO.insertCourse(cvo);
		System.out.println("After cvo :: "+cvo.getCourseNo()); //3
		List<String> tag=cvo.getTags();

		for(String tags:tag){
			courseDAO.insertTags(tags,cvo.getCourseNo());

		}


		return result;

	}




	public List<Course> selectMycourseList(String userId) throws Exception{

		return courseDAO.selectMycourseList(userId);

	}
	
	public Course selectMyCourse(String userId,int courseNo) throws Exception{
		

		return courseDAO.selectMyCourse(userId, courseNo);

	}
	
	public List<String> selectCourseTag(int courseNo) throws Exception{

		return courseDAO.selectCourseTag(courseNo);

	}
	
	public int deleteCourse(int courseNo) throws Exception{

		return courseDAO.deleteCourse(courseNo);

	}
	
	
	public int updateCourse(Course cvo, HttpServletRequest request) throws Exception{
		
		System.out.println("updateCourse서비스입성");

		//이전 이미지 넣을수 있어서 받아놓는다.
		Member pvo = (Member) SecurityContextHolder.getContext().getAuthentication().getPrincipal();


		// 파일 업로드 로직을 추가
		HttpSession session = request.getSession();
		MultipartFile mFile = cvo.getUploadFile();

		if (mFile.isEmpty() == false) { // 파일 업로드를 했다면
			System.out.println(mFile.getSize() + "============" + mFile.isEmpty());

			String fileName = mFile.getOriginalFilename();

			Date today = new Date();
			SimpleDateFormat df = new SimpleDateFormat("YYYYMMddHHmmssSSS");
			String now = df.format(today);

			String newfilename = now + "_" + fileName;
			cvo.setCourseImage(newfilename); // vo의 완벽한 세팅이 완료

			String root = session.getServletContext().getRealPath("/");
			String path = root + "\\resources\\upload\\";

			File copyFile = new File(path + newfilename);
			mFile.transferTo(copyFile); // upload 폴더에 newfilename이 저장

		}

			int result=courseDAO.updateCourse(cvo);
			courseDAO.deleteTags(cvo.getCourseNo());
			List<String> tag=cvo.getTags();

			for(String tags:tag){
				courseDAO.insertTags(tags,cvo.getCourseNo());

			}
	

		
		
		

		return result;

	}
	
	public List<Course> selectAccetpedCourseList() throws Exception{

		return courseDAO.selectAccetpedCourseList();

	}
	
	

}
