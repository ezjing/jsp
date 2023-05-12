package com.bitc.jsp_0512.dao;

import com.bitc.jsp_0512.dto.MyfileDTO;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class MyfileDAO extends JDBConnect  {
    public int insertFile(MyfileDTO dto) {
        int applyResult = 0;
        try {
            String query = "INSERT INTO myfile (name, title, cate, ofile, sfile, postdate) ";
            query += "VALUES (?, ?, ?, ?, ?, NOW()) ";

            pstmt = conn.prepareStatement(query);
            pstmt.setString(1, dto.getName());
            pstmt.setString(2, dto.getTitle());
            pstmt.setString(3, dto.getCate());
            pstmt.setString(4, dto.getOfile());
            pstmt.setString(5, dto.getSfile());

            applyResult = pstmt.executeUpdate();
        }
        catch (Exception e) {
            System.out.println("INSERT 중 에외 발생");
            e.printStackTrace();
        }
        return applyResult;
    }

    public List<MyfileDTO> myFileList() {
        List<MyfileDTO> fileList = new ArrayList<>();

        /* 파일 목록을 불러올 SQl문 */
        String query = "SELECT * FROM myfile ORDER BY idx DESC";

            try {
                pstmt = conn.prepareStatement(query);
                /* 데이터 베이스에 SQL 쿼리를 전달하여 실행하고 결과값 받아오기 */
                rs = pstmt.executeQuery();

                while (rs.next()) {
                    /* 각각의 데이터를 저장하기 위해 MyfileDTO타입의 객체 생성 */
                    MyfileDTO item = new MyfileDTO();
                    /* ResultSet에 저장된 정보를 MyfileDTO타입의 객체에 저장 */
                    item.setIdx(rs.getString("idx"));
                    item.setName(rs.getString("name"));
                    item.setTitle(rs.getString("title"));
                    item.setCate(rs.getString("cate"));
                    item.setOfile(rs.getString("ofile"));
                    item.setSfile(rs.getString("sfile"));
                    item.setPostdate(rs.getString("postdate"));

                    /* 저장된 정보를 List에 추가 */
                    fileList.add(item);
                }
            }
            catch (SQLException e) {
                System.out.println("*****SELECT 시 오류 발생*****");
            }

            /* 저장된 List를 반환 */
        return fileList;
    }
}
