package com.spring.dao;

import java.util.ArrayList;
import java.util.List;

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
		int checkresult = sqlSession.selectOne(namespace+".send_chat_check", vo);
		if(checkresult==0) {	//ù ä��. �� cid �����ؼ� �����ؾ���
			int sessionresult = sqlSession.insert(namespace+".send_chat", vo);
			if(sessionresult!=0) {
				result = true;
			}
		}else {	//�̹� ä���� �ִ� ���. ���� X
			result = true;
		}
		return result;
	}
	
	public ArrayList<ChatVO> load_chatlist(String myid){
		List<ChatVO> olist = sqlSession.selectList(namespace+".load_chatlist", myid);
		return (ArrayList<ChatVO>)olist;
	}
}
