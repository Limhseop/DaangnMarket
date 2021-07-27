package com.spring.daangn;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.spring.service.AdminService;
import com.spring.vo.MemberVO;
import com.spring.vo.NoticeVO;
import com.spring.vo.QuestionVO;
import com.spring.vo.SessionVO;

@Controller
public class AdminController {
	
	@Autowired
	private AdminService adminService;
	
	@RequestMapping(value="/admin.do" , method = RequestMethod.GET)
	public ModelAndView admin() {
		ModelAndView mav = new ModelAndView();
		
		//멤버리스트 가져오기
		ArrayList<MemberVO> list = adminService.getMemberList();
		
		//공지사항 가져오기
		ArrayList<NoticeVO> nlist = adminService.getNoticeList();
		
		//문의내역 가져오기
		ArrayList<QuestionVO> qlist = adminService.getQuestionList();
		
		mav.setViewName("admin/admin");
		mav.addObject("mlist",list);
		mav.addObject("qlist",qlist);
		mav.addObject("nlist",nlist);
		return mav;
	}
	
	//1대1문의
	@RequestMapping(value="/question.do" , method = RequestMethod.POST)
	public String question(String qtitle,String qcontent,HttpSession session) {
		
		SessionVO svo = (SessionVO)session.getAttribute("svo");
		
		
		adminService.question(qtitle,qcontent,svo.getId());
		
		
		return "service_center/service_center";
	}
	@RequestMapping(value="/answer.do" , method = RequestMethod.GET)
	public ModelAndView answer(String qtitle,String qcontent) {
		ModelAndView mav = new ModelAndView();
		//QuestionVO qvo = adminService.getQuestion(title);
		//mav.addObject("qvo",qvo);
		
		mav.setViewName("admin/answer");
		mav.addObject("title", qtitle);
		mav.addObject("content",qcontent);
		
		return mav;
	}
	
	@RequestMapping(value="/answerRegister.do" , method = RequestMethod.POST)
	public String answerRegister(QuestionVO vo) {
		
		adminService.insertAnswer(vo);
		
		return "redirect:/admin.do";
	}
	
}
