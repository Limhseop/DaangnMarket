package com.spring.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.vo.NoticeVO;

@Repository

public class NoticeDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	private String namespace="mapper.notice";
	
	//insert ---> 게시판 글쓰기
		public boolean getInsertResult(NoticeVO vo){
			boolean result = false;
			System.out.println("123" + vo.getTitle());
			System.out.println("123" + vo.getContent());
			int value = sqlSession.insert(namespace+".insert", vo);
			if(value !=0) result = true;
			
			
			return result;
		}//getInsertResult
	
}
