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
String assgnname=request.getParameter("title");
String Descrp=request.getParameter("comment");
String assgnno=request.getParameter("assgnno");


out.println("Assignment no ==>>"+assgnno);

out.println("assgno==>>"+Descrp);

try
{
Class.forName("com.mysql.cj.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/christ","root","1234");


String sqlupdate = "UPDATE assignment SET assignment_name ='"+assgnname+"', descriptionAssgn= '"+Descrp+"' WHERE assignment_no ='"+assgnno+"'";
PreparedStatement stmt = con.prepareStatement(sqlupdate);

int updateRecords = stmt.executeUpdate();
if(updateRecords>0)
{
	response.sendRedirect("ModifyAssgn.jsp");
}




}

catch(Exception e)
{
	System.out.println("Error in ModifyEDIT ==>>"+e);
	
}

%>
				



</body>
