package com.spring.daangn;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Random;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.spring.service.MemberService;
import com.spring.vo.SessionVO;

import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

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
	public ModelAndView login_check(String id, String pass, HttpSession session) {
		String result_page = "";
		ModelAndView mv = new ModelAndView();
		SessionVO svo = memberService.loginCheck(id, pass);

		if(svo!=null) {	//로그인 성공
			session.setAttribute("svo",svo);
			result_page = "index";
			mv.setViewName(result_page);
		}else { //로그인 실패
			result_page = "loginJoin/login";
			mv.setViewName(result_page);
			mv.addObject("result", "fail");
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
	
	//회원가입 - 핸드폰 번호 인증 ajax
	@RequestMapping(value="/phone_check_ajax.do", method=RequestMethod.GET)
	@ResponseBody
	public String phone_check_ajax(String phone) {
		String result="fail";
	    String api_key = "NCSCHGZZR2715ZEZ";
	    String api_secret = "PKP5WNSIMROHLY3FG6NNPZAETQJ4CUGB";
	    Message coolsms = new Message(api_key, api_secret);

	    Random ran = new Random();
	    ArrayList<String> code = new ArrayList<String>();
	    String num="";
	    for(int i=0;i<6;i++) {
	    	code.add(String.valueOf(ran.nextInt(10)));
	    	num += code.get(i);
	    }
	    
	    // 4 params(to, from, type, text) are mandatory. must be filled
	    HashMap<String, String> params = new HashMap<String, String>();
	    params.put("to", phone);
	    params.put("from", "01054871614");
	    params.put("type", "SMS");
	    params.put("text", "[당근마켓] 인증번호 ["+num+"]를 입력해주세요.");
	    params.put("app_version", "test app 1.2"); // application name and version
	    JSONObject obj = new JSONObject();
	    try {
	    	obj = (JSONObject) coolsms.send(params);
	    	result="success";
	    	System.out.println(obj.toString());
	    } catch (CoolsmsException e) {
	      System.out.println(e.getMessage());
	      System.out.println(e.getCode());
	    }
	    
	    obj.put("result", result);
	    obj.put("number", num);
	    
	    Gson gson = new Gson();
	    return gson.toJson(obj);
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