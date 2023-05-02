package com.bitc.jsp_board_model1;

// 데이터베이스의 board 테이블과 데이터를 주고 받기 위한 데이터를 저장하는 클래스(테이블의 컬럼과 동일한 멤버 변수)
public class BoardDto {
    private int postNum;
    private String postTitle;
    private String postContent;
    private String postWriteUser;
    private String postDate;
    private int postVisitCount;

    public int getPostNum() {
        return postNum;
    }

    public void setPostNum(int postNum) {
        this.postNum = postNum;
    }

    public String getPostTitle() {
        return postTitle;
    }

    public void setPostTitle(String postTitle) {
        this.postTitle = postTitle;
    }

    public String getPostContent() {
        return postContent;
    }

    public void setPostContent(String postContent) {
        this.postContent = postContent;
    }

    public String getPostWriteUser() {
        return postWriteUser;
    }

    public void setPostWriteUser(String postWriteUser) {
        this.postWriteUser = postWriteUser;
    }

    public String getPostDate() {
        return postDate;
    }

    public void setPostDate(String postDate) {
        this.postDate = postDate;
    }

    public int getPostVisitCount() {
        return postVisitCount;
    }

    public void setPostVisitCount(int postVisitCount) {
        this.postVisitCount = postVisitCount;
    }
}
