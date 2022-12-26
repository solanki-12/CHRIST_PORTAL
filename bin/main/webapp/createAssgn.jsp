<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.Date"%>

<%@page import="org.apache.commons.fileupload.servlet.*"%>
<%@page import="org.apache.commons.fileupload.*"%>
<%@page import="org.apache.commons.fileupload.disk.*"%>
<%@page import="java.io.File"%>
<%@page import="java.io.FileOutputStream"%>
<%@page import="java.util.List"%>

<%

String useremail = (String)session.getAttribute("useremail");

try
{
	
Date date = new Date( );
String currentDate  = String.valueOf(date.getDate());
String currentMonth  = String.valueOf(date.getMonth()+1);
String currentYear  = String.valueOf(date.getYear()+1900);
// String createdDate = currentDate+"/"+currentMonth+"/"+currentYear;
String createdDate = currentYear+"-"+currentMonth+"-"+currentDate;

Class.forName("com.mysql.cj.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/christ","root","1234");
Statement st=con.createStatement();

//File upload to server...

DiskFileItemFactory item_factory=new DiskFileItemFactory();

ServletFileUpload file_upload=new ServletFileUpload(item_factory);

List<FileItem> list_files = file_upload.parseRequest(request);

FileItem item1=list_files.get(0);
String title=new String(item1.get()); 

FileItem item2=list_files.get(1);
String subject = new String(item2.get());

FileItem item3=list_files.get(2);
String description=new String(item3.get()); 

FileItem item4=list_files.get(3);
String fileNAME = item4.getName();

FileItem item5=list_files.get(4);
String dueDateTime = new String(item5.get());

FileItem item6=list_files.get(5);
String createdBy = new String(item6.get());

FileItem item7=list_files.get(6);
String course = new String(item7.get());

System.out.println("course value from create Assgnment: "+course);

System.out.println("Due date time ===>>>"+dueDateTime);

String dueDateTimeArray[] = dueDateTime.split("T");
String dueDate = dueDateTimeArray[0];
String dueTime = dueDateTimeArray[1];
System.out.println("Due date ===>>>"+dueDate);
System.out.println("Due time ===>>>"+dueTime); 


long file_size=item4.getSize();
String file_type= item4.getContentType();

String root_directory=application.getRealPath("/");

File f1=new File(root_directory+"//"+title);
f1.mkdir();

FileOutputStream fos=new FileOutputStream(root_directory+"//"+title+"//"+fileNAME);
System.out.println("root directory==>>"+root_directory+"//"+title+"//"+fileNAME);
fos.write(item3.get());

session.setAttribute("filename",fileNAME);
session.setAttribute("title",title);
session.setAttribute("course",course);


session.setAttribute("x",title+"/"+fileNAME+"/"+course);

System.out.println("Filename===>>"+fileNAME);
System.out.println("title ===>>"+title);

/* request.setAttribute("course",course); */
 System.out.println("Subject value  ===>>"+subject);
%>
<img src="<%=title%>/<%=fileNAME%>" width="500px" height="500px">

<%
st.executeUpdate("insert into assignment (assignment_name,  filename, descriptionAssgn, created_by, creation_date, due_date, dueTime, Subject, Course) values ('"+title+"','"+fileNAME+"','"+description+"','"+createdBy+"','"+createdDate+"','"+dueDate+"','"+dueTime+"','"+subject+"','"+course+"')");


}


catch(Exception e){System.out.println("Exception ---> "+e);}
%>

<jsp:forward page="EmailTrigger.jsp"/>
