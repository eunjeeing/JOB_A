package com.kh.joba.admin.visitor.model.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.kh.joba.admin.visitor.model.vo.VisitCount;

public class VisitCountDAOImpl implements VisitCountDAO {
	
	public static Connection getConnection() {
		Connection con = null;
		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			
			//  getConnection( 오라클서버url, 사용자계정, 비밀번호 );
			con = DriverManager.getConnection(
							"jdbc:oracle:thin:@localhost:1521:xe", 
							"JOBA", "JOBA");
			
			con.setAutoCommit(false); 
			// 에러 여부와 관계없이 자동 커밋하는 것을 방지
			
		} catch (ClassNotFoundException | SQLException e) {

			e.printStackTrace();
		}
		
		return con;
	}
	public static void close(PreparedStatement pstmt) {
		try {
			pstmt.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public static void close(ResultSet rset) {
		try {
			rset.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public static void close(Connection con) {
		try {
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public static void commit(Connection con) {
		// 변경사항 저장 메소드
		try {
			con.commit();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public static void rollback(Connection con) {
		// 변경사항 취소 메소드
		try {
			con.rollback();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	@Override
	public int setVisitTotalCount(Connection con, VisitCount v) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql ="INSERT INTO VISITOR\n"
				+ "(VISIT_ID,VISIT_IP,VISIT_TIME,VISIT_AGENT)\n"
				+ "VALUES\n"
				+ "(VISITOR_SEQ.NEXTVAL,#{visit_ip},DEFAULT,#{visit_agent})";
		
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, v.getVisit_id());
			pstmt.setString(2, v.getVisit_ip());
			pstmt.setString(3, v.getVisit_time());
			pstmt.setString(4, v.getVisit_agent());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}
	
	@Override
	public int getVisitTodayCount(Connection con) {
			
		int result = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = "SELECT COUNT(*) FROM VISITOR\n"
				+ "WHERE SUBSTR(TO_CHAR(VISIT_TIME),1,9)=TO_DATE(SYSDATE,'yy/MM/dd')";
		
		try {
			pstmt = con.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				result = rset.getInt(1);
			}
		} catch (SQLException e) {
			
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		System.out.println("todaycount result :" + result);
		return result;

	}

	@Override
	public int getVisitTotalCount(Connection con) {
		int result = 0;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = "SELECT COUNT(*) FROM VISITOR";
		
		try {
			pstmt = con.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				result = rset.getInt(1);
			}
		} catch (SQLException e) {
			
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		System.out.println("totalcount result :" + result);
		return result;
	}


}
