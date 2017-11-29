package BookingSystem;

import java.sql.*;
import java.util.ArrayList;

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
	ArrayList<String> history=new ArrayList<String>(0);
	
	public String getUserName()
	{
		return userName;
	}
	public int getAuthority()
	{
		return authority;
	}
	public ArrayList<String> getHistory()
	{
		return history;
	}
	//checks if username and password are correct: assign user authority and username if so
	public boolean checkUser(String user,String password) throws ClassNotFoundException, SQLException
	{
		Class.forName("com.mysql.jdbc.Driver");
		 conn=DriverManager.getConnection("jdbc:mysql://lodgebasedb.ctud3vauv27c.us-east-1.rds.amazonaws.com/bookingproject","lodgebase","lodgebase");
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
	
	//creates a user
	public boolean createUser(String user,String password) throws ClassNotFoundException, SQLException
	{
		Class.forName("com.mysql.jdbc.Driver");
		conn=DriverManager.getConnection("jdbc:mysql://lodgebasedb.ctud3vauv27c.us-east-1.rds.amazonaws.com/bookingproject","lodgebase","lodgebase");
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
	public boolean userHistory(String user) throws ClassNotFoundException, SQLException
	{
		int userID, roomID;
		String historyLine;
		Class.forName("com.mysql.jdbc.Driver");
		conn=DriverManager.getConnection("jdbc:mysql://lodgebasedb.ctud3vauv27c.us-east-1.rds.amazonaws.com/bookingproject","lodgebase","lodgebase");
		//shows if account is already created
		 String query="SELECT * FROM bookingproject.userinfo WHERE username=?;";
		 PreparedStatement pstmt = conn.prepareStatement(query);
		 pstmt.setString( 1, user); 
		 ResultSet rs = pstmt.executeQuery( );
		 if(rs.next())
		 {
			 userID=rs.getInt("userid");
		 }
		 else
			 return false;
		 history.clear();
		 query="SELECT * FROM bookingproject.userhistory WHERE userid=?;";
		 pstmt = conn.prepareStatement(query);
		 pstmt.setInt( 1, userID); 
		 rs = pstmt.executeQuery( );
		 if(!rs.first())
			 return false;
		 rs.afterLast();
		 int j=1;
		 while(rs.previous())
		 {
			 roomID=rs.getInt("roomid");
			 String query2="SELECT * FROM bookingproject.rooms WHERE roomid=?;";
			 PreparedStatement pstmt2 = conn.prepareStatement(query2);
			 pstmt2.setInt( 1, roomID); 
			 ResultSet rs2 = pstmt2.executeQuery( );
			 String roomName="";
			 if(rs2.next())
			 {
				 roomName=rs2.getString("roomNumber");
			 }
			 System.out.println(++j);
			 historyLine="You stayed in Room # " + roomName + " from "+ rs.getString("check-in")+ " to "+
					 rs.getString("check-out");
			 history.add(historyLine);
		 }
		 for(int i=0;i<history.size();i++)
			 System.out.println(history.get(i));
		 return true;
	}
}
