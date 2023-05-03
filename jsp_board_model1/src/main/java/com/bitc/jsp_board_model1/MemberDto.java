package com.bitc.jsp_board_model1;

public class MemberDto {
    private String UserId;
    private String UserPw;
    private String UserName;

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
}
