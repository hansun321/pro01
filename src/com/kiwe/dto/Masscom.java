package com.kiwe.dto;

public class Masscom {
    private int mno;
    private String title;
    private String link;
    private String resdate;

    public int getMno() {
        return mno;
    }

    public void setMno(int mno) {
        this.mno = mno;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getLink() {
        return link;
    }

    public void setLink(String link) {
        this.link = link;
    }

    public String getResdate() {
        return resdate;
    }

    public void setResdate(String resdate) {
        this.resdate = resdate;
    }
    @Override
    public String toString() {
        return "Masscom{" +
                "mno=" + mno +
                ", title='" + title + '\'' +
                ", link='" + link + '\'' +
                ", resdate='" + resdate + '\'' +
                '}';
    }
}
