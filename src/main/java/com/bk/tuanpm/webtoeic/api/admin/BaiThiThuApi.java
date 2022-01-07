package com.bk.tuanpm.webtoeic.api.admin;

import java.io.File;
import java.io.FileInputStream;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.sql.Date;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.List;
import javax.servlet.http.HttpServletRequest;

import com.bk.tuanpm.webtoeic.common.CommonConst;
import com.bk.tuanpm.webtoeic.entities.*;
import com.bk.tuanpm.webtoeic.service.*;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.bk.tuanpm.webtoeic.repository.PartRepository;
import com.bk.tuanpm.webtoeic.service.impl.UserAdminServiceImpl;

@RestController
@RequestMapping("/api/admin/exam")
public class BaiThiThuApi {

    private final HttpServletRequest request;

    public final BaiThiThuService baithithuService;

    public final SetQuestionService setQuestionService;

    public final QuestionService questionService;

    public final ExplainDetailService explainDetailService;

    public final PartService partService;

    public final PartRepository partRepository;

    final UserAdminServiceImpl userAdminService;

    public BaiThiThuApi(HttpServletRequest request, BaiThiThuService baithithuService, SetQuestionService setQuestionService, QuestionService questionService, ExplainDetailService explainDetailService, PartService partService, PartRepository partRepository, UserAdminServiceImpl userAdminService) {
        this.request = request;
        this.baithithuService = baithithuService;
        this.setQuestionService = setQuestionService;
        this.questionService = questionService;
        this.explainDetailService = explainDetailService;
        this.partService = partService;
        this.partRepository = partRepository;
        this.userAdminService = userAdminService;
    }

    @GetMapping("/loadExam")
    public List<String> showAllExam() {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        Account account = userAdminService.findByEmail(auth.getName());
        String roleAccount = account.getRole().getRole();
        List<String> response = new ArrayList<String>();
        List<Exam> list = new ArrayList<>();
        Collection<String> listStatus = new ArrayList<>();
        if (CommonConst.ROLE_CONTENT.equals(roleAccount)) {
            listStatus.add(CommonConst.CREATE);
            listStatus.add(CommonConst.REJECT);
        } else if (CommonConst.ROLE_TUTORIAL.equals(roleAccount)) {
            listStatus.add(CommonConst.APPROVE);
        } else {
            return response;
        }

        list = baithithuService.getAllExamSubmited(listStatus);

        for (int i = 0; i < list.size(); i++) {
            String json = "baithithuid:" + list.get(i).getBaithithuid() + "," + "anhbaithithu:"
                    + list.get(i).getAnhbaithithu() + "," + "tenbaithithu:" + list.get(i).getTenbaithithu();
            response.add(json);
        }
        return response;
    }

    @GetMapping("/loadExamApprove")
    public List<String> showListExamApprove() {
        List<String> response = new ArrayList<String>();
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        TutorialAdmin currentUser = userAdminService.findTutorialAdminByEmail(auth.getName());
        String roleAccount = currentUser.getRole().getRole();

        List<Exam> list = new ArrayList<>();
        Collection<String> listStatus = new ArrayList<>();
        if (CommonConst.ROLE_TUTORIAL.equals(roleAccount)) {
            listStatus.add(CommonConst.CREATE);
        } else {
            return response;
        }
        list = baithithuService.getAllExamSubmited(listStatus);

        for (int i = 0; i < list.size(); i++) {
            String json = "baithithuid:" + list.get(i).getBaithithuid() + "," + "anhbaithithu:"
                    + list.get(i).getAnhbaithithu() + "," + "tenbaithithu:" + list.get(i).getTenbaithithu();
            response.add(json);
        }
        return response;
    }

    @RequestMapping(value = "/approve/{examId}")
    public String approveExam(@PathVariable("examId") int examId) {
        List<Exam> listExam = baithithuService.getBaiThiThu(Integer.valueOf(examId));
        baithithuService.approveExam(listExam.get(0));
        return "success";
    }

    @RequestMapping(value = "/reject/{examId}")
    public String rejectExam(@PathVariable("examId") int examId) {
        List<Exam> listExam = baithithuService.getBaiThiThu(Integer.valueOf(examId));
        baithithuService.rejectExam(listExam.get(0));
        return "success";
    }

    @RequestMapping(value = "/delete/{idBaiThiThu}")
    public String deleteById(@PathVariable("idBaiThiThu") int id) {
        baithithuService.delete(id);
        return "success";
    }

    @PostMapping(value = "/save", consumes = "multipart/form-data")
    @ResponseBody
    public List<String> addBaiThiThu(
            @RequestParam("examTitle") String examTitle,
            @RequestParam("examLevel") String examLevel,
            @RequestParam("examDescription") String examDescription,
            @RequestParam("fileThumbnail") MultipartFile fileThumbnail,
            @RequestParam("fileQuestionExcel") MultipartFile fileQuestionExcel,
            @RequestParam("fileQuestionImageLst") MultipartFile[] fileQuestionImageLst,
            @RequestParam("fileQuestionAudioLst") MultipartFile[] fileQuestionAudioLst) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        ContentAdmin currentUser = userAdminService.findContentAdminByEmail(auth.getName());

        List<String> response = new ArrayList<String>();
        String rootDirectory = request.getSession().getServletContext().getRealPath("/");
        // Query vao DB lay ra exam.
        // Save data to table EXAM
        Exam exam = new Exam();
        exam.setTenbaithithu(examTitle);
        exam.setLevel(examLevel);
        exam.setDescription(examDescription);
        exam.setAnhbaithithu(fileThumbnail.getOriginalFilename());
        exam.setUserAdd(currentUser);
        exam.setDateAdd(Date.valueOf(LocalDate.now()));
        exam.setUpdateDate(Date.valueOf(LocalDate.now()));
        exam.setUpdateBy(currentUser.getUsername());
        exam.setIsActive(CommonConst.CREATE);
        exam.setDelFlg(CommonConst.FLG_ON);
        baithithuService.save(exam);

        System.out.println("id=" + exam.getBaithithuid());
        try {
            // Save file upload to local folder
            File folderImages = new File(rootDirectory + "/resources/file/exams/" + exam.getBaithithuid() + "/images");
            if (!folderImages.exists()) {
                folderImages.mkdirs();
            }
            File folderExcel = new File(rootDirectory + "/resources/file/exams/" + exam.getBaithithuid() + "/excel");
            if (!folderExcel.exists()) {
                folderExcel.mkdirs();
            }
            File folderAudio = new File(rootDirectory + "/resources/file/exams/" + exam.getBaithithuid() + "/audio");
            if (!folderAudio.exists()) {
                folderAudio.mkdirs();
            }

            Path pathExcel = Paths.get(rootDirectory + "/resources/file/exams/" + exam.getBaithithuid() + "/excel/" + fileQuestionExcel.getOriginalFilename());
            fileQuestionExcel.transferTo(new File(pathExcel.toString()));

            Path pathImages = Paths.get(rootDirectory + "/resources/file/exams/" + exam.getBaithithuid() + "/images/" + fileThumbnail.getOriginalFilename());
            fileThumbnail.transferTo(new File(pathImages.toString()));

            for (MultipartFile questionImage : fileQuestionImageLst) {
                Path pathImageQuestion = Paths.get(rootDirectory + "/resources/file/exams/" + exam.getBaithithuid() + "/images/" + questionImage.getOriginalFilename());
                questionImage.transferTo(new File(pathImageQuestion.toString()));
            }

            for (MultipartFile questionAudio : fileQuestionAudioLst) {
                Path pathListening = Paths.get(rootDirectory + "/resources/file/exams/" + exam.getBaithithuid() + "/audio/" + questionAudio.getOriginalFilename());
                questionAudio.transferTo(new File(pathListening.toString()));
            }

            // Save data from file excel to database
            insertDataFromExcelToDatabase(pathExcel.toString(), exam, partService);

        } catch (Exception e) {
            response.add(e.toString());
            System.out.println("ErrorReadFileExcel:" + e);
        }

        return response;
    }

//    @PostMapping(value = "/update")
//    @ResponseBody
//    public List<String> updateBaiGrammar(@RequestParam("idExam") int id, @RequestParam("name") String name,
//                                         @RequestParam("file_image") MultipartFile file_image,
//                                         @RequestParam("file_image_question") MultipartFile[] file_image_question,
//                                         @RequestParam("file_listening") MultipartFile[] file_listening,
//                                         @RequestParam("file_excel") MultipartFile file_excel) {
//
//        List<String> response = new ArrayList<String>();
//        String rootDirectory = request.getSession().getServletContext().getRealPath("/");
//        Exam baithithu = baithithuService.getBaiThiThu(id).get(0);
//        try {
//            // save file upload to local folder
//            Path pathExcel = Paths.get(rootDirectory + "/resources/file/excel/" + "exam." + baithithu.getBaithithuid()
//                    + "." + file_excel.getOriginalFilename());
//            file_excel.transferTo(new File(pathExcel.toString()));
//
//            Path pathImage = Paths.get(rootDirectory + "/resources/file/images/exam/" + "" + baithithu.getBaithithuid()
//                    + "." + file_image.getOriginalFilename());
//            file_image.transferTo(new File(pathImage.toString()));
//
//            for (MultipartFile single_image : file_image_question) {
//                Path pathImageQuestion = Paths.get(rootDirectory + "/resources/file/images/exam/" + ""
//                        + baithithu.getBaithithuid() + "." + single_image.getOriginalFilename());
//                single_image.transferTo(new File(pathImageQuestion.toString()));
//            }
//
//            for (MultipartFile single_listening : file_listening) {
//                Path pathListening = Paths.get(rootDirectory + "/resources/file/audio/exam/" + ""
//                        + baithithu.getBaithithuid() + "." + single_listening.getOriginalFilename());
//                single_listening.transferTo(new File(pathListening.toString()));
//            }
//
//            baithithu.setTenbaithithu(name);
//            baithithu.setAnhbaithithu(baithithu.getBaithithuid() + "." + file_image.getOriginalFilename());
//            baithithuService.save(baithithu);
//
//            BaiThiThuApi btt = new BaiThiThuApi();
//            List<Question> listCauHoiFull = btt.getListFromExcel(pathExcel.toString(), baithithu, partService);
//
//            for (int i = 0; i < listCauHoiFull.size(); i++) {
//                questionService.save(listCauHoiFull.get(i));
//            }
//
//        } catch (Exception e) {
//            response.add(e.toString());
//            System.out.println("errorUpdate:" + e);
//        }
//
//        return response;
//    }

    // get info Exam ->edit Exam
    @RequestMapping(value = "/infoExam/{idBaiThiThu}")
    public String infoGrammarById(@PathVariable("idBaiThiThu") int id) {
        Exam baiexam = baithithuService.getBaiThiThu(id).get(0);
        return baiexam.getTenbaithithu();
    }

    public void insertDataFromExcelToDatabase(String pathFileExcel, Exam exam, PartService partService) {
        try {
            FileInputStream excelFile = new FileInputStream(new File(pathFileExcel));
            XSSFWorkbook workbook = new XSSFWorkbook(excelFile);
            XSSFSheet worksheet = workbook.getSheetAt(0);

            SetQuestion setQuestionStored = new SetQuestion();

            for (int i = 1; i < worksheet.getPhysicalNumberOfRows(); i++) {
                SetQuestion setQuestion = new SetQuestion();
                Question question = new Question();
                ExplainDetail explainDetail = new ExplainDetail();
                PartToeic partToeic = new PartToeic();

                XSSFRow row = worksheet.getRow(i);
                if (row.getCell(6) != null)
                    partToeic = partService.getPartByName(row.getCell(6).getStringCellValue());
                else {
                    throw new Exception("Part Name have not NULL.");
                }

                int finalI = i;
                Boolean isAddSetQuestion = Arrays.stream(CommonConst.LIST_ROW_NUMBER_SET_QUESTION).anyMatch(x -> x == finalI);
                if (isAddSetQuestion) {
                    setQuestion.setExam(exam);
                    setQuestion.setUpdateDate(Date.valueOf(LocalDate.now()));
                    if (row.getCell(1) != null)
                        setQuestion.setAudio(row.getCell(1).getStringCellValue());
                    if (row.getCell(2) != null)
                        setQuestion.setContent(row.getCell(2).getStringCellValue());
                    if (row.getCell(3) != null)
                        setQuestion.setImage(row.getCell(3).getStringCellValue());
                    if (row.getCell(4) != null)
                        setQuestion.setParagraph(row.getCell(4).getStringCellValue());
                    //if (row.getCell(5) != null)
                    // setQuestion.setTotalQuestion(row.getCell(5).getStringCellValue());
                    if (row.getCell(6) != null)
                        setQuestion.setPartToeic(partToeic);
                    setQuestionService.save(setQuestion);
                    setQuestionStored = setQuestion;
                }

                if (row.getCell(7) != null)
                    question.setCorrectanswer(row.getCell(7).getStringCellValue());
                if (row.getCell(8) != null)
                    question.setNumber((int) row.getCell(8).getNumericCellValue());

                if (row.getCell(9) != null && row.getCell(9).getCellType() == row.getCell(9).CELL_TYPE_STRING)
                    question.setOption1(row.getCell(9).getStringCellValue().toString());
                if (row.getCell(9) != null && row.getCell(9).getCellType() == row.getCell(9).CELL_TYPE_NUMERIC)
                    question.setOption1(String.valueOf(row.getCell(9).getNumericCellValue()));

                if (row.getCell(10) != null && row.getCell(10).getCellType() == row.getCell(10).CELL_TYPE_STRING)
                    question.setOption2(row.getCell(10).getStringCellValue().toString());
                if (row.getCell(10) != null && row.getCell(10).getCellType() == row.getCell(10).CELL_TYPE_NUMERIC)
                    question.setOption2(String.valueOf(row.getCell(10).getNumericCellValue()));

                if (row.getCell(11) != null && row.getCell(11).getCellType() == row.getCell(11).CELL_TYPE_STRING)
                    question.setOption3(row.getCell(11).getStringCellValue().toString());
                if (row.getCell(11) != null && row.getCell(11).getCellType() == row.getCell(11).CELL_TYPE_NUMERIC)
                    question.setOption3(String.valueOf(row.getCell(11).getNumericCellValue()));

                if (row.getCell(12) != null && row.getCell(12).getCellType() == row.getCell(12).CELL_TYPE_STRING)
                    question.setOption4(row.getCell(12).getStringCellValue().toString());
                if (row.getCell(12) != null && row.getCell(12).getCellType() == row.getCell(12).CELL_TYPE_NUMERIC)
                    question.setOption4(String.valueOf(row.getCell(12).getNumericCellValue()));

                if (row.getCell(13) != null)
                    question.setQuestion(row.getCell(13).getStringCellValue());

                question.setBaithithu(exam);
                question.setPartToeic(partToeic);
                question.setSetQuestion(setQuestionStored);
                question.setUpdateDate(Date.valueOf(LocalDate.now()));
                questionService.save(question);

                if (row.getCell(14) != null)
                    explainDetail.setExplain(row.getCell(14).getStringCellValue());

                explainDetail.setQuestion(question);
                explainDetail.setUpdateDate(Date.valueOf(LocalDate.now()));
                explainDetailService.save(explainDetail);
            }
        } catch (Exception e) {
            System.out.println("Error_BaiThiThuApi:" + e);
        }
    }

    public List<Question> getListFromExcel(String pathFileExcel, Exam exam, PartService partService) {
        List<SetQuestion> setQuestionLst = new ArrayList<>();
        List<Question> questionLst = new ArrayList<>();

        try {
            FileInputStream excelFile = new FileInputStream(new File(pathFileExcel));
            XSSFWorkbook workbook = new XSSFWorkbook(excelFile);
            XSSFSheet worksheet = workbook.getSheetAt(0);
            for (int i = 1; i < worksheet.getPhysicalNumberOfRows(); i++) {
                Question question = new Question();
                XSSFRow row = worksheet.getRow(i);

                if (row.getCell(0) != null)
                    question.setNumber((int) row.getCell(0).getNumericCellValue());

                if (row.getCell(4) != null)
                    question.setQuestion(row.getCell(4).getStringCellValue().toString());

                if (row.getCell(5) != null && row.getCell(5).getCellType() == row.getCell(5).CELL_TYPE_STRING)
                    question.setOption1(row.getCell(5).getStringCellValue().toString());
                if (row.getCell(5) != null && row.getCell(5).getCellType() == row.getCell(5).CELL_TYPE_NUMERIC)
                    question.setOption1(String.valueOf(row.getCell(5).getNumericCellValue()));

                if (row.getCell(6) != null && row.getCell(6).getCellType() == row.getCell(6).CELL_TYPE_STRING)
                    question.setOption2(row.getCell(6).getStringCellValue().toString());
                if (row.getCell(6) != null && row.getCell(6).getCellType() == row.getCell(6).CELL_TYPE_NUMERIC)
                    question.setOption2(String.valueOf(row.getCell(6).getNumericCellValue()));

                if (row.getCell(7) != null && row.getCell(7).getCellType() == row.getCell(7).CELL_TYPE_STRING)
                    question.setOption3(row.getCell(7).getStringCellValue().toString());
                if (row.getCell(7) != null && row.getCell(7).getCellType() == row.getCell(7).CELL_TYPE_NUMERIC)
                    question.setOption3(String.valueOf(row.getCell(7).getNumericCellValue()));

                if (row.getCell(8) != null && row.getCell(8).getCellType() == row.getCell(8).CELL_TYPE_STRING)
                    question.setOption4(row.getCell(8).getStringCellValue().toString());
                if (row.getCell(8) != null && row.getCell(8).getCellType() == row.getCell(8).CELL_TYPE_NUMERIC)
                    question.setOption4(String.valueOf(row.getCell(8).getNumericCellValue()));
                if (row.getCell(9) != null)
                    question.setCorrectanswer(row.getCell(9).getStringCellValue().toString());

                if (row.getCell(10) != null) {
                    question.setPartToeic(partService.getPartByName(row.getCell(10).getStringCellValue().toString()));
                }
                question.setBaithithu(exam);
                questionLst.add(question);

            }
        } catch (Exception e) {
            System.out.println("errorhere:" + e);
        }

        for (int i = 0; i < questionLst.size(); i++) {
            questionService.save(questionLst.get(i));
        }

        return questionLst;

    }

}
