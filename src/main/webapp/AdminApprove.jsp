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

String approvebtn = request.getParameter("approve");
System.out.println("status admin approve button ==>"+approvebtn);
 


String emaildb = request.getParameter("emaildb");
String status = (String)session.getAttribute("status"); 
String email = (String)session.getAttribute("admin_email"); 
 System.out.println("email admin approve ==>"+email);
 System.out.println("status admin approve ==>"+status);
 System.out.println("user email from database==>>"+emaildb);
  
   
 /* Class.forName("com.mysql.cj.jdbc.Driver");
 Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/christ","root","1234");
 Statement st=con.createStatement();
 if()
 {
 st.executeUpdate("insert into user (name,  email, password, student, course, session, teacher) values ('"+name+"','"+email+"','"+password+"','"+student+"','"+course+"','"+year+"','"+teacher+"')");
 
 }	 
  rs.close();
 */ 
%>

</body>
</html>