<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.PreparedStatement"%>
<%@page import="database.connection"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%

	String hr_mail=request.getParameter("hr_mail");
	Connection con=connection.getConnection();
	try {
		Statement st=con.createStatement();
		int i=st.executeUpdate("update hr_reg set status='accepted' where hr_mail='"+hr_mail+"'");
		response.sendRedirect("Accepthr.jsp");
	} catch (Exception e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	
	
 %>

</body>
</html>