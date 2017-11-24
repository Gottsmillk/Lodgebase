package BookingSystem;

import java.sql.*;

/**
 * all registered accounts for database and different users can use different methods
 * depending on their authority
 * @author Wyatt McLoon
 *
 */
public class User 
{

	
	String userName=new String();
	//int authority decides what methods and webpages the user can access
		//0:user: basic privileges
		//1:receptionist:can use user privileges on any user
		//2:manager:can access receptionist privileges and change/add room info
		//3:website support:add building and assign manager
	int authority;
	Connection conn=null;
	
	//checks if username and password are correct: assign user authority and username if so
	public String getUserName()
	{
		return userName;
	}
	public int getAuthority()
	{
		return authority;
	}
	public boolean checkUser(String user,String password) throws ClassNotFoundException, SQLException
	{
		Class.forName("com.mysql.jdbc.Driver");
		 conn=DriverManager.getConnection("jdbc:mysql://localhost/bookingproject","root","wyatt");
		 String query="SELECT * FROM bookingproject.userinfo WHERE username=? AND password=?;";
		 PreparedStatement pstmt = conn.prepareStatement(query);
		 pstmt.setString( 1, user);
		 pstmt.setString( 2, password); 
		 ResultSet rs = pstmt.executeQuery( );
		 if(rs.next())
		 {
			 userName=rs.getString("username");
			 authority=rs.getInt("userType");
			 return true;
		 }
		 return false;
	}
	
	public boolean createUser(String user,String password) throws ClassNotFoundException, SQLException
	{
		Class.forName("com.mysql.jdbc.Driver");
		 conn=DriverManager.getConnection("jdbc:mysql://localhost/bookingproject","root","wyatt");
		//shows if account is already created
		 String query="SELECT * FROM bookingproject.userinfo WHERE username=?;";
		 PreparedStatement pstmt = conn.prepareStatement(query);
		 pstmt.setString( 1, user); 
		 ResultSet rs = pstmt.executeQuery( );
		 if(rs.next())
			 return false;
		 
		 
		 //create account if account with username doesn't exist
		 query="INSERT INTO `bookingproject`.`userinfo` (`username`, `password`, `userType`) "
				 + "VALUES ('"+user+"', '"+password+"', '0');";
		 Statement stmt = conn.prepareStatement(query);
		 stmt.executeUpdate(query);
		 return true;
	}
	
}
