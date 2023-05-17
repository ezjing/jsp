package com.bitc.jsp_0517.database;

public class MemberDto {
    private String UserId;
    private String UserPw;
    private String UserName;
    private int userGrade;

    public String getUserId() {
        return UserId;
    }

    public void setUserId(String userId) {
        UserId = userId;
    }

    public String getUserPw() {
        return UserPw;
    }

    public void setUserPw(String userPw) {
        UserPw = userPw;
    }

    public String getUserName() {
        return UserName;
    }

    public void setUserName(String userName) {
        UserName = userName;
    }

    public int getUserGrade() {
        return userGrade;
    }

    public void setUserGrade(int userGrade) {
        this.userGrade = userGrade;
    }
}
