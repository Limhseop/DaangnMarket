package com.spring.daangn;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.spring.service.Mypage;
import com.spring.vo.MemberVO;

@Controller
public class MypageController {
	
	@Autowired
	private Mypage mypage;
	
//	@RequestMapping(value="/memberUpdate.do", method = RequestMethod.GET)
//	public ModelAndView memberUpdate() {
//		
//	}
			
	@RequestMapping(value="/mypage.do" , method = RequestMethod.GET)
	public ModelAndView mypage(String id) {
		ModelAndView mav = new ModelAndView();
		
		MemberVO vo = mypage.getMember(id);
		
		mav.setViewName("/mypage/mypage");
		mav.addObject("vo",vo);
		
		return mav;
	}
}
