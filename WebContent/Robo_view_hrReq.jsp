<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="database.connection"%>
<%@page import="java.sql.Connection,java.util.List,java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE HTML>
<!--
	Industrious by TEMPLATED
	templated.co @templatedco
	Released for free under the Creative Commons Attribution 3.0 license (templated.co/license)
-->
<html>
	<head>
		<title>HR_View Notifications</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<meta name="description" content="" />
		<meta name="keywords" content="" />
		<link rel="stylesheet" href="css/main.css" />
	</head>
	<body class="is-preload">

		<!-- Header -->
			<header id="header">
				<a class="logo" href="adminhome.jsp">A Resume Evaluation System Based on Text Mining</a>
				<!-- <nav>
					<a href="#menu">Menu</a>
				</nav> -->
			</header>

		<!-- Heading -->
			<div id="heading" >
				<h1>All Notifications</h1>
			</div>

		<!-- Main -->
			<section id="main" class="wrapper">
				<div class="inner">
					<div class="content">
					<div class="table-wrapper">
										<table>
											<thead>
												<tr>
													<th>Company ID</th>
													<th>Company Name</th>
													<th>Role</th>
													<th>Skills</th>
													<th>Email</th>
													<th>No.of Requirements</th>
													
												</tr>
											</thead>
											<tbody>
											
											
												 <%
			Connection conn=connection.getConnection();
			String sql="SELECT * from notification";
			PreparedStatement ps=conn.prepareStatement(sql);
			ResultSet rs=ps.executeQuery();
		  while(rs.next())
			{ 
			  				
				%>
				<tr><td><%=rs.getString("com_id") %></td>
				<td><%=rs.getString("company_name") %></td>
				<td><%=rs.getString("role") %></td>
				<td><%=rs.getString("skills") %></td>
				<td><%=rs.getString("mail") %></td>
				<td><%=rs.getString("no_requirements") %></td>
				
				
			 					</tr>
				<%
			}
		
			%>	
												 
											</tbody>
										
										</table>
									</div>
					</div>
				</div>
			</section>

		
		<!-- Scripts -->
			<script src="js/jquery.min.js"></script>
			<script src="js/browser.min.js"></script>
			<script src="js/breakpoints.min.js"></script>
			<script src="js/util.js"></script>
			<script src="js/main.js"></script>

	</body>
</html>