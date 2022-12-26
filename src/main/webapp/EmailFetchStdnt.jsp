<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<%@page import="emailAuthenticator.EmailSender"%>
   
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%


Class.forName("com.mysql.cj.jdbc.Driver");
Connection co = DriverManager.getConnection("jdbc:mysql://localhost:3306/christ","root","1234");

Statement st=co.createStatement();

ResultSet rs=st.executeQuery("select email from user where student = 1");
System.out.println("result==>"+rs);

List<String> email  = new ArrayList();
System.out.println("Email details==>>"+email.size());


while(rs.next())
{
	email.add(rs.getString("email"));	
	EmailSender.sendEmail(); 

	
	
}



%>
</body>
</html>