package native_jdbc_programing.service; //단위테스트 - >통합테스트

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import native_jdbc_programing.dto.Department;
import native_jdbc_programing.dto.Title;
import native_jdbc_programing.util.JdbcUtil;

public class TransactionService {
	public String transAddTitleAndDepartment(Title title, Department dept) { // add
		String titleSql = "insert into title values(?,?)";
		String deptSql = "insert into department values(?,?,?)";

//하나의 커넥션을 가지고 써야한다. 각각의 커넥션을 가져와서 따로 처리하지않게 
		// db에 연결하기
		Connection con = null;
		// 얘는 두개 해줘야함
		PreparedStatement tPstmt = null;
		PreparedStatement dPstmt = null;
		String res = null;

		try {
			con = JdbcUtil.getConnection(); // 접속하기 (오토커밋으로 되어있다)
			con.setAutoCommit(false); // 반드시 요고 하나로 생성해서 던지고

			tPstmt = con.prepareStatement(titleSql);
			tPstmt.setInt(1, title.gettNo());
			tPstmt.setString(2, title.gettName());
			tPstmt.executeUpdate();

			dPstmt = con.prepareStatement(deptSql); // 같아야만 트랜잭션이 적용된다.
			dPstmt.setInt(1, dept.getDeptNo());
			dPstmt.setString(2, dept.getDeptName());
			dPstmt.setInt(3, dept.getFloor());
			dPstmt.executeUpdate();

			con.commit();
			res = "commit";
//			System.out.println("commit()");
		} catch (SQLException e) {
			res = "rollback";
			rollbackutil(con);
		} finally {
			System.out.println(res);
			close(con, tPstmt, dPstmt);
		}
		return res;

	}

	public void close(Connection con, PreparedStatement tPstmt, PreparedStatement dPstmt) {
		try {
			con.setAutoCommit(true);

			if (tPstmt != null)
				tPstmt.close();
			if (dPstmt != null)
				dPstmt.close();
			if (con != null)
				con.close();

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public void rollbackutil(Connection con) {
		try {
			// System.out.println("rollback()");
			con.rollback();

		} catch (SQLException e1) {
			e1.printStackTrace();
		}
	}

	public int transRemoveTitleAndDepartment(Title title, Department dept) { // Remove
		String titleSql = "delete from title where tno = ?";
		String deptSql = "delete from department where deptno = ?";

		Connection con = null;
		PreparedStatement tPstmt = null;
		PreparedStatement dPstmt = null;

		int res = 0;
		
		try {
			con = JdbcUtil.getConnection(); // 접속하기 (오토커밋으로 되어있다)
			con.setAutoCommit(false); // 반드시 요고 하나로 생성해서 던지고

			
			System.out.println("res > "+ res);
			tPstmt = con.prepareStatement(titleSql);
			tPstmt.setInt(1, title.gettNo());
//			tPstmt.setString(2,title.gettName());
			res += tPstmt.executeUpdate();
			System.out.println("res > "+ res);
			
			
			

			dPstmt = con.prepareStatement(deptSql); // 같아야만 트랜잭션이 적용된다.
			dPstmt.setInt(1, dept.getDeptNo());
//			dPstmt.setString(2,dept.getDeptName());
//			dPstmt.setInt(3,dept.getFloor());
			res += dPstmt.executeUpdate();
			System.out.println("res > "+ res);
			
			
			if(res==2) {  //두개다 성공했으면

			con.commit();
			System.out.println("commit()");
			
			}else {
				throw new SQLException();
				
			}
		} catch (SQLException e) {
			rollbackutil(con);

		} finally {
			close(con, tPstmt, dPstmt);
		}
		return res;
		
	}
}
