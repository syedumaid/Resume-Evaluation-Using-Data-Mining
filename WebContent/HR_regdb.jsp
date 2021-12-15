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
<title>HR_reg DB</title>
</head>
<body>

<%
try	
 {
    /* StringBuffer buffer = new StringBuffer();
 	String characters = "abcdefghijklmnoABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890";
 	int charactersLength = characters.length();

	for (int i = 0; i < 6; i++) {
	double index = Math.random() * charactersLength;
	buffer.append(characters.charAt((int) index));
	}
	String hr_key=buffer.toString();
	System.out.println("hr_key="+hr_key); */
    String hr_name=request.getParameter("hr_name");
	String hr_mobile=request.getParameter("hr_mobile");
	String hr_mail=request.getParameter("hr_mail");
	String company_name=request.getParameter("company_name");
	String hr_pass=request.getParameter("hr_pass");
	String hr_conpass=request.getParameter("hr_conpass");
	String organization_address=request.getParameter("organization_address");
	System.out.println("hr_name="+hr_name);
	System.out.println("hr_mobile="+hr_mobile);
	System.out.println("hr_mail="+hr_mail);
	System.out.println("company_name="+company_name);
	System.out.println("hr_pass="+hr_pass);
	System.out.println("hr_conpass="+hr_conpass);
	System.out.println("organization_address="+organization_address);
	
	Connection conn=connection.getConnection();
	String sql="insert into hr_reg(hr_name,hr_mobile,hr_mail,company_name,hr_conpass,organization_address,status) values(?,?,?,?,?,?,'pending')";
	PreparedStatement ps=conn.prepareStatement(sql);
	ps.setString(1, hr_name);
	ps.setString(2, hr_mobile);
	ps.setString(3, hr_mail);
	ps.setString(4, company_name); 
	ps.setString(5, hr_conpass);
	ps.setString(6, organization_address);
	/* ps.setString(7,status);  */  

	ps.execute();
	response.sendRedirect("HR_reg.jsp");
}
catch(SQLException e)
{
	e.printStackTrace();
}
%>
</body>
</html>