package com.bitc.jsp_0512.dao;

import  java.sql.*;

public class JDBConnect {
    public Connection conn;
    public Statement stmt;
    public PreparedStatement pstmt;
    public ResultSet rs;

    private String dbDriver;
    private String dbUrl;
    private String dbUserId;
    private String dbUserPw;

    public JDBConnect() {
        dbDriver = "com.mysql.cj.jdbc.Driver";
        dbUrl = "jdbc:mysql://localhost:3306/testdb?useUnicode=true&characterEncoding=utf-8&serverTimezone=UTC";
        dbUserId = "full505";
        dbUserPw = "full505";
    }

    public void open() {
        try {
            Class.forName(dbDriver);  // 드라이버 로드
            conn = DriverManager.getConnection(dbUrl, dbUserId, dbUserPw);   // 드라이버에 연결
            System.out.println("\n***** 데이터 베이스 연결 *****\n");
        }
        catch (SQLException e) {
            System.out.println("***** 데이터 베이스 연결 중 오류가 발생했습니다. *****");
            System.out.println("***** SQLException : " + e.getMessage() + " *****");
            e.printStackTrace();
        }
        catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
    }

    public void close() {
        try {
            if (rs != null) {
                rs.close();
            }
            if (stmt != null) {
                stmt.close();
            }
            if (pstmt != null) {
                pstmt.close();
            }
            if (conn != null) {
                conn.close();
            }

            System.out.println("\n***** 데이터 베이스 연결 종료 *****\n");
        }
        catch (Exception e) {

        }
    }
}
