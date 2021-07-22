package com.spring.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.dao.ChatDAO;
import com.spring.vo.ChatVO;

@Service("chatService")
public class ChatServiceImpl implements ChatService{
	@Autowired
	ChatDAO dao;
	
	public boolean send_chat(ChatVO vo) {
		return dao.send_chat(vo);
	}
}
