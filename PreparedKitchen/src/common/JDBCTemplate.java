package common;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class JDBCTemplate {
	
	public static Connection getConnection() {
		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		} catch (ClassNotFoundException e) {
			System.out.println("01. error");
			e.printStackTrace();
		}
		
		Connection con = null;
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String user = "kh";
		String password = "kh";
		
		try {
			con = DriverManager.getConnection(url, user, password);
			con.setAutoCommit(false);
		} catch (SQLException e) {
			System.out.println("02. error");
			e.printStackTrace();
		}
		
		return con;
	}
	
	public static void close(Connection con) {
		if(con != null) {
			try {
				con.close();
			} catch (SQLException e) {
				System.out.println("con.close error");
				e.printStackTrace();
			}
		}
	}
	
	public static void close(Statement stmt) {
		if(stmt != null) {
			try {
				stmt.close();
			} catch (SQLException e) {
				System.out.println("stmt.close error");
				e.printStackTrace();
			}
		}
	}
	
	public static void close(ResultSet rs) {
		if(rs != null) {
			try {
				rs.close();
			} catch (SQLException e) {
				System.out.println("rs.close error");
				e.printStackTrace();
			}
		}
	}
	
	public static void commit(Connection con) {
		if(con != null) {
			try {
				con.commit();
			} catch (SQLException e) {
				System.out.println("commit error");
				e.printStackTrace();
			}
		}
	}
	
	public static void rollback(Connection con) {
		if(con != null) {
			try {
				con.rollback();
			} catch (SQLException e) {
				System.out.println("rollback error");
				e.printStackTrace();
			}
		}
	}

}
