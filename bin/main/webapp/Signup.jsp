
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


int student=0;
int teacher=0;

String[] studentarr = request.getParameterValues("namevalue");
if (studentarr != null) 
{
   for (int i = 0; i < studentarr.length; i++) 
   {
      System.out.println ("studentarry value : "+studentarr[i]);
      String val = studentarr[i];
      System.out.println("val is equal => "+(val.equals("teacher")));
      System.out.println("val is equal => "+(val.equals("student")));
      if(val.equals("teacher")){
    	  System.out.println("inside teacher if");
    	  teacher = 1;
      }
      else if(val.equals("student")){
    	  System.out.println("inside student if");
    	  student = 1;
      }
      
   }
}

String name = request.getParameter("name");
String email = request.getParameter("email");
String password = request.getParameter("pass");
String course = request.getParameter("course");
String year = request.getParameter("year");

System.out.println("course value ==>>"+course);
System.out.println("year value ==>>"+year);
System.out.println("name value ==>>"+name);
System.out.println("email value ==>>"+email);
System.out.println("password value ==>>"+password);



System.out.println("active status of teacher="+teacher);
System.out.println("active status of student="+student);

Class.forName("com.mysql.cj.jdbc.Driver");
Connection co = DriverManager.getConnection("jdbc:mysql://localhost:3306/christ","root","1234");

Statement st=co.createStatement();

/* st.executeUpdate("insert into user values ('"+name+"','"+email+"','"+password+"','"+student+"','"+course+"','"+year+"','"+teacher+"')");
 */
   st.executeUpdate("insert into user (name,  email, password, student, course, session, teacher) values ('"+name+"','"+email+"','"+password+"','"+student+"','"+course+"','"+year+"','"+teacher+"')");
 
/* /* st.executeUpdate("insert into assignment (assignment_name,  filename, descriptionAssgn, created_by, creation_date, due_date, dueTime, Subject, Course) values ('"+title+"','"+fileNAME+"','"+description+"','Anuj','"+createdDate+"','"+dueDate+"','"+dueTime+"','"+subject+"','BCA')");
 */
 %>

	 	     <jsp:forward page="SuccessSignup.html"/>
 <%

%>
</body>
</html>