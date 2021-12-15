<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="database.connection"%>
<%@page import="java.sql.Connection"%>
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
	String company_name=request.getParameter("company_name");
	String hr_conpass=request.getParameter("hr_conpass");
	System.out.println("company_name="+company_name);
	System.out.println("hr_conpass="+hr_conpass);
	Connection conn=connection.getConnection();
	String sql1="select * from hr_reg where company_name=? and hr_conpass=? and status=?";
	//String sql="SELECT hr_name,hr_conpass FROM hr_reg WHERE STATUS ='accepted'";
	PreparedStatement ps=conn.prepareStatement(sql1);
	ps.setString(1, company_name);
	ps.setString(2, hr_conpass);
	ps.setString(3,"accepted");
	ResultSet rs=ps.executeQuery();
	
	if(rs.next())
	{
		
	session.setAttribute("company_name", company_name);
		session.setAttribute("hr_conpass", hr_conpass); 
		response.sendRedirect("HR_home.jsp");		
	}
	else
	{
		%>
		<script type="text/javascript">
		alert("name or pass is incorrect...");				
		window.location="Hr_login.jsp";
		</script>
		<%
	}
}
catch(Exception e)
{
	e.printStackTrace();
}
%>
</body>
</html>