package com.bitc.tastyblog.model;

public class TourDTO {
    private int writeNum;
    private String name;
    private String title;
    private String content;
    private String date;
    private int visit;
    private String ofile;
    private String sfile;
    private int accountNum;

    public int getWriteNum() {
        return writeNum;
    }

    public void setWriteNum(int writeNum) {
        this.writeNum = writeNum;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
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

    public int getVisit() {
        return visit;
    }

    public void setVisit(int visit) {
        this.visit = visit;
    }

    public String getOfile() {
        return ofile;
    }

    public void setOfile(String ofile) {
        this.ofile = ofile;
    }

    public String getSfile() {
        return sfile;
    }

    public void setSfile(String sfile) {
        this.sfile = sfile;
    }

    public int getAccountNum() {
        return accountNum;
    }

    public void setAccountNum(int accountNum) {
        this.accountNum = accountNum;
    }
}
