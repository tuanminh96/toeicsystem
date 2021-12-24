package com.bk.tuanpm.webtoeic.dto;

public class ExamQuestionDTO {
    private Integer idExam;
    private String title;
    private Integer idSet;
    private String audio;
    private String content;
    private String sImage;
    private String sParagraph;
    private Integer idPart;
    private String partName;
    private String type;
    private Integer idQuestion;
    private String audioMp3;
    private String correctAnswer;
    private String qImage;
    private Integer number;
    private String option1;
    private String option2;
    private String option3;
    private String option4;
    private String qParagraph;
    private String question;
    private Integer idExplainDetail;
    private String explain;
    private String userAnswer;
    private String description;


    public ExamQuestionDTO() {
    }

    public ExamQuestionDTO(Integer idExam, String title, Integer idSet, String audio, String content, String sImage, String sParagraph, Integer idPart, String partName, String type, Integer idQuestion, String audioMp3, String correctAnswer, String qImage, Integer number, String option1, String option2, String option3, String option4, String qParagraph, String question, Integer idExplainDetail, String explain, String userAnswer, String description) {
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
        this.audioMp3 = audioMp3;
        this.correctAnswer = correctAnswer;
        this.qImage = qImage;
        this.number = number;
        this.option1 = option1;
        this.option2 = option2;
        this.option3 = option3;
        this.option4 = option4;
        this.qParagraph = qParagraph;
        this.question = question;
        this.idExplainDetail = idExplainDetail;
        this.explain = explain;
        this.userAnswer = userAnswer;
        this.description = description;
    }

    public Integer getIdExam() {
        return idExam;
    }

    public void setIdExam(Integer idExam) {
        this.idExam = idExam;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public Integer getIdSet() {
        return idSet;
    }

    public void setIdSet(Integer idSet) {
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

    public Integer getIdPart() {
        return idPart;
    }

    public void setIdPart(Integer idPart) {
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

    public Integer getIdQuestion() {
        return idQuestion;
    }

    public void setIdQuestion(Integer idQuestion) {
        this.idQuestion = idQuestion;
    }

    public String getAudioMp3() {
        return audioMp3;
    }

    public void setAudioMp3(String audioMp3) {
        this.audioMp3 = audioMp3;
    }

    public String getCorrectAnswer() {
        return correctAnswer;
    }

    public void setCorrectAnswer(String correctAnswer) {
        this.correctAnswer = correctAnswer;
    }

    public String getqImage() {
        return qImage;
    }

    public void setqImage(String qImage) {
        this.qImage = qImage;
    }

    public Integer getNumber() {
        return number;
    }

    public void setNumber(Integer number) {
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

    public Integer getIdExplainDetail() {
        return idExplainDetail;
    }

    public void setIdExplainDetail(Integer idExplainDetail) {
        this.idExplainDetail = idExplainDetail;
    }

    public String getExplain() {
        return explain;
    }

    public void setExplain(String explain) {
        this.explain = explain;
    }

    public String getUserAnswer() {
        return userAnswer;
    }

    public void setUserAnswer(String userAnswer) {
        this.userAnswer = userAnswer;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
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
                ", partName='" + partName + '\'' +
                ", type='" + type + '\'' +
                ", idQuestion=" + idQuestion +
                ", audioMp3='" + audioMp3 + '\'' +
                ", correctAnswer='" + correctAnswer + '\'' +
                ", qImage='" + qImage + '\'' +
                ", number=" + number +
                ", option1='" + option1 + '\'' +
                ", option2='" + option2 + '\'' +
                ", option3='" + option3 + '\'' +
                ", option4='" + option4 + '\'' +
                ", qParagraph='" + qParagraph + '\'' +
                ", question='" + question + '\'' +
                ", idExplainDetail=" + idExplainDetail +
                ", explain='" + explain + '\'' +
                ", userAnswer='" + userAnswer + '\'' +
                ", description='" + description + '\'' +
                '}';
    }
}
