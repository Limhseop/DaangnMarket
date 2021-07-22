package com.spring.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.dao.BoardDAO;

@Service("boardService")
public class BoardServiceImpl implements BoardService {

	@Autowired
	private BoardDAO boardDAO;
	
	@Override
	public ArrayList<Object> getList(int start, int end) {
		// TODO Auto-generated method stub
		return boardDAO.getList(start, end);
	}

	/*
	 * @Override public Object getContent(String id) { // TODO Auto-generated method
	 * stub return null; }
	 */

	@Override
	public int execTotalCount() {
		// TODO Auto-generated method stub
		return boardDAO.execTotalCount();
	}

}
