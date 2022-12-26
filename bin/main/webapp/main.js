/******     SIGNUP TOGGLE VALIDATION       *****/
function teacherCheck() {
	console.log("inside techer");
  var teacherChecked = document.getElementById("teacher");
  var studentChecked = document.getElementById("student");
  if(teacherChecked.checked){
  	 studentChecked.checked=false;
	 document.getElementById("CourseList").style.display = "none";
	 document.getElementById("SessionList").style.display ="none";
  }
}
function studentCheck(){
		console.log("inside student");
  var teacherChecked = document.getElementById("teacher");
  var studentChecked = document.getElementById("student");
  if(studentChecked.checked){
     teacherChecked.checked=false;
     document.getElementById("CourseList").style.display = "block";
	 document.getElementById("SessionList").style.display ="block";
  } 
  else if(!studentChecked.checked){
     document.getElementById("CourseList").style.display = "none";
	 document.getElementById("SessionList").style.display ="none";		
	}
}

/******     SIGNUP TOGGLE VALIDATION       *****/

/***SIGNUP EMAIL Validation****/
function validateEmail(){
	
	var emailVal = document.getElementById("email");
	console.log("email value===>"+email);
	var mailformat = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/;
	if(emailVal.value.match(mailformat))
	{
		console.log("Valid email address!");
		document.registerform.email.focus();
		return true;
	}
	else
	{
		console.log("You have entered an invalid email address!");
		document.registerform.email.focus();
		return false;
	}
}
/***SIGNUP EMAIL Validation****/


function hideElements(){
	console.log("inside hideElement function");
	document.getElementById("CourseList").style.display ="none";
	document.getElementById("SessionList").style.display ="none";	
}


/***************** My Profile (pass visible validation)************************ */
function myFunction() {
  var x = document.getElementById("password");
  if (x.type === "password") {
    x.type = "text";
  } else {
    x.type = "password";
  }
}
