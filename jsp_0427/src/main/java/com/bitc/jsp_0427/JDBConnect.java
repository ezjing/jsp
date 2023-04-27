package com.bitc.jsp_0427;

import java.sql.*;



public class JDBConnect {
    public Connection conn;
    public Statement stmt;
    public PreparedStatement pstmt;
    public ResultSet rs;

    private String dbUrl;
    private String dbUserId;
    private String dbUserPw;
    private String dbDriver;

    public JDBConnect() {
        dbUrl = "jdbc:mysql://localhost:3306/testdb?useUnicode=true&characterEncoding=utf-8&serverTimezone=UTC";
        dbUserId = "full505";
        dbUserPw = "full505";
    }

    public JDBConnect(String dbDriver, String dbUrl, String dbUserId, String dbUserPw) { // 생성자 오버로딩
        this.dbDriver = dbDriver;
        this.dbUrl = dbUrl;
        this.dbUserId = dbUserId;
        this.dbUserPw = dbUserPw;
    }

    public void open() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");  // 드라이버 로드

            conn = DriverManager.getConnection(dbUrl, dbUserId, dbUserPw);   // 드라이버에 연결

            System.out.println("DB 연결 성공(기본 생성자)");

        }
        // catch를 2개 넣어 예외되는 상황별로 에러메시지 각각 출력하도록 돼있음
        catch (SQLException e) {
            System.out.println("Database Connection Open Error");
            System.out.println("SQLException : " + e.getMessage());
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

                System.out.println("JDBC 자원 해제");
            }
        }
        catch (Exception e) {

        }
    }
}
