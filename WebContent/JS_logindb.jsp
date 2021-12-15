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
HttpSession h=request.getSession();

%>
<%
try
{
	String username=request.getParameter("username");
	h.setAttribute("username", username);
	String userconpass=request.getParameter("userconpass");
	System.out.println("username="+username);
	System.out.println("userconpass="+userconpass);
	Connection conn=connection.getConnection();
	String sql="select * from js_reg where username=? and userconpass=?";
	PreparedStatement ps=conn.prepareStatement(sql);
	ps.setString(1, username);
	ps.setString(2, userconpass);
	ResultSet rs=ps.executeQuery();
	
	if(rs.next())
	{
		String user_id=rs.getString("user_id");
		System.out.println("user_id="+user_id);
		String user_key=rs.getString("user_key");
		application.setAttribute("user_key",user_key);
		session.setAttribute("username", username);
		session.setAttribute("user_id", user_id);
		response.sendRedirect("JS_home.jsp");		
	}
	else
	{
		%>
		<script type="text/javascript">
		alert("name or pass is incorrect...");				
		window.location="JS_login.jsp";
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