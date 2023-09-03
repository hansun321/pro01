package com.kiwe.dto;

public class Faq {
    private int fno;
    private String question;
    private String answer;

    public int getFno() {
        return fno;
    }

    public void setFno(int fno) {
        this.fno = fno;
    }

    public String getQuestion() {
        return question;
    }

    public void setQuestion(String question) {
        this.question = question;
    }

    public String getAnswer() {
        return answer;
    }

    public void setAnswer(String answer) {
        this.answer = answer;
    }

    @Override
    public String toString() {
        return "Faq{" +
                "fno=" + fno +
                ", question='" + question + '\'' +
                ", answer='" + answer + '\'' +
                '}';
    }
}
