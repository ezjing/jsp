package com.bitc.tastyblog.model;

import java.sql.*;

public class Connect {
    protected Connection conn;
    protected Statement stmt;
    protected PreparedStatement pstmt;
    protected ResultSet rs;

    public Connect() {
        this("com.mysql.cj.jdbc.Driver", "jdbc:mysql://localhost:3306/testdb?useUnicode=true&characterEncoding=utf-8&serverTimezone=UTC", "full505", "full505");
    }

    public Connect(String driver, String url, String id, String pw) {
        try {
            Class.forName(driver);
            conn = DriverManager.getConnection(url, id, pw);
        }
        catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void dbClose() {
        try {
            if (rs != null) {rs.close();}
            if (stmt != null) {stmt.close();}
            if (pstmt != null) {pstmt.close();}
            if (conn != null) {conn.close();}
            System.out.println("***** DB is closed *****");
        }
        catch (Exception e) {

        }
    }
}