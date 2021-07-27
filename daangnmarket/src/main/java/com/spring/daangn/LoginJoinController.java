package com.spring.daangn;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Random;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
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

@Controller
public class LoginJoinController {
	
	@Autowired
	private MemberService memberService;
	@Autowired
	BCryptPasswordEncoder passwordEncoder;


		
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
		    System.out.println("�޴��� ������ȣ : " + num);
	    /* �������*/
	    
	    obj.put("result", result);
	    obj.put("number", num);
	    
	    Gson gson = new Gson();
	    return gson.toJson(obj);
	  }
	
	//ȸ������ ����
	@RequestMapping(value="/join_proc.do", method=RequestMethod.POST)
	public ModelAndView join_proc(MemberVO vo) {
		vo.setIntroduce("�ȳ��ϼ���. "+vo.getId()+"�Դϴ�.");
		vo.setImagepath("img_profile_male.png");
		vo.setAdmin("N");
		String password = passwordEncoder.encode(vo.getPass());
		vo.setPass(password);
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
	@RequestMapping(value="/findIdResult.do", method=RequestMethod.POST)
	public ModelAndView findIdResult(MemberVO vo) {
		ModelAndView mv = new ModelAndView();
		String url="";
		String result = memberService.findIdCheck(vo);
		if(result.equals("")) {
			url="loginJoin/findId";
			mv.addObject("result","fail");
		}else {
			url="loginJoin/findIdResult";
			mv.addObject("id",result);
		}
		mv.setViewName(url);
		return mv;
	}

	//��й�ȣ ã�� �ڵ��� ���� ������ 
	@RequestMapping(value="/findPassHp.do", method=RequestMethod.POST)
	public ModelAndView findPassHp(MemberVO vo) {
		ModelAndView mv = new ModelAndView();
		String url ="";
		boolean result = memberService.findPassCheck(vo);
		if(result==false) {
			url="loginJoin/findPass";
			mv.addObject("result","fail");
		}else {
			url="loginJoin/findPassHp";
			mv.addObject("id",vo.getId());
		}
		mv.setViewName(url);
		return mv;
	}
	
	//�Է��� �ڵ��� ��ȣ�� DB�� ��ġ�ϴ��� ajax
	@ResponseBody
	@RequestMapping(value="/phone_num_check_ajax.do", method=RequestMethod.GET)
	public String phone_num_check_ajax(String id, String phone) {
		MemberVO vo = new MemberVO();
		vo.setId(id);
		vo.setPhone(phone);
		boolean result = memberService.phone_num_ajax(vo);
		JSONObject jobj = new JSONObject();
		if(result==true) {			//��ȣ ��ġ
			jobj.put("id", id);
			jobj.put("phone", phone);
			jobj.put("result", "success");
		}else {		//��ȣ ����ġ
			jobj.put("id", id);
			jobj.put("result", "fail");
		}
		
		Gson gson = new Gson();
		return gson.toJson(jobj);
	}
	
	//��й�ȣ �缳��
	@RequestMapping(value="/changePass.do", method=RequestMethod.POST)
	public ModelAndView changePass(MemberVO vo) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("loginJoin/changePass");
		mv.addObject("id",vo.getId());
		
		return mv;
	}
	
	//��й�ȣ �缳�� ���
	@RequestMapping(value="/findPassResult.do", method=RequestMethod.POST)
	public ModelAndView findPassResult(MemberVO vo) {
		ModelAndView mv = new ModelAndView();
		String password = passwordEncoder.encode(vo.getPass());
		vo.setPass(password);
		String url ="";
		boolean result = memberService.setNewPass(vo);
		if(result==false) {
			url="error_page";
		}else {
			url="loginJoin/findPassResult";
		}
		mv.setViewName(url);
		return mv;
	}
	
	
}