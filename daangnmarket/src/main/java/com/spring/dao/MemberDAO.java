package com.spring.dao;

public class MemberDAO extends DBConn {
	//로그인 체크
	public boolean loginCheck(String id, String pass) {
		boolean result=false;
		String sql = " select count(*) from daangn_member where id=? and pass=? ";
		getPreparedStatement(sql);
		
		try {
			pstmt.setString(1, id);
			pstmt.setString(2, pass);
			rs=pstmt.executeQuery();
			int num=0;
			if(rs.next()) {
				num = rs.getInt(1);
			}
			
			if(num!=0) {
				result=true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
}
