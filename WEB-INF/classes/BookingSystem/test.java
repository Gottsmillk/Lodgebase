package BookingSystem;

import java.sql.*;


public class test 
{
	
	public static void main(String[] args) throws ClassNotFoundException, SQLException
	{
		User test=new User();
		if(test.checkUser("wyatt", "1"))
		{
			System.out.println(test.userName);
			System.out.println(test.authority);
		}
		if(test.checkUser("wyatt", "notpassword"))
		{
			System.out.println(test.userName);
			System.out.println(test.authority);
		}
	}
	//THINGS TO DO--------------------------------------------------
	
	
	//add room in rooms database with building id
	public void newRoom(String user) throws SQLException, ClassNotFoundException
	 {
		
	 }
	
	//add room to userhistory with userid
	public void editUserHistory(int userid) throws SQLException, ClassNotFoundException
	 {
		
	 }
}
