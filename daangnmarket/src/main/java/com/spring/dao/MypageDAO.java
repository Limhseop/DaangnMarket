package com.spring.dao;

import com.spring.vo.MemberVO;

public class MypageDAO extends DBConn{
	
	//회원 정보 가져오기(name,joindate,sale,purchase,introduce)
	public MemberVO getMember(String id) {
		MemberVO vo = new MemberVO();
		String sql = "select * from daangn_member where id=?";
		getPreparedStatement(sql);
		
		try {
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				vo.setId(rs.getString(1));
				vo.setPass(rs.getString(2));
				vo.setName(rs.getString(3));
				vo.setEmail(rs.getString(4));
				vo.setPhone(rs.getString(5));
				vo.setAddr(rs.getString(6));
				vo.setIntroduce(rs.getString(7));
				vo.setJoindate(rs.getString(8));
				vo.setSale(rs.getInt(9));
				vo.setPurchase(rs.getInt(10));
				vo.setImagepath(rs.getString(11));
				
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return vo;
	}
}
