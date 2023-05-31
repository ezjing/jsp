package com.bitc.tastyblog.model;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class TourDAO extends Connect{
    public TourDAO() {
        super();
    }

    public List<TourDTO> selectTourList() {
        List<TourDTO> tourList = new ArrayList<>();

        String sql = "SELECT write_num, name, title, content, date, visit, ofile, sfile, account_num FROM tour_table ORDER BY write_num DESC; ";

        try {
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();

            while (rs.next()) {
                TourDTO tour = new TourDTO();

                tour.setWriteNum(rs.getInt("write_num"));  // get ()안의 내용은 sql 컬렴명 그대로 쓸 것
                tour.setName(rs.getString("name"));
                tour.setTitle(rs.getString("title"));
                tour.setContent(rs.getString("content"));
                tour.setDate(rs.getString("date"));
                tour.setVisit(rs.getInt("visit"));
                tour.setOfile(rs.getString("ofile"));
                tour.setSfile(rs.getString("sfile"));
                tour.setAccountNum(rs.getInt("account_num"));

                tourList.add(tour);
            }
        }
        catch (SQLException e) {
            System.out.println("***** 데이터 베이스에서 SELECT 중 오류가 발생했습니다. *****");
            System.out.println("***** Error: " + e.getMessage() + " *****");
            e.printStackTrace();
        }
        return tourList;
    }

    public TourDTO selectTourDetail(int num) {
        TourDTO tour = new TourDTO();

        String sql = "SELECT write_num, name, title, content, date, visit, ofile, sfile, account_num FROM tour_table WHERE write_num = ?; ";

        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, num);   // 함수의 매개변수
            rs = pstmt.executeQuery();

            while (rs.next()) {
                tour.setWriteNum(rs.getInt("write_num"));
                tour.setName(rs.getString("name"));
                tour.setTitle(rs.getString("title"));
                tour.setContent(rs.getString("content"));
                tour.setDate(rs.getString("date"));
                tour.setVisit(rs.getInt("visit"));
                tour.setOfile(rs.getString("ofile"));
                tour.setSfile(rs.getString("sfile"));
                tour.setAccountNum(rs.getInt("account_num"));
            }
        }
        catch (SQLException e) {
            System.out.println("***** 데이터베이스에 SELECT 중 오류가 발생했습니다 *****");
            System.out.println("***** Error: " + e.getMessage() + " *****");
            e.printStackTrace();
        }
        return tour;
    }

    public int insertTour(TourDTO tour) {
        int result = 0;

        String sql = "INSERT INTO tour_table (name, title, content, date, ofile, sfile, account_num) ";
        sql += "VALUES (?, ?, ?, NOW(), ?, ?, ?); ";

        try {
            pstmt = conn.prepareStatement(sql);

            pstmt.setString(1, tour.getName());
            pstmt.setString(2, tour.getTitle());
            pstmt.setString(3, tour.getContent());
            pstmt.setString(4, tour.getOfile());
            pstmt.setString(5, tour.getSfile());
            pstmt.setInt(6, tour.getAccountNum());

            result = pstmt.executeUpdate();
        }
        catch (SQLException e) {
            System.out.println("***** 데이터베이스에 INSERT 중 오류가 발생했습니다 *****");
            System.out.println("***** Error: " + e.getMessage() + " *****");
            e.printStackTrace();
        }
        return result;
    }

    public int deleteTour(int num) {
        int result = 0;

        String sql = "DELETE FROM tour_table WHERE write_num = ? ";

        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, num);

            result = pstmt.executeUpdate();
        }
        catch (SQLException e) {
            System.out.println("***** 데이터베이스에 DELETE 중 오류가 발생했습니다 *****");
            System.out.println("***** Error: " + e.getMessage() + " *****");
            e.printStackTrace();
        }
        return result;
    }

    public int updateTour(TourDTO tour) {
        int result = 0;

        String sql = "UPDATE tour_table SET title = ?, content = ?, date = NOW(), ofile = ?, sfile = ?  WHERE write_num = ?; ";
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, tour.getTitle());
            pstmt.setString(2, tour.getContent());
            pstmt.setString(3, tour.getOfile());
            pstmt.setString(4, tour.getSfile());
            pstmt.setInt(5, tour.getWriteNum());

            result = pstmt.executeUpdate();
        }
        catch (SQLException e) {
            System.out.println("***** 데이터 베이스에 UPDATE 중 오류가 발생했습니다. *****");
            System.out.println("***** Error :" + e.getMessage() +  " *****");
            e.printStackTrace();
        }
        return result;
    }

    public void updateTourVisits(int num) {
        String sql = "UPDATE tour_table SET visit = visit + 1 WHERE write_num = ? ";

        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, num);
            pstmt.executeUpdate();
        }
        catch (SQLException e) {
            System.out.println("***** 데이터 베이스에 UPDATE 중 오류가 발생했습니다. *****");
            System.out.println("***** Error :" + e.getMessage() +  " *****");
            e.printStackTrace();
        }
    }

    public int totalTourCount() {
        int result = 0;

        String sql = "SELECT count(*) AS cnt FROM tour_table ";

        try {
            stmt = conn.createStatement();
            rs = stmt.executeQuery(sql);

            while (rs.next()) {
                result = rs.getInt("cnt");
            }
        }
        catch (SQLException e) {
            System.out.println("SELECT 사용 중 오류가 발생했습니다.");
            e.printStackTrace();
        }
        return result;
    }

    public List<TourDTO> selectTourList(int startNum, int postSize) {
        // 게시물의 목록을 저장할 빈 List 선언
        List<TourDTO> dataList = new ArrayList<TourDTO>();    // 배열 크기가 어떻게 될지 몰라 배열보다 리스트가 좋음

        // 게시물 목록을 가져올 SQl 쿼리 생성
        String sql= "SELECT write_num, name, title, content, date, visit, ofile, sfile, account_num FROM tour_table ";
        sql += "ORDER BY write_num DESC ";
        sql += "LIMIT ?, ? ";

        try {
            // SQL 쿼리 명령을 위해서 Statement 객체 생성 (conn 객체를 통해서)
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, startNum);
            pstmt.setInt(2, postSize);

            // SQL 쿼리문 실행, 결과 받아오기(rs에)
            rs = pstmt.executeQuery();

            // 가져온 결과물을 하나씩 출력
            while (rs.next()) {
                // 게시물 1개의 정보를 저장할 수 있는 BoardDto 객체 생성
                TourDTO tour = new TourDTO();

                // board에 데이터 받기
                // 게시물 정보 저장
                tour.setWriteNum(rs.getInt("write_num"));  // get ()안의 내용은 sql 컬렴명 그대로 쓸 것
                tour.setName(rs.getString("name"));
                tour.setTitle(rs.getString("title"));
                tour.setContent(rs.getString("content"));
                tour.setDate(rs.getString("date"));
                tour.setVisit(rs.getInt("visit"));
                tour.setOfile(rs.getString("ofile"));
                tour.setSfile(rs.getString("sfile"));
                tour.setAccountNum(rs.getInt("account_num"));

                // board 에 데이터 받은거 dataList에 추가
                // 게시물 전체 리스트를 저장하는 dataList에 BoardDto 객체 추가
                dataList.add(tour);
            }
        }
        catch (SQLException e) {
            System.out.println("게시물 목록 조회 중 오류가 발생했습니다.");
            e.printStackTrace();
        }

        return dataList;
    }

    public ArrayList<TourDTO> getSearch(String searchField, String searchText) {
        ArrayList<TourDTO> list = new ArrayList<>();

        String sql = "SELECT * FROM tour_table WHERE " + searchField.trim();

        try {
            if (searchText != null && !searchText.equals("")) {
                sql += " LIKE '%" + searchText.trim() + "%' ORDER BY write_num DESC LIMIT 10 ";
            }
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                TourDTO tour = new TourDTO();
                tour.setWriteNum(rs.getInt(1));
                tour.setName(rs.getString(2));
                tour.setTitle(rs.getString(3));
                tour.setContent(rs.getString(4));
                tour.setDate(rs.getString(5));
                tour.setVisit(rs.getInt(6));
                tour.setOfile(rs.getString(7));
                tour.setSfile(rs.getString(8));
                tour.setAccountNum(rs.getInt(9));
                list.add(tour);
            }
        }
        catch (Exception e) {
            System.out.println("SELECT 사용 중 오류가 발생했습니다.");
            e.printStackTrace();
        }
        return list;
    }

}
