package com.spring.dao;

import java.util.List;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

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
			int value = sqlSession.insert(namespace+".insert", vo);
			if(value !=0) result = true;
			
			
			return result;
		}//getInsertResult
	
		//Select --> 전체 리스트
		public List<NoticeVO> list() throws Exception{
			
			return sqlSession.selectList("mapper.notice.list");
		}
		
}
