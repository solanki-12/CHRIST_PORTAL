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
<%@page import="java.util.Random"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> 
    <meta name="viewport" content="width=device-width, initial-scale=1.0"> 
    <title>SignUp Successful </title>

    <meta name="author" content="Codeconvey" />
    <!-- Message Box CSS -->
    <link rel="stylesheet" href="css/SucessSignup.css">
    <!--Only for demo purpose - no need to add.-->
    <link rel="stylesheet" href="css/demo.css" />
	
</head>
<body>
		
<form method="POST" action="UpdateMyprofile.jsp" >
<section>
    <div class="rt-container">
          <div class="col-rt-12">
              <div class="Scriptcontent">
              
<!-- partial:index.partial.html -->
<div id='card' class="animated fadeIn">
  <div id='upper-side'>
    <?xml version="1.0" encoding="utf-8"?>
      <!-- Generator: Adobe Illustrator 17.1.0, SVG Export Plug-In . SVG Version: 6.00 Build 0)  -->
      <!DOCTYPE svg PUBLIC "-//W3C//DTD SVG 1.1//EN" "http://www.w3.org/Graphics/SVG/1.1/DTD/svg11.dtd">
      <svg version="1.1" id="checkmark" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" xml:space="preserve">
        <path d="M131.583,92.152l-0.026-0.041c-0.713-1.118-2.197-1.447-3.316-0.734l-31.782,20.257l-4.74-12.65
	c-0.483-1.29-1.882-1.958-3.124-1.493l-0.045,0.017c-1.242,0.465-1.857,1.888-1.374,3.178l5.763,15.382
	c0.131,0.351,0.334,0.65,0.579,0.898c0.028,0.029,0.06,0.052,0.089,0.08c0.08,0.073,0.159,0.147,0.246,0.209
	c0.071,0.051,0.147,0.091,0.222,0.133c0.058,0.033,0.115,0.069,0.175,0.097c0.081,0.037,0.165,0.063,0.249,0.091
	c0.065,0.022,0.128,0.047,0.195,0.063c0.079,0.019,0.159,0.026,0.239,0.037c0.074,0.01,0.147,0.024,0.221,0.027
	c0.097,0.004,0.194-0.006,0.292-0.014c0.055-0.005,0.109-0.003,0.163-0.012c0.323-0.048,0.641-0.16,0.933-0.346l34.305-21.865
	C131.967,94.755,132.296,93.271,131.583,92.152z" />
        <circle fill="none" stroke="#ffffff" stroke-width="5" stroke-miterlimit="10" cx="109.486" cy="104.353" r="32.53" />
 <%
 
 
 /* String email = (String)session.getAttribute("useremail");*/
 
String name = request.getParameter("name");
String email = request.getParameter("email");
String password = request.getParameter("password"); 


System.out.println("email on ott confirmation===>>>"+email);
 
 session.setAttribute("email",email);
 session.setAttribute("password",password);
 session.setAttribute("name",name);
  

String result;
 
final String to = email;
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
	
	Random rn=new Random();
	int n;
	while(true) {
	n = rn.nextInt(9999);
	
	if(n>999 && n<=9999) {
		System.out.println(n);
		break;
		}
	}
	
	session.setAttribute("otpno",""+n);
	
	MimeMessage message = new MimeMessage(mailSession);
	
	message.setFrom(new InternetAddress(from));
	/* 
	message.addRecipient(Message.RecipientType.TO,new InternetAddress(to)); */
	
	 message.addRecipients(Message.RecipientType.TO, InternetAddress.parse(email));
	
	message.setSubject(subject);
	
	message.setText(""+n);
	
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
      </svg>
 
      <h3 id='status'>
       OTP sent check your Email
    </h3>
  </div>
  <div id='lower-side'>
    <input type="text" id='message' name="getotp" placeholder="Enter OTP" >
      
    <input type="submit" id="contBtn" value="submit">
    <br><br>
    
  </div>
</div>
<!-- partial -->
    		
           
    		</div>
		</div>
    </div>
</section>
</form>     


    <!-- Analytics -->

	</body>
</html>