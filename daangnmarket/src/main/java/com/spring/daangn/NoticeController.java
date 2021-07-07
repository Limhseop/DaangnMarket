package com.spring.daangn;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

public class NoticeController {
	
	@RequestMapping(value="/notice.do", method = RequestMethod.GET)
	public String notice() {
		return "/notice/notice";
	}
			
	@RequestMapping(value="/notice_write.do" , method = RequestMethod.GET)
	public String notice_write() {
		return "/notice/notice_write";
	}

}
