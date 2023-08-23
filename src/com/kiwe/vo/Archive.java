package com.kiwe.vo;

public class Archive {
    private int no;
    private String title;
    private String resdate;
    private String attach;

    public int getNo() {
        return no;
    }

    public void setNo(int no) {
        this.no = no;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getResdate() {
        return resdate;
    }

    public void setResdate(String resdate) {
        this.resdate = resdate;
    }

    public String getAttach() {
        return attach;
    }

    public void setAttach(String attach) {
        this.attach = attach;
    }

    @Override
    public String toString() {
        return "Archive{" +
                "no=" + no +
                ", title='" + title + '\'' +
                ", resdate='" + resdate + '\'' +
                ", attach='" + attach + '\'' +
                '}';
    }
}
