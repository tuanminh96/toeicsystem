package com.bk.tuanpm.webtoeic.service.impl;

import java.util.Date;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.stereotype.Component;

import com.bk.tuanpm.webtoeic.entities.Account;
import com.bk.tuanpm.webtoeic.entities.User;
import com.bk.tuanpm.webtoeic.service.SendingEmailService;

@Component
public class SendingEmailServiceImpl implements SendingEmailService {
	
	private static final String SMTP_SERVER = "smtp.gmail.com";
    private static final String USERNAME = "toeicbksystem1403@gmail.com";
    private static final String PASSWORD = "Abcde12345@";

    private static final String EMAIL_FROM = "toeicbksystem1403@gmail.com";
    
	
	@Override
	public void sendingEmail(User user) {
		Properties prop = System.getProperties();
        prop.put("mail.smtp.host", SMTP_SERVER); //optional, defined in SMTPTransport
        prop.put("mail.smtp.auth", "true");
        prop.put("mail.smtp.port", "465"); // default port 25
        prop.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
        
        String EMAIL_TO = "pmt.bka.96@gmail.com"; //user.getEmail()
        String EMAIL_TO_CC = "";

        String EMAIL_SUBJECT = "Notify the result of upgrading the user's vip account" + " ";
        String EMAIL_TEXT = "Hello Java Mail \n ABC123";
        
        Session session = Session.getInstance(prop, null);
        Message msg = new MimeMessage(session);

        try {
		
			// from
            msg.setFrom(new InternetAddress(EMAIL_FROM));

			// to 
            msg.setRecipients(Message.RecipientType.TO,
                    InternetAddress.parse(EMAIL_TO, false));

			// cc
            msg.setRecipients(Message.RecipientType.CC,
                    InternetAddress.parse(EMAIL_TO_CC, false));

			// subject
            msg.setSubject(EMAIL_SUBJECT);
			
			// content 
            msg.setText(EMAIL_TEXT);
			
            msg.setSentDate(new Date());

			// Get SMTPTransport
            Transport t = (Transport) session.getTransport("smtp");
			
			// connect
            t.connect(SMTP_SERVER, USERNAME, PASSWORD);
			
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
