package com.bitc.jsp_0428;

import java.sql.*;

// DAO : 자바에서 데이터베이스에 접근하고 데이터를 CRUD하기 위해 사용하는 클래스
// View 부분과 데이터 처리 부분을 분리하여 관리하기 위함
public class MemberDAO {
    public Connection conn;
    public Statement stmt;
    public PreparedStatement pstmt;
    public ResultSet rs;

    private String dbUrl;
    private String dbUserId;
    private String dbUserPw;


    public MemberDAO() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");  // 드라이버 로드
            dbUrl = "jdbc:mysql://localhost:3306/testdb?useUnicode=true&characterEncoding=utf-8&serverTimezone=UTC";
            dbUserId = "full505";
            dbUserPw = "full505";

            conn = DriverManager.getConnection(dbUrl, dbUserId, dbUserPw);   // 드라이버에 연결
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            throw new RuntimeException(e);

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    // 데이터 베이스 연결
    public void dbOpen() {
        try {
            conn = DriverManager.getConnection(dbUrl, dbUserId, dbUserPw);
            System.out.println("\n*****데이터베이스 연결 성공*****\n");
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("\n*****데이터베이스 연결 실패*****\n");
        }
    }

    // 데이터 베이스 접속 종료
    public void dbClose() {
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
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // 데이터 베이스에서 사용자 목록 가져오기
    public MemberDTO getMemberDTO(String uid, String upass) {
        MemberDTO dto = new MemberDTO();
        
        String query = "SELECT * FROM member WHERE id=? AND pass=?";

        try {
            // PrepareStatement 객체 생성
            pstmt = conn.prepareStatement(query);
            // SQL 쿼리문에 있는 ?에 실제 데이터로 벼환
            pstmt.setString(1, uid);
            pstmt.setString(2, upass);
            
            // 데이터 베이스로 쿼리문 실행, rs에 결과값 가져오기
            rs = pstmt.executeQuery();

            if (rs.next()) {    // rs 값을 가져와서 dto로 넣기
                // ResultSet에 저장된 데이터 중 컬럼명을 통하여 데이터 가져오기
                dto.setId(rs.getString("id"));
                dto.setPass(rs.getString("pass"));
                // ResultSet에 저장된 데이터 중 index 번호로 데이터 가져오기
                dto.setName(rs.getString(3));   // name
                dto.setRegidate((rs.getString(4))); // regidate
            }
        } catch (SQLException e) {
            System.out.println(">> 데이터 베이스 사용 중 오류가 발생했습니다.");
            e.printStackTrace();
        }

        return dto;

        

    }
}

