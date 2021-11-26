drop database toeicsystem;
create database testtoeic;
USE testtoeic;
-- MySQL dump 10.13  Distrib 5.7.11, for Win64 (x86_64)
--
-- Host: localhost    Database: webtoeic
-- ------------------------------------------------------
-- Server version	5.7.11-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table  nguoi_dung 
--

DROP TABLE IF EXISTS  nguoi_dung ;
CREATE TABLE  nguoi_dung  (
   id  bigint NOT NULL IDENTITY(1,1),
   dia_chi  nvarchar(255) DEFAULT NULL,
   email  varchar(255) DEFAULT NULL,
   ho_ten  nvarchar(255) DEFAULT NULL,
   pass  varchar(255) DEFAULT NULL,
   so_dien_thoai  varchar(255) DEFAULT NULL,
   vai_tro  int DEFAULT NULL,
  PRIMARY KEY ( id )
);

/*INSERT INTO  nguoi_dung  VALUES (1,NULL,'admin@gmail.com','Nguyễn Xuân Nam','$2a$10$Wm/.xaMmNZgAwA0ys5K.K.1xLzVmoX68nyqrFPqEARdrSow8aeVAy','123456789',2),(2,NULL,'member@gmail.com','Đào Huy Chương','$2a$10$g3O3lxP.ij2kjP3nsjpuiuDgD00Y/IfgphQJI920zu/6VikIWgTae','123456789',1); */
/*!40000 ALTER TABLE  nguoi_dung  ENABLE KEYS */;

--
-- Table structure for table  bai_grammar 
--

DROP TABLE IF EXISTS bai_grammar;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE  bai_grammar  (
   baigrammarid  int NOT NULL IDENTITY(1,1),
   anhbaigrammar  nvarchar(255) DEFAULT NULL,
   content_html  text,
   content_mark_down  text,
   tenbaigrammar  nvarchar(255) DEFAULT NULL,
  PRIMARY KEY ( baigrammarid )
);
/*!40101 SET character_set_client = @saved_cs_client */;



DROP TABLE IF EXISTS  bai_tap_doc ;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE  bai_tap_doc  (
   id  bigint NOT NULL IDENTITY(1,1),
   do_kho  int NOT NULL,
   part  int NOT NULL,
   script  varchar(255) DEFAULT NULL,
   ten_bai_doc  nvarchar(255) DEFAULT NULL,
  PRIMARY KEY ( id )
);


DROP TABLE IF EXISTS  bai_tap_nghe ;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE  bai_tap_nghe  (
   id  bigint NOT NULL IDENTITY(1,1),
   do_kho  int NOT NULL,
   part  int NOT NULL,
   script  varchar(255) DEFAULT NULL,
   ten_bai_nghe  varchar(255) DEFAULT NULL,
  PRIMARY KEY ( id )
);


--
-- Table structure for table  bai_tap_tu_vung 
--

DROP TABLE IF EXISTS  bai_tap_tu_vung ;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE  bai_tap_tu_vung  (
   baitaptuvungid  int NOT NULL IDENTITY(1,1),
   anhbaituvung  varchar(255) DEFAULT NULL,
   tenbaituvung  nvarchar(255) DEFAULT NULL,
  PRIMARY KEY ( baitaptuvungid )
);
/*!40101 SET character_set_client = @saved_cs_client */;

/*!40000 ALTER TABLE  bai_tap_tu_vung  DISABLE KEYS */;
/*INSERT INTO  bai_tap_tu_vung  VALUES (2,'2.business plan.jpg','Lesson 1 - Business planning'),(3,'3.computerandtheinternet.jpg','Lesson 2 - Computer and the internet'),(4,'4.Salaries-and-Benefits.jpg','Lesson 3 - Salaries & Benefits'),(5,'5.summer.jpg','Lesson 4- Summer'),(6,'6.summer.jpg','Lesson 5- Summer'); */


--
-- Table structure for table  bai_thi_thu 
--

DROP TABLE IF EXISTS  bai_thi_thu ;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE  bai_thi_thu  (
   baithithuid  int NOT NULL IDENTITY(1,1),
   anhbaithithu  varchar(255) DEFAULT NULL,
   tenbaithithu  nvarchar(255) DEFAULT NULL,
  PRIMARY KEY ( baithithuid )
);


/*INSERT INTO  bai_thi_thu  VALUES (1,'1.mini-test.png','Practice Mini Test 1 - Test  TOEIC Reading, Listening'),(2,'2.exam-test.jpeg','Practice Mini Test 2 - Test  TOEIC Reading, Listening'),(3,'3.mini-test.png','Practice Mini Test 3 - Test  TOEIC Reading, Listening'),(4,'4.exam-test.jpeg','Practice Mini Test 4 - Test  TOEIC Reading, Listening'),(5,'5.exam-test.jpeg','Practice Mini Test 5 - Test  TOEIC Reading, Listening'); */


DROP TABLE IF EXISTS  cau_hoi_bai_tap_doc ;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE  cau_hoi_bai_tap_doc  (
   id  bigint NOT NULL IDENTITY(1,1),
   cau_hoi  varchar(255) DEFAULT NULL,
   dap_an_dung  varchar(255) DEFAULT NULL,
   dap_an_1  varchar(255) DEFAULT NULL,
   dap_an_2  varchar(255) DEFAULT NULL,
   dap_an_3  varchar(255) DEFAULT NULL,
   dap_an_4  varchar(255) DEFAULT NULL,
   giai_thich  varchar(255) DEFAULT NULL,
   photo_name  varchar(255) DEFAULT NULL,
   so_thu_tu  varchar(255) DEFAULT NULL,
   bai_tap_doc_id  bigint DEFAULT NULL,
  PRIMARY KEY ( id ),
  CONSTRAINT  FKec05quu61nalb96kvo06m5lm4  FOREIGN KEY ( bai_tap_doc_id ) REFERENCES  bai_tap_doc  ( id )
);


DROP TABLE IF EXISTS  cau_hoi_bai_tap_nghe ;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE  cau_hoi_bai_tap_nghe  (
   id  bigint NOT NULL IDENTITY(1,1),
   cau_hoi  varchar(255) DEFAULT NULL,
   dap_an_dung  varchar(255) DEFAULT NULL,
   dap_an_1  varchar(255) DEFAULT NULL,
   dap_an_2  varchar(255) DEFAULT NULL,
   dap_an_3  varchar(255) DEFAULT NULL,
   dap_an_4  varchar(255) DEFAULT NULL,
   giai_thich  varchar(255) DEFAULT NULL,
   photo_name  varchar(255) DEFAULT NULL,
   so_thu_tu  varchar(255) DEFAULT NULL,
   bai_tap_nghe_id  bigint DEFAULT NULL,
  PRIMARY KEY ( id ),
  CONSTRAINT  FK569ojxvjejlo12dd1x95yhwu5  FOREIGN KEY ( bai_tap_nghe_id ) REFERENCES  bai_tap_nghe  ( id )
);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table  cau_hoi_bai_tap_nghe 
--

-- Table structure for table  cau_hoi_bai_thi_thu 
--

DROP TABLE IF EXISTS  cau_hoi_bai_thi_thu ;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE  cau_hoi_bai_thi_thu  (
   cauhoibaithithuid  int NOT NULL IDENTITY(1,1),
   audiomp3  varchar(255) DEFAULT NULL,
   correctanswer  varchar(255) DEFAULT NULL,
   dap_an_user  varchar(255) DEFAULT NULL,
   image  varchar(255) DEFAULT NULL,
   number  int DEFAULT NULL,
   option1  varchar(255) DEFAULT NULL,
   option2  varchar(255) DEFAULT NULL,
   option3  varchar(255) DEFAULT NULL,
   option4  varchar(255) DEFAULT NULL,
   paragraph  text,
   question  varchar(255) DEFAULT NULL,
   baithithuid  int NOT NULL,
  PRIMARY KEY ( cauhoibaithithuid ),
  CONSTRAINT  FKe2uv4c5hiy47l9utxyltela8d  FOREIGN KEY ( baithithuid ) REFERENCES  bai_thi_thu  ( baithithuid ) ON DELETE CASCADE
);
/*!40101 SET character_set_client = @saved_cs_client */;


DROP TABLE IF EXISTS  comment_grammar ;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE  comment_grammar  (
   cmtgrammarid  int NOT NULL IDENTITY(1,1),
   cmtgrammarcontent  varchar(255) DEFAULT NULL,
   time  datetime DEFAULT NULL,
   baigrammarid  int NOT NULL,
   id  bigint NOT NULL,
  PRIMARY KEY ( cmtgrammarid ),
  CONSTRAINT  FKfemqtykw679muo86sadwe7ec3  FOREIGN KEY ( id ) REFERENCES  nguoi_dung  ( id ) ON DELETE CASCADE,
  CONSTRAINT  FKoqdhw1u7geuy8x02fteb4j8pg  FOREIGN KEY ( baigrammarid ) REFERENCES  bai_grammar  ( baigrammarid ) ON DELETE CASCADE
);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table  comment_grammar 
--



DROP TABLE IF EXISTS  comment_tu_vung ;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE  comment_tu_vung  (
   cmtvocabularyid  int NOT NULL IDENTITY(1,1),
   cmtvocabularycontent  varchar(255) DEFAULT NULL,
   time  datetime DEFAULT NULL,
   baitaptuvungid  int NOT NULL,
   id  bigint NOT NULL,
  PRIMARY KEY ( cmtvocabularyid ),
  CONSTRAINT  FK8tmjurh2c9w97cqvlim336wxa  FOREIGN KEY ( id ) REFERENCES  nguoi_dung  ( id ) ON DELETE CASCADE,
  CONSTRAINT  FKc318s9a1ynvshxfjj7rj14s7y  FOREIGN KEY ( baitaptuvungid ) REFERENCES  bai_tap_tu_vung  ( baitaptuvungid ) ON DELETE CASCADE
);


--
-- Table structure for table  ket_qua 
--

DROP TABLE IF EXISTS  ket_qua ;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE  ket_qua  (
   ketquaid  int NOT NULL IDENTITY(1,1),
   correctlisten  int DEFAULT NULL,
   correctread  int DEFAULT NULL,
   time  datetime DEFAULT NULL,
   socaudung  int DEFAULT NULL,
   socausai  int DEFAULT NULL,
   baithithuid  int NOT NULL,
   nguoidungid  bigint NOT NULL,
  PRIMARY KEY ( ketquaid ),
  CONSTRAINT  FK7tu3h8lgrgirbano5u7khf8l7  FOREIGN KEY ( baithithuid ) REFERENCES  bai_thi_thu  ( baithithuid ) ON DELETE CASCADE,
  CONSTRAINT  FKeiiibwj68arv48msgk6n2jky4  FOREIGN KEY ( nguoidungid ) REFERENCES  nguoi_dung  ( id ) ON DELETE CASCADE
);

DROP TABLE IF EXISTS  noi_dung_bai_tu_vung ;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE  noi_dung_bai_tu_vung  (
   noidungbaituvungid  int NOT NULL IDENTITY(1,1),
   audiomp3  varchar(255) DEFAULT NULL,
   content  varchar(255) DEFAULT NULL,
   image  varchar(255) DEFAULT NULL,
   meaning  varchar(255) DEFAULT NULL,
   number  int DEFAULT NULL,
   sentence  varchar(255) DEFAULT NULL,
   transcribe  varchar(255) DEFAULT NULL,
   baitaptuvungid  int NOT NULL,
  PRIMARY KEY ( noidungbaituvungid ),
  CONSTRAINT  FK3xu0kv4p43fi7qa9mmj9em9oc  FOREIGN KEY ( baitaptuvungid ) REFERENCES  bai_tap_tu_vung  ( baitaptuvungid ) ON DELETE CASCADE
) ;

DROP TABLE IF EXISTS  slidebanner ;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE  slidebanner  (
   slidebannerid  int NOT NULL,
   slidename  nvarchar(MAX),
   slidecontent  nvarchar(MAX) ,
   slideimage  varchar(45)  DEFAULT NULL,
  PRIMARY KEY ( slidebannerid )
) ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table  slidebanner 
--


/*!40000 ALTER TABLE  slidebanner  DISABLE KEYS */;
INSERT INTO  slidebanner  VALUES (6,N' Bài Tập Reading, Listening',N'Chúng tôi cung cấp cho các bạn các dạng bài tập hay, bổ ích','slide2'),(7,N'Thi Thử Toiec Online',N'Sau khi có kiến thức vững vàng, các bạn được trải nghiệm thi online','bbb'); 
/*!40000 ALTER TABLE  slidebanner  ENABLE KEYS */;
SELECT * FROM dbo.slidebanner;
DELETE FROM slidebanner where slidebannerid in (1,2,3,4)
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-05-01 19:35:54

