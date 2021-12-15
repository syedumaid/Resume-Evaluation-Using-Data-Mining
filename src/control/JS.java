package control;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import database.connection;

/**
 * Servlet implementation class JS
 */
@MultipartConfig(maxFileSize = 16177215)
@WebServlet("/JS")
public class JS extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public JS() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try
		{
			String username = request.getParameter("username");
			String usermobile = request.getParameter("usermobile");
			String usermail = request.getParameter("usermail");
			String useraddress = request.getParameter("useraddress");
			String school_name = request.getParameter("school_name");
			String CGPA_10 = request.getParameter("CGPA_10");
			String acadamy = request.getParameter("acadamy");
			String CGPA_12 = request.getParameter("CGPA_12");
			String branch = request.getParameter("branch");
			String college_name = request.getParameter("college_name");
			String CGPA_graduation = request.getParameter("CGPA_graduation");
			String graduation_branch = request.getParameter("graduation_branch");
			String year = request.getParameter("year");
			String skills = request.getParameter("skills");
			String previous_company = request.getParameter("previous_company");
			String previous_package = request.getParameter("previous_package");
			String expecting_package = request.getParameter("expecting_package");
			System.out.println("branch");
			Part myFile1 = request.getPart("myFile");
			InputStream myfile = null;
			if (myFile1 != null) {
				myfile = myFile1.getInputStream();
			}

			Connection conn = connection.getConnection();
			String sql = "insert into js_profile values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, username);
			ps.setString(2, usermobile);
			ps.setString(3, usermail);
			ps.setString(4, useraddress);
			ps.setString(5, school_name);
			ps.setString(6, CGPA_10);
			ps.setString(7, acadamy);
			ps.setString(8, CGPA_12);
			ps.setString(9, branch);
			ps.setString(10, college_name);
			ps.setString(11, CGPA_graduation);
			ps.setString(12, graduation_branch);
			ps.setString(13, year);
			ps.setString(14, skills);
			ps.setString(15, previous_company);
			ps.setString(16, previous_package);
			ps.setString(17, expecting_package);
			ps.setBinaryStream(18, myfile);

			ps.executeUpdate();
			response.sendRedirect("JS_home.jsp");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
