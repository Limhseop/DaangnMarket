package com.spring.daangn;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ChatController {
	
	//ä�� �⺻ ȭ��
	@RequestMapping(value="/chat_main.do", method=RequestMethod.GET)
	public String chat_main() {
		return "chat/chatlist";
	}
	
}
