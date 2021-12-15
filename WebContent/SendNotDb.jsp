<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.PreparedStatement"%>
<%@page import="database.connection"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.SQLException" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
try	
 {
	int com_id=Integer.parseInt(request.getParameter("com_id"));
	String company_name=request.getParameter("company_name");
	String role=request.getParameter("role");
	String skills=request.getParameter("skills");
	String mail=request.getParameter("mail");
	String no_requirements=request.getParameter("no_requirements");
	
	System.out.println("com_id="+com_id);
	System.out.println("company_name="+company_name);
	System.out.println("role="+role);
	System.out.println("skills="+skills);
	System.out.println("mail="+mail);
	System.out.println("no_requirements="+no_requirements);
	
		
	Connection conn=connection.getConnection();
	String sql="insert into notification(com_id,company_name,role,skills,mail,no_requirements) values(?,?,?,?,?,?)";
	PreparedStatement ps=conn.prepareStatement(sql);
	ps.setInt(1, com_id);
	ps.setString(2, company_name);
	ps.setString(3, role);
	ps.setString(4, skills);
	ps.setString(5, mail);
	ps.setString(6,no_requirements);
	

	ps.execute();
	response.sendRedirect("SendNoti.jsp");
}
catch(SQLException e)
{
	e.printStackTrace();
}
%>


</body>
</html>