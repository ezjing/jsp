package com.bitc.tastyblog.model;

public class VisitlogDTO {
    private int visitlogNum;
    private String content;
    private String date;
    private String nick;
    private int accountNum;

    public int getVisitlogNum() {
        return visitlogNum;
    }

    public void setVisitlogNum(int visitlogNum) {
        this.visitlogNum = visitlogNum;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getNick() {
        return nick;
    }

    public void setNick(String nick) {
        this.nick = nick;
    }

    public int getAccountNum() {
        return accountNum;
    }

    public void setAccountNum(int accountNum) {
        this.accountNum = accountNum;
    }
}
