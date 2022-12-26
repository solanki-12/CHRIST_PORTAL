<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
 
<!DOCTYPE html>
<html>
<head>

<meta charset="ISO-8859-1">
<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta http-equiv="X-UA-Compatible" content="ie=edge">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<title>Christ Portal</title>
	<!-- Font Icon -->
	<link rel="stylesheet" href="fonts/material-icon/css/material-design-iconic-font.min.css">

	<!-- Main css -->
	<link rel="stylesheet"  href="Portal.css">
	
	
	
<style>
	
.main{
	padding-top:30px;
	padding-bottom: 20px;
  font-size: 13px;
  line-height: 1.8;
  color: #222;
  background: #f8f8f8;
  font-weight: 400;
  font-family: Poppins; }

.content {
  width: 900px;
  background: #fff;
  margin: 0 auto;
  box-shadow: 0px 15px 16.83px 0.17px rgba(0, 0, 0, 0.05);
  -moz-box-shadow: 0px 15px 16.83px 0.17px rgba(0, 0, 0, 0.05);
  -webkit-box-shadow: 0px 15px 16.83px 0.17px rgba(0, 0, 0, 0.05);
  -o-box-shadow: 0px 15px 16.83px 0.17px rgba(0, 0, 0, 0.05);
  -ms-box-shadow: 0px 15px 16.83px 0.17px rgba(0, 0, 0, 0.05);
  border-radius: 20px;
  -moz-border-radius: 20px;
  -webkit-border-radius: 20px;
  -o-border-radius: 20px;
  -ms-border-radius: 20px; }

</style>	

</head>
<body>

<% 


String email = (String)session.getAttribute("useremail");
 String passwordb=null;
 String namedb=null;
  
 System.out.println("session email"+email);
   
 Class.forName("com.mysql.cj.jdbc.Driver");
 Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/christ","root","1234");
 Statement st=con.createStatement();
 ResultSet rs=st.executeQuery("select name, password FROM user where email = '"+email+"'");

   	
while(rs.next()){
   //Display values
   namedb =rs.getString("name");
   passwordb = rs.getString("password");
   System.out.println("password from database"+passwordb);
   
}
	         
rs.close();
	   	   
%>



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
					<a class="nav-link active" aria-current="page" href="StudentMyProfile.jsp">My Profile</a>
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
</nav>


<div class="main">
<div class="content">

<div class="progress">
  <div class="progress-bar bg-info" role="progressbar" style="width: 30%" aria-valuenow="15" aria-valuemin="0" aria-valuemax="100"></div>
  <div class="progress-bar bg-warning" role="progressbar" style="width: 41%" aria-valuenow="30" aria-valuemin="0" aria-valuemax="100"></div>
  <div class="progress-bar bg-danger" role="progressbar" style="width: 30%" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100"></div>
</div>
<form method="POST" action="Myprofile.jsp">
<div>
<img src="https://d29fhpw069ctt2.cloudfront.net/icon/image/37746/preview.svg" class="rounded float-center" alt="userprofile" width="120" height="120" style="margin-left: 30%; margin-top: 20px"><br><br>
<img src="2x/imagephoto.png" class="logo" style= "margin-left: 27%; margin-top: -70px; width: 44px; height: 43px;">
</div>        
	 <div class="row">
	 <div class="col">
	<input type="text" name="name" class="form-control" placeholder="Name" aria-label="First name" style="
	width: 325px; margin-left: 34%; margin-top: 7px;" value="<%=namedb%>" readonly>
	<button type="button" class="btn btn-primary" style="margin-left: 71%; margin-top: -7%" >Edit</button>
	 
	</div>
	  
      
      
	<div class="row mb-3">
	<input type="email" name="email" class="form-control" id="colFormLabel" placeholder="email" style=" width: 36.5%; margin-left: 37%;  margin-top:5%;" value="<%=email%>" readonly><div class="col-sm-10" >
	<button type="button" class="btn btn-primary" style="margin-left: 92%; margin-top: -9%;">Edit</button>
	</div>
	</div>
 
	<div class="col-md-6">
	<input type="password" name="Passwd" class="form-control" placeholder="Password" id="password" name="password" style="width: 78%; margin-left: 72%; margin-top:6%;" value="<%=passwordb%>" readonly>
	<button type="button" class="btn btn-primary" style="margin-left: 151%; margin-top: -15%;">Edit</button>
	
	<input type="checkbox" onclick="myFunction()" style="margin-left:72%; margin-top:3%;">Show Password
	
	</div>
  
<button type="submit" class="btn btn-primary" style="margin-left: -3%;  margin-top: 120px;width: 8%; margin-bottom:2%;">Update</button>
</form>
</div>

</div>


<!-- JS -->
<script src="vendor/jquery/jquery.min.js"></script>
<script src="main.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>

<script>
function myFunction() {
  var x = document.getElementById("password");
  if (x.type === "password") {
    x.type = "text";
  } else {
    x.type = "password";
  }
}
</script>





</body>


</html>