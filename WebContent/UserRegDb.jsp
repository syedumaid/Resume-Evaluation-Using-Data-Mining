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
    String name=request.getParameter("name");
	String email=request.getParameter("email");
	String mobile=request.getParameter("mobile");
	String city=request.getParameter("city");
	String password=request.getParameter("password");
	String cpassword=request.getParameter("cpassword");
	String gender=request.getParameter("gender");
	System.out.println("name="+name);
	System.out.println("email="+email);
	System.out.println("mobile="+mobile);
	System.out.println("city="+city);
	System.out.println("password="+password);
	System.out.println("cpassword="+cpassword);
	Connection conn=connection.getConnection();
	String sql="insert into js_reg(name,email,mobile,city,cpassword,gender) values(0,?,?,?,?,?,?)";
	PreparedStatement ps=conn.prepareStatement(sql);
	ps.setString(1, name);
	ps.setString(2, email);
	ps.setString(3, mobile);
	ps.setString(4, city); 
	ps.setString(5, cpassword);
	ps.setString(6,gender); 
	ps.execute();
	response.sendRedirect("UserRegister.jsp");
}
catch(Exception e)
{
	e.printStackTrace();
}
%>
</body>
</html>