package com.way.learning.controller.course;

import java.io.File;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.way.learning.model.course.vo.Course;
import com.way.learning.model.course.vo.LectureBoard;
import com.way.learning.model.member.vo.Member;
import com.way.learning.service.course.LectureBoardService;

@Controller
@RequestMapping("/lectureBoard/*")
public class LectureBoardController {

	@Autowired
	private LectureBoardService lectureBoardService  ;

	@RequestMapping("writeLecture")
	public ModelAndView writeLecture(ModelAndView mav){
		Member mvo=(Member)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		List list=lectureBoardService.selectMyCourseNo(mvo.getUserId());
		mav.setViewName("course/lecture/writeLecture");
		mav.addObject("list", list);


		return mav;


	}

	@RequestMapping("insertLecture")
	public ModelAndView insertLecture(LectureBoard lvo ) throws Exception{
		Member mvo=(Member)SecurityContextHolder.getContext().getAuthentication().getPrincipal();

		System.out.println("insertLecture 컨트롤러 lvo:"+lvo);
		if(mvo==null){ //로그인 상태가 아니다...글쓰기로 못간다..
			return new ModelAndView("redirect:/");			
		}
		//로그인 한 상태라면
		lvo.setMember(mvo); //cvo와 mvo의 Hasing 관계가 성립된다..

		lectureBoardService.insertLecture(lvo); 


		return new ModelAndView("redirect:/","lvo",lvo);
	}
	
	@ResponseBody
	@RequestMapping("isLectureOrderExist")
	public int isLectureOrderExist(@RequestParam(defaultValue="0") int courseNo, @RequestParam(defaultValue="0") int lectureOrder ) throws Exception{
		System.out.println("isLectureOrderExist courseNo:"+courseNo);
		System.out.println("isLectureOrderExist lectureOrder:"+lectureOrder);

		int result=lectureBoardService.isLectureOrderExist(courseNo, lectureOrder);
System.out.println("isLectureOrderExist result:"+result);

		return result;
	}
	
	
	@ResponseBody
	@RequestMapping("selectMaxLectureNo")
	public int selectMaxLectureNo(@RequestParam(defaultValue="0") int courseNo ) throws Exception{
		System.out.println("selectMaxLectureNo courseNo:"+courseNo);
		

		int result=lectureBoardService.selectMaxLectureNo(courseNo);


		return result;
	}



	@RequestMapping("showLectureList")
	public ModelAndView showCourseList(int courseNo, @RequestParam(defaultValue="0") int lectureNo, ModelAndView mav) throws Exception{
		Member mvo=(Member)SecurityContextHolder.getContext().getAuthentication().getPrincipal();


		List<LectureBoard> lecList=lectureBoardService.selectLectureList(courseNo);

		//LectureBoard lvo=lectureBoardService.selectLecture(lecList.get(0).getLectureNo(),courseNo);

		Course	 cvo  =lectureBoardService.selectCourse(courseNo, mvo.getUserId());

		List<String> tags=lectureBoardService.selectCourseTag(courseNo);


		//System.out.println("showLectureList lecList:"+lecList);

		//System.out.println("showLectureList lvo:"+lvo);
		System.out.println("showLectureList cvo:"+cvo);
		//System.out.println("showLectureList tags:"+tags);


		mav.setViewName("course/lecture/lectureList");
		mav.addObject("lecList",lecList);
		mav.addObject("lectureNo",lectureNo);
		//mav.addObject("lvo",lvo);
		mav.addObject("cvo",cvo);
		mav.addObject("tags",tags);


		return mav;
	}


	@RequestMapping("showLecture")
	public ModelAndView showLecture(int courseNo, int lectureNo,ModelAndView mav) throws Exception{
		Member mvo=(Member)SecurityContextHolder.getContext().getAuthentication().getPrincipal();


		LectureBoard lvo=lectureBoardService.selectLecture(lectureNo,courseNo);


		mav.setViewName("course/lecture/showLecture");
		mav.addObject("lvo",lvo);

		System.out.println("showLecture lvo:"+lvo);


		return mav;
	}

	@RequestMapping("deleteLecture")
	public String deleteLecture(int courseNo, int lectureNo, ModelAndView mav) throws Exception{
		System.out.println("deleteLecture courseNo:"+courseNo);
		System.out.println("deleteLecture lectureNo:"+lectureNo);


		int result=lectureBoardService.deleteLecture(lectureNo, courseNo);





		return "redirect:/lectureBoard/showLectureList?courseNo="+courseNo;
	}


	@RequestMapping("updateForm")
	public ModelAndView updateForm(int courseNo,int lectureNo, ModelAndView mav) throws Exception{
		System.out.println("updateForm controller 입성");
		Member mvo=(Member)SecurityContextHolder.getContext().getAuthentication().getPrincipal();


		//List list=lectureBoardService.selectMyCourseNo(mvo.getUserId());	
		LectureBoard lvo=lectureBoardService.selectLecture(lectureNo,courseNo);

		System.out.println("updateForm controller 의 lvo:"+lvo);

		mav.setViewName("course/lecture/updateLecture");
		mav.addObject("lvo", lvo);
		//mav.addObject("list", list);
		
		


		return mav;

	}



	@RequestMapping("updateLecture")
	public String updateLecture(LectureBoard lvo , ModelAndView mav) throws Exception{
		System.out.println("updateLecture 입성 lvo"+lvo);
		lectureBoardService.updateLecture(lvo);


		return "redirect:/lectureBoard/showLectureList?courseNo="+lvo.getCourseNo();
	}



	@ResponseBody
	@RequestMapping("likeStatus")
	public int likeStatus(int courseNo)throws Exception{
		System.out.println("likeStatus 컨트롤러 입성");
		System.out.println("ggg courseNo:"+courseNo);
		
		Member mvo=(Member)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		
		
		
		int result=lectureBoardService.isCourseRecommend(courseNo, mvo.getUserId());
		System.out.println("컨트롤러 result:"+result);
		return result;
	}
	
	@ResponseBody
	@RequestMapping("changeLike")
	public int changeLike(int courseNo)throws Exception{
		
		Member mvo=(Member)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		
		
		
		lectureBoardService.isCourseLike(courseNo,mvo.getUserId());
		int cnt=lectureBoardService.selectCntCourseLike(courseNo);
		return cnt;
	}
	
	
	@ResponseBody
	@RequestMapping("selectCntCourseLike")
	public int selectCntCourseLike(int courseNo)throws Exception{
		
		int cnt=lectureBoardService.selectCntCourseLike(courseNo);
		return cnt;
	}
	
	
	
	
	@ResponseBody
	@RequestMapping("changeMyLecutreRecord")
	public int changeMyLecutreRecord(int courseNo,int lectureNo)throws Exception{
		System.out.println("changeMyLecutreRecord 컨트롤러 입성");
		
		
		Member mvo=(Member)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		
		
		
		int result=lectureBoardService.changeMyLecutreRecord(courseNo, lectureNo,mvo.getUserId());
		
		return result;
	}
	
	
	@ResponseBody
	@RequestMapping("isMyLectureRecordExist")
	public int isMyLectureRecordExist(int courseNo,int lectureNo)throws Exception{
		System.out.println("isMyLectureRecordExist courseNo:"+courseNo);
		System.out.println("isMyLectureRecordExist lectureNo:"+lectureNo);
		System.out.println("isMyLectureRecordExist 컨트롤러 입성");
		
		
		Member mvo=(Member)SecurityContextHolder.getContext().getAuthentication().getPrincipal();

		int result=lectureBoardService.isMyLectureRecordExist(courseNo, lectureNo,mvo.getUserId());
		
		return result;
	}












	@RequestMapping("imageUpload")
	public void imageUpload(HttpServletRequest request, HttpSession session,
			HttpServletResponse response, 
			@RequestParam MultipartFile upload ,ModelAndView mav)
					throws Exception {
		//imageUload.do를 통해  MultipartFile upload매개변수에 파일이 들어옴
		//업로드는클라이언트가 서버에 요청하는것임
		//http header 설정
		System.out.println("이미지 업로드 컨트롤러!!");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset-utf-8");
		//http body 설정
		OutputStream out=null; //java.io  업로드...
		PrintWriter printWriter=null; //java.io
		//업로드한 파일 이름
		String fileName=upload.getOriginalFilename();
		Date today= new Date();
		SimpleDateFormat df = new SimpleDateFormat("YYYYMMddHHmmssSSS");
		String now=df.format(today);

		String newfilename = now+"_"+fileName;

		System.out.println("newfilename:"+newfilename);
		//바이트 배열로 변환
		byte[] bytes=upload.getBytes();
		//이미지를 업로드할 디렉토리(배포 경로로 설정)

		//String root = session.getServletContext().getRealPath("/");
		//String path = root+"\\WEB-INF\\views\\images\\"+fileName;


		String uploadPath = session.getServletContext().getRealPath("/")+"\\WEB-INF\\views\\images\\" + newfilename;

		/*"C:\\Tomcat 8.5\\wtpwebapps\\SpringMVC16_SpringSecurity_RegisterMember\\WEB-INF\\views\\images\\" + newfilename;*/



		out=new FileOutputStream(new File(uploadPath)); //java.io
		//서버에 저장됨
		out.write(bytes);
		//한게시물에 이미지 1개씩 여러개 올릴수 있음. 그때 필요한 변수가 CKEditorFuncNum
		//ckeditor에서 만든 변수라 철자 맞아야 함. CKEditorFuncNum
		String callback=request.getParameter("CKEditorFuncNum");
		System.out.println("callback:"+callback);
		printWriter=response.getWriter();
		String fileUrl
		=request.getContextPath()+"/images/"+newfilename; 
		System.out.println("fileUrl:"+fileUrl);
		/*	mav.addObject("callback", callback);
		mav.addObject("fileUrl", fileUrl);
		mav.setViewName(viewName);
		 */
		printWriter.println(
				//window.parent는 팝업창을 띄운 메인작성창을 말함
				"<script>window.parent.CKEDITOR.tools.callFunction("
				+ callback+",'"+fileUrl+"','이미지가 업로드되었습니다.')"
				+ "</script>");
		//스트림 닫기
		printWriter.flush();

		/*return mav;*/
	}


}


/*  
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



	@RequestMapping("showCourseList")
	public ModelAndView showCourseList() throws Exception{
		Member mvo=(Member)SecurityContextHolder.getContext().getAuthentication().getPrincipal();


		List<Course> list=courseService.selectMycourseList(mvo.getUserId());


		return new ModelAndView("course/courselist","list",list);
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

 */