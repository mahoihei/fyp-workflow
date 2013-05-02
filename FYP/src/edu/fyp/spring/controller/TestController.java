package edu.fyp.spring.controller;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.Properties;

import javax.jdo.PersistenceManager;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.appengine.api.mail.MailService;
import com.google.appengine.api.mail.MailServiceFactory;

import edu.fyp.bean.*;
import edu.fyp.bean.node.*;
import edu.fyp.repository.PMF;

@Controller
public class TestController {

	PersistenceManager pm = PMF.get().getPersistenceManager();

	@RequestMapping("/test")
	public @ResponseBody
	String test() throws Exception {
		// File f = new File("mail-template/NotifyOFComingApproval.html");
		// BufferedReader in = null;
		// try {
		// in = new BufferedReader(new FileReader(f));
		// } catch (FileNotFoundException e) {
		// // TODO Auto-generated catch block
		// e.printStackTrace();
		// }
		// String text = null;
		// String line;
		// while ((line = in.readLine()) != null) {
		// text += line;
		// }

//		Properties props = new Properties();
//		Session session = Session.getDefaultInstance(props, null);
//			Message msg = new MimeMessage(session);
//			msg.setFrom(new InternetAddress("mahoihei@gmail.com",
//					"mahoihei@gmail.com"));
//			msg.addRecipient(Message.RecipientType.TO, new InternetAddress(
//					"mahoihei@gmail.com", "Mr. User"));
//			msg.setSubject("Your Example.com account has been activated");
//			msg.setText("<html><body><input type='text'></body></body>");
//			Transport.send(msg);
		
		// return text;
		//return "Hello World";
	}
}
