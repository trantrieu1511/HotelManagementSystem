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

    public Room() {
    }

    public Room(int RoomID, String Name, int RoomTypeID, int Floor, String View) {
        this.RoomID = RoomID;
        this.Name = Name;
        this.RoomTypeID = RoomTypeID;
        this.Floor = Floor;
        this.View = View;
    }

    public Room(int RoomID, String RoomName, int Floor, String View, int RoomTypeID, String RoomTypeName, int Adult, int Children, double Price) {
        super(RoomTypeID, RoomTypeName, Adult, Children, Price);
        this.RoomID = RoomID;
        this.Name = RoomName;
        this.Floor = Floor;
        this.View = View;
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
    public String toString() {
        return "Room{" + "RoomID=" + RoomID + ", Name=" + Name + ", RoomTypeID=" + RoomTypeID + ", Floor=" + Floor + ", View=" + View + '}' + " " + super.toString();
    }

}
