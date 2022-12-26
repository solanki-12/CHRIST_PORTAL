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
	   <title>Report</title>
	   <!-- Font Icon -->
		<link rel="stylesheet" href="fonts/material-icon/css/material-design-iconic-font.min.css">
		
		<!-- CSS only -->
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
		<!-- JavaScript Bundle with Popper -->
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

		<script src="https://cdn.jsdelivr.net/npm/chart.js@3.7.1/dist/chart.min.js"></script>

<link rel="stylesheet"  href="Portal.css">

<style>
 .chartBox {
 	width:400px;
 	margin-left:-100px;
 	
 }
 .secondchartBox {
	width:700px;
	height:700px;
	margin-left:40%;
	margin-top:-40%;
 }
</style>


<meta charset="ISO-8859-1">
<title>Teacher Dashboard</title>

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
				<li class="nav-item">
					<a class="nav-link active" aria-current="page" id="dashboard" href="DashboardTeacher.jsp">Dashboard</a>
				</li>
				<li class="nav-item dropdown">

					<a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
						Assignment
					</a>
					<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
						<li><a class="dropdown-item" href="AssignmentCreate.jsp">Create Assignment</a></li>
						<li><hr class="dropdown-divider"></li>
						<li><a class="dropdown-item" href="ModifyAssgn.jsp">Modify Assignment</a></li>
					</ul>
				</li>

				<li class="nav-item" id="report">
					<a class="nav-link active" aria-current="page" href="Report.jsp" style="margin-left:-44%;">Report</a>
				</li>	
				<li class="nav-item" id="mprofile">
					<a class="nav-link active" aria-current="page" href="Myprofile.jsp" style="margin-left:-84%;">My Profile</a>
				</li>
				<li class="nav-item" id="home">
					<a class="nav-link active" href="Portal.html"  style="argin-left: 138%;">Home</a>
				</li>

				<li class="nav-item" id="Signout">
					<a class="nav-link active"  href="index.html" style="margin-left:165%; margin-top:10px;">Signout	
					</a>
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
<form  method="POST" action="DashboardTeacher.jsp" style="margin-left: 85px;">
    <br><br><br>
    
    <label style="font-size:40px" class="modify"><b>Dashboard</b></label><br><br><br>
    
    <div class="chartBox">
    	<canvas id="myChart"></canvas><br/>    
    	<label style="font-size:20px;margin-left:140px;"><b>Student Status</b></label><br><br><br>
	</div>

   
    <div class="secondchartBox">
    	<canvas id="myChartAsg"></canvas><br/>
    	<label style="font-size:20px;margin-left:240px;"><b>Assignments Subject Wise</b></label><br><br><br>    
	</div>
    

<% 

Class.forName("com.mysql.cj.jdbc.Driver");
Connection co = DriverManager.getConnection("jdbc:mysql://localhost:3306/christ","root","1234");

Statement st=co.createStatement();

//For first Chart
ResultSet rs=st.executeQuery("select * from user");
System.out.println("result==>"+rs);

int approvedStudents = 0;
int inprogressStudnets = 0;
int rejectedStudents = 0;

 while(rs.next())
{
	  String dbStatus =rs.getString("status");
	  System.out.println("dbStatus====>"+dbStatus);
	  String isStudent = rs.getString("teacher");
	  System.out.println("isStudent===>"+(isStudent.equals("0")));
	  
	  if(dbStatus.equals("Approved") && isStudent.equals("0")){
		  System.out.println("---inside approved if----");
		  approvedStudents=approvedStudents+1;	  
	  }
	  else if(dbStatus.equals("In-Progress") && isStudent.equals("0")){
		  System.out.println("---inside in-progress if----");
		  inprogressStudnets=inprogressStudnets+1;
	  }
	  else if(dbStatus.equals("Rejected") && isStudent.equals("0")){
		  System.out.println("---inside rejected if----");
		  rejectedStudents=rejectedStudents+1;
	  }
	  
}

 System.out.println("Total Approved Students===>"+approvedStudents);
 System.out.println("Total In Progress Student==>"+inprogressStudnets);
 System.out.println("Total Rejected Student==>"+rejectedStudents);
 
%>

<%

Class.forName("com.mysql.cj.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/christ","root","1234");

Statement stt=con.createStatement();

//For Second Chart
ResultSet rs1=stt.executeQuery("select * from assignment");
System.out.println("rs1 ====>"+rs1);
Map map = new HashMap();

while(rs1.next())
{
	  String dbSubject =rs1.getString("Subject");
	  System.out.println("dbSubject====>"+dbSubject);
	  if(map.containsKey(dbSubject)){
		  map.put(dbSubject, (int)map.get(dbSubject)+1);
	  }else{
   	  map.put(dbSubject,1);
	  }
}

System.out.println("resul of subjects ===>"+map);

%>


</form>
</div>
</body>

<script>
const ctx = document.getElementById('myChart').getContext('2d');
var approvedStudents = "<%=approvedStudents%>";
var inprogressStudnets = "<%=inprogressStudnets%>";
var rejectedStudents = "<%=rejectedStudents%>";
const myChart = new Chart(ctx, {
    type: 'doughnut',
    data: {
        labels: ['Approved Students', 'In-Progress Students', 'Rejected Students'],
        datasets: [{
        	label: '# of Votes',
            data: [approvedStudents, inprogressStudnets, rejectedStudents],
            backgroundColor: [
                'rgba(255, 99, 132, 0.2)',
                'rgba(54, 162, 235, 0.2)',
                'rgba(255, 206, 86, 0.2)',
            ],
            borderColor: [
                'rgba(255, 99, 132, 1)',
                'rgba(54, 162, 235, 1)',
                'rgba(255, 206, 86, 1)',
                'rgba(75, 192, 192, 1)',
                'rgba(153, 102, 255, 1)',
                'rgba(255, 159, 64, 1)'
            ],
            borderWidth: 1
        }]
    },
    options: {
        scales: {
            y: {
                beginAtZero: true
            }
        }
    }
});


var mapKeys = "<%=map.keySet()%>";
console.log("mapKeys===>"+mapKeys);

var mapKeysArray = mapKeys.split(",");
console.log("mapKeysArray===>"+mapKeysArray);

const ctx2 = document.getElementById('myChartAsg').getContext('2d');
const myChart2 = new Chart(ctx2, {
    type: 'bar',
    data: {
        labels: mapKeysArray,
        datasets: [{
        	label: 'Assignment No.',
            data: <%=map.values()%>,
            backgroundColor: [
                'rgba(255, 99, 132, 0.2)',
                'rgba(54, 162, 235, 0.2)',
                'rgba(255, 206, 86, 0.2)',
            ],
            borderColor: [
                'rgba(255, 99, 132, 1)',
                'rgba(54, 162, 235, 1)',
                'rgba(255, 206, 86, 1)',
                'rgba(75, 192, 192, 1)',
                'rgba(153, 102, 255, 1)',
                'rgba(255, 159, 64, 1)'
            ],
            borderWidth: 1
        }]
    },
    options: {
        scales: {
            y: {
                beginAtZero: true
            }
        }
    }
});


</script>

<div class="progress">
  <div class="progress-bar bg-info" role="progressbar" style="width: 30%" aria-valuenow="15" aria-valuemin="0" aria-valuemax="100"></div>
  <div class="progress-bar bg-warning" role="progressbar" style="width: 41%" aria-valuenow="30" aria-valuemin="0" aria-valuemax="100"></div>
  <div class="progress-bar bg-danger" role="progressbar" style="width: 30%" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100"></div>
</div>

</html>