<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
</head>
<body>
<% 
    int x=0;
   String youremail = request.getParameter("your_email");
   String yourpass = request.getParameter("your_pass");
   session.setAttribute("useremail",youremail);
   
   String userStatus = "";
   
   System.out.println("yourname===>"+youremail);
   System.out.println("yourpass===>"+yourpass);
   
   Class.forName("com.mysql.cj.jdbc.Driver");
   Connection co = DriverManager.getConnection("jdbc:mysql://localhost:3306/christ","root","1234");
   
   Statement st=co.createStatement();
   
   ResultSet rs=st.executeQuery("select * from user");
   System.out.println("result==>"+rs);
   
   
   
    while(rs.next())
   {
    	String student = rs.getString("student");
    	String teacher = rs.getString("teacher");
      String youremailDb =rs.getString("email");
	  String yourpassDb =rs.getString("password");
	  String loginStatus = rs.getString("status");
	  System.out.println("login Status ==>>"+loginStatus);
	  
	  System.out.println("login status matched==>"+(loginStatus.equals("Approved")));
	  
	  if( yourpass.equals(yourpassDb) && youremail.equals(youremailDb)){
		   
		   if(loginStatus.equals("Approved")){
			x=1;
			userStatus=loginStatus;
			System.out.println("Redirect to Portal html");
			 if(student.equals("1"))
			 {
			 %>
			  <jsp:forward page="StudentPortal.jsp"/>
			 <%
			 }else if(teacher.equals("1"))
			 {
				 %>
				  <jsp:forward page="Portal.html"/>
				 <%
				 
			 }
		   }else{
			   userStatus = loginStatus;
			   System.out.println("User status is not approved");
		   }
	   }
	   
	}
     
	  
      if(x==0)
	   {
    	  if(userStatus==""){
    	 		 %>
    		      <jsp:forward page="Signup.html"/>
    			 <%
    	  }else{
    		  System.out.println("You do not have access right : "+userStatus);
 
    		  %>
		      <jsp:forward page="ProgressRequest.html"/>
			 <%
    		 
    	  }
       }
      
      
      
   %>
</body>
</html>