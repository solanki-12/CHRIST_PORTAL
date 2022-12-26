<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
        <%@page import="java.sql.*,java.util.*"%>
<!DOCTYPE html>
<html>
<head>
     <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <title>Create Assignment</title>
    <!-- Font Icon -->
    <link rel="stylesheet" href="fonts/material-icon/css/material-design-iconic-font.min.css">
    <!-- CSS only -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <!-- JavaScript Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

   <link rel="stylesheet"  href="createAssgn.css">
<meta charset="ISO-8859-1">
<title>ModifyEdit Jsp</title>
</head>

<body>

<nav class="navbar navbar-expand-lg  navbar-dark bg-dark">
	
	
	
	<div class="container">

<div class="progress" >
    <div class="progress-bar" role="progressbar" style="width: 100%" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100"></div>
</div>

</nav>
<div class="container" >

<form  method="POST" action="UpdateAssgn.jsp">
    			<button type="button" class="btn btn-primary" style="margin-left: -110px;margin-top: -29px; width: 90px;" onclick="location.href='Portal.html';">Back</button>
    <label style="font-size:40px; margin-left:29%" > <b>Edit Assignment</b></label>

   <!-- 
    <div class="input-group mb-3">
        <input type="file" class="form-control" id="inputGroupFile02" name="file">
        <label class="input-group-text" for="inputGroupFile02">Upload</label>
    </div>
 -->



<%
String assgnno = request.getParameter("Number");

System.out.println(assgnno);

try
{
Class.forName("com.mysql.cj.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/christ","root","1234");

String sqlfetch = "select * from assignment where assignment_no ='"+assgnno+"'";
PreparedStatement stmt = con.prepareStatement(sqlfetch);

ResultSet rs = stmt.executeQuery();
while(rs.next())
{
		    %>
				<div class="form-group">
				<label for="exampleFormControlInput1" style="font-size:25px">Assignment Number</label>
				    <input type="text" class="form-control" name ="assgnno" id="exampleFormControlInput1" value=<%=assgnno%> readonly>
				</div>
				
				
				<div class="form-group">
				<label for="exampleFormControlInput1" style="font-size:25px">Title</label>
				    <input type="text" class="form-control" name ="title" id="exampleFormControlInput1" value=<%=rs.getString("assignment_name")%>>
				</div>
			 

				
				<label style="font-size:25px">Description</label>
				<div class="form-floating">
				    <textarea class="form-control" name="comment" id="floatingTextarea2" style="height: 100px" ><%=rs.getString("descriptionAssgn")%></textarea>
				</div>
				
				 <div class="form-group" >
				    <input type="Submit" name="createbtn" id="createbtn" class="form-submit" value="Submit"/>
				</div>

		
		      
		    <% 
  
}
}
catch(Exception e)
{
	System.out.println("Error in ModifyEDIT ==>>"+e);
	
}



%>

</form>
</div>
</body>
</html>