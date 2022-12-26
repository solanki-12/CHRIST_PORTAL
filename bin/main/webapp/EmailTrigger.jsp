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
<title>Email Trigger </title>
</head>
<body>
<%

String course = (String)session.getAttribute("course");
System.out.println("Course get value==>>"+course);

//Get User Data

 Class.forName("com.mysql.cj.jdbc.Driver");
Connection co = DriverManager.getConnection("jdbc:mysql://localhost:3306/christ","root","1234");

Statement st=co.createStatement();

ResultSet rs=st.executeQuery("select * from user");
System.out.println("result==>"+rs);

String[] toEmailArray;

List<String> toListOfStudents=new ArrayList<String>();

while(rs.next())
{
	
	  String youremailDb =rs.getString("email");
	  String isStudent =rs.getString("student");
	  String loginStatus = rs.getString("status");
	  String coursedb = rs.getString("course");
	  System.out.println("youremailDb====>"+youremailDb);
	  System.out.println("isStudent====>"+isStudent);
	  System.out.println("login Status ==>>"+loginStatus);
	  if(isStudent.equals("1") && loginStatus.equals("Approved") && coursedb.equals(course)){
		  toListOfStudents.add(youremailDb);
	  }
}

System.out.println("toListOfStudents===>"+toListOfStudents);

StringBuilder str = new StringBuilder("");
// Traversing the ArrayList
for (String eachstring : toListOfStudents) {
    str.append(eachstring).append(",");
}
// StringBuffer to String conversion
 String toStudentEmails = str.toString();
toStudentEmails = toStudentEmails.substring(0,toStudentEmails.length()-1);
System.out.println("toStudentEmails===>"+toStudentEmails);

 
 String result;
final String to = toStudentEmails;
final String subject = "Assignment is created please submit on the time."; 
final String messg = "Learning java programming";
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
	/* 
	message.addRecipient(Message.RecipientType.TO,new InternetAddress(to)); */
	
	 message.addRecipients(Message.RecipientType.TO, InternetAddress.parse(toStudentEmails));
	
	message.setSubject(subject);
	
	message.setText(messg);
	
	Transport.send(message);
	
	result ="message send successfully";
	
	System.out.println("code successfully executed +++>>>"+result);
		
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