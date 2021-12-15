<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Short list</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="StyleSheet" href="css/w3.css">
<script type="text/javascript">
function btn1()
{
	
	document.getElementById("search").style.display = "block";
	document.getElementById("loc_search").style.display = "none";
	document.getElementById("ind_search").style.display = "none";
}
function btn2()
{
	document.getElementById("search").style.display = "none";
	document.getElementById("loc_search").style.display = "none";
	document.getElementById("ind_search").style.display = "block";

}
function btn3()
{
	document.getElementById("search").style.display = "none";
	document.getElementById("loc_search").style.display = "block";
	document.getElementById("ind_search").style.display = "none";
}
function clear()
{
	document.getElementById("search").style.display = "none";
	document.getElementById("loc_search").style.display = "none";
	document.getElementById("ind_search").style.display = "none";
}
</script>
</head>
<body onload="clear()" class="w3-animate-zoom" style="background:gray";>
<%@ page import="java.io.*" import="java.sql.*" import="org.apache.poi.xwpf.extractor.XWPFWordExtractor" import="org.apache.poi.xwpf.usermodel.*" import="java.util.ArrayList" %>

<%
final int BUFFER_SIZE = 4096;  
String url = "jdbc:mysql://localhost:3306/vtjdm01_2019";
   String user = "root";
   ArrayList<String> list;
   String password = "root";
   String filePath = "temp.docx";
   HttpSession session1=request.getSession(false);
   Object uid=session1.getAttribute("UI");
   try{
	list=(ArrayList)session1.getAttribute("list");
	for(String s:list)
		{
			System.out.println(s);
		}
   }catch(NullPointerException n)
   {
	   list=null;
   }
  		
   try {
   	Class.forName("com.mysql.jdbc.Driver");
       Connection conn = DriverManager.getConnection(url, user, password);
       String mail="";
       String sql = "select * from trails";
      
       PreparedStatement statement = conn.prepareStatement(sql);
      // statement.setInt(1, 1);
       ResultSet result = statement.executeQuery();

      %>
      <!-- Navigation bar -->
<div class="w3-bar w3-bar w3-light-grey w3-card-2" style="width:100%;">
<a href="#" class="w3-bar-item w3-button w3-red w3-mobile w3-padding-large"><i class="fa fa-bed w3-margin-right"></i>Here the Logo</a>
  <!-- <a href="ViewProfile.jsp" class="w3-bar-item w3-button w3-padding-large">View Profile</a> 
<a href="userhome.jsp" class="w3-bar-item w3-button w3-padding-large">Back to home</a>
    <a href="Searching?skilltype=Exclude&&txt_skills=''&&admin=no" class="w3-bar-item w3-button w3-padding-large">Search profiles</a>  -->
  <a href="Index.html" class="w3-bar-item w3-button w3-red w3-right w3-mobile w3-padding-large">logout</a>
<a href="#" class="w3-bar-item w3-button w3-right w3-padding-large">Settings</a> 
</div>
<!-- End Navigation bar --> 


<!-- Filtering area -->
<div id=reg class=" " >
<div class="w3-card-4" style="left:350px;position: absolute;width:1000px;height:250px; ">
  <div class="w3-container w3-teal" style=""> 
        <h2>Filter resumes here</h2>
      </div>
<div style=position:relative; class="w3-center">
<button class=" w3-btn w3-teal " Style="width:250px;" id=bb1 onclick="btn1()" value="">Skills <span class="glyphicon glyphicon-chevron-down"></span></button>
<!-- <button class=" w3-btn w3-teal " Style="width:250px;" id=bb2 onclick="btn3()" value="">Experience <span class="glyphicon glyphicon-chevron-down"></span></button> -->
<!-- <button class=" w3-btn w3-teal " Style="width:250px;" id=bb3 onclick="btn2()" value="" disabled="disabled">Function <span class="glyphicon glyphicon-chevron-down"></span></button> -->
</div><br>
<div id=search class="w3-center">
<form action="Searching" method="get">
<input type="hidden" value="no" name=admin>
<table class="w3-table"><tr>

<td><input class=" " Style="width:350px;height: 50px;" type=text name=txt_skills id=skills></td>
<td><input class="w3-radio" type=radio name=skilltype value=Any><strong> Any</strong></td>
<td><input class="w3-radio" type=radio name=skilltype value=All><strong> All</strong></td>
<td><input class="w3-radio" type=radio name=skilltype value=Exclude><strong> Exclude</strong></td>
<td><input class="w3-btn w3-teal" Style="width:250px;" type=Submit value=search></td></tr></table>
</form>
</div>
<form id=myform action=NoticeCal method=post>
<div id=loc_search>
<table class="w3-table"><tr><td><strong>Min Notice period</strong><select name=note_min onchange="change()" class="w3-select w3-teal">
<option value=0>immediate</option>
<option value=15>15 days</option>
<option value=30>30 days</option>
<option value=45>45 days</option>
<option value=60>2 months</option>
<option value=90>3 months</option>
<option value=180>6 months</option>
</select></td><td><strong>Max Notice period</strong><select name=note_max onchange="change()" class="w3-select w3-teal">
<option value=0>immediate</option>
<option value=15>15 days</option>
<option value=30>30 days</option>
<option value=45>45 days</option>
<option value=60>2 months</option>
<option value=90>3 months</option>
<option value=180>6 months</option>
</select></td><td><strong>Min Experience</strong><select name=ex_min onchange="change()" class="w3-select w3-teal">
<option value=0>fresher</option>
<option value=6>6 months</option>
<option value=12>1 year</option>
<option value=24>2 years</option>
<option value=36>3 years</option>
<option value=48>4 years</option>
<option value=60>5 years</option>
</select></td><td><strong>Max Experience</strong><select name=ex_max onchange="change()" class="w3-select w3-teal">
<option value=0>fresher</option>
<option value=6>6 months</option>
<option value=12>1 year</option>
<option value=24>2 years</option>
<option value=36>3 years</option>
<option value=48>4 years</option>
<option value=60>5 years</option>
</select></td><td><input type=submit value=search class="w3-btn w3-teal" Style="margin-top: 22px;"></td></tr></table>
</div>
</form>
<!--END Filtering area -->
<div id=ind_search>
<table class="w3-table"><tr><td><strong>location</strong><select class="w3-select w3-teal"><option>location</option></select></td>
<td><strong>industry</strong><select class="w3-select w3-teal"><option>industry</option></select></td>
<td><strong>function</strong><select class="w3-select w3-teal"><option>Function</option></select></td>
<td><input class="w3-btn w3-teal" type=submit value=search Style="margin-top: 22px;"></td></tr></table>
</div></div>
</div>
<!-- END Filtering area  -->
          <div style="top: 300px;left: 350px;position: absolute;">
     	<% 
       while(result.next()) {
    	   for(String l:list)
			{
				if(result.getString(2).equalsIgnoreCase(l))
				{
				
				
    	 %> <div class="w3-card-4 " style="left:0px;top:10px;position: relative;width:1000px;height:400px;">
    	 <div id=prohead style=height:50px;width:100%;background-color:#33adff;><h2 class="w3-text-white"><%=result.getString(1) %> <%=result.getString(3) %> Profile</h2></div>
			<div id=prodiv>
			<table style=top:0px;left:0px;position:relative;padding-left:126px;width:100%; id=tab1>
			<tr><td width="200px">
		<img src="img/user.png" Style=height:270px;width:230px;top:0px;left:0px;position:absolute;></td>
<td> <table class="w3-table">
 			<tr><td>Company_Name</td><td><label><%=result.getString(1) %></label></td></tr>
    	   <tr><td>Name</td><td><label><%=result.getString(2) %></label></td></tr>
    	   <tr><td>mobile</td><td><label><%=result.getString(3) %></label></td></tr>
    	   <tr><td>mail</td><td><label><%=result.getString(4) %></label></td></tr>
    	   <tr><td>address</td><td><label><%=result.getString(5) %></label></td></tr>
    	   <%-- <td>School Name</td><td><label><%=result.getString(5) %></label></td>
    	   <td>CGPA_10</td><td><label><%=result.getString(6) %></label></td>
    	   <td>College</td><td><label><%=result.getString(7) %></label></td>
    	   <td>CGPA_12</td><td><label><%=result.getString(8) %></label></td>
    	   <td>branch</td><td><label><%=result.getString(9) %></label></td>
    	   <td>College_name</td><td><label><%=result.getString(10) %></label></td>
    	   <td>Branch</td><td><label><%=result.getString(11) %></label></td>
    	   <td>year</td><td><label><%=result.getString(12) %></label></td>
    	   <td>Skills</td><td><label><%=result.getString(13) %></label></td>
    	   <td>Pre_company</td><td><label><%=result.getString(14) %></label></td>
    	   <td>Pre_package</td><td><label><%=result.getString(15) %></label></td>
    	   <td>Expecting package</td><td><label><%=result.getString(16) %></label></td>
    	   <td>Resume</td><td><label><%=result.getString(17) %></label></td> --%></tr>
    	   
    	   
    	    <%-- <%=result.getString(3) %></td><td>mobile</td><td><label><%=result.getString(2) %></label></td></tr>
    	   <tr><td>Email_Id</td><td><label><%=result.getString(3) %></label></td><td>address</td><td><label><%=result.getString(4) %></label></td></tr>
    	   <tr><td>School name</td><td><label><%=result.getString(5) %></label></td><td>10_CGPA</td><td><label><%=result.getInt(6) %> College name</label></td></tr>
    	   <tr><td>D.O.B.</td><td><label><%=result.getDate(7) %></label></td><td>Notice Period</td><td><label><%=result.getInt(19) %> Days</label></td></tr>
    	   <tr><td>Nationality</td><td><label>Indian</label></td><td>Current Location</td><td><label><%=result.getString(16) %></label></td></tr>
    	   <tr><td>Gender</td><td><label><%=result.getString(6) %></label></td><td>Prefered location</td><td><label><%=result.getString(17) %></label></td></tr> 
    	    --%>
    	    </table></td></tr>
			</table>
			<div id=profoot class="w3-panel" style="height:50px;width:100%;bottom:10px;position:absolute ;">
			<form action="profiles.jsp">
			<input type="hidden" value=<%=result.getString(4)%> name=name>
			<h3><input type=Submit class="w3-btn w3-teal" value="view full profile"></a></h3>
			</form>
			</div>
			</div>
			</div>
<% }
			}}
        conn.close();
    } catch (SQLException ex) {
        ex.printStackTrace();
    } catch (IOException ex) {
        ex.printStackTrace();
    } catch (Exception e) {
 		// TODO Auto-generated catch block
 		e.printStackTrace();
 	} 
   
     	%>
     	</div>

</body>
</html>