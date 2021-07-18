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
import com.spring.vo.MemberVO;
import com.spring.vo.SessionVO;

import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

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
	public ModelAndView login_check(String id, String pass, HttpSession session) {
		String result_page = "";
		ModelAndView mv = new ModelAndView();
		SessionVO svo = memberService.loginCheck(id, pass);

		if(svo!=null) {	//�α��� ����
			session.setAttribute("svo",svo);
			result_page = "index";
			mv.setViewName(result_page);
		}else { //�α��� ����
			result_page = "loginJoin/login";
			mv.setViewName(result_page);
			mv.addObject("result", "fail");
		}
		return mv;
	}
	
	//�α׾ƿ�
	@RequestMapping(value="/logout.do", method=RequestMethod.GET)
	public String logout(HttpSession session) {
		SessionVO svo = (SessionVO)session.getAttribute("svo");
		if(svo!=null)
			session.invalidate();
		
		return "/index";
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
	
	//ȸ������ - �ڵ��� ��ȣ ���� ajax
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
	    params.put("text", "[��ٸ���] ������ȣ ["+num+"]�� �Է����ּ���.");
	    params.put("app_version", "test app 1.2"); // application name and version
	    JSONObject obj = new JSONObject();
	    
	    /*	//�޴��� ���� ��� ���Ƶ׽��ϴ�!
	    try {
	    	obj = (JSONObject) coolsms.send(params);
	    	result="success";
	    
	    } catch (CoolsmsException e) {
	      System.out.println(e.getMessage());
	      System.out.println(e.getCode());
	    }
	    */
	    
	    /*�޴��� ���� ������ �� �����ϴ� �ڵ�*/
	    
	    result="success";
	    System.out.println(num);
	     
	    
	    obj.put("result", result);
	    obj.put("number", num);
	    
	    Gson gson = new Gson();
	    return gson.toJson(obj);
	  }
	
	//ȸ������ ����
	@RequestMapping(value="/join_proc.do", method=RequestMethod.POST)
	public ModelAndView join_proc(MemberVO vo) {
		vo.setAddr(vo.getAddr_jibun(), vo.getAddr_detail());
		vo.setIntroduce("�ȳ��ϼ���. "+vo.getId()+"�Դϴ�.");
		vo.setImagepath("img_profile_male.png");
		vo.setAdmin("N");
		ModelAndView mv = new ModelAndView();
		boolean result = memberService.join_proc(vo);
		if(result==true) {
			mv.setViewName("loginJoin/joinSuccess");
		}else {
			mv.setViewName("error_page");
		}
		return mv;
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