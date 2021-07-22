package com.spring.daangn;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.spring.service.ChatService;
import com.spring.vo.ChatVO;

@Controller
public class ChatController {
	@Autowired
	private ChatService chatService;
	
	//ä�� �⺻ ȭ��
	@RequestMapping(value="/chat_main.do", method=RequestMethod.GET)
	public ModelAndView chat_main() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("chat/chatlist");
		return mv;
	}
	
	//��ǰ ���������� ä�� �ɾ��� ���
	@RequestMapping(value="/send_chat.do", method=RequestMethod.GET)
	public ModelAndView send_chat(int pid, String receiver, String sender) {
		ModelAndView mv = new ModelAndView();
		ChatVO vo = new ChatVO();
		vo.setPid(pid);
		vo.setReceiver(receiver);
		vo.setSender(sender);
		boolean result = chatService.send_chat(vo);
		mv.addObject("pid",pid);
		mv.addObject("receiver",receiver);
		mv.addObject("sender",sender);
		mv.setViewName("chat/chatlist");
		return mv;
	}
	
}
