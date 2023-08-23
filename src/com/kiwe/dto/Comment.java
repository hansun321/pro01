package com.kiwe.dto;

public class Comment {
    private int cno;
    private int qno;
    private String author;
    private String resdate;
    private String content;

    public int getCno() {
        return cno;
    }

    public void setCno(int cno) {
        this.cno = cno;
    }

    public int getQno() {
        return qno;
    }

    public void setQno(int qno) {
        this.qno = qno;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public String getResdate() {
        return resdate;
    }

    public void setResdate(String resdate) {
        this.resdate = resdate;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    @Override
    public String toString() {
        return "Comment{" +
                "cno=" + cno +
                ", qno=" + qno +
                ", author='" + author + '\'' +
                ", resdate='" + resdate + '\'' +
                ", content='" + content + '\'' +
                '}';
    }
}
