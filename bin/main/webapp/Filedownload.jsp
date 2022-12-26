<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
String filename = (String)session.getAttribute("filename");
String title = (String)session.getAttribute("title");

System.out.println("filename ==>>"+filename);
System.out.println("title ==>>"+title);

String path = title+"//"+filename;


response.sendRedirect(path);

%>


</body>
</html>