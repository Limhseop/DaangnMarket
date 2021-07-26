package com.spring.service;

import java.util.ArrayList;

import com.spring.vo.BoardVO;

public interface BoardService {

	ArrayList<Object> getList(int start, int end);
	int execTotalCount();
	Object getContent(String id);
}
