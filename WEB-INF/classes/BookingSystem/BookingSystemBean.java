package BookingSystem;

import java.util.ArrayList;
import java.util.Arrays;

@SuppressWarnings("serial")
public class BookingSystemBean implements java.io.Serializable
{
	//used to set the usertype: only used by manager
	ArrayList<String> usertypes=new ArrayList<String>(Arrays.asList(new String[] {"customer","receptionist","manager"}));
	User user=new User();
	public User getUser()
	{
		return user;
	}
	
	public void setUser(User currentUser)
	{
		user=currentUser;
	}
}
