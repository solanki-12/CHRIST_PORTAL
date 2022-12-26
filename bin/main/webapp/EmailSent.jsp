<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="javax.mail.MessagingException"%>
<%@page import="javax.mail.Message"%>
<%@page import="javax.mail.internet.*"%>
<%@page import="javax.mail.MailSessionDefinition"%>
<%@page import="javax.mail.Session"%>
<%@page import="java.util.Properties"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*,javax.mail.*"%>
<%@page import="javax.mail.Transport"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%

String result;
 
final String to = "happpy02082002@gmail.com";
final String subject = "Insertion Sort"; 
final String messg = "sort the list by using insertion sort..";
final String from = "solankianuj12@gmail.com";
final String pass = "dl7scb1254solanki";

String host = "smtp.gmail.com";


Properties props = new Properties();
props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");

props.put("mail.smtp.host", host);
props.put("mail.transport.protocol", "smtp");
props.put("mail.smtp.auth", "true");

props.put("mail.smtp.port", "587");

props.put("mail.smtp.starttls.enable", "true");
props.put("mail.user", from);
props.put("mail.password", pass);

Session mailSession = Session.getInstance(props, new javax.mail.Authenticator(){
	
	@Override
	 protected PasswordAuthentication getPasswordAuthentication(){
		return new PasswordAuthentication(from,pass);
	}
});

try{
	
	MimeMessage message = new MimeMessage(mailSession);
	
	message.setFrom(new InternetAddress(from));
	
	message.addRecipient(Message.RecipientType.TO,new InternetAddress(to));
	
	message.setSubject(subject);
	
	message.setText(messg);
	
	Transport.send(message);
	
	result ="message send successfully";
	
	out.println("code successfully executed +++>>>"+result);
		
}
catch(MessagingException mex){
	mex.printStackTrace();
	result= "Error:unable to sent message....";
	System.out.println("inside catch block +++>>>"+result);
}

%>
<jsp:forward page="successfileupload.html"/>


</body>
</html>