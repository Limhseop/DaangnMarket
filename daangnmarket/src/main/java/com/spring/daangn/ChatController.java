package com.spring.daangn;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
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
	public ModelAndView chat_plain() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("chat/chatlist");
		mv.addObject("status","load");
		return mv;
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
	
	//ä�� �󼼳��� ȭ�� ��ȸ
	@RequestMapping(value="/view_chat.do", method=RequestMethod.GET)
	@ResponseBody
	public ModelAndView view_chat(String cid, String myid) {
		ModelAndView mv = new ModelAndView();
		ArrayList<ChatVO> list = chatService.load_chatdetail(cid);
		
		return mv;
	}
	
	//��ǰ ���������� ä�� �ɾ��� ���
	@RequestMapping(value="/make_newchat.do", method=RequestMethod.GET)
	public ModelAndView make_newchat(String pid, String receiver, String sender) {
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
		
		mv.addObject("myid",sender);
		mv.addObject("status","new");
		mv.addObject("cvo", vo);
		mv.setViewName("redirect:/chat_main.do");
		return mv;
	}
	
	
	//ä�� ���� ���
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
		
		boolean result = chatService.send_chat_check(vo);
		if(result) {	//�� ä��
			mv.addObject("myid",sender);
			mv.addObject("status","new");
			mv.setViewName("redirect:/chat_main.do");
		}else {	//�̹� ä���� �ִ� ���
			mv.addObject("myid",sender);
			mv.addObject("status","new");
			mv.setViewName("redirect:/chat_main.do");
		}
		return mv;
	}
	
}
