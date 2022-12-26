<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
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
</head>

<body>

<nav class="navbar navbar-expand-lg  navbar-dark bg-dark">
	<div class="container">

		<div class="bg-dark">
			<img src="logo.jpg" class="logo" ></img>
			<h5 class="text-white h1" style="padding:0% 0% 1% 1%">Christ</h5>
		<h2 style="font-size: 15px;margin-top: -8px;padding-bottom: -15px;" class="text-white h1">(Deemed to be University)</h2>
		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav ms-auto mb-2 mb-lg-0">
				<li class="nav-item dropdown">

					<a class="nav-link dropdown-toggle"  href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
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
<div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel">
	<div class="carousel-indicators">
		<button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
		<button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
		<button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
	</div>
	<div class="carousel-inner">
		<div class="carousel-item active" class="bs-slider-overlay">
			<img src="boy1.jpg" class="d-block w-100" id="boy-blur" alt="Bootstrap Touch Slider" class="sliding-image">
		</div>
		<div class="carousel-item">
			<img src="girlimg.jpg" class="d-block w-100" id="blur-girl" alt="..." style="
    margin-top: -8px;
">
			<div class="top-centered">Vision is the art of seeing,</br>
				what is invisible.</br>
				-Jonatha Swift
			</div>
		</div>
		<div class="carousel-item">
			<img src="girlimg2.jpg" class="d-block w-100" id="girl-blur" alt="Girl">
			<div class="centered">The mind is not a vessel to be filled,</br>
				 but a fire to be kindled.</br>
			     -Plutarch</div>
		</div>
	</div>
	<button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
		<span class="carousel-control-prev-icon" aria-hidden="true"></span>
		<span class="visually-hidden">Previous</span>
	</button>
	<button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
		<span class="carousel-control-next-icon" aria-hidden="true"></span>
		<span class="visually-hidden">Next</span>
	</button>
</div>




<div class="progress">
  <div class="progress-bar bg-info" role="progressbar" style="width: 30%" aria-valuenow="15" aria-valuemin="0" aria-valuemax="100"></div>
  <div class="progress-bar bg-warning" role="progressbar" style="width: 41%" aria-valuenow="30" aria-valuemin="0" aria-valuemax="100"></div>
  <div class="progress-bar bg-danger" role="progressbar" style="width: 30%" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100"></div>
</div>
<section class="section" id="feedback">
	<div class="container text-center">
		<h6 class="display-4 has-line" style="font-weight: bold; margin-top:-5%;">FEEDBACK</h6>
		<p class="mb-5 pb-2" style=" FONT-STYLE: initial;">Kindly share your helpful feedback!!!</p>


	<div>
		<form>
			<div class="row mb-4">
				<div class="col-md-6">
					<div class="form-group pb-1">
						<input type="text" class="form-control" style="margin-left: 59%; " required placeholder="Name">
					</div>
					<div class="form-group pb-1">
						<input type="email" class="form-control" required placeholder="Email" style="margin-left: 59%;margin-top:2%;">
					</div>
				</div>
				<div class="col-md-6">
					<textarea name="" id="" cols="" rows="7" class="form-control" required placeholder="Message" style="margin-top: 25%; margin-left: -51%"></textarea>
				</div>
			</div>
			<input type="submit" class="btn btn-primary btn-block" value="Send Message">
		</form>
	</div>
</section>

<!-- JS -->
<script src="vendor/jquery/jquery.min.js"></script>
<script src="js/main.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>


</body>
</html>