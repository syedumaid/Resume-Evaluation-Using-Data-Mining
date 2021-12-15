<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
	String name=request.getParameter("name");
	String password=request.getParameter("password");
	System.out.println("name="+name);
	System.out.println("password="+password);
	if(name.equals("admin") && password.equals("admin"))
	{
		response.sendRedirect("Admin_panel.jsp");
	}
	else
	{
		response.sendRedirect("Admin_login.jsp");
	}
}
catch(Exception e)
{
	e.printStackTrace();
}
%>
</body>
</html>