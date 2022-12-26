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
    <title>Modify Assignment</title>
    <!-- Font Icon -->
    <link rel="stylesheet" href="fonts/material-icon/css/material-design-iconic-font.min.css">
   
    <!-- CSS only -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <!-- JavaScript Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

   <link rel="stylesheet"  href="Portal.css">
<style>
table {
  font-family: arial, sans-serif;
  border-collapse: collapse;
  width: 100%;
  margin-left:-100px;
}

.modify{
    margin-left: 138px;
    margin-top: -28px;
    font-size: 40px;
    }


td, th {
  border: 3px solid #dddddd;
  text-align: center;
  padding: 20px 20px 2px 25px;
 
}

tr:nth-child(even) {
  background-color: lightblue;
}

</style>


<meta charset="ISO-8859-1">
<title>View Assignment</title>

</head>
</body>

<nav class="navbar navbar-expand-lg  navbar-dark bg-dark">
	<div class="container">

		<div class="bg-dark">
			<img src="logo.jpg" class="logo" ></img>
			<h5 class="text-white h1" style="padding:0% 0% 1% 1%">Christ</h5>
		<h2 style="font-size: 15px;margin-top: -8px;padding-bottom: -15px;" class="text-white h1">(Deemed to be University)</h2>
		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav ms-auto mb-2 mb-lg-0">
				<li class="nav-item dropdown">

					<a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
						Assignment
					</a>
					<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
						<li><a class="dropdown-item" href="StudentViewAssignment.jsp">View Assignment</a></li>
						<li><hr class="dropdown-divider"></li>
						<li><a class="dropdown-item" href="StudentModifyAssignment.jsp">Modify Assignment</a></li>
					</ul>
				</li>

				<li class="nav-item" id="report">
					<a class="nav-link active" aria-current="page" href="#">Report</a>
				</li>
				<li class="nav-item" id="mprofile">
					<a class="nav-link active" aria-current="page" href="StudentMyprofile.jsp">My Profile</a>
				</li>
				<li class="nav-item" id="home">
					<a class="nav-link active" href="StudentPortal.jsp">Home</a>
				</li>
				
				<li class="nav-item" id="Signout">
					<a class="nav-link active" href="index.html" style="margin-left:128%; margin-top:10px;">Signout</a>
				</li>
				


			</ul>
		</div>
	</div>
	</div>
</nav>




<div class="progress">
  <div class="progress-bar bg-info" role="progressbar" style="width: 30%" aria-valuenow="15" aria-valuemin="0" aria-valuemax="100"></div>
  <div class="progress-bar bg-warning" role="progressbar" style="width: 41%" aria-valuenow="30" aria-valuemin="0" aria-valuemax="100"></div>
  <div class="progress-bar bg-danger" role="progressbar" style="width: 30%" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100"></div>
</div>

<div class="container" >
<form  method="POST" action="StudentViewAssignment.jsp" style="margin-left: 85px;">
    <br><br><br>
    <label style="font-size:40px;margin-left:30%;" class="modify"> <b>View Assignment</b></label><br><br><br>
<table  style="width:100%; margin-left:-10px;">
<tr>
<th >Assignment No</th>
<th>Assignment Name</th>
<th>Created By</th>
<th>File Name</th>
<th>Assignment Description</th>
<th>Creation Date</th>
<th>Due Date</th>
</tr>



<% 
String assgnName = "";
String Descrp = "";


try
{
Class.forName("com.mysql.cj.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/christ","root","1234");

String sqlfetch = "select * from assignment";
PreparedStatement stmt = con.prepareStatement(sqlfetch);

ResultSet rs = stmt.executeQuery();
while(rs.next())
{
		
	    %>
	      <tr>
	      <td><%=rs.getString("assignment_no")%></td>
	      <td><%=rs.getString("assignment_name")%></td>
	      <td><%=rs.getString("created_by")%></td>
	      <td><%=rs.getString("filename")%></td>
	      <td><%=rs.getString("descriptionAssgn")%></td>
	      <td><%=rs.getString("creation_date")%></td>
	      <td><%=rs.getString("due_date")%></td>
	      
	      </tr>
	      
	      
	    <% 
}
}
catch(Exception e)
{
  System.out.println("Error ==>>"+e);
}

%>






</table>
</form>

</div>
</body>



</html>