package com.spring.daangn;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.spring.service.MemberService;

@Controller
public class LoginJoinController {
	
	@Autowired
	private MemberService memberService;
	
	//로그인 화면
	@RequestMapping(value="/login.do",method=RequestMethod.GET)
	public String login() {
		return "loginJoin/login";
	}
	
	//로그인 체크 진행
	@RequestMapping(value="/login_check.do",method=RequestMethod.POST)
	public ModelAndView login_check(String id, String pass, String saveID) {
		ModelAndView mv = new ModelAndView();
		if(memberService.loginCheck(id, pass)) {	//로그인 성공
			mv.setViewName("index");
		}else { //로그인 실패
			mv.setViewName("loginJoin/login");
			mv.addObject("result","fail");
		}
		return mv;
	}
	
 	//회원가입 페이지
	@RequestMapping(value="/join.do", method=RequestMethod.GET)
	public String join() {
		return "loginJoin/join";
	}
	
	//회원가입 - 아이디 중복체크 ajax
	@RequestMapping(value="/id_check_ajax.do", method=RequestMethod.GET)
	@ResponseBody
	public String id_check_ajax(String id) {
		boolean result = memberService.idCheck(id);
		String value="";
		if(result==true) {
			value="true";
		}else {
			value="false";
		}
		return value;
	}
	
	//회원가입 성공 페이지
	@RequestMapping(value="/joinSuccess.do", method=RequestMethod.GET)
	public String joinSuccess() {
		return "loginJoin/joinSuccess";
	}
	
	//아이디/비밀번호 찾기 페이지
	@RequestMapping(value="/findInfo.do", method=RequestMethod.GET)
	public String findInfo() {
		return "loginJoin/findInfo";
	}
	
	//아이디 찾기 팝업창
	@RequestMapping(value="/findId.do", method=RequestMethod.GET)
	public String findId() {
		return "loginJoin/findId";
	}
	
	//비밀번호 찾기 팝업창
	@RequestMapping(value="/findPass.do", method=RequestMethod.GET)
	public String findPass() {
		return "loginJoin/findPass";
	}
	
	//아이디 찾기 결과
	@RequestMapping(value="/findIdResult.do", method=RequestMethod.GET)
	public String findIdResult() {
		return "loginJoin/findIdResult";
	}
	
	//비밀번호 찾기 결과
	@RequestMapping(value="/findPassResult.do", method=RequestMethod.GET)
	public String findPassResult() {
		return "loginJoin/findPassResult";
	}
	
	//비밀번호 재설정
	@RequestMapping(value="/changePass.do", method=RequestMethod.GET)
	public String changePass() {
		return "loginJoin/changePass";
	}
	
	//비밀번호 찾기 핸드폰 인증 페이지 
	@RequestMapping(value="/findPassHp.do", method=RequestMethod.GET)
	public String findPassHp() {
		return "loginJoin/findPassHp";
	}
	
}