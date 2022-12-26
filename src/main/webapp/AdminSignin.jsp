<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
</head>
<body>
<% 
    int x=0;
   
   String email = request.getParameter("admin_email");
   String pass = request.getParameter("admin_pass");
   session.setAttribute("admin_email",email);
   
   
   
   System.out.println("admin email===>"+email);
   System.out.println("admin pass===>"+pass);
   
   Class.forName("com.mysql.cj.jdbc.Driver");
   Connection co = DriverManager.getConnection("jdbc:mysql://localhost:3306/christ","root","1234");
   
   Statement st=co.createStatement();
   
   ResultSet rs=st.executeQuery("select * from admin");
   System.out.println("result==>"+rs);
   
   
   
    while(rs.next())
   {
	  String emailDb =rs.getString("admin_email");
	  String passDb =rs.getString("admin_pass");
	  
	  
	  if( pass.equals(passDb) && email.equals(emailDb))
	  {
		  x=1;
			System.out.println("Redirect to Portal html");
			 %>
			  <jsp:forward page="AdminPortal.jsp"/>
			 <% 
	}
	   
	   
	}
     
	  
      if(x==0)
	   {
    	  	    System.out.println("Details is incorrect : !!!!");
    	}
      
   %>
</body>
</html>