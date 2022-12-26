
import javax.mail.MessagingException;
import javax.mail.Message;
import javax.mail.internet.*;
import javax.mail.MailSessionDefinition;
import javax.mail.Session;
import java.util.Properties;
import java.sql.*;
import java.util.*;
import javax.mail.*;
import javax.mail.Transport;

public class demo {

	/*
	 * String course = (String)session.getAttribute("course");
	 * System.out.println("Course get value==>>"+course);
	 */
	// Get User Data
	public static void main(String[] args)
	{
	String result;
	final String to = "solankiarun01@gmail.com";
	final String subject = "Assignment is created please submit on the time.";
	final String messg = "Learning java programming";
	final String from = "solankianuj12@gmail.com";
	final String pass = "dl7scb1254solanki";

	String host = "smtp.gmail.com";

	Properties props = new Properties();
	props.put("mail.smtp.socketFactory.class","javax.net.ssl.SSLSocketFactory");

	props.put("mail.smtp.host",host);props.put("mail.transport.protocol","smtp");props.put("mail.smtp.auth","true");

	props.put("mail.smtp.port","587");

	props.put("mail.smtp.starttls.enable","true");props.put("mail.user",from);props.put("mail.password",pass);

	Session mailSession=Session.getInstance(props,new javax.mail.Authenticator(){

	@Override protected PasswordAuthentication getPasswordAuthentication(){return new PasswordAuthentication(from,pass);}});

	try{

	MimeMessage message = new MimeMessage(mailSession);

	message.setFrom(new InternetAddress(from));
	/*
	 * message.addRecipient(Message.RecipientType.TO,new InternetAddress(to));
	 */

	message.addRecipients(Message.RecipientType.TO,InternetAddress.parse("solankiarun01@gmail.com"));

	message.setSubject(subject);

	message.setText(messg);

	Transport.send(message);

	result="message send successfully";

	System.out.println("code successfully executed +++>>>"+result);

	}catch(
	MessagingException mex)
	{
		mex.printStackTrace();
		result = "Error:unable to sent message....";
		System.out.println("inside catch block +++>>>" + result);
	}

	}
	
}
