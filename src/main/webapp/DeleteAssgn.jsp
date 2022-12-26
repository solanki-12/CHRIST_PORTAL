<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*,java.util.*"%>
        <%@page import="javax.swing.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>


<%

String assgnno=request.getParameter("Number");



try
{
Class.forName("com.mysql.cj.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/christ","root","1234");


String sqlupdate = "DELETE FROM assignment WHERE assignment_no='"+assgnno+"'";
PreparedStatement stmt = con.prepareStatement(sqlupdate);



int updateRecords = stmt.executeUpdate();
if(updateRecords>0)
{
	 JFrame f=new JFrame();  
	    JOptionPane.showMessageDialog(f,"Assginment Removed !!!");
	response.sendRedirect("ModifyAssgn.jsp");
}

}

catch(Exception e)
{
	System.out.println("Error in ModifyEDIT ==>>"+e);
	
}

%>
				



</body>
