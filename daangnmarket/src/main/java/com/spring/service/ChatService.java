package com.spring.service;

import java.util.ArrayList;

import com.spring.vo.ChatVO;

public interface ChatService {
	
	boolean send_chat(ChatVO vo);
	boolean send_chat_check(ChatVO vo);
	ArrayList<ChatVO> load_chatlist(String myid);
	ArrayList<ChatVO> load_chatdetail(int cid);
	int get_cid(ChatVO vo);
}
