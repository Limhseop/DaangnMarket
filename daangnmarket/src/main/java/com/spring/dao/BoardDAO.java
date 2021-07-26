package com.spring.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.vo.BoardVO;

@Repository
public class BoardDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;

	private String namespace = "mapper.board";

	// select
	public List<BoardVO> list() throws Exception{
		
		return sqlSession.selectList("mapper.board.list");
	}
	
	// 전체 로우수
	public int execTotalCount() {
		return sqlSession.selectOne(namespace + ".count");
	}

	// Select --> 전체 리스트 : 페이징 처리
	public ArrayList<Object> getList(int start, int end) {
		Map<String, String> param = new HashMap<String, String>();
		param.put("start", String.valueOf(start));
		param.put("end", String.valueOf(end));
		List<Object> list = sqlSession.selectList(namespace + ".list", param);

		return (ArrayList<Object>)list;
	}
}
