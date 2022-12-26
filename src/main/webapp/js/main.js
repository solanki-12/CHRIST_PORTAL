/*********** CREATE ASSIGNMENT *******************/
function emptyField()
{
 var title = document.getElementById("exampleFormControlInput1");
 var description = document.getElementById("floatingTextarea2");
 if(title.value.length == 0 && description.value.length == 0 )
 {
	
		alert("Do not leave empty field");  	
         return false;
}	
	
}	

/***************** Date Time picker (Create Assignment)********************** */








/****** SIGNUP TOGGLE VALIDATION *****/
function teacherCheck() {
  var teacherChecked = document.getElementById("teacher");
  var studentChecked = document.getElementById("student");
  if(teacherChecked.checked){
  	 studentChecked.checked=false;
  teacherChecked=1;
  }
}

function studentCheck(){
  var teacherChecked = document.getElementById("teacher");
  var studentChecked = document.getElementById("student");
  if(studentChecked.checked){
     teacherChecked.checked=false;
  studentChecked=1; 
  }
  
  
}


/********* Signup Password And Repassword Check *************/
/*
function passRepass()
{
	var pass = document.getElementById("pass");
	var repass = document.getElementById("repass");
	if(pass != repass)
	{
		document.getElementById('newpass').innerText='Enter the password !!';
	}
	
}
*/




/******  Forgot pass validation ***********/

function passWordChecked()
{
	
var passd = document.getElementById("newpass");
var repassd = document.getElementById("repass");
var changepassd = document.getElementById("changepas");
if(passd.text!='' && repassd.text!='' && changepassd.checked==true)
{
	alert="('Password Changed !!')";
}
	var passd = document.getElementById("newpass");
	var repassd = document.getElementById("repass");
	
   if(passd!='' && repassd=='')
   {
		console.log('---inside pswd not provided----');
		document.getElementById('repass').innerText='Confirm password !!';
		return false;
   }else if(passd=='' && repassd!=''){
		console.log('---inside username not provided----');
		document.getElementById('newpass').innerText='Enter the password !!';
		return false;
   }



}


/*
/******  Forgot pass validation ***********/

/*
function checkValidation(event){

console.log('inside validation method');

let username = document.mySignInForm.your_name.value;
console.log('username==>'+username);
let pswd = document.mySignInForm.your_pass.value;
console.log('password==>'+pswd);

  if(username=='' && pswd==''){
		console.log('---inside username and pswd not provided----');
		document.getElementById('signInErrorDiv').innerText='Please provide username and password!!';
		return false;
   }
   else if(username!=='' && pswd=='')
   {
		console.log('---inside pswd not provided----');
		document.getElementById('signInErrorDiv').innerText='Password cannot be blank!!';
		return false;
   }else if(username=='' && pswd!=''){
		console.log('---inside username not provided----');
		document.getElementById('signInErrorDiv').innerText='Username cannot be blank!!';
		return false;
   }
   else
   {
	window.location.href = "http://localhost:8080/Christ/index.jsp";
	}
	/*
	document.forms[0].action="index.jsp";
	document.forms[0].method="post";
	document.forms[0].submit(); */
	 //return true;
     //window.location="/index.jsp";
    
	

