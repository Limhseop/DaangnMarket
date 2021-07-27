package com.spring.daangn;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
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
	
	//채팅 jsp 보기
	@RequestMapping(value="/chat_plain.do", method=RequestMethod.GET)
	public ModelAndView chat_plain() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("chat/chatlist");
		mv.addObject("status","load");
		return mv;
	}
	
	//채팅 로그 불러오기
	@RequestMapping(value="/chat_getlog.do", method=RequestMethod.GET)
	public ModelAndView chat_getlog(int cid, String myid) {
		ModelAndView mv = new ModelAndView();
		mv.addObject("sender", myid);
		ArrayList<ChatVO> log_list = chatService.load_chatdetail(cid);
		String buyer = log_list.get(0).getBuyer();
		String seller = log_list.get(0).getSeller();
		String pid = log_list.get(0).getPid();
		String receiver="";
		if(myid.equals(buyer)) {
			receiver = seller;
		}else {
			receiver = buyer;
		}
		
		mv.addObject("receiver",receiver);
		mv.addObject("pid", pid);
		
		mv.setViewName("redirect:/make_newchat.do");
		return mv;
		
	}
	
	//채팅 리스트 화면
	@RequestMapping(value="/chat_main.do", method=RequestMethod.GET)
	public ModelAndView chat_main(String sender, String sender_name, String sender_image,
			String receiver, String receiver_name, String receiver_image, int cid,
			String pid, String ptitle, String p_location, String psfile,
			int price, String saled, String log, String seller, String buyer,
			int chat_check, String myid, String status) {
		ModelAndView mv = new ModelAndView();
		/**우측 채팅 로그 불러오기**/

		/**status가 select일 경우: 채팅으로 거래하기로 들어왔을 때.
		status가 load인 경우 : header의 채팅 탭으로 들어왔을 때**/
		
		if(status==null || status.equals("")) {
			status="load";
		}else {
			ChatVO vo = new ChatVO();
			
			vo.setSender(sender);
			vo.setSender_name(sender_name);
			vo.setSender_image(sender_image);
			vo.setReceiver(receiver);
			vo.setReceiver_name(receiver_name);
			vo.setReceiver_image(receiver_image);
			vo.setPid(pid);
			vo.setPtitle(ptitle);
			vo.setP_location(p_location);
			vo.setPsfile(psfile);
			vo.setPrice(price);
			vo.setSaled(saled);
			vo.setSeller(seller);
			vo.setBuyer(buyer);
			vo.setLog(log);
			vo.setCid(cid);
			mv.addObject("vo_setting", vo);
		
			if(chat_check==1){	//채팅으로 거래하기로 들어왔는데 그 전 채팅내역이 있는 경우
				ArrayList<ChatVO> log_list = chatService.load_chatdetail(cid);
				mv.addObject("log_list", log_list);
			}
		}
		
		
		/**좌측 채팅 리스트 불러오기(공통)**/
		ArrayList<ChatVO> chat_list = chatService.load_chatlist(myid);	//chatVO 받아옴
		MemberVO mvo = mypageService.getMember(myid);
		mv.setViewName("chat/chatlist");
		mv.addObject("myid",myid);
		mv.addObject("chat_list", chat_list);
		mv.addObject("status",status);
		mv.addObject("mvo",mvo);
		
		
		return mv;
	}
	
	//채팅 상세내용 화면 조회	--ajax 처리 하기
	@RequestMapping(value="/load_chat_ajax.do", method=RequestMethod.GET)
	@ResponseBody
	public String view_chat(int cid) {
		ArrayList<ChatVO> log_list = chatService.load_chatdetail(cid);
		
		JsonObject jdata = new JsonObject();
		JsonArray jlist = new JsonArray();
		Gson gson = new Gson();
		
		for(ChatVO vo:log_list) {
			JsonObject jobj = new JsonObject();
			jobj.addProperty("lid", vo.getLid());
			jobj.addProperty("cid", vo.getCid());
			jobj.addProperty("sender", vo.getSender());
			jobj.addProperty("sender_name", vo.getSender_name());
			jobj.addProperty("sender_image", vo.getSender_image());
			jobj.addProperty("receiver", vo.getReceiver());
			jobj.addProperty("receiver_name", vo.getReceiver_name());
			jobj.addProperty("receiver_image", vo.getReceiver_image());
			jobj.addProperty("pid", vo.getPid());
			jobj.addProperty("seller", vo.getSeller());
			jobj.addProperty("buyer", vo.getBuyer());
			jobj.addProperty("ptitle", vo.getPtitle());
			jobj.addProperty("p_location", vo.getP_location());
			jobj.addProperty("psfile", vo.getPsfile());
			jobj.addProperty("price", vo.getPrice());
			jobj.addProperty("saled", vo.getSaled());
			jobj.addProperty("log", vo.getLog());
			jobj.addProperty("csfile", vo.getCsfile());
			jobj.addProperty("cday", vo.getCday());
			jobj.addProperty("ctime", vo.getCtime());
			
			jlist.add(jobj);
		}
		jdata.add("jlist", jlist);
		jdata.addProperty("status", "select");
		
		return gson.toJson(jdata);
	}
	
	/*
	//채팅 보낼 경우(처음)
	@RequestMapping(value="/send_chat.do", method=RequestMethod.POST)
	public ModelAndView send_chat(String text_message, String sender, String receiver, String pid) {
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
		mv.addObject("status","select");
		mv.addObject("cvo", vo);
		mv.setViewName("redirect:/chat_main.do");
		return mv;
	}
	*/
	
	//제품 페이지에서 채팅 걸었을 경우
	@RequestMapping(value="/make_newchat.do", method=RequestMethod.GET)
	public ModelAndView make_newchat(String log, String pid, String receiver, String sender) {
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
		vo.setPrice(pvo.getPrice());
		vo.setSaled(pvo.getSaled());
		vo.setLog(log);
		vo.setSeller(pvo.getId());
		if(pvo.getId().equals(sender)) {	//판매자가 sender일 경우
			vo.setBuyer(receiver);
		}else {
			vo.setBuyer(sender);
		}

		
		mv.addObject("sender",sender);
		mv.addObject("sender_name",sender_mvo.getName());
		mv.addObject("sender_image",sender_mvo.getImagepath());
		mv.addObject("receiver",receiver);
		mv.addObject("receiver_name",receiver_mvo.getName());
		mv.addObject("receiver_image",receiver_mvo.getImagepath());
		mv.addObject("pid",pid);
		mv.addObject("ptitle",pvo.getPtitle());
		mv.addObject("p_location",pvo.getLocation());
		mv.addObject("psfile",pvo.getPsfile());
		mv.addObject("price",pvo.getPrice());
		mv.addObject("saled",pvo.getSaled());
		mv.addObject("seller",pvo.getId());
		mv.addObject("log",log);
		if(pvo.getId().equals(sender)) {	//판매자가 sender일 경우
			mv.addObject("buyer",receiver);
		}else {
			mv.addObject("buyer",sender);
		}
		
		
		boolean result = chatService.send_chat_check(vo);
		int chat_check=0;
		if(result) {	//새 채팅
			chat_check=0;
			mv.addObject("cid",0);
		}else {	//이미 채팅이 있는 경우
			chat_check=1;
			vo.setCid(chatService.get_cid(vo));
			mv.addObject("cid",vo.getCid());
		}
		
		if(log!=null) {	//채팅을 전했을 때
			chatService.send_chat(vo);
			chat_check=1;
		}
		
		mv.addObject("chat_check",chat_check);
		//mv.addObject("vo",vo);
		//mv.addObject("map",map);
		mv.addObject("myid",sender);
		mv.addObject("status","select");
		mv.setViewName("redirect:/chat_main.do");
		return mv;
	}
	
}
