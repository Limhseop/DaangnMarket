package com.spring.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.vo.MemberVO;
import com.spring.vo.NoticeVO;
import com.spring.vo.QuestionVO;

@Repository
public class AdminDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	private String namespace = "mapper.admin";
	
	public ArrayList<MemberVO> getMemberList() {
		ArrayList<MemberVO> list = new ArrayList<MemberVO>();
		
		List<MemberVO> al = new ArrayList<MemberVO>();
		al = sqlSession.selectList(namespace+".getmemberlist");
		
		list = (ArrayList<MemberVO>)al;
		
		return list;
	}
	
	public boolean question(String qtitle,String qcontent,String id) {
		
		boolean result = false;
		
		Map<String,String> param = new HashMap<String,String>();
		
		param.put("qtitle", qtitle);
		param.put("qcontent", qcontent);
		param.put("id", id);
		
		int value = sqlSession.insert(namespace+".questioninsert",param);
		if(value != 0) {
			result = true;
		}
		
		return result;
	}
	
	public ArrayList<QuestionVO> getQuestionList(){
		
		List<QuestionVO> qlist = sqlSession.selectList(namespace+".questionlist");
		
		return (ArrayList<QuestionVO>)qlist;
	}
	
	public QuestionVO getQuestion(String title) {
		
		QuestionVO vo = sqlSession.selectOne(namespace+".getquestion",title);
		
		return vo;
	}
	
	public void insertQuestion(QuestionVO vo) {
		Map<String,String> param = new HashMap<String,String>();
		
		param.put("qtitle", vo.getQtitle());
		param.put("qcontent", vo.getQcontent());
		param.put("qanswer", vo.getQanswer());
		sqlSession.insert(namespace+".insertanswer",param);
	}
	
	public ArrayList<NoticeVO> getNoticeList(){
		List<NoticeVO> nlist = sqlSession.selectList(namespace+".getnoticelist");
		
		return (ArrayList<NoticeVO>)nlist;
	}
}
