package com.bitc.tastyblog.model;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CafeDAO extends Connect{
    public CafeDAO() {
        super();
    }

    public List<CafeDTO> selectCafeList() {
        List<CafeDTO> cafeList = new ArrayList<>();

        String sql = "SELECT write_num, name, title, content, date, visit, ofile, sfile, account_num FROM cafe_table ORDER BY account_num; ";

        try {
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();

            while (rs.next()) {
                CafeDTO cafe = new CafeDTO();

                cafe.setWriteNum(rs.getInt("write_num"));  // get ()안의 내용은 sql 컬렴명 그대로 쓸 것
                cafe.setName(rs.getString("name"));
                cafe.setTitle(rs.getString("title"));
                cafe.setContent(rs.getString("content"));
                cafe.setDate(rs.getString("date"));
                cafe.setVisit(rs.getInt("visit"));
                cafe.setOfile(rs.getString("ofile"));
                cafe.setSfile(rs.getString("sfile"));
                cafe.setAccountNum(rs.getInt("account_num"));

                cafeList.add(cafe);
            }
        }
        catch (SQLException e) {
            System.out.println("***** 데이터 베이스에서 SELECT 중 오류가 발생했습니다. *****");
            System.out.println("***** Error: " + e.getMessage() + " *****");
            e.printStackTrace();
        }
        return cafeList;
    }

    public CafeDTO selectCafeDetail(int num) {
        CafeDTO cafe = new CafeDTO();

        String sql = "SELECT write_num, name, title, content, date, visit, ofile, sfile, account_num FROM cafe_table WHERE write_num = ?; ";

        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, num);   // 함수의 매개변수
            rs = pstmt.executeQuery();

            while (rs.next()) {
                cafe.setWriteNum(rs.getInt("write_num"));
                cafe.setName(rs.getString("name"));
                cafe.setTitle(rs.getString("title"));
                cafe.setContent(rs.getString("content"));
                cafe.setDate(rs.getString("date"));
                cafe.setVisit(rs.getInt("visit"));
                cafe.setOfile(rs.getString("ofile"));
                cafe.setSfile(rs.getString("sfile"));
                cafe.setAccountNum(rs.getInt("account_num"));
            }
        }
        catch (SQLException e) {
            System.out.println("***** 데이터베이스에 SELECT 중 오류가 발생했습니다 *****");
            System.out.println("***** Error: " + e.getMessage() + " *****");
            e.printStackTrace();
        }
        return cafe;
    }

    public List<CafeDTO> selectCafeList(int startNum, int postSize) {
        // 게시물의 목록을 저장할 빈 List 선언
        List<CafeDTO> dataList = new ArrayList<>();    // 배열 크기가 어떻게 될지 몰라 배열보다 리스트가 좋음

        // 게시물 목록을 가져올 SQl 쿼리 생성
        String sql= "SELECT write_num, name, title, content, date, visit, ofile, sfile, account_num FROM cafe_table ";
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
                CafeDTO cafe = new CafeDTO();

                // cafe에 데이터 받기
                // 게시물 정보 저장
                cafe.setWriteNum(rs.getInt("write_num"));  // get ()안의 내용은 sql 컬렴명 그대로 쓸 것
                cafe.setName(rs.getString("name"));
                cafe.setTitle(rs.getString("title"));
                cafe.setContent(rs.getString("content"));
                cafe.setDate(rs.getString("date"));
                cafe.setVisit(rs.getInt("visit"));
                cafe.setOfile(rs.getString("ofile"));
                cafe.setSfile(rs.getString("sfile"));
                cafe.setAccountNum(rs.getInt("account_num"));

                // board 에 데이터 받은거 dataList에 추가
                // 게시물 전체 리스트를 저장하는 dataList에 BoardDto 객체 추가
                dataList.add(cafe);
            }
        }
        catch (SQLException e) {
            System.out.println("게시물 목록 조회 중 오류가 발생했습니다.");
            e.printStackTrace();
        }

        return dataList;
    }
}
























