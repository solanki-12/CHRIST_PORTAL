<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%


String name = request.getParameter("person_name");
String phno = request.getParameter("phone_no");
String msg = request.getParameter("feed_message");


System.out.println("person name ==>>"+name);
System.out.println("person phone ==>>"+phno);
System.out.println("person message ==>>"+msg);


Class.forName("com.mysql.cj.jdbc.Driver");
Connection co = DriverManager.getConnection("jdbc:mysql://localhost:3306/christ","root","1234");
Statement st=co.createStatement();
st.executeUpdate("insert into feedback values ('"+name+"','"+phno+"','"+msg+"')");


  %>

 	 	     <jsp:forward page="SuccessFeedback.html"/>
  <% 
 

%>

</body>
</html>