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
	
	//�α��� ȭ��
	@RequestMapping(value="/login.do",method=RequestMethod.GET)
	public String login() {
		return "loginJoin/login";
	}
	
	//�α��� üũ ����
	@RequestMapping(value="/login_check.do",method=RequestMethod.POST)
	public ModelAndView login_check(String id, String pass, String saveID) {
		ModelAndView mv = new ModelAndView();
		if(memberService.loginCheck(id, pass)) {	//�α��� ����
			mv.setViewName("index");
		}else { //�α��� ����
			mv.setViewName("loginJoin/login");
			mv.addObject("result","fail");
		}
		return mv;
	}
	
 	//ȸ������ ������
	@RequestMapping(value="/join.do", method=RequestMethod.GET)
	public String join() {
		return "loginJoin/join";
	}
	
	//ȸ������ - ���̵� �ߺ�üũ ajax
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
	
	//ȸ������ ���� ������
	@RequestMapping(value="/joinSuccess.do", method=RequestMethod.GET)
	public String joinSuccess() {
		return "loginJoin/joinSuccess";
	}
	
	//���̵�/��й�ȣ ã�� ������
	@RequestMapping(value="/findInfo.do", method=RequestMethod.GET)
	public String findInfo() {
		return "loginJoin/findInfo";
	}
	
	//���̵� ã�� �˾�â
	@RequestMapping(value="/findId.do", method=RequestMethod.GET)
	public String findId() {
		return "loginJoin/findId";
	}
	
	//��й�ȣ ã�� �˾�â
	@RequestMapping(value="/findPass.do", method=RequestMethod.GET)
	public String findPass() {
		return "loginJoin/findPass";
	}
	
	//���̵� ã�� ���
	@RequestMapping(value="/findIdResult.do", method=RequestMethod.GET)
	public String findIdResult() {
		return "loginJoin/findIdResult";
	}
	
	//��й�ȣ ã�� ���
	@RequestMapping(value="/findPassResult.do", method=RequestMethod.GET)
	public String findPassResult() {
		return "loginJoin/findPassResult";
	}
	
	//��й�ȣ �缳��
	@RequestMapping(value="/changePass.do", method=RequestMethod.GET)
	public String changePass() {
		return "loginJoin/changePass";
	}
	
	//��й�ȣ ã�� �ڵ��� ���� ������ 
	@RequestMapping(value="/findPassHp.do", method=RequestMethod.GET)
	public String findPassHp() {
		return "loginJoin/findPassHp";
	}
	
}