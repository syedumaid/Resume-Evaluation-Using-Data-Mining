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
		
  <!-- Custom fonts for this template -->
  <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

  <!-- Custom styles for this template -->
  <link href="css/sb-admin-2.min.css" rel="stylesheet">

  <!-- Custom styles for this page -->
  <link href="vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">
	</head>
	<body class="is-preload" style="background:url(img/back1.jpg)";>
	<a class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger" href="Index.html">logout</a>
<% String username=(String)session.getAttribute("username");

	
		session.setAttribute("username", username);
		%>

		<!-- Header -->
			<header id="header">
				<h1><a class="logo" href="Index.html">A Resume Evaluation System Based on Text Mining</a></h1>

				</header>
<!-- Heading -->
			<div id="heading" >
				
				<center> <h3>welcome <%= username%></h3></center>
			
			</div>

		<!-- Main -->
			<section id="main" class="wrapper">
				<div class="inner">
					<div class="content">
					<div class="table-wrapper">
										 <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0" style="background-color:grey;color:black">
											<thead>
												<tr>
													<th>Company ID</th>
													<th>Company Name</th>
													<th>Role</th>
													<th>Skills</th>
													<th>Email</th>
													<th>No.of Requirements</th>
													<th>Apply</th>
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
				<td><a href="trail.jsp?username=<%= session.getAttribute("username") %>&&company_name=<%=rs.getString("company_name")%>">Apply</a></td>
				
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

		

	</body>
</html>