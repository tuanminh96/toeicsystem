package com.bk.tuanpm.webtoeic.dto;

public class ExamHistoryDTO {
    private String title;
    private String dateTest;
    private String totalTimeTest;
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

    public String getTotalTimeTest() {
        return totalTimeTest;
    }

    public void setTotalTimeTest(String totalTimeTest) {
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
