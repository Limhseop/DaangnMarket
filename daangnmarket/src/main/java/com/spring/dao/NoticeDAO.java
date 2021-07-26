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
		
		// Select 공지사항 상세정보 
		public NoticeVO getContent(String bno) {
			return sqlSession.selectOne(namespace+".content", bno);
		}
		
		// Update 공지사항 수정 
		public boolean getUpdateResult(NoticeVO vo){
			boolean result = false;
			int value = sqlSession.update(namespace+".update", vo);
			if(value !=0) result = true;
			return result;
		}
		// DELETE 공지사항 삭제
		public boolean getDeleteResult(NoticeVO vo){
			boolean result = false;
			int value = sqlSession.delete(namespace+".delete", vo);
			if(value != 0) result = true;
			
			return result;
		}
		
		
		
}
