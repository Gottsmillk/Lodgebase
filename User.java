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
	ArrayList<String> roomNumbers=new ArrayList<String>(0);
	ArrayList<Room> roomArray=new ArrayList<Room>(0);
	String[] testArray = {"Hello", "Goodbye", "Test"};
	
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
	public ArrayList<String> getRoomNumbers()
	{
		return roomNumbers;
	}

	public String[] getTestArray()
	{
		return testArray;
	}
	public ArrayList<Room> getRoomArray()
	{
		return roomArray;
	}
	
	
	//----------------------FOR USERS------------------------------------
	
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
	
	public void updateRoomArray(String numGuests, String numBeds, String check_in, String check_out) throws ClassNotFoundException, SQLException
	{
		roomArray.clear();
		Class.forName("com.mysql.jdbc.Driver");
		conn=DriverManager.getConnection("jdbc:mysql://lodgebasedb.ctud3vauv27c.us-east-1.rds.amazonaws.com/bookingproject","lodgebase","lodgebase");
		String query = "SELECT * FROM bookingproject.rooms WHERE numberOfPeople >= '" + numGuests + "' AND numberOfBeds >= '" + numBeds + "'";
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery(query);
		while(rs.next()){
			Room tempRoom = new Room();
			tempRoom.roomID = rs.getInt("roomid");
			roomArray.add(tempRoom);
		}
	}
	
	//shows users room history
	public boolean userHistory(String user) throws ClassNotFoundException, SQLException
	{
		int userID, roomID;
		String historyLine;
		//sets up db connection
		Class.forName("com.mysql.jdbc.Driver");
		conn=DriverManager.getConnection("jdbc:mysql://lodgebasedb.ctud3vauv27c.us-east-1.rds.amazonaws.com/bookingproject","lodgebase","lodgebase");
		//finds user's id number
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
		 //looks up all users purchases(through the user id)
		 query="SELECT * FROM bookingproject.userhistory WHERE userid=?;";
		 pstmt = conn.prepareStatement(query);
		 pstmt.setInt( 1, userID); 
		 rs = pstmt.executeQuery( );
		 if(!rs.first())
			 return false;
		 //prints the table from newest to oldest purchase
		 rs.afterLast();
		 while(rs.previous())
		 {
			 //finds room number based off its table id number
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
			 //adds the purchase to an arraylist of strings that will be used on the webpage
			 historyLine="You stayed in Room # " + roomName + " from "+ rs.getString("check_in")+ " to "+
					 rs.getString("check_out");
			 history.add(historyLine);
		 }
		 return true;
	}
	
	//--------------------------FOR RECEPTIONIST-------------------------------------------------
	
	//TODO method that switches a customers room for another one
	//TODO method that removes a customers room reservation
	//TODO method that returns customers password(only for authority level 0)
	
	
	//--------------------------FOR MANAGERS-----------------------------------------------------
	
	
	public boolean buildingRooms(String username) throws ClassNotFoundException, SQLException
	{
		//sets up db connection
		int userID=0, buildingID=0;
		Class.forName("com.mysql.jdbc.Driver");
		conn=DriverManager.getConnection("jdbc:mysql://lodgebasedb.ctud3vauv27c.us-east-1.rds.amazonaws.com/bookingproject","lodgebase","lodgebase");
		//finds user's id number
		 String query="SELECT * FROM bookingproject.userinfo WHERE username=?;";
		 PreparedStatement pstmt = conn.prepareStatement(query);
		 pstmt.setString( 1, username); 
		 ResultSet rs = pstmt.executeQuery( );
		 if(rs.next())
		 {
			 userID=rs.getInt("userid");
		 }
		 //finds building id for the manager
		 roomNumbers.clear();
		 query="SELECT * FROM bookingproject.buildings WHERE managerid=?;";
		 pstmt = conn.prepareStatement(query);
		 pstmt.setInt( 1, userID); 
		 rs = pstmt.executeQuery( );
		 if(rs.next())
		 {
			 buildingID=rs.getInt("buildingid");
		 }
		 //finds all rooms associated with that building
		 query="SELECT * FROM bookingproject.rooms WHERE buildingid=?;";
		 pstmt = conn.prepareStatement(query);
		 pstmt.setInt( 1, buildingID); 
		 rs = pstmt.executeQuery( );
		 while(rs.next())
		 {
			 roomNumbers.add(rs.getString("roomNumber"));
		 }
		 return true;
	}
	public void createRoom(String username,String smoking,int numberOfBeds,int numberOfPeople, double price,String roomNumber) throws SQLException, ClassNotFoundException
	{
		//sets up db connection
			int userID=0, buildingID=0;
			Class.forName("com.mysql.jdbc.Driver");
			conn=DriverManager.getConnection("jdbc:mysql://lodgebasedb.ctud3vauv27c.us-east-1.rds.amazonaws.com/bookingproject","lodgebase","lodgebase");
			//finds user's id number
			 String query="SELECT * FROM bookingproject.userinfo WHERE username=?;";
			 PreparedStatement pstmt = conn.prepareStatement(query);
			 pstmt.setString( 1, username); 
			 ResultSet rs = pstmt.executeQuery( );
			 if(rs.next())
			 {
				 userID=rs.getInt("userid");
			 }
			 //finds building id for the manager
			 roomNumbers.clear();
			 query="SELECT * FROM bookingproject.buildings WHERE managerid=?;";
			 pstmt = conn.prepareStatement(query);
			 pstmt.setInt( 1, userID); 
			 rs = pstmt.executeQuery( );
			 if(rs.next())
			 {
				 buildingID=rs.getInt("buildingid");
			 }
			 query="INSERT INTO `bookingproject`.`rooms` (`buildingid`, `smoking`, "
			 		+ "`numberOfBeds`, `numberOfPeople`, `price`, `roomNumber`) VALUES ('"+buildingID+"', '"+smoking+"', '"+numberOfBeds+"', '"
			 				+numberOfPeople+"', '"+price+"', '"+roomNumber+"');";
			 Statement stmt = conn.prepareStatement(query);
			 stmt.executeUpdate(query);	 
	}
	public void changeRoomData(String username,String smoking,int numberOfBeds,int numberOfPeople, double price,String currentRoomNumber,String newRoomNumber) throws ClassNotFoundException, SQLException
	{
		//sets up db connection
		int userID=0, buildingID=0,roomID=0;
		Class.forName("com.mysql.jdbc.Driver");
		conn=DriverManager.getConnection("jdbc:mysql://lodgebasedb.ctud3vauv27c.us-east-1.rds.amazonaws.com/bookingproject","lodgebase","lodgebase");
		//finds user's id number
		 String query="SELECT * FROM bookingproject.userinfo WHERE username=?;";
		 PreparedStatement pstmt = conn.prepareStatement(query);
		 pstmt.setString( 1, username); 
		 ResultSet rs = pstmt.executeQuery( );
		 if(rs.next())
		 {
			 userID=rs.getInt("userid");
		 }
		 //finds building id for the manager
		 roomNumbers.clear();
		 query="SELECT * FROM bookingproject.buildings WHERE managerid=?;";
		 pstmt = conn.prepareStatement(query);
		 pstmt.setInt( 1, userID); 
		 rs = pstmt.executeQuery( );
		 if(rs.next())
		 {
			 buildingID=rs.getInt("buildingid");
		 }
		//finds room id from room number and building id
		 roomNumbers.clear();
		 query="SELECT * FROM bookingproject.rooms WHERE buildingid=? AND roomNumber=?;";
		 pstmt = conn.prepareStatement(query);
		 pstmt.setInt( 1, buildingID); 
		 pstmt.setString( 2, currentRoomNumber);
		 rs = pstmt.executeQuery( );
		 if(rs.next())
		 {
			 roomID=rs.getInt("roomID");
		 }
		 query="UPDATE `bookingproject`.`rooms` SET `smoking`='"+smoking+"', `numberOfBeds`='"+numberOfBeds+"', `numberOfPeople`='"+
		 numberOfPeople+"', `price`='"+price+"', `roomNumber`='"+newRoomNumber+"'  WHERE `roomid`='"+roomID+"';";
		 Statement stmt = conn.prepareStatement(query);
		 stmt.executeUpdate(query);	

	}
	public void deleteRoom(String username,String roomNumber) throws ClassNotFoundException, SQLException
	{
		//sets up db connection
				int userID=0, buildingID=0,roomID=0;
				Class.forName("com.mysql.jdbc.Driver");
				conn=DriverManager.getConnection("jdbc:mysql://lodgebasedb.ctud3vauv27c.us-east-1.rds.amazonaws.com/bookingproject","lodgebase","lodgebase");
				//finds user's id number
				 String query="SELECT * FROM bookingproject.userinfo WHERE username=?;";
				 PreparedStatement pstmt = conn.prepareStatement(query);
				 pstmt.setString( 1, username); 
				 ResultSet rs = pstmt.executeQuery( );
				 if(rs.next())
				 {
					 userID=rs.getInt("userid");
				 }
				 //finds building id for the manager
				 roomNumbers.clear();
				 query="SELECT * FROM bookingproject.buildings WHERE managerid=?;";
				 pstmt = conn.prepareStatement(query);
				 pstmt.setInt( 1, userID); 
				 rs = pstmt.executeQuery( );
				 if(rs.next())
				 {
					 buildingID=rs.getInt("buildingid");
				 }
				//finds room id from room number and building id
				 roomNumbers.clear();
				 query="SELECT * FROM bookingproject.rooms WHERE buildingid=? AND roomNumber=?;";
				 pstmt = conn.prepareStatement(query);
				 pstmt.setInt( 1, buildingID); 
				 pstmt.setString( 2, roomNumber);
				 rs = pstmt.executeQuery( );
				 if(rs.next())
				 {
					 roomID=rs.getInt("roomID");
				 }
				 query="DELETE FROM `bookingproject`.`rooms` WHERE `roomid`='"+roomID+"';";
				 Statement stmt = conn.prepareStatement(query);
				 stmt.executeUpdate(query);	
				 
		//TODO method to turn customer account into receptionist
	}
	//-------------------------FOR SUPPORT----------------------------------
	
	//TODO method to add building/hotel to the website
	//TODO method to add a manager to a hotel
}
