<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
 pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="database.connection"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.io.File"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.FileOutputStream"%>
<%@page import="java.io.IOException"%>
<%@page import="java.io.InputStream"%>

<%@page import="java.io.* "%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Candidate_reg DB</title>
</head>
<body>

<%
/*  FileInputStream fIn=null; 
Connection conn = null;
PreparedStatement ps=null;

String myfile=request.getParameter("myfile");
File f=new File(upload);


String filepath=f.getAbsolutePath();
 */


try	

 {	
    String username=request.getParameter("username");
	String usermobile=request.getParameter("usermobile");
	String usermail=request.getParameter("usermail");
	String useraddress=request.getParameter("useraddress");
	String school_name=request.getParameter("school_name");
	String CGPA_10=request.getParameter("CGPA_10");
	String acadamy=request.getParameter("acadamy");
	String CGPA_12=request.getParameter("CGPA_12");
	String branch=request.getParameter("branch");
	String college_name=request.getParameter("college_name");
	String CGPA_graduation=request.getParameter("CGPA_graduation");
	String graduation_branch=request.getParameter("graduation_branch");
	String year=request.getParameter("year");
	String skills=request.getParameter("skills");
	String previous_company=request.getParameter("previous_company");
	String previous_package=request.getParameter("previous_package");
	String expecting_package=request.getParameter("expecting_package");
	Part myFile1= request.getPart("myFile");
	InputStream myfile=null,myfile1=null;
	if(myFile1 != null){
		myfile = myFile1.getInputStream();
	}
	/* InputStream inputStream = null;
    String filename;
    PrintWriter out=response.getWriter();
    File file = null;
    Part filePart = request.getPart("file");
    String ctype=filePart.getContentType();
    String email=(String)request.getSession().getAttribute("email"); */
   		 

/* 	if(myFile != null){
	
		myfile=myFile.getInputStream();
		
		myfile1=myFile.getInputStream();
		
	}
	String content=myFile.getContentType();
int j=0;
while((j=myFile.read())!=-1){
	text= text+(char) j;
}  */
	
	System.out.println("username="+username);
	System.out.println("usermobile="+usermobile);
	System.out.println("usermail="+usermail);
	System.out.println("useraddress="+useraddress);
	System.out.println("school_name="+school_name);
	System.out.println("CGPA_10="+CGPA_10);
	System.out.println("acadamy="+acadamy);
	System.out.println("CGPA_12="+CGPA_12);
	System.out.println("branch="+branch);
	System.out.println("college_name="+college_name);
	System.out.println("CGPA_graduation="+CGPA_graduation);
	System.out.println("graduation_branch="+graduation_branch);
	System.out.println("year="+year);
	System.out.println("skills="+skills);
	System.out.println("previous_company="+previous_company);
	System.out.println("previous_package="+previous_package);
	System.out.println("expecting_package="+expecting_package);
	System.out.println("myfile="+myfile);
	

	
	Connection conn=connection.getConnection();
	String sql="insert into js_profile values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
	PreparedStatement ps=conn.prepareStatement(sql);
	ps.setString(1, username);
	ps.setString(2, usermobile);
	ps.setString(3, usermail);
	ps.setString(4, useraddress); 
	ps.setString(5, school_name);
	ps.setString(6,CGPA_10); 
	ps.setString(7, acadamy);
	ps.setString(8, CGPA_12);
	ps.setString(9, branch);
	ps.setString(10, college_name); 
	ps.setString(11, CGPA_graduation);
	ps.setString(12, graduation_branch);
	ps.setString(13,year); 
	ps.setString(14, skills);
	ps.setString(15, previous_company);
	ps.setString(16, previous_package); 
	ps.setString(17, expecting_package);
	ps.setBinaryStream(18, myfile); 
	
	//ps.executeUpdate();
	response.sendRedirect("JS_home.jsp");
}
catch(Exception e)
{
	e.printStackTrace();
}
%>
</body>
</html>