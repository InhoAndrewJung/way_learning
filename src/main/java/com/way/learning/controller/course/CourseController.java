package com.way.learning.controller.course;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.way.learning.model.course.vo.Course;
import com.way.learning.model.member.vo.Member;
import com.way.learning.service.course.CourseService;

@Controller
@RequestMapping("/course/*")
public class CourseController {

	@Autowired
	private CourseService courseService;

	@RequestMapping("writeCourse")
	public String writeCourse(){

		return "course/writeCourse";


	}


	@RequestMapping("insertCourse")
	public ModelAndView insertCourse( Course cvo ,HttpServletRequest request) throws Exception{
		Member mvo=(Member)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		System.out.println("컨트로러 mvo:"+mvo);

		if(mvo==null){ //로그인 상태가 아니다...글쓰기로 못간다..
			return new ModelAndView("redirect:/");			
		}
		//로그인 한 상태라면
		cvo.setMember(mvo); //cvo와 mvo의 Hasing 관계가 성립된다..

		courseService.insertCourse(cvo,request); 

		System.out.println("컨트롤러 cvo:"+cvo);
		return new ModelAndView("redirect:/","cvo",cvo);
	}



	@RequestMapping("showMyCourseList")
	public ModelAndView showCourseList() throws Exception{
		Member mvo=(Member)SecurityContextHolder.getContext().getAuthentication().getPrincipal();


		List<Course> list=courseService.selectMycourseList(mvo.getUserId());


		return new ModelAndView("course/myCourseList","list",list);
	}


	@RequestMapping("showCourse")
	public ModelAndView showCourse(int courseNo, ModelAndView mav) throws Exception{
		Member mvo=(Member)SecurityContextHolder.getContext().getAuthentication().getPrincipal();


		Course cvo=courseService.selectMyCourse(mvo.getUserId(), courseNo);
		System.out.println("cvo:"+cvo);
		List<String> tags=courseService.selectCourseTag(courseNo);
		System.out.println("tags:"+tags);
		mav.setViewName("course/showCourse");
		mav.addObject("cvo", cvo);
		mav.addObject("tags", tags);

		return mav;

	}


	@RequestMapping("deleteCourse")
	public ModelAndView deleteCourse(int courseNo, ModelAndView mav) throws Exception{



		int result=courseService.deleteCourse(courseNo);
		System.out.println("delete result:"+result);

		return new ModelAndView("redirect:/course/showCourseList");

	}

	@RequestMapping("updateForm")
	public ModelAndView updateForm(int courseNo, ModelAndView mav) throws Exception{

		Member mvo=(Member)SecurityContextHolder.getContext().getAuthentication().getPrincipal();


		Course cvo=courseService.selectMyCourse(mvo.getUserId(), courseNo);
		System.out.println("cvo:"+cvo);
		List<String> tags=courseService.selectCourseTag(courseNo);
		System.out.println("tags:"+tags);
		mav.setViewName("course/updateCourse");
		mav.addObject("cvo", cvo);
		mav.addObject("tags", tags);

		return mav;

	}


	@RequestMapping("updateCourse")
	public ModelAndView updateCouse(Course cvo ,HttpServletRequest request, ModelAndView mav) throws Exception{
		System.out.println("updateCourse 입성");
		courseService.updateCourse(cvo,request); 


		return new ModelAndView("redirect:/");
	}
	
	
	@RequestMapping("selectAccetpedCourseList")
	public ModelAndView selectAccetpedCourseList(ModelAndView mav) throws Exception{
		
	


		List<Course> list=courseService.selectAccetpedCourseList();
		mav.setViewName("course/acceptedCourse");
		mav.addObject("list", list);

		return mav;
	}











}
