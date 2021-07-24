package com.spring.daangn;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.spring.service.ChatService;
import com.spring.service.MypageService;
import com.spring.vo.ChatVO;
import com.spring.vo.MemberVO;

@Controller
public class ChatController {
	@Autowired
	private ChatService chatService;

	@Autowired
	private MypageService mypageService;
	
	//ä�� jsp ����
	@RequestMapping(value="/chat_plain.do", method=RequestMethod.GET)
	public String chat_plain() {
		return "chat/chatlist";
	}
	
	//ä�� �⺻ ȭ��
	@RequestMapping(value="/chat_main.do", method=RequestMethod.GET)
	public ModelAndView chat_main(String myid) {
		ArrayList<ChatVO> chat_list = chatService.load_chatlist(myid);	//chatVO �޾ƿ�
		MemberVO mvo = mypageService.getMember(myid);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("chat/chatlist");
		mv.addObject("myid",myid);
		mv.addObject("chat_list", chat_list);
		mv.addObject("mvo",mvo);
		
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
		if(result) {
			mv.addObject("pid",pid);
			mv.addObject("receiver",receiver);
			mv.addObject("sender",sender);
			mv.addObject("myid",sender);
			mv.setViewName("redirect:/chat_main.do");
		}else {
			mv.setViewName("error_page");
		}
		return mv;
	}
	
}
