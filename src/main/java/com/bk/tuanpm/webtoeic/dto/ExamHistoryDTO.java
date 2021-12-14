package com.bk.tuanpm.webtoeic.dto;

import java.time.LocalDate;
import java.time.LocalDateTime;

public class ExamHistoryDTO {
    private String title;
    private String dateTest;
    private int totalTimeTest;
    private int scoreReading;
    private int scoreListen;

    public ExamHistoryDTO() {
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDateTest() {
        return dateTest;
    }

    public void setDateTest(String dateTest) {
        this.dateTest = dateTest;
    }

    public int getTotalTimeTest() {
        return totalTimeTest;
    }

    public void setTotalTimeTest(int totalTimeTest) {
        this.totalTimeTest = totalTimeTest;
    }

    public int getScoreReading() {
        return scoreReading;
    }

    public void setScoreReading(int scoreReading) {
        this.scoreReading = scoreReading;
    }

    public int getScoreListen() {
        return scoreListen;
    }

    public void setScoreListen(int scoreListen) {
        this.scoreListen = scoreListen;
    }

    @Override
    public String toString() {
        return "ExamHistoryDTO{" +
                "title='" + title + '\'' +
                ", dateTest=" + dateTest +
                ", totalTimeTest=" + totalTimeTest +
                ", scoreReading=" + scoreReading +
                ", scoreListen=" + scoreListen +
                '}';
    }
}
