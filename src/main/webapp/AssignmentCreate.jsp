<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*,java.util.*"%>
    
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

   <title>Create Assignment</title>
    <!-- Font Icon -->
    <link rel="stylesheet" href="fonts/material-icon/css/material-design-iconic-font.min.css">
    <!-- CSS only -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">


    <!-- JavaScript Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

	<!-- Main css -->
    <link rel="stylesheet"  href="Portal.css">

    
    
<style>
    
    .container {
  padding: 16px;
  min-height: 100px;
  width: 700px;

}

/* Full-width input fields */
input[type=text], input[type=password] {
  width: 100%;
  padding: 15px;
  margin: 5px 0 22px 0;
  display: inline-block;
  border: none;
  background: #f1f1f1;
}



  .form-group
  {
    position: relative;
    margin-bottom: 25px;
    overflow: hidden; }
    .form-group:last-child {
      margin-bottom: 0px;

  }

.form-submit {
  display: inline-block;
  background: #6dabe4;
  color: #fff;
  border: none;
  width: auto;
  padding: 15px 39px;
  border-radius: 5px;
  -moz-border-radius: 5px;
  -webkit-border-radius: 5px;
  -o-border-radius: 5px;
  -ms-border-radius: 5px;
  margin-top: 25px;
  cursor: pointer;
  }

  .form-submit:hover {
    background: #4292dc; }

  .form-group {
    position: relative;
    margin-bottom: 20px;
    overflow: hidden; }

  .form-group:hover
  {
  	background: #fff;
  }

  .form-group:last-child {
      margin-bottom: 0px; }
      
      
  	
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
 <nav class="navbar navbar-expand-lg  navbar-dark bg-dark" >
	<div class="container">

		<div class="bg-dark">
			<img src="logo.jpg" class="logo" style="margin-left:-25%;"></img>
			<h5 class="text-white h1" style="padding:0% 0% 1% 1%; margin-left:-24%;">Christ</h5>
		<h2 style="font-size: 15px;margin-top: -8px;padding-bottom: -15px; margin-left:-23%;" class="text-white h1">(Deemed to be University)</h2>
		<div class="collapse navbar-collapse" id="navbarSupportedContent" style="margin: -30px 50px 5px 240px;padding-top: 0%;">
			<ul class="navbar-nav ms-auto mb-2 mb-lg-0">
				<li class="nav-item">
					<a class="nav-link active" aria-current="page" href="DashboardTeacher.jsp" style="margin-left:-139%;margin-top 14%; ">Dashboard</a>
				</li>
				<li class="nav-item dropdown">

					<a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false" style="margin-left:-30%;">
						Assignment
					</a>
					<ul class="dropdown-menu" aria-labelledby="navbarDropdown" >
						<li><a class="dropdown-item" href="AssignmentCreate.jsp">Create Assignment</a></li>
						<li><hr class="dropdown-divider"></li>
						<li><a class="dropdown-item" href="ModifyAssgn.jsp">Modify Assignment</a></li>
					</ul>
				</li>

				<li class="nav-item" id="report">
					<a class="nav-link active" aria-current="page" href="Report.jsp" style="margin-left:-44%;">Report</a>
				</li>
				<li class="nav-item" id="mprofile">
					<a class="nav-link active" aria-current="page" href="Myprofile.html" style="margin-left:-84%;">My Profile</a>
				</li>
				<li class="nav-item" id="home">
					<a class="nav-link active" href="Portal.html" style="argin-left: 138%;">Home</a>
				</li>
				
				<li class="nav-item" id="Signout">
					<a class="nav-link active" href="index.html" style="margin-left:165%; margin-top:10px;">Signout</a>
				</li>
				
				


			</ul>
		</div>
	</div>
</nav>
 
 
 

<div class="main">
<div class="content">
<div class="container" >
<button type="button" class="btn btn-lg btn-danger" data-toggle="popover" style="padding-top: 0px;
    margin-left: -113px;
    width: 134%;
    font-size: 28px;
    margin-top: -13px;
      border-radius: 13px;
      " onclick="location.href='ModifyAssgn.jsp';">Modify Assignment</button>

<form  method="POST" action="createAssgn.jsp" onclick="emptyField()" encType="multipart/form-data">
    <br><br><br>
    <label style="font-size:40px"> <b>Create Assignment</b></label><br><br><br>

    <div class="form-group">
        <label for="exampleFormControlInput1" style="font-size:25px;">Title</label>
        <input type="text" class="form-control" name ="title" id="exampleFormControlInput1" placeholder="Enter Title" style=" margin-left:3px; width:95%;">
    </div>
    
    <div class="form-group">
        <label for="exampleFormControlInput1" style="font-size:25px;">Subject</label>
        <input type="text" class="form-control" name ="subject" id="exampleFormControlInput1" placeholder="Enter Subject" style=" margin-left:3px; width:95%;">
    </div>

    <label style="font-size:25px">Description</label>
    <div class="form-floating">
        <textarea class="form-control" placeholder="Leave a comment here" name="comment" id="floatingTextarea2" style="height: 100px"></textarea>
      
	   <nav class="navbar navbar-light bg-light" style="width: 90%;">
	   
	   <button style="top: -12px;">
	    <img src="2x/Bold.png" width="20" height="20" >
	   </button>
	   <button style="margin-right: 86%;">
	    <img src="2x/italic.png" width="20" height="20" >
	   </button>
	   <button style="margin-right: -3%; margin-left: 18%; margin-top: -31px;">
	    <img src="2x/underline.png" width="20" height="20" >
	   </button>
	   <button style="margin-right: 67%; margin-left: 28%; margin-top: -31px;">
	    <img src="2x/formated.png" width="20" height="20" >
	   </button>
	   <button style="    margin-left: 38%; margin-top: -31px">
	    <img src="2x/formatclear.png" width="20" height="20" >
	   </button>
	  </nav>
	
	 </div>
	 <br>
	 
    
	<div class="input-group mb-3">
	    <input type="file" class="form-control" id="inputGroupFile02" name="file">
	    </div><br>
	
	<br>

	
	<div>
	<label for="birthdaytime" style="font-size:25px;  margin-bottom:5px;">Due Date:</label>
	  <input type="datetime-local" id="duedate" name="duedate" style="width: 26%;height: 35px; font-size:16px;">
	</div>
	
	
	
    <div class="form-group">
        <label for="exampleFormControlInput1" style="font-size:25px;margin-top: 23px;">Created by</label>
        <input type="text" class="form-control" name ="createdBy" id="exampleFormControlInput1" placeholder="Enter Name" style=" margin-left:3px; width:86%;margin-top: 14px;">
    </div>

	<span id="CourseList" style="font-size:25px;margin-top:23px" class="form-group">
		Course:
		<select  class="custom-select"  name="course" id="course" style="width: 27%; margin-left:2px; text-align:center; font-size: 16px;font-family: fangsong;">
		    <option value="None">--None--</option>
		    <option value="BCA">BCA</option>
		    <option value="BBA" >BBA</option>
		    <option value="LLB" >LLB</option>
		</select>
	</span> 
	
    <div class="form-group" >
       <input type="Submit" name="createbtn" id="createbtn" style="font-size:15px;" class="form-submit" value="Submit"/>
    </div>
    
</form>
</div>
</div>
</div>

<script src="main.js"></script>

</body>
</html>