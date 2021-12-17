package com.bk.tuanpm.webtoeic.dto;

public class ExamQuestionDTO {
    private int idExam;
    private String title;
    private int idSet;
    private String audio;
    private String content;
    private String sImage;
    private String sParagraph;
    private int idPart;
    private String partName;
    private String type;
    private int idQuestion;
    private String audiomp3;
    private String correctanswer;
    private String qImage;
    private int number;
    private String option1;
    private String option2;
    private String option3;
    private String option4;
    private String qParagraph;
    private String question;

    public ExamQuestionDTO() {
    }

    public ExamQuestionDTO(int idExam, String title, int idSet, String audio, String content, String sImage, String sParagraph, int idPart, String partName, String type, int idQuestion, String audiomp3, String correctanswer, String qImage, int number, String option1, String option2, String option3, String option4, String qParagraph, String question) {
        this.idExam = idExam;
        this.title = title;
        this.idSet = idSet;
        this.audio = audio;
        this.content = content;
        this.sImage = sImage;
        this.sParagraph = sParagraph;
        this.idPart = idPart;
        this.partName = partName;
        this.type = type;
        this.idQuestion = idQuestion;
        this.audiomp3 = audiomp3;
        this.correctanswer = correctanswer;
        this.qImage = qImage;
        this.number = number;
        this.option1 = option1;
        this.option2 = option2;
        this.option3 = option3;
        this.option4 = option4;
        this.qParagraph = qParagraph;
        this.question = question;
    }

    public int getIdExam() {
        return idExam;
    }

    public void setIdExam(int idExam) {
        this.idExam = idExam;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public int getIdSet() {
        return idSet;
    }

    public void setIdSet(int idSet) {
        this.idSet = idSet;
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

    public String getsImage() {
        return sImage;
    }

    public void setsImage(String sImage) {
        this.sImage = sImage;
    }

    public String getsParagraph() {
        return sParagraph;
    }

    public void setsParagraph(String sParagraph) {
        this.sParagraph = sParagraph;
    }

    public int getIdPart() {
        return idPart;
    }

    public void setIdPart(int idPart) {
        this.idPart = idPart;
    }

    public String getPartName() {
        return partName;
    }

    public void setPartName(String partName) {
        this.partName = partName;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public int getIdQuestion() {
        return idQuestion;
    }

    public void setIdQuestion(int idQuestion) {
        this.idQuestion = idQuestion;
    }

    public String getAudiomp3() {
        return audiomp3;
    }

    public void setAudiomp3(String audiomp3) {
        this.audiomp3 = audiomp3;
    }

    public String getCorrectanswer() {
        return correctanswer;
    }

    public void setCorrectanswer(String correctanswer) {
        this.correctanswer = correctanswer;
    }

    public String getqImage() {
        return qImage;
    }

    public void setqImage(String qImage) {
        this.qImage = qImage;
    }

    public int getNumber() {
        return number;
    }

    public void setNumber(int number) {
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

    public String getqParagraph() {
        return qParagraph;
    }

    public void setqParagraph(String qParagraph) {
        this.qParagraph = qParagraph;
    }

    public String getQuestion() {
        return question;
    }

    public void setQuestion(String question) {
        this.question = question;
    }

    @Override
    public String toString() {
        return "ExamQuestionDTO{" +
                "idExam=" + idExam +
                ", title='" + title + '\'' +
                ", idSet=" + idSet +
                ", audio='" + audio + '\'' +
                ", content='" + content + '\'' +
                ", sImage='" + sImage + '\'' +
                ", sParagraph='" + sParagraph + '\'' +
                ", idPart=" + idPart +
                ", part_name='" + partName + '\'' +
                ", type='" + type + '\'' +
                ", idQuestion=" + idQuestion +
                ", audiomp3='" + audiomp3 + '\'' +
                ", correctanswer='" + correctanswer + '\'' +
                ", qImage='" + qImage + '\'' +
                ", number=" + number +
                ", option1='" + option1 + '\'' +
                ", option2='" + option2 + '\'' +
                ", option3='" + option3 + '\'' +
                ", option4='" + option4 + '\'' +
                ", qParagraph='" + qParagraph + '\'' +
                ", question='" + question + '\'' +
                '}';
    }
}
