package com.bk.tuanpm.webtoeic.request;

import java.util.HashMap;

public class DataExamDTO {
    private HashMap<String, String> jsonAnswerUser;
    private String timeDoExam;

    public DataExamDTO(HashMap<String, String> jsonAnswerUser, String timeDoExam) {
        this.jsonAnswerUser = jsonAnswerUser;
        this.timeDoExam = timeDoExam;
    }

    public HashMap<String, String> getJsonAnswerUser() {
        return jsonAnswerUser;
    }

    public void setJsonAnswerUser(HashMap<String, String> jsonAnswerUser) {
        this.jsonAnswerUser = jsonAnswerUser;
    }

    public String getTimeDoExam() {
        return timeDoExam;
    }

    public void setTimeDoExam(String timeDoExam) {
        this.timeDoExam = timeDoExam;
    }

    @Override
    public String toString() {
        return "DataExamDTO{" +
                "jsonAnswerListen=" + jsonAnswerUser +
                ", timeDoExam='" + timeDoExam + '\'' +
                '}';
    }
}
