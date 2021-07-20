package db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class jdbcUtil {

	private jdbcUtil() {
	};

	public static Connection getConnection() {

		Connection conn = null;
		try {
			Context init = new InitialContext();
			DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/OracleDB");
			conn = ds.getConnection();
			conn.setAutoCommit(false);

		} catch (SQLException e) {
			e.printStackTrace();
		} catch (NamingException e) {
			e.printStackTrace();
		}
		return conn;
	}

	public static boolean isConnected(Connection conn) {
		boolean validateConnection = true;
		try {
			if (conn == null || conn.isClosed()) {
				validateConnection = false;
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return validateConnection;
	}

	public static void close(Connection conn) {

		try {
			if (conn != null) {
				conn.close();
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public static void close(Statement stmt) {

		try {
			if (stmt != null) {
				stmt.close();
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public static void close(PreparedStatement pstmt) {

		try {
			if (pstmt != null) {
				pstmt.close();
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public static void close(ResultSet rs) {

		try {
			if (rs != null) {
				rs.close();
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public static void commit(Connection conn) {
		if (isConnected(conn))
			try {
				conn.commit();

			} catch (SQLException e) {
				e.printStackTrace();
			}

	}

	public static void rollback(Connection conn) {
		if (isConnected(conn))
			try {
				conn.rollback();

			} catch (SQLException e) {
				e.printStackTrace();
			}

	}

}
