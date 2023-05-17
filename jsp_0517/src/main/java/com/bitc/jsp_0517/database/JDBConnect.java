package com.bitc.jsp_0517.database;

import java.sql.*;

public class JDBConnect {
    protected Connection conn;
    protected Statement stmt;
    protected PreparedStatement pstmt;
    protected ResultSet rs;

    private String dbUrl;
    private String dbUserId;
    private String dbUserPw;

    public JDBConnect() {   // 드라이버 연결
        dbUrl = "jdbc:mysql://localhost:3306/testdb?useUnicode=true&characterEncoding=utf-8&serverTimezone=UTC";
        dbUserId = "full505";
        dbUserPw = "full505";
    }

    public void dbOpen() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(dbUrl,dbUserId, dbUserPw);
            System.out.println("데이터 베이스에 연결되었습니다.");
        }
        catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void dbClose() {
        try {
            if (rs != null) {rs.close();}
            if (pstmt != null) {pstmt.close();}
            if (conn != null) {conn.close();}
        }
        catch (Exception e) {
            e.printStackTrace();
        }
    }
}
