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
		<title>User Register</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<meta name="description" content="" />
		<meta name="keywords" content="" />
		<link rel="stylesheet" href="css/main1.css" />
	</head>
	<body class="is-preload">
	<% String company_name=(String)session.getAttribute("company_name");
			
		session.setAttribute("company_name", company_name);
		%>

		<!-- Header -->
			<header id="header">
				<a class="logo" href="Index.html">A Resume Evaluation System Based on Text Mining</a>
				<nav>
					<a href="#menu">Menu</a>
				</nav>
			</header>

		<!-- Nav -->
		<nav id="menu">
				<ul class="links">
				<li><a href="SendNoti.jsp">Home</a></li>
					<li><a href="SendNoti.jsp">Add Notifications</a></li>
					<li><a href="AllNot.jsp">View notifications</a></li>
					<li><a href="Index.html">Logout</a></li>
				</ul>
			</nav>

		<!-- Banner -->
			<section id="banner">
				<div class="inner">
				<BR><BR><BR>
				
					<h3>Add Requirements</h3>
									<form method="post" action="SendNotDb.jsp">
										<div class="row gtr-uniform">
										<div class="col-6 col-12-xsmall">
												<input type="text" name="com_id" id="password" value="" placeholder="Company Id"  required="required"/>
											</div>
										
											<div class="col-6 col-12-xsmall">
												<input type="text" name="company_name"  value="<%= company_name%>" placeholder="Company name"  required="required" />
											</div>
												<div class="col-6 col-12-xsmall">
												<input type="text" name="role"  value="" placeholder="Role" required="required" />
											</div>
											<div class="col-6 col-12-xsmall">
												<input type="text" name="skills"  value="" placeholder="skills" required="required" />
											</div>
											
												<div class="col-6 col-12-xsmall">
												<input type="text" name="mail"  value="" placeholder="mail_id" required="required" />
											</div>
											<div class="col-6 col-12-xsmall">
												<input type="text" name="no_requirements"  value="" placeholder="No.of requirements"  required="required"/>
											</div></div><br>
										 																
												
																		
											<div class="col-6 col-12-xsmall">
												<input type="submit" value="Submit Form" class="primary" />
											</div>
											<div class="col-6 col-12-xsmall">
												<input type="reset" value="Reset" />
											</div>
										
										</div>
									</form>
				</div>
			<!-- 	<video autoplay loop muted playsinline src="img/res3.jpg"></video> -->
			</section>

		

		<!-- Scripts -->
			<script src="js/jquery.min.js"></script>
			<script src="js/browser.min.js"></script>
			<script src="js/breakpoints.min.js"></script>
			<script src="js/util.js"></script>
			<script src="js/main.js"></script>

	</body>
</html>