package com.bk.tuanpm.webtoeic.service.impl;

import java.text.ParseException;
import java.util.Date;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.bk.tuanpm.webtoeic.config.EmailConfig;
import com.bk.tuanpm.webtoeic.dto.PaymentDTO;
import com.bk.tuanpm.webtoeic.entities.Account;
import com.bk.tuanpm.webtoeic.entities.OrderPayment;
import com.bk.tuanpm.webtoeic.entities.User;
import com.bk.tuanpm.webtoeic.service.SendingEmailService;
import com.bk.tuanpm.webtoeic.util.DateTimeUtil;

@Component
public class SendingEmailServiceImpl implements SendingEmailService {
	
    
    @Autowired
    EmailConfig emailConfig;
	
	@Override
	public void sendingEmail(User user, OrderPayment paymentDTO) {
		
		System.out.println("sending");
		Properties prop = System.getProperties();
        prop.put("mail.smtp.host", emailConfig.getProperty("SMTP_SERVER")); //optional, defined in SMTPTransport
        prop.put("mail.smtp.auth", "true");
        prop.put("mail.smtp.port", "465"); // default port 25
        prop.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
        
        String EMAIL_TO = user.getEmail(); //user.getEmail()
        String EMAIL_TO_CC = "";

        String EMAIL_SUBJECT = emailConfig.getProperty("EMAIL_SUBJECT") + "[Ref:"+paymentDTO.getRefNo()+"]";
        String EMAIL_TEXT = emailConfig.getProperty("EMAIL_TEXT");
        StringBuilder builder = new StringBuilder(EMAIL_TEXT);
        builder.append("\n");
        builder.append("Họ tên: "+user.getHoTen());
        builder.append("\n");
        builder.append("Địa chỉ:"+user.getDiaChi());
        builder.append("\n");
        builder.append("Số tiền:"+(paymentDTO.getAmount()/100)+" VNĐ");
        builder.append("\n");
        try {
			builder.append("Ngày nâng cấp: "+ DateTimeUtil.convertDate2String(paymentDTO.getPayDate()));
		} catch (ParseException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
        builder.append("\n");
        builder.append("Thông tin:"+paymentDTO.getOrderInfo());
        builder.append("\n");
        builder.append(emailConfig.getProperty("EMAIL_FOOTER"));
        
        String emailBody = builder.toString();
        Session session = Session.getInstance(prop, null);
        Message msg = new MimeMessage(session);

        try {
		
			// from
            msg.setFrom(new InternetAddress(emailConfig.getProperty("EMAIL_FROM")));

			// to 
            msg.setRecipients(Message.RecipientType.TO,
                    InternetAddress.parse(EMAIL_TO, false));

			// cc
            msg.setRecipients(Message.RecipientType.CC,
                    InternetAddress.parse(EMAIL_TO_CC, false));

			// subject
            msg.setSubject(EMAIL_SUBJECT);
			
			// content 
            msg.setText(emailBody);
			
            msg.setSentDate(new Date());

			// Get SMTPTransport
            Transport t = (Transport) session.getTransport("smtp");
			System.out.println(emailConfig.getProperty("USERNAME"));
			System.out.println(emailConfig.getProperty("PASSWORD"));
			// connect
            t.connect(emailConfig.getProperty("SMTP_SERVER"), 
            		"toeicbksystem1403@gmail.com", emailConfig.getProperty("PASSWORD"));
			
			// send
            t.sendMessage(msg, msg.getAllRecipients());

//            System.out.println("Response: " + t.get);
            System.out.println("Success");
            t.close();

        } catch (MessagingException e) {
            e.printStackTrace();
        }
		
	}

}
