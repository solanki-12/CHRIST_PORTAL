/*
function teacherCheck() {
	console.log("inside techer");
  var teacherChecked = document.getElementById("teacher");
  var studentChecked = document.getElementById("student");
  if(teacherChecked.checked){
  	 studentChecked.checked=false;
  }
}
function studentCheck(){
		console.log("inside student");
  var teacherChecked = document.getElementById("teacher");
  var studentChecked = document.getElementById("student");
  if(studentChecked.checked){
     teacherChecked.checked=false;
  } 
}

function ValidateEmail()
{
var email = document.getElementById("email");	
var mailformat = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/;

if(email.value.match(mailformat))
{

alert("Valid email address!");
document.registerform.email.focus();
return true;
}
else
{
alert("You have entered an invalid email address!");
document.registerform.email.focus();
return false;
}
}

function myFunction() {
  var x = document.getElementById("password");
  if (x.type === "password") {
    x.type = "text";
  } else {
    x.type = "password";
  }
}

*/