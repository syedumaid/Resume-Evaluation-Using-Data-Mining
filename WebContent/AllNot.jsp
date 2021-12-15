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
	<% String company_name=(String)session.getAttribute("company_name");
			
		session.setAttribute("company_name", company_name);
		%>

		<!-- Header -->
			<header id="header">
				<a class="logo" href="adminhome.jsp">A Resume Evaluation System Based on Text Mining</a>
				<!-- <nav>
					<a href="#menu">Menu</a>
				</nav> -->
			</header>

		<!-- Nav -->
		<!-- <nav id="menu">
				<ul class="links">
					<li><a href="adminhome.jsp">Home</a></li>
					<li><a href="acceptusers.jsp">Accept Users</a></li>
					<li><a href="allusers.jsp">Active Users</a></li>
					<li><a href="addcsp.jsp">Add CSP</a></li>
					<li><a href="allcsp.jsp">View CSP</a></li>
					<li><a href="ActivityGraph.jsp">User Activity Graph</a></li>
					<li><a href="RatingGraph.jsp">User Rating Graph</a></li>
					<li><a href="RecommendedGraph.jsp">User Recommendation Graph</a></li>
					<li><a href="index.html">Logout</a></li>
				</ul>
			</nav> -->
		<!-- Heading -->
			<div id="heading" >
				<h1>All Notifications</h1>
				<h2><%= company_name%></h2>
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
													<th>Email</th>
													<th>No.of Requirements</th>
													<th>Delete</th>
												</tr>
											</thead>
											<tbody>
											
											
												 <%
			Connection conn=connection.getConnection();
			String sql="SELECT * from notification where company_name='"+company_name+"'";
			PreparedStatement ps=conn.prepareStatement(sql);
			ResultSet rs=ps.executeQuery();
		  while(rs.next())
			{ 
			  				
				%>
				<tr><td><%=rs.getString("com_id") %></td>
				<td><%=rs.getString("company_name") %></td>
				<td><%=rs.getString("role") %></td>
				<td><%=rs.getString("mail") %></td>
				<td><%=rs.getString("no_requirements") %></td>
				<td><a href="DeleteCom.jsp?mail=<%= rs.getString("com_id") %>">Delete</a></td>
				
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