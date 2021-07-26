package com.spring.service;

import java.util.ArrayList;
import java.util.List;

import com.spring.vo.BoardVO;

public interface BoardService {

	// select
	public List<BoardVO> list() throws Exception;
	ArrayList<Object> getList(int start, int end);
	int execTotalCount();
	Object getContent(String id);
}
