<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*,java.util.*"%>
    <%@page import="javax.swing.*"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<title>Insert title here</title>
</head>
<body>


<% 


String otpno = (String)session.getAttribute("otpno");
String getotp = request.getParameter("getotp");
String password =(String)session.getAttribute("password");
String name = (String)session.getAttribute("name");
String email = (String)session.getAttribute("email");

System.out.println("otpno ==>>"+otpno);
System.out.println("getotp ==>>"+getotp);


if(otpno.equals(getotp))
{

System.out.println("password from update my profile ==>>"+password);

	try
	{
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/christ","root","1234");
	
	
	
	String sqlfetch = "update user set name='"+name+"', password='"+password+"' where email='"+email+"'";
	PreparedStatement stmt = con.prepareStatement(sqlfetch);
	
		int  rs = stmt.executeUpdate();
		if(rs>0)
		{
			System.out.println("record successfully updated !!");
			
			%>
			<jsp:forward page="Myprofile.jsp"/>
			
			<% 
		}
	
	}
	
		
		catch(Exception e)
		{
		  System.out.println("Error ==>>"+e);
		}
}
	

else{
	
	 JFrame f=new JFrame();  
	    JOptionPane.showMessageDialog(f,"OTP mismatched !! please check again !!");
%>
	 <jsp:forward page="Myprofile.jsp"/>
 
<% 
System.out.println("else part executed !!");

}

%>



</body>
</html>