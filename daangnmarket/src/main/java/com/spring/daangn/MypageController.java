package com.spring.daangn;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MypageController {
	
	@RequestMapping(value="/memberUpdate.do", method = RequestMethod.GET)
	public String memberUpdate() {
		return "memberUpdate";
	}
			
	@RequestMapping(value="/mypage.do" , method = RequestMethod.GET)
	public String mypage() {
		return "mypage";
	}
}
