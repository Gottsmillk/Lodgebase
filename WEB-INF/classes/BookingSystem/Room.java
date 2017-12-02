package BookingSystem;
public class Room{
	int roomID = -1;
	int numBeds = -1;
	int numGuests = -1;
	int roomNumber = -1;
	boolean smoking = false;
	boolean suite = false;
	int price = -1;

	public int getRoomID(){
		return roomID;
	}
	public int getNumBeds(){
		return numBeds;
	}
	public int getNumGuests(){
		return numGuests;
	}
	public int getRoomNumber(){
		return roomNumber;
	}
	public boolean getSmoking(){
		return smoking;
	}
	public boolean getSuite(){
		return suite;
	}
	public int getPrice(){
		return price;
	}

}
