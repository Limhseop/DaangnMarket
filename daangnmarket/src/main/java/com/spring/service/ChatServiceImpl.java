package com.spring.service;

import java.util.ArrayList;

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
	public ArrayList<ChatVO> load_chatlist(String myid){
		return dao.load_chatlist(myid);
	}
	public boolean send_chat_check(ChatVO vo) {
		return dao.send_chat_check(vo);
	}
	public ArrayList<ChatVO> load_chatdetail(int cid){
		return dao.load_chatdetail(cid);
	}
	public int get_cid(ChatVO vo) {
		return dao.get_cid(vo);
	}
}
