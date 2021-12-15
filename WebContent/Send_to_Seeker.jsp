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
    
    String name=request.getParameter("name");
    String mobile=request.getParameter("mobile");
	String mail=request.getParameter("mail");
		
	System.out.println("name="+name);
	System.out.println("mobile="+mobile);
	System.out.println("mail="+mail);
	
	Connection conn=connection.getConnection();
	String sql="insert into send_data3 (name,mobile,mail) values(?,?,?)";
	PreparedStatement ps=conn.prepareStatement(sql);
	ps.setString(1, name);
	ps.setString(2, mobile);
	ps.setString(3, mail);

	ps.execute();
	response.sendRedirect("success2.jsp");

	
}
catch(Exception e)
{
	e.printStackTrace();
}
%>

</body>
</html>