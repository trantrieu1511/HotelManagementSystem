/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Entity;

/**
 *
 * @author DELL
 */
public class Room extends RoomType {

    int RoomID;
    String Name;
    int RoomTypeID, Floor;
    String View;
    boolean isAvailable;

    public Room() {
    }

    public Room(int RoomID, String Name, int RoomTypeID, int Floor, String View, boolean isAvailable) {
        this.RoomID = RoomID;
        this.Name = Name;
        this.RoomTypeID = RoomTypeID;
        this.Floor = Floor;
        this.View = View;
        this.isAvailable = isAvailable;
    }

    //get list of room bt RT_ID constructor
    public Room(int RoomID, String RoomName, int Floor, String View, int RoomTypeID, String RoomTypeName, int Adult, int Children, double Price, String Description) {
        super(RoomTypeID, RoomTypeName, Adult, Children, Price, Description);
        this.RoomID = RoomID;
        this.Name = RoomName;
        this.Floor = Floor;
        this.View = View;
    }

    //count available rooms constructor
    public Room(int RoomTypeID, int NoOfAvailableRoom) {
        super(RoomTypeID, NoOfAvailableRoom);
    }

    public int getRoomID() {
        return RoomID;
    }

    public void setRoomID(int RoomID) {
        this.RoomID = RoomID;
    }

    public String getRoomName() {
        return Name;
    }

    public void setRoomName(String Name) {
        this.Name = Name;
    }

    public int getFloor() {
        return Floor;
    }

    public void setFloor(int Floor) {
        this.Floor = Floor;
    }

    public String getView() {
        return View;
    }

    public void setView(String View) {
        this.View = View;
    }

    @Override
    public int getRoomTypeID() {
        return super.RoomTypeID;
    }

    @Override
    public void setRoomTypeID(int RoomTypeID) {
        super.RoomTypeID = RoomTypeID;
    }

    @Override
    public String getName() {
        return super.Name;
    }

    @Override
    public void setName(String Name) {
        super.Name = Name;
    }

    @Override
    public int getAdult() {
        return Adult;
    }

    @Override
    public void setAdult(int Adult) {
        this.Adult = Adult;
    }

    @Override
    public int getChildren() {
        return Children;
    }

    @Override
    public void setChildren(int Children) {
        this.Children = Children;
    }

    @Override
    public int getNoOfAvailableRoom() {
        return NoOfAvailableRoom;
    }

    @Override
    public void setNoOfAvailableRoom(int NoOfAvailableRoom) {
        this.NoOfAvailableRoom = NoOfAvailableRoom;
    }

    public boolean isIsAvailable() {
        return isAvailable;
    }

    public void setIsAvailable(boolean isAvailable) {
        this.isAvailable = isAvailable;
    }

    @Override
    public String toString() {
        return "Room{" + "RoomID=" + RoomID + ", Name=" + Name + ", RoomTypeID=" + RoomTypeID + ", Floor=" + Floor + ", View=" + View + '}' + " " + super.toString();
    }

}
