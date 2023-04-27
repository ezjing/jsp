package com.bitc.jsp_0427;

import java.sql.*;
import java.util.*;


public class JDBConnect2 {
    private Connection conn;
    private Statement stmt;
    private PreparedStatement pstmt;
    private ResultSet rs;

    private String dbUrl;
    private String dbUserId;
    private String dbUserPw;
    private String dbDriver;

    public JDBConnect2() {
        dbUrl = "jdbc:mysql://localhost:3306/testdb?useUnicode=true&characterEncoding=utf-8&serverTimezone=UTC";
        dbUserId = "full505";
        dbUserPw = "full505";
    }

    public JDBConnect2(String dbDriver, String dbUrl, String dbUserId, String dbUserPw) { // 생성자 오버로딩 부분
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

    public int postWrite(String postTitle, String postContent, String postUser) {
        String sql = "INSERT INTO board (title, content, id, postdate) ";
        sql += "VALUES (?, ?, ?, NOW()) ";

        int result = 0;

        try {
//      생성된 SQL과 함께 PreparedStatement 객체를 생성
            pstmt = conn.prepareStatement(sql);
//      sql의 ? 부분에 실제 데이터를 추가
            pstmt.setString(1, postTitle);
            pstmt.setString(2, postContent);
            pstmt.setString(3, postUser);

//      insert 쿼리문 실행
            result = pstmt.executeUpdate();
        }
        catch (SQLException e) {
            e.printStackTrace();
        }

        return result;
    }

    public List<Map<String, String>> postList() {
//    게시물 목록을 가져오는 SQL 쿼리
        String sql = "SELECT num, title, id, postdate, visitcount FROM board ";
//    가져온 결과값을 저장할 ArrayList
        List<Map<String, String>> dataList = new ArrayList<>();

        try {
//      PreparedStatement 를 사용하여 SQL 쿼리는 질의
            pstmt = conn.prepareStatement(sql);
//      결과값 가져오기
            rs = pstmt.executeQuery();

            while (rs.next()) {
//        ResultSet에 저장된 내용 출력
                int postNum = rs.getInt("num");
                String postTitle = rs.getString("title");
                String postUser = rs.getString("id");
                String postDate = rs.getString("postdate");
                String postVisit = rs.getString("visitcount");

//        HashMap 타입에 데이터 저장
                Map<String, String> data = new HashMap<>();
                data.put("postNum", String.valueOf(postNum));
                data.put("postTitle", postTitle);
                data.put("postUser", postUser);
                data.put("postDate", postDate);
                data.put("postVisit", postVisit);

//        ArryaList에 게시물 1개에 대한 정보를 추가함
                dataList.add(data);
            }
        }
        catch (SQLException e) {
            e.printStackTrace();
        }

//    ArrayList에 저장된 내용을 반환
        return dataList;
    }
}

// 아래는 내가 한 부분

//    String[] arr;
//
//    public void postWrite() {
//        try {
//            stmt = conn.createStatement();   // stmt로 번역해서 받아옴
//            String sql = "SELECT * FROM board"; // sql문 입력 준비
////            rs = stmt.executeQuery(sql);    // 입력
//
//            while (rs.next()) {
//                int postNum = rs.getInt("num");
//                String postTitle = rs.getString("title");
//                String postContent = rs.getString("content");
//                String postId = rs.getString("id");
//                String postDate = rs.getString("postdate");
//                int postVisitCount = rs.getInt("visitcount");
//
//                sql += "VALUES ('" + postNum + "', '" + postTitle + "', '" + postContent + "', '" + postId + "', '" + postDate + "', '" + postVisitCount + "') ";
//            }
//
//            for (int i = 0; i < arr.length; i++) {
//                arr[i] = sql;
//            }
//
//            // 출력하는 부분 list에서 출력할수있도록 해보자
//            System.out.println(Arrays.toString(arr));
//
//            for(String a : arr) {
//                System.out.println(a);
//            }
//        }
//        catch (SQLException e) {
//            System.out.println("데이터 베이스 사용 중 오류가 발생했습니다.<br>");
//            System.out.println("SQLException : " + e.getMessage());
//        }
//    }
//
//    public void postList() {
//        for (int i = 0; i < arr.length; i++) {
////            tr a만들기.
//            for (String j : arr) {
////                writer.write();
////                <td><%=postNum%></td>
////                <td><%=postTitle%></td>
////                <td><%=postContent%></td>
////                <td><%=postId%></td>
////                <td><%=postDate%></td>
////                <td><%=postVisitCount%></td>
//            }
//        }
//    }
//}
