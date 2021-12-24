package com.bk.tuanpm.webtoeic.dto;

public class ExamUploadDTO {
    private String audio;
    private String content;
    private String image;
    private String paragraph;
    private String totalQuest;
    private String idPart;
    private String correctAnswer;
    private String number;
    private String option1;
    private String option2;
    private String option3;
    private String option4;
    private String question;
    private String explain;

    public ExamUploadDTO() {
    }

    public ExamUploadDTO(String audio, String content, String image, String paragraph, String totalQuest, String idPart, String correctAnswer, String number, String option1, String option2, String option3, String option4, String question, String explain) {
        this.audio = audio;
        this.content = content;
        this.image = image;
        this.paragraph = paragraph;
        this.totalQuest = totalQuest;
        this.idPart = idPart;
        this.correctAnswer = correctAnswer;
        this.number = number;
        this.option1 = option1;
        this.option2 = option2;
        this.option3 = option3;
        this.option4 = option4;
        this.question = question;
        this.explain = explain;
    }

    public String getAudio() {
        return audio;
    }

    public void setAudio(String audio) {
        this.audio = audio;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getParagraph() {
        return paragraph;
    }

    public void setParagraph(String paragraph) {
        this.paragraph = paragraph;
    }

    public String getTotalQuest() {
        return totalQuest;
    }

    public void setTotalQuest(String totalQuest) {
        this.totalQuest = totalQuest;
    }

    public String getIdPart() {
        return idPart;
    }

    public void setIdPart(String idPart) {
        this.idPart = idPart;
    }

    public String getCorrectAnswer() {
        return correctAnswer;
    }

    public void setCorrectAnswer(String correctAnswer) {
        this.correctAnswer = correctAnswer;
    }

    public String getNumber() {
        return number;
    }

    public void setNumber(String number) {
        this.number = number;
    }

    public String getOption1() {
        return option1;
    }

    public void setOption1(String option1) {
        this.option1 = option1;
    }

    public String getOption2() {
        return option2;
    }

    public void setOption2(String option2) {
        this.option2 = option2;
    }

    public String getOption3() {
        return option3;
    }

    public void setOption3(String option3) {
        this.option3 = option3;
    }

    public String getOption4() {
        return option4;
    }

    public void setOption4(String option4) {
        this.option4 = option4;
    }

    public String getQuestion() {
        return question;
    }

    public void setQuestion(String question) {
        this.question = question;
    }

    public String getExplain() {
        return explain;
    }

    public void setExplain(String explain) {
        this.explain = explain;
    }

    @Override
    public String toString() {
        return "ExamUploadDTO{" +
                "audio='" + audio + '\'' +
                ", content='" + content + '\'' +
                ", image='" + image + '\'' +
                ", paragraph='" + paragraph + '\'' +
                ", totalQuest='" + totalQuest + '\'' +
                ", idPart='" + idPart + '\'' +
                ", correctAnswer='" + correctAnswer + '\'' +
                ", number='" + number + '\'' +
                ", option1='" + option1 + '\'' +
                ", option2='" + option2 + '\'' +
                ", option3='" + option3 + '\'' +
                ", option4='" + option4 + '\'' +
                ", question='" + question + '\'' +
                ", explain='" + explain + '\'' +
                '}';
    }
}
