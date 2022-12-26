<%@page import="org.apache.commons.fileupload.servlet.*"%>
<%@page import="org.apache.commons.fileupload.*"%>
<%@page import="org.apache.commons.fileupload.disk.*"%>
<%@page import="java.io.File"%>
<%@page import="java.io.FileOutputStream"%>
<%@page import="java.util.List"%>

<%

   DiskFileItemFactory item_factory=new DiskFileItemFactory();
   
   ServletFileUpload file_upload=new ServletFileUpload(item_factory);
   
   List<FileItem> list_files = file_upload.parseRequest(request);
   
   FileItem item1=list_files.get(0);
   String name=new String(item1.get()); 
  
  
   FileItem item2=list_files.get(1);
    
   String file_name=item2.getName();
   long file_size=item2.getSize();
   String file_type= item2.getContentType();
   
   String root_directory=application.getRealPath("/");
   
   File f1=new File(root_directory+"//"+name);
   f1.mkdir();
 
   FileOutputStream fos=new FileOutputStream(root_directory+"//"+name+"//"+item2.getName());
   System.out.println("root directory==>>"+root_directory+"//"+name+"//"+item2.getName());
   fos.write(item2.get());
   
   session.setAttribute("filename",item2.getName());
   session.setAttribute("Username",name);
   
   System.out.println("Filename set attribute ==>>"+item2.getName());
   System.out.println("username set attribute ==>>"+name);
   
   
   session.setAttribute("x",name+"/"+item2.getName());
   
%>

<img src="<%=name%>/<%=item2.getName()%>" width="500px" height="500px">
<a href="Filedownload.jsp">click here to download</a>