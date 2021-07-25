package com.spring.daangn;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.spring.service.ChatService;
import com.spring.service.MypageService;
import com.spring.service.ProductService;
import com.spring.vo.ChatVO;
import com.spring.vo.MemberVO;
import com.spring.vo.ProductVO;

@Controller
public class ChatController {
	@Autowired
	private ChatService chatService;

	@Autowired
	private MypageService mypageService;
	
	@Autowired
	private ProductService productService;
	
	//ä�� jsp ����
	@RequestMapping(value="/chat_plain.do", method=RequestMethod.GET)
	public String chat_plain() {
		return "chat/chatlist";
	}
	
	//ä�� ����Ʈ ȭ��
	@RequestMapping(value="/chat_main.do", method=RequestMethod.GET)
	public ModelAndView chat_main(String myid, String status) {
		if(status==null || status.equals("")) {
			status="load";
		}
		
		/**status�� new�� ���: ä������ �ŷ��ϱ�� ������ ��.
		status�� load�� ��� : header�� ä�� ������ ������ ��**/
		
		ArrayList<ChatVO> chat_list = chatService.load_chatlist(myid);	//chatVO �޾ƿ�
		MemberVO mvo = mypageService.getMember(myid);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("chat/chatlist");
		mv.addObject("myid",myid);
		mv.addObject("chat_list", chat_list);
		mv.addObject("status",status);
		mv.addObject("mvo",mvo);
		
		return mv;
	}
	
	//��ǰ ���������� ä�� �ɾ��� ���
	@RequestMapping(value="/send_chat.do", method=RequestMethod.GET)
	public ModelAndView send_chat(String pid, String receiver, String sender) {
		ModelAndView mv = new ModelAndView();
		ChatVO vo = new ChatVO();
		MemberVO receiver_mvo = mypageService.getMember(receiver);
		MemberVO sender_mvo = mypageService.getMember(sender);
		ProductVO pvo = productService.getContent(pid);
		
		vo.setSender(sender);
		vo.setSender_name(sender_mvo.getName());
		vo.setSender_image(sender_mvo.getImagepath());
		vo.setReceiver(receiver);
		vo.setReceiver_name(receiver_mvo.getName());
		vo.setReceiver_image(receiver_mvo.getImagepath());
		vo.setPid(pid);
		vo.setPtitle(pvo.getPtitle());
		vo.setP_location(pvo.getLocation());
		vo.setPsfile(pvo.getPsfile());
		
		boolean result = chatService.send_chat(vo);
		if(result) {
			/**
			mv.addObject("pid",pid);
			mv.addObject("receiver",receiver);
			mv.addObject("sender",sender);
			**/
			mv.addObject("myid",sender);
			mv.addObject("status","new");
			mv.setViewName("redirect:/chat_main.do");
		}else {
			mv.setViewName("error_page");
		}
		return mv;
	}
	
}
