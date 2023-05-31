package com.bitc.tastyblog.model;

import java.sql.SQLException;

public class AccountDAO extends Connect {
    // 로그인 한 계정 정보 들고오는 메소드
    public AccountDTO selectUser(String id, String pw) {
        AccountDTO account = new AccountDTO();

        String sql = "SELECT account_num, id, pw, name, nick FROM account_table WHERE id = ? AND pw = ?; ";

        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, id);
            pstmt.setString(2, pw);

            rs = pstmt.executeQuery();

            while (rs.next()) {
                account.setAccountNum(rs.getInt("account_num"));
                account.setId(rs.getString("id"));
                account.setPw(rs.getString("pw"));
                account.setName(rs.getString("name"));
                account.setNick(rs.getString("nick"));
            }
        }
        catch (SQLException e) {
            System.out.println("***** 데이터베이스에 SELECT 중 오류가 발생했습니다 *****");
            System.out.println("***** Error: " + e.getMessage() + " *****");
            e.printStackTrace();
        }
        return account;
    }


    public boolean equalsPassword(String id, String pw) {
        boolean result = false;

        String sql = "SELECT count(*) AS cnt FROM account_table WHERE id = ? AND pw = ? ";

        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, id);
            pstmt.setString(2, pw);

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

    public int insertAccount(AccountDTO account) {
        int result = 0;

        String sql = "INSERT INTO account_table (id, pw, name, nick) " ;
        sql += "VALUES ";
        sql += "(?, ?, ?, ?); ";

        try {
            pstmt = conn.prepareStatement(sql);

            pstmt.setString(1, account.getId());
            pstmt.setString(2, account.getPw());
            pstmt.setString(3, account.getName());
            pstmt.setString(4, account.getNick());

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
