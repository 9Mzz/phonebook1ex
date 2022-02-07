package com.javaex.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.javaex.vo.PersonVo;

public class PhoneDao {

	// 0. import java.sql.*;
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	private String driver = "oracle.jdbc.driver.OracleDriver";
	private String url = "jdbc:oracle:thin:@localhost:1521:xe";
	private String id = "webdb";
	private String pw = "webdb";

	private void getConnection() {
		try {
			// 1. JDBC 드라이버 (Oracle) 로딩
			Class.forName(driver);

			// 2. Connection 얻어오기
			conn = DriverManager.getConnection(url, id, pw);
			// System.out.println("접속성공");

		} catch (ClassNotFoundException e) {
			System.out.println("error: 드라이버 로딩 실패 - " + e);
		} catch (SQLException e) {
			System.out.println("error:" + e);
		}
	}

	private void close() {

		// 5. 자원정리
		try {
			if (rs != null) {
				rs.close();
			}
			if (pstmt != null) {
				pstmt.close();
			}
			if (conn != null) {
				conn.close();
			}
		} catch (SQLException e) {
			System.out.println("error:" + e);
		}
	}

	public int perosnInsert(PersonVo personVo) {

		int count = 0;
		getConnection();

		try {
			// 3. SQL문 준비 / 바인딩 / 실행
			String query = "";
			query += " INSERT INTO person ";
			query += " VALUE(seq_person_id.nextval, ?, ?, ?) ";

			pstmt = conn.prepareStatement(query);

			pstmt.setString(1, personVo.getName());
			pstmt.setString(2, personVo.getHp());
			pstmt.setString(3, personVo.getCompany());

			count = pstmt.executeUpdate();

			// 4.결과처리

		} catch (SQLException e) {
			System.out.println("error:" + e);
		}
		close();
		return count;
	}

	// 사람 리스트
	public List<PersonVo> getPersonList() {
		return getPersonList();
	}

	// 사람 리스트 검색
	public List<PersonVo> getPersonList(String keyword) {
		List<PersonVo> personList = new ArrayList<PersonVo>();

		getConnection();

		try {
			String query = "";
			query += " select person_id, name, hp, company ";
			query += " from person ";
			if (keyword != "" || keyword == null) {
				query += " where name like ? ";
				query += " or hp like ? ";
				query += " or company like  ";
				pstmt = conn.prepareStatement(query);
				
				pstmt.setString(1, query);
				
				pstmt.setString(1, '%'+keyword+'%');
				pstmt.setString(2, '%'+keyword+'%');

			} else {
			}

		} catch (SQLException e) {
			System.out.println("error:" + e);
		}

		return personList;
	}

	// 끝
}
