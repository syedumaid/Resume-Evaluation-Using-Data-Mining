package control;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.StringTokenizer;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.apache.log4j.MDC;


/**
 * Servlet implementation class Searching
 */
@WebServlet("/Searching")
public class Searching extends HttpServlet {
	private static final long serialVersionUID = 1L;
	static Logger log=Logger.getLogger(Searching.class);  
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Searching() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session=request.getSession(false);
		String skills=request.getParameter("txt_skills");
		String type=request.getParameter("skilltype");
		
		//System.out.println(skills);
		StringTokenizer st=new StringTokenizer(skills,",");
		String url = "jdbc:mysql://localhost:3306/vtjdm01_2019";
		   String user = "root";
		   String password = "root";
		   String filePath = "temp.docx";
		   try {
		   	Class.forName("com.mysql.jdbc.Driver");
		       Connection conn = DriverManager.getConnection(url, user, password);
		       ArrayList<String> mail=new ArrayList<String>();
		       String sql = "select name,Skills from trails";
		      ArrayList<String> l=new ArrayList();
		      String db[];
		       PreparedStatement statement = conn.prepareStatement(sql);
		      // statement.setInt(1, 1);
		       ResultSet result = statement.executeQuery();
		     
		       while(st.hasMoreTokens())
		       {
		    	   l.add(st.nextToken());
		       }
		       for(String a:l)
		       {
		    	  System.out.println(a);
		       }
		       while(result.next())
		       {
		    	   
		    	   int count=0;
		    	   StringTokenizer st1 = null;
		    	   try{
		    	   st1=new StringTokenizer(result.getString("Skills"),",");
		    	   }catch(NullPointerException n){
		    		   st1=new StringTokenizer("dfeswfiue,jewf",",");
		    	   }
		    	   while(st1.hasMoreTokens())
		    	   {
		    		   String s=st1.nextToken();
		    		   
		    		   for(String a:l)
				       {
		    			   if(a.equalsIgnoreCase(s))
		    			   {
				    	   System.out.println(a);
		    			   count++;
		    			   }
		    			  
				       }
		    		   
		    		 
		    	   }
		    	   
		    	   if(count==l.size()&&type.equals("All"))
    			   {
    				   mail.add(result.getString(1));
    			   }
		    	   if(count<=l.size()&&count!=0&&type.equals("Any"))
    			   {
		    		   mail.add(result.getString(1));
    			   }
		    	   if(count==0&&type.equals("Exclude"))
    			   {
		    		   mail.add(result.getString(1));
    			   }
		    	   System.out.println(count);
		    	   System.out.println(type);
	    		   System.out.println(mail);
		    	   System.out.println("-----------");
		       }
		       HttpSession se=request.getSession();
	            se.setAttribute("list", mail);
	            //out.println(mail);
	            
	           /* System.out.println("is admin "+admin);
	            if(admin.equals("no"))
	            {
	            	 MDC.put("UserId", session.getAttribute("UI"));
	            	log.debug(" Employee searching the resumes by the skills "+skills); 
	            	getServletContext().getRequestDispatcher("/Candidates.jsp").forward(
	 	                    request, response);
	            	
	            }else{
	            	 MDC.put("UserId", session.getAttribute("UI"));
	            	log.debug(" Admin searching the resumes by the skills "+skills); */
	            	 getServletContext().getRequestDispatcher("/Robot_home1.jsp").forward(
		 	                    request, response);
	           /* }
	           
		   }*/
		   } catch(Exception e)
		   {
			   e.printStackTrace();
		   }
	
		response.getWriter().append("Served at: ").append(request.getContextPath());
	
	}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
