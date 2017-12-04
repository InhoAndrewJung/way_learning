package com.way.learning.controller.member;


import javax.mail.internet.MimeMessage;


import java.util.List;


import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;

import org.springframework.security.core.context.SecurityContextHolder;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.way.learning.model.member.vo.Member;
import com.way.learning.model.question.vo.AnswerResult;
import com.way.learning.service.member.MemberService;

@Controller
@RequestMapping("/member/*")
public class MemberController {

	@Autowired
	private MemberService memberService;

	// 회원정보수정시 비밀번호 암호화처리를 위한 객체를 주입받는다
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;

	// 메일보낼때 필요한...

	@Autowired
	private JavaMailSenderImpl mailSender;

	@Autowired
	public void setMailSender(JavaMailSenderImpl mailSender) {
		this.mailSender = mailSender;
	}

	// 아이디 찾기 페이지이동
	@RequestMapping("findId")
	public String findIdPage() {

		return "member/findId";
	}

	// 아이디 찾기

	@RequestMapping("findIdProc")
	@ResponseBody
	public ModelAndView findIdByEmail(HttpServletRequest request, ModelAndView mav) {
		boolean findIdResult = false;
		String userId = memberService.findIdByEmail(request.getParameter("email"));
		mav.setViewName("member/findIdProc");
		if (userId != "") {
			findIdResult = true;
			mav.addObject("findIdResult", findIdResult);
			mav.addObject("userId", userId);
			return mav;
		} else {
			mav.addObject("findIdResult", findIdResult);
			return mav;
		}

	}

	// 비밀번호 찾기 페이지 이동
	@RequestMapping("ExistId")
	public String findPassPage() {

		return "member/ExistId";
	}

	// 비밀번호 찾기 아이디확인
	@RequestMapping("idCheckforPass")
	public ModelAndView idCheckforPass(HttpServletRequest request, ModelAndView mav) {
		String userId = request.getParameter("userId");
		String result = memberService.idcheck(userId);
		mav.setViewName("member/mailSender");
		if (result == "fail") {
			mav.addObject("userId", userId);
			mav.addObject("result", result);
			return mav;
		} else {
			mav.addObject("result", result);
			return mav;
		}
	}

	// 아이디 이메일 받아 비밀번호 이메일전송
	@RequestMapping("mailSender")
	public ModelAndView mailSender(HttpServletRequest request, ModelAndView mav, Member vo) throws Exception {

		String result = request.getParameter("result");
		System.out.println("컨트result:" + result);
		final String userId = request.getParameter("userId");
		System.out.println("파이널 userId:" + userId);
		// 1.아이디가 있다 확인
		if (result.equals("fail")) {
			mav.setViewName("member/loginForm");

			System.out.println("컨트userId:" + userId);
			final String email = request.getParameter("email");
			// 2.임시비밀번호 생성
			final String tempPassword = "" + (int) (Math.random() * 100000 + 1);
			// 3.임시비밀번호 암호화
			String encodePassword = passwordEncoder.encode(tempPassword);
			vo.setPassword(encodePassword);

			// 4. 아이디에 해당하는 이메일받아옴
			vo = memberService.findMemberById(userId);
			// 5. 받은 이메일과 등록된 이메일이 일치한다면,
			if (email.equals(vo.getEmail())) {
				System.out.println("입력받은 email과 등록된 email이 일치합니다.");
				// 6. 임시비밀번호를 db에 세팅
				memberService.updatefindPass(encodePassword, userId);

				// 7.보낼 메세지 준비
				MimeMessagePreparator preparator = new MimeMessagePreparator() {

					String body = "Your Temporary Password for " + userId + " : " + tempPassword;

					@Override
					public void prepare(MimeMessage mimeMessage) throws Exception {
						final MimeMessageHelper helper = new MimeMessageHelper(mimeMessage, true, "UTF-8");
						helper.setFrom("opilior86@gmail.com");
						helper.setTo(email);
						helper.setSubject("[ WayLearning ] : " + userId + ", Temporary Password !");
						helper.setText(body, true);
					}// prepare
				};// MimeMessagePreparator

				// 없는 메일로 보낼때 예외처리
				try {
					// 8.메일보냄
					mailSender.send(preparator);

					System.out.println("[MailSender] : Email Sent Successfully!!");

					mav.addObject("result", result);
					// 9.메일보내기 성공 결과 리턴
				} catch (Exception e) {
					System.out.println(e.fillInStackTrace());
				}
			} else {
				System.out.println("[MailSender] : No Such User Found !");
				mav.addObject("result", result);
				// 10.메일보내기 실패 결과 리턴

			} // if
		} // if
		return mav;
	}// mailSender

	// 회원가입 폼
	@RequestMapping("registerForm")
	public String registerForm() {

		return "member/registerForm";
	}

	// 회원 가입하기 :: redirect 방식
	@RequestMapping("registerMember")
	public String insertMaember(Member vo, HttpServletRequest request) throws Exception {
		System.out.println("컨트롤러 멤버 vo:" + vo);
		System.out.println("컨트롤러 멤버 vo:" + vo);
		int emailResult = memberService.emailcheck(request.getParameter("email"));
		if (emailResult == 1) {
			System.out.println("이미 있는 이메일입니다.");
		}
		memberService.registerMember(vo, request);
		return "redirect:/";

	}

	// 로그인 폼
	@RequestMapping("loginForm")
	public String loginForm() {
		return "member/loginForm";
	}

	// 아이디 중복확인
	@RequestMapping("idcheckAjax")
	@ResponseBody
	public String idCheckAjax(HttpServletRequest request) {
		return memberService.idcheck(request.getParameter("userId"));
	}
	
	//이메일 중복확인
	@RequestMapping("emailcheckAjax")
	@ResponseBody
	public int emailCheckView(HttpServletRequest request) {
		return memberService.emailcheck(request.getParameter("email"));
	}

	@RequestMapping("updateForm")
	public String updateForm() {
		return "member/updateForm";
	}

	@RequestMapping("updateMember")
	public ModelAndView updateMemberAction(HttpServletRequest request, Member vo) throws Exception {
		
		

		memberService.updateMember(vo,request);

		return new ModelAndView("member/update_result");
	}
	
	@RequestMapping("showMyRecord")
	public ModelAndView showMyRecord(HttpServletRequest request,ModelAndView mav) throws Exception {
		System.out.println("showMyRecord 컨트롤러 입성!");
		Member mvo=(Member)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String userId=mvo.getUserId();
		System.out.println("showMyRecord 유저아이디:"+userId);
		List<String> rightList=memberService.selectRightNo(userId);
		List<String> wrongList=memberService.selectWrongNo(userId);
		AnswerResult answerResult=memberService.selectMyRecord(userId);
		int myRanking=memberService.selectMyRanking(userId);
		mav.addObject("rightList", rightList);
		mav.addObject("wrongList", wrongList);
		mav.addObject("answerResult", answerResult);
		mav.addObject("myRanking", myRanking);
		mav.setViewName("/member/showMyRecord");

		return mav;
	}
	
	
	@RequestMapping("showAllRanking")
	public ModelAndView showAllRanking(HttpServletRequest request,ModelAndView mav, @RequestParam(defaultValue="cntSubmit") String sorting) throws Exception {
		System.out.println("showAllRanking 컨트롤러 입성!");
		Member mvo=(Member)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String userId=mvo.getUserId();
		System.out.println("showAllRanking 유저아이디:"+userId);
		System.out.println("showAllRanking sorting:"+sorting);
		List<AnswerResult> list=memberService.selectAllRanking(sorting);
		mav.addObject("list", list);
		mav.setViewName("/member/showAllRanking");

		return mav;
	}
	
	
	
	
	
}





