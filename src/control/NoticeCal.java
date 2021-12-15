package control;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class NoticeCal
 */
@WebServlet("/NoticeCal")
public class NoticeCal extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeCal() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int note_min=Integer.parseInt(request.getParameter("note_min"));
		int note_max=Integer.parseInt(request.getParameter("note_max"));
		int ex_min=Integer.parseInt(request.getParameter("ex_min"));
		int ex_max=Integer.parseInt(request.getParameter("ex_max"));
		//System.out.println(skills);
		
		String url = "jdbc:mysql://localhost:3306/vtjdm01_2019";
		   String user = "root";
		   String password = "root";
		   String filePath = "temp.docx";
		   try {
		   	Class.forName("com.mysql.jdbc.Driver");
		       Connection conn = DriverManager.getConnection(url, user, password);
		       ArrayList<String> mail=new ArrayList<String>();
		       String sql = "select Id,Experience,Notice from portal";
		      ArrayList<String> l=new ArrayList();
		      String db[];
		       PreparedStatement statement = conn.prepareStatement(sql);
		      // statement.setInt(1, 1);
		       ResultSet result = statement.executeQuery();
		     
		       while(result.next())
		       {
		    	   int count=0;
		    	   int note=result.getInt("Notice");
		    	  int ex=result.getInt("Experience");	
		    	  if(note>=note_min&&note<=note_max&&ex>=ex_min&&ex<=ex_max)
		    	  {
		    		  mail.add(result.getString("Id"));
		    	  }
		    		   
		    		 
		    	   
		       }
		       HttpSession se=request.getSession();
	            se.setAttribute("list", mail);
	            //out.println(mail);
	            getServletContext().getRequestDispatcher("/Candidates.jsp").forward(
	                    request, response);
		   }catch(Exception e)
		   {
			   e.printStackTrace();
		   }
	
		doGet(request, response);
	}

	}


