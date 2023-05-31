package com.bitc.tastyblog.model;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class VisitlogDAO extends Connect {
    public List<VisitlogDTO> selectVisitlogList() {
        List<VisitlogDTO> visitlogList = new ArrayList<>();

        String sql = "SELECT visitlog_num, content, date, nick, account_num FROM visitlog_table ORDER BY visitlog_num DESC; ";

        try {
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();

            while (rs.next()) {
                VisitlogDTO visitlog = new VisitlogDTO();

                visitlog.setVisitlogNum(rs.getInt("visitlog_num"));  // get ()안의 내용은 sql 컬렴명 그대로 쓸 것
                visitlog.setContent(rs.getString("content"));
                visitlog.setDate(rs.getString("date"));
                visitlog.setNick(rs.getString("nick"));
                visitlog.setAccountNum(rs.getInt("account_num"));

                visitlogList.add(visitlog);
            }
        }
        catch (SQLException e) {
            System.out.println("***** 데이터 베이스에서 SELECT 중 오류가 발생했습니다. *****");
            System.out.println("***** Error: " + e.getMessage() + " *****");
            e.printStackTrace();
        }
        return visitlogList;
    }

    public int insertVisitlog(VisitlogDTO visitlog) {
        int result = 0;

        String sql = "INSERT INTO visitlog_table (content, date, nick, account_num) ";
        sql += "VALUES (?, NOW(), ?, ?); ";

        try {
            pstmt = conn.prepareStatement(sql);

            pstmt.setString(1, visitlog.getContent());
            pstmt.setString(2, visitlog.getNick());
            pstmt.setInt(3, visitlog.getAccountNum());

            result = pstmt.executeUpdate();
        }
        catch (SQLException e) {
            System.out.println("***** 데이터베이스에 INSERT 중 오류가 발생했습니다 *****");
            System.out.println("***** Error: " + e.getMessage() + " *****");
            e.printStackTrace();
        }
        return result;
    }
}
