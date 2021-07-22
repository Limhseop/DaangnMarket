package com.spring.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.vo.ChatVO;

@Repository
public class ChatDAO extends DBConn{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	private static String namespace = "mapper.chat";
	
	public boolean send_chat(ChatVO vo) {
		boolean result = false;
		int sessionresult = sqlSession.insert(namespace+".send_chat", vo);
		if(sessionresult!=0) result = true;
		return result;
	}
}
