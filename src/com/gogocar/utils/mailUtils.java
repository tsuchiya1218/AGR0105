package com.gogocar.utils;

import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class mailUtils {

	 public static void sendFromYandex(String from, String pass, String to, String subject, String body) throws AddressException, MessagingException {
	        Properties props = System.getProperties();
	        String host = "smtp.yandex.com";
	        props.put("mail.smtp.host", host);
	        props.put("mail.smtp.user", from);
	        props.put("mail.smtp.password", pass);
	        props.put("mail.smtp.port", "465");
	        props.put("mail.smtp.auth", "true");
	        props.put("mail.smtp.starttls.enable", "true");
	        props.put("mail.smtp.ssl.enable", "true");
	        props.put("mail.smtp.quitwait", "false");
	        props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
	        props.put("mail.debug", "true");

	        Session session = Session.getInstance(props);
	        session.setDebug(true);
	        MimeMessage message = new MimeMessage(session);
	        message.setHeader("Content-Type", "text/plain; charset=UTF-8");
	        message.setSubject(subject, "UTF-8");
	        message.setText(body, "UTF-8");

	        try {
	            message.setFrom(new InternetAddress(from));
	            InternetAddress[] toAddress = InternetAddress.parse(to);
	            message.setRecipients(Message.RecipientType.TO, toAddress);
	            //设置在发送给收信人之前给自己（发送方）抄送一份，不然会被当成垃圾邮件，报554错
	            message.addRecipients(MimeMessage.RecipientType.CC, InternetAddress.parse(to));

	            message.setSubject(subject);
	            message.setText(body);
	            Transport transport = session.getTransport("smtp");
	            transport.connect(host, from, pass);
	            transport.sendMessage(message, message.getAllRecipients());
	            transport.close();
	        } catch (AddressException ae) {
	            ae.printStackTrace();
	        } catch (MessagingException me) {
	            me.printStackTrace();
	        }
	    }

	
	
}
