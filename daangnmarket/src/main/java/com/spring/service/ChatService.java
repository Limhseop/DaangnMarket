package com.spring.service;

import java.util.ArrayList;

import com.spring.vo.ChatVO;

public interface ChatService {
	
	boolean send_chat(ChatVO vo);
	ArrayList<ChatVO> load_chatlist(String myid);
}
