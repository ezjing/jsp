package com.bitc.jsp_mvcboard.model;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class MVCBoardDAO extends JDBConnect {
    // 기본생성자는 자동으로 생성되며 상속받은 경우는 super로 상속받은 클래스 받아옴
    public MVCBoardDAO() {
        super();
    }

    // 전체 게시물 목록 가져오기
    public List<MVCBoardDTO> selectBoardList() {
        List<MVCBoardDTO> boardList = new ArrayList<>();

        String sql = "SELECT post_idx, post_title, post_writer, post_visits, post_date, post_ofile ";
        sql += "FROM mvcboard ";
        sql += "ORDER BY post_idx DESC;";

        try {
            pstmt = conn.prepareStatement(sql); // 쿼리문을 데이터베이스에 전달
            rs = pstmt.executeQuery();  // 쿼리 실행시킨결과 rs에 저장 (select 문이라 위에 위치)

            while (rs.next()) {
                MVCBoardDTO board = new MVCBoardDTO();

                board.setPostIdx(rs.getInt("post_idx"));
                board.setPostTitle(rs.getString("post_title"));
                board.setPostWriter(rs.getString("post_writer"));
                board.setPostVisits(rs.getInt("post_visits"));
                board.setPostDate(rs.getString("post_date"));
                board.setPostOfile(rs.getString("post_ofile"));

                boardList.add(board);
            }
        }
        catch (SQLException e) {
            System.out.println("***** 데이터 베이스에서 SELECT 중 오류가 발생했습니다. *****");
            System.out.println("***** Error: " + e.getMessage() + " *****");
            e.printStackTrace();
        }
        return boardList;
    }

    // 데이터 베이스에 글 등록하기
    public int insertBoard(MVCBoardDTO board) {
        int result = 0;

        String sql = "INSERT INTO mvcboard ";
        sql += "(post_writer, post_title, post_content, post_pass, post_date, post_ofile, post_sfile) ";
        sql += "VALUES  ";
        sql += "(?, ?, ?, ?, NOW(), ?, ?) ";

        try {
            pstmt = conn.prepareStatement(sql); // 쿼리문을 데이터베이스에 전달

            pstmt.setString(1, board.getPostWriter());
            pstmt.setString(2, board.getPostTitle());
            pstmt.setString(3, board.getPostContent());
            pstmt.setString(4, board.getPostPass());
            pstmt.setString(5, board.getPostOfile());
            pstmt.setString(6, board.getPostSfile());

            result = pstmt.executeUpdate(); // 쿼리 실행시킨결과 result에 저장(insert 문이라 아래에 위치)
        }
        catch (SQLException e) {
            System.out.println("***** 데이터베이스에 INSERT 중 오류가 발생했습니다 *****");
            System.out.println("***** Error: " + e.getMessage() + " *****");
            e.printStackTrace();
        }

        return result;  // 업데이트 성공 시 1 출력
    }

    // 게시물 상세 정보 가져오기
    public MVCBoardDTO selectBoardDetail(int idx) {
        MVCBoardDTO board = new MVCBoardDTO();

        String sql = "SELECT post_idx, post_title, post_content, post_writer, post_date, post_ofile, post_visits, post_dn_count ";
        sql += "FROM mvcboard ";
        sql += "WHERE post_idx = ? ";

        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, idx);
            rs = pstmt.executeQuery();

            while (rs.next()) { // 어차피 데이터 하나만 들고올거라 반복문도 딱히 필요 없음
                board.setPostIdx(rs.getInt("post_idx"));
                board.setPostTitle(rs.getString("post_title"));
                board.setPostContent(rs.getString("post_content"));
                board.setPostWriter(rs.getString("post_writer"));
                board.setPostDate(rs.getString("post_date"));
                board.setPostOfile(rs.getString("post_ofile"));
                board.setPostVisits(rs.getInt("post_visits"));
                board.setPostDnCount(rs.getInt("post_dn_count"));
            }
        }
        catch (SQLException e) {
            System.out.println("***** 데이터베이스에 SELECT 중 오류가 발생했습니다 *****");
            System.out.println("***** Error: " + e.getMessage() + " *****");
            e.printStackTrace();
        }


        return board;
    }

    public boolean equalsPassword(int postIdx, String postPass) {
        boolean result = false;

        String sql = "SELECT count(*) AS cnt ";
        sql += "FROM mvcboard ";
        sql += "WHERE post_idx = ? ";
        sql += "AND post_pass = ? ";

        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, postIdx);
            pstmt.setString(2, postPass);

            rs = pstmt.executeQuery();

            while(rs.next()) {
                if (rs.getInt("cnt") == 1) {
                    result = true;
                }
            }
        }
        catch (SQLException e) {
            System.out.println("***** 데이터베이스에 DELETE 중 오류가 발생했습니다 *****");
            System.out.println("***** Error: " + e.getMessage() + " *****");
            e.printStackTrace();
        }


        return result;
    }

    public int deleteBoard(int postIdx) {
        int result = 0;

        String sql = "DELETE FROM mvcboard WHERE post_idx = ? ";

        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, postIdx);

            result = pstmt.executeUpdate();
        }
        catch (SQLException e) {
            System.out.println("***** 데이터베이스에 DELETE 중 오류가 발생했습니다 *****");
            System.out.println("***** Error: " + e.getMessage() + " *****");
            e.printStackTrace();
        }

        return result;
    }
}
