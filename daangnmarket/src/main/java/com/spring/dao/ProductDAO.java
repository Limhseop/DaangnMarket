package com.spring.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.vo.MemberVO;
import com.spring.vo.ProductVO;

@Repository
public class ProductDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	private static String namespace = "mapper.product";
	
	//관리자 리스트에서 선택 삭제
	public int getSelectDelete(String[] stArray) {
		return sqlSession.delete(namespace+".select_delete", stArray);
	}
	
	//select : 회원이 좋아요 했는지 여부 가져오기
	public String getLike(String memberid) {
		return sqlSession.selectOne(namespace+".getlike", memberid);
	}
	
	//update : 채팅 카운트 올리기
	public int getChatCount(String pid) {
		return sqlSession.update(namespace+".updatechat", pid);
	}
	//update : 즐겨찾기 신고하기
	public int getReportResult(String pid) {
		return sqlSession.update(namespace+".updatereport", pid);
	}
	//update : 즐겨찾기 설정
	public int getLikeResult(String pid) {
		return sqlSession.update(namespace+".updatelike", pid);
	}
	//update : 즐겨찾기 해제
	public int getDislikeResult(String pid) {
		return sqlSession.update(namespace+".updatedislike", pid);
	}
	
	//select: 유저 정보 가져오기
	public MemberVO getMember(String id) {
		return sqlSession.selectOne(namespace+".member", id);
	}
	
	
	//select : 유저 위치 알아오기
	public String getLocation(String id) {
		return sqlSession.selectOne(namespace+".location", id);
	}
	
	//select : 유저 이름 알아오기
	public String getUserName(String id) {
		return sqlSession.selectOne(namespace+".username", id);
	}
	
	//select : 행 수 얻어오기
	public int execTotalCount() {
		return sqlSession.selectOne(namespace+".count");
	}
	
	//select : 파일 이름 가져오기
	public String getPsfile(String pid) {
		return sqlSession.selectOne(namespace+".psfile", pid);
		
	}
	
	//delete : 삭제하기
	public boolean getDeleteResult(String pid) {
		boolean result = false;
		int value = sqlSession.delete(namespace+".pro_delete", pid);
		if(value != 0) {
			result = true;
		}
		
		return result;
	}
	
	//update : 수정하기(파일 미포함)
	public boolean getUpdateResultNofile(ProductVO vo) {
		boolean result = false;
		
		int value = sqlSession.update(namespace+".pro_updateNofile", vo);
		
		if(value != 0) {
			result = true;
		}
		
		return result;
	}
	
	//update : 수정하기 (파일 포함)
	public boolean getUpdateResult(ProductVO vo) {
		boolean result = false;
		int value = sqlSession.update(namespace+".pro_update", vo);
		if(value != 0) {
			result = true;
		}
		
		return result;
	}
	
	//update: 판매상태 바꾸기
	public int getSaleResult(String pid) {
		return sqlSession.update(namespace+".updateSale", pid);
	}
	
	//update: 조회수 올리기
	public void getUpdateHit(String pid) {
		sqlSession.update(namespace+".updateHit", pid);
	}
	//insert: 좋아요 기록하기
	public void likeInsert(String memberid, String pid) {
		Map<String, String> param = new HashMap();
		param.put("memberid", memberid);
		param.put("pid", pid);
		sqlSession.update(namespace+".likeinsert", pid);
	}
	//delete: 좋아요 삭제하기
	public void likeDelete(String memberid, String pid) {
		Map<String, String> param = new HashMap();
		param.put("memberid", memberid);
		param.put("pid", pid);
		sqlSession.update(namespace+".likedelete", pid);
	}
	
	//select : 상세내용 가져오기
	public ProductVO getContent(String pid) {
		return sqlSession.selectOne(namespace+".content", pid);
	}
	
	//select: 리스트 가져오기
	public ArrayList<ProductVO> getList(int start, int end){
		Map<String, Object> param = new HashMap();
		param.put("start", start);
		param.put("end", end);
		
		List<ProductVO> list = sqlSession.selectList(namespace+".productlistpage", param);
		
		return (ArrayList<ProductVO>)list;
	}
	
	//select: 리스트 가져오기
	public ArrayList<ProductVO> getList(){
		List<ProductVO> list = sqlSession.selectList(namespace+".productlist");
		return (ArrayList<ProductVO>)list;
	}
	//select: 검색 리스트 가져오기
	public ArrayList<ProductVO> getList(String category, String search){
		Map<String, String> param = new HashMap<String, String>();
		param.put("category", category); 
		param.put("sname", search);
		List<ProductVO> list = sqlSession.selectList(namespace+".productsearch", param);
		
		return (ArrayList<ProductVO>)list;
	}
	
	//select: 해당 판매자 id가져오기 
	public ArrayList<ProductVO> getList(String id){
		List<ProductVO> list = sqlSession.selectList(namespace+".productlistuser", id);
		return (ArrayList<ProductVO>)list;
	}
	
	//select: 해당 판매자 id가져오기 
	public ArrayList<ProductVO> getMoreList(String id){
		List<ProductVO> list = sqlSession.selectList(namespace+".productlistmore", id);
		return (ArrayList<ProductVO>)list;
	}

	public boolean getInsertResult(ProductVO vo) {
		// TODO Auto-generated method stub
		boolean result = true;
		
		int value = sqlSession.insert(namespace+".insert", vo);
		
		if(value != 0) {
			result = true;
		}
		
		return result;
	}

	
	
	
	
}
