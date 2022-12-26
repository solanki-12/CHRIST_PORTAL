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
    <title>Admin Report</title>
    <!-- Font Icon -->
    <link rel="stylesheet" href="fonts/material-icon/css/material-design-iconic-font.min.css">
   
    <!-- CSS only -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <!-- JavaScript Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
	<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
	

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
.highlight {
            background-color: #b8b8b8;
        }

</style>


<meta charset="ISO-8859-1">
<title>Admin Report</title>

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

				<li class="nav-item" id="report">
					<a class="nav-link active" aria-current="page" href="AdminReport.jsp">Approval Request</a>
				</li>
				<li class="nav-item" id="mprofile">
					<a class="nav-link active" aria-current="page" href="AdminMyprofile.jsp">My Profile</a>
				</li>
				<li class="nav-item" id="home">
					<a class="nav-link active" href="AdminPortal.jsp">Home</a>
				</li>
				
				<li class="nav-item" id="Signout">
					<a class="nav-link active" href="AdminSignin.html" style="margin-left:520%; margin-top:10px;">Signout</a>
					
				</li>
				


			</ul>
		</div>
	</div>
	</nav>




<div class="progress">
  <div class="progress-bar bg-info" role="progressbar" style="width: 30%" aria-valuenow="15" aria-valuemin="0" aria-valuemax="100"></div>
  <div class="progress-bar bg-warning" role="progressbar" style="width: 41%" aria-valuenow="30" aria-valuemin="0" aria-valuemax="100"></div>
  <div class="progress-bar bg-danger" role="progressbar" style="width: 30%" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100"></div>
</div>

<div class="container" >
<form  method="POST" action="AdminApprove.jsp" style="margin-left: 85px;" name="userDetail">
    <br><br><br>
    <label style="font-size:40px" class="modify"> <b>User Requests</b></label><br><br><br>
<table  style="width:100%" id="tableData">
<tr>
<th scope="col">#</th>
<th scope="col">User Name</th>
<th scope="col">Email</th>
<th scope="col">Course</th>
<th scope="col">Year</th>
<th scope="col">Status</th>
<th scope="col">Request</th>
</tr>



<% 
 String status= "In-Progress";
try
{
Class.forName("com.mysql.cj.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/christ","root","1234");

String sqlfetch = "select * from user where status = '"+status+"'";
PreparedStatement stmt = con.prepareStatement(sqlfetch);

ResultSet rs = stmt.executeQuery();
int i=1;
while(rs.next())
{
		
	    %>
	      <tr>
	      <td id=<%=i%>><%=i%></td>
	      <td class="row-data"><%=rs.getString("name")%></td>
	      <td class="row-data"><%=rs.getString("email")%></td>
	      <td class="row-data"><%=rs.getString("course")%></td>
	      <td class="row-data"><%=rs.getString("session")%></td>
	      <td class="row-data"><%=rs.getString("status")%></td>
	      <td>
     	     <input type="button" name="approve"  class="btn btn-success"  value="Approve" id="ApproveBtn" onclick="updateUser(this)"> 
	         <button  type="button"  class="btn btn-danger" onclick="AdminReject.jsp?Number=<%=rs.getString("status")%>">Reject</button>
	      </td>
	      </tr>
	    <%
	    i++;
}

/* System.out.println("email from database on admin report =>>"+emaildb);
 */

session.setAttribute("status", status);
System.out.println("status from database ==>>"+status);
/* session.setAttribute("emaildb", emaildb);
 */



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

<script>


function updateUser(x) {
    console.log("row index is==>"+x.rowIndex);
	/*  var rowId = event.target.parentNode.parentNode.id;
    console.log("rowId==>"+rowId);
  //this gives id of tr whose button was clicked
    var data = document.getElementById(rowId).querySelectorAll(".row-data"); 
  /*returns array of all elements with 
  "row-data" class within the row with given id*/
 /*   var name = data[0].innerHTML;
    var email = data[1].innerHTML;
    var course = data[2].innerHTML;
    var session = data[3].innerHTML;
    alert("Name: " + name + "\nemail: " + email + "\ncourse: " + course + "\nsession: " + session);
 */
 }

</script>


</html>