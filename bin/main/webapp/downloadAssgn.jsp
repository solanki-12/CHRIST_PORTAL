<%@page language="java" contentType="text/html; charset=ISO-8859-1"
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
String name = (String)session.getAttribute("name");



String root_directory=application.getRealPath("/");
String path = name+"//"+filename;

response.sendRedirect(path);

%>

</body>
</html>