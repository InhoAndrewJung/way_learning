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
		System.out.println("而⑦듃濡쒕윭 mvo:"+mvo);

		if(mvo==null){ //濡쒓렇�씤 �긽�깭媛� �븘�땲�떎...湲��벐湲곕줈 紐산컙�떎..
			return new ModelAndView("redirect:/");			
		}
		//濡쒓렇�씤 �븳 �긽�깭�씪硫�
		cvo.setMember(mvo); //cvo�� mvo�쓽 Hasing 愿�怨꾧� �꽦由쎈맂�떎..

		courseService.insertCourse(cvo,request); 

		System.out.println("而⑦듃濡ㅻ윭 cvo:"+cvo);
		return new ModelAndView("redirect:/course/showMyCourseList");
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
		System.out.println("updateCourse �엯�꽦");
		courseService.updateCourse(cvo,request); 


		return new ModelAndView("redirect:/");
	}
	
	
	@RequestMapping("selectAccetpedCourseList")
	public ModelAndView selectAccetpedCourseList(ModelAndView mav) throws Exception{
		
	


		List<Course> list=courseService.selectAccetpedCourseList();
		mav.setViewName("jsonView");
		mav.addObject("list", list);

		return mav;
	}











}
