<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="database.connection"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Candidate_reg DB</title>
</head>
<body>

<%
try	
 {
    StringBuffer buffer = new StringBuffer();
 	String characters = "abcdefghijklmnoABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890";
 	int charactersLength = characters.length();

	for (int i = 0; i < 6; i++) {
	double index = Math.random() * charactersLength;
	buffer.append(characters.charAt((int) index));
	}
	String user_key=buffer.toString();
	System.out.println("user_key="+user_key);
    String username=request.getParameter("username");
	String usermobile=request.getParameter("usermobile");
	String usermail=request.getParameter("usermail");
	String userpass=request.getParameter("userpass");
	String userconpass=request.getParameter("userconpass");
	String useraddress=request.getParameter("useraddress");
	System.out.println("username="+username);
	System.out.println("usermobile="+usermobile);
	System.out.println("usermail="+usermail);
	System.out.println("userpass="+userpass);
	System.out.println("userconpass="+userconpass);
	System.out.println("useraddress="+useraddress);
	Connection conn=connection.getConnection();
	String sql="insert into js_reg(username,usermobile,usermail,userconpass,useraddress,user_key) values(?,?,?,?,?,?)";
	PreparedStatement ps=conn.prepareStatement(sql);
	ps.setString(1, username);
	ps.setString(2, usermobile);
	ps.setString(3, usermail);
	ps.setString(4, userconpass); 
	ps.setString(5, useraddress);
	ps.setString(6,user_key); 
	ps.execute();
	response.sendRedirect("JS_login.jsp");
}
catch(Exception e)
{
	e.printStackTrace();
}
%>
</body>
</html>