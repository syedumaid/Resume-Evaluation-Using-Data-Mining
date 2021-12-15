<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="database.connection"%>
<%@page import="java.sql.Connection,java.util.List,java.util.ArrayList"%>
 <%@page import="database.connection"%>
<%@page import="java.sql.*"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.SQLException" %>
<!DOCTYPE html>
<html lang="en">

<head>

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

<body class="is-preload" style="background:url(img/back1.jpg)";>

<% String company_name=(String)session.getAttribute("company_name");
			
		session.setAttribute("company_name", company_name);
		%>
		
<%
ResultSet rs1=null;
 String username=(String)session.getAttribute("username");
String mail=request.getParameter("mail");
Connection con=connection.getConnection();
String query="SELECT * from trails where company_name='"+company_name+"'";
try {
	Statement st=con.createStatement();
	
	System.out.println("=====>"+query);
	rs1=st.executeQuery(query);
	
	
} catch (SQLException e) {
	// TODO Auto-generated catch block
	e.printStackTrace();
}
	
 %>

  <!-- Page Wrapper -->
 <header id="header">
				<h1><a class="logo" href="Index.html">A Resume Evaluation System Based on Text Mining</a></h1>

				</header>
<!-- Heading -->
			<div id="heading" >
				
				<center>  <h3>welcome <%= company_name%></h3></h3></center>
				<a href="HR_home.jsp">logout</a>
			
			</div>

		<!-- Main -->
			<section id="main" class="wrapper">
				<div class="inner">
					<div class="content">
					<div class="table-wrapper">
										 <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0" style="background-color:grey;color:black">
                  <thead>
                    <tr>
                      <th>Candidate Name</th>
                      <th>Mobile</th>
                      <th>Mail id</th>
                      <th>address</th>
                      <th>School name</th>
                      <th>CGPA_10</th>
                      <th>12_College name</th>
                      <th>CGPA_12</th>
                      <th>Branch</th>
                      <th>College name</th>
                      <th>CGPA_Graduation</th>
                      <th>Graduation branch</th>
                      <th>Year of passed out</th>
                      <th>Skills</th>
                      <th>Previous company</th>
                      <th>Pre_package</th>
                      <th>Expecting package</th>
                      <th>resume</th>
                      
                                          </tr>
                  </thead>
                  <tbody>


      <%
			Connection conn=connection.getConnection();
			String sql="SELECT * from trails where company_name='"+company_name+"'";
			PreparedStatement ps=conn.prepareStatement(query);
			ResultSet rs=ps.executeQuery();
		  while(rs.next())
			{ 
			  
				
				%>
				<tr><td><%=rs.getString(2) %></td>
				<td><%=rs.getString(3) %></td>
				<td><%=rs.getString(4) %></td>
				<td><%=rs.getString(5) %></td>
				<td><%=rs.getString(6) %></td>
				<td><%=rs.getString(7) %></td>
				<td><%=rs.getString(8) %></td>
				<td><%=rs.getString(9) %></td>
				<td><%=rs.getString(10) %></td>
				<td><%=rs.getString(11) %></td>
				<td><%=rs.getString(12) %></td>
				<td><%=rs.getString(13) %></td>
				<td><%=rs.getString(14) %></td>
				<td><%=rs.getString(15) %></td>
				<td><%=rs.getString(16) %></td>
				<td><%=rs.getString(17) %></td>
				<td><%=rs.getString(18) %></td>
				<td><%=rs.getString(19) %></td>
				
			 	<%-- <td><a href="AcceptHr_db.jsp?email=<%= rs.getString(3) %>">Accept</a></td> --%>
				
			
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
