<%@page import="java.nio.file.Files"%>
<%@page import="java.nio.file.Path" import="org.apache.log4j.Logger" import="org.apache.log4j.MDC" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="StyleSheet" href="css/w3.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<title>Insert title here</title>
</head>
<body class="w3-animate-zoom" style="background:gray";>
<!-- Navigation bar -->
<div class="w3-bar w3-bar w3-light-grey w3-card-2" style="width:100%;">
<a href="#" class="w3-bar-item w3-button w3-red w3-mobile w3-padding-large"><i class="fa fa-bed w3-margin-right"></i>Here the Logo</a>
  <!-- a href="ViewProfile.jsp" class="w3-bar-item w3-button w3-padding-large">View Profile</a> 
   <a href="userhome.jsp" class="w3-bar-item w3-button w3-padding-large">Back to home</a>
    <a href="Searching?skilltype=Exclude&&txt_skills=''&&admin=no" class="w3-bar-item w3-button w3-padding-large">Search profiles</a>  -->

  <a href="Index.html" class="w3-bar-item w3-button w3-red w3-right w3-mobile w3-padding-large">logout</a>
<a href="#" class="w3-bar-item w3-button w3-right w3-padding-large">Settings</a> 
</div>
<!-- End Navigation bar --> 
<%@ page import="java.io.*" import="java.sql.*" import="org.apache.poi.xwpf.extractor.XWPFWordExtractor" import="org.apache.poi.xwpf.usermodel.*" import="java.util.List" %>
<%

final int BUFFER_SIZE = 4096;  
String url = "jdbc:mysql://localhost:3306/vtjdm01_2019";
   String user = "root";
   String password = "root";
   String filePath = "temp.docx";
	File f=new File(filePath);
   try {
   	Class.forName("com.mysql.jdbc.Driver");
       Connection conn = DriverManager.getConnection(url, user, password);
       String mail=request.getParameter("name");
       System.out.println("User :"+mail);
       String sql = "select * from trails where mail='"+session.getAttribute("mail")+"'";
       String name = "";
       String mobile = "";
       String mail1 = "";
       PreparedStatement statement = conn.prepareStatement(sql);
      // statement.setInt(1, 1);
       ResultSet result = statement.executeQuery();

      	%>
     	<div id=hrpro class="w3-card-4 " Style="width:300px;height:800px;left:20px;top:100px;position: fixed;  "><% 
       if(result.next())
       {
    	   name = result.getString(2) + " " + result.getString(3);
    	   
		%>
     	<img src="img/user.png" id=hrpic width=100% height=300px alt=hrpic /><br><br><br> 
     	COMPANY_NAME:<%=result.getString(1) %><br><br>
     	NAME:<%=result.getString(2) %> <%=result.getString(3) %><br><br>
     	Mail Id:<%=result.getString(4) %><br><br>
     	Mobile:<%=result.getString(3) %><br><br>
     	<br><br>
     	<%
       }%>
       <a class="w3-btn w3-teal" Style="width: 100%;"  href="#" >Send to Admin</a><br><br>
       <a class="w3-btn w3-teal" Style="width: 100%;" >Settings</a>
     	</div> 
     	
    <div class="w3-cotainer" Style="left:350px;top: 100px;position: absolute;width: 1000px;" >
      <% 
      sql = "select * from trails where mail='"+mail+"'";
      PreparedStatement ps=conn.prepareStatement(sql);
      result = ps.executeQuery();
       while(result.next()) {
    	 %>
    	
		<div class="w3-card-4" style="height:300px" >
			<div id=prohead style="height: 50px; width: 100%; background-color: #33adff;"><h2>Candidate Profile</h2></div>
			<div id=prodiv>
				<div class="w3-container"style="top: 50px; left: 0px; position: absolute; padding-left: 126px; width: 100%;" id=tab1>
					<img src="img/user.png" Style="height: 250px; width: 230px; top: 10px; left: 0px; position: absolute;">
						</div>
						 <form action="Send_to_admin.jsp" method="POST">
						<div style="display: inline-block;left: 210px;position: relative; ">
							<table class="w3-table" style="left: 10px ;position: relative;">
								<tr>
								<td>Company_Name</td>
									<td><label><%=result.getString(1)%> </label></td>
									<td>Name</td>
									<td><label><%=result.getString(2)%> </label></td>
									<td>KeySkills</td>
									<td><label><%=result.getString(15)%></label></td>
								</tr>
								<tr>
									<td>Email_Id</td>
									<td><label><%=result.getString(4)%></label></td>
									<td>Company</td>
									<td><label><%=result.getString(16)%></label></td>
								</tr>
								<tr>
									<td>MobileNumber</td>
									<td><label><%=result.getString(3)%></label></td>
									<td>Nationality</td>
									<td><label>Indian</label></td>
									<br><br>
									<td><a href="Send_to_admin.jsp?mail=<%= result.getString(4) %>&&name=<%= result.getString(2) %>&&mobile=<%= result.getString(3)%>" style="">Send to admin</a></td>
								</tr>
							</table>
					</div>
			</div>
			</div>
			</form>
		
		<%	
           Blob blob = result.getBlob(19);
           InputStream inputStream = blob.getBinaryStream(); 
           OutputStream outputStream = new FileOutputStream( new File(filePath));
           int bytesRead = -1;
           byte[] buffer = new byte[BUFFER_SIZE];
           while ((bytesRead = inputStream.read(buffer)) != -1) {
        	   
               outputStream.write(buffer, 0, bytesRead);
           }
         
           XWPFDocument docx = new XWPFDocument(new FileInputStream(filePath));
           //using XWPFWordExtractor Class
           %>
           <form action="Download" method="post">
           <input type="hidden" name=sub value="<%=result.getString(4) %>">
           <div id=resumehead style="height:50px;width:100%;background-color:#33adff;top:50px;position:relative;"><h3>Candidate Resume<button type="Submit" class="w3-button" style="float: right;" ><span class="fa fa-download w3-xxlarge"></span></button></h3></div>
           </form>
			<div id=resume class="w3-card-4" style="color:black;width:100%;height:550px;overflow: auto;">
           <% 
           XWPFWordExtractor we = new XWPFWordExtractor(docx);
           List<IBodyElement> list=docx.getBodyElements();
           int i=0,j=0;
           for(IBodyElement body:list)
           {	
           	if(body.getElementType().toString().equals("TABLE"))
           	{
           		XWPFTable ib=body.getBody().getTableArray(i);
       				i++;
	                %>
	                	<table><%
	                	List<XWPFTableRow> trow=ib.getRows();
	                			for(XWPFTableRow tr:trow)
	                			{
	                				List<XWPFTableCell> tcol=tr.getTableCells(); %>
	                				<tr><% 
	                				for(XWPFTableCell tc:tcol)
	                				{%>
	                				<td><%=tc.getText()%></td><% 
	                				}
	                				%></tr><%
	                			}
	                			 %></table><%
	                
	                	
	                
           	}
           	else{%>
           	<p><%=body.getBody().getParagraphArray(j).getParagraphText() %></p>
         
           <% 
           j++;
           }
           
           	}
           
           inputStream.close();
           outputStream.close();
          System.out.println(f.getAbsolutePath());
         
       }
       conn.close();
   } catch (SQLException ex) {
       ex.printStackTrace();
   } catch (IOException ex) {
       ex.printStackTrace();
   } catch (ClassNotFoundException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	} %>
	</div>
	</div>
</body>
</html>