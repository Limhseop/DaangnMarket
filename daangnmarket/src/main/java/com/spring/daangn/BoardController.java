package com.spring.daangn;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class BoardController {

	//boardlist-게시판
	@RequestMapping(value = "/boardlist.do", method = RequestMethod.GET)
	public String boardlist() {
		return "/boardlist";
	}
	
	//boardPost-게시글
	@RequestMapping(value = "/boardPost.do", method = RequestMethod.GET)
	public String boardPost() {
		return "/boardPost";
	}
}
