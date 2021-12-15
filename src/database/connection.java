package database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
									
public class connection {
	static Connection con;
	public static Connection getConnection()
	{
 		
		try
		{
			Class.forName("com.mysql.jdbc.Driver");	
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/vtjdm01_2019","root","root");
			System.out.println("got connected");
		}
		catch(Exception e)
		{
			System.out.println("database connection error");
		}
		return con;
	}
	public static int applyCloud(String com_id,String username) throws SQLException{

		Connection con=connection.getConnection();
		
		String sql="insert into apply values(?,?,?)";
		PreparedStatement ps=con.prepareStatement(sql);
		ps.setString(2,com_id);
		ps.setString(1,username);
		ps.setString(3,"pending");
		
		int i=ps.executeUpdate();
		
		
		return i;
		
	}
}