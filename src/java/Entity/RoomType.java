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
public class RoomType {

    int RoomTypeID;
    String Name;
    double Price;
    String Img, Description;
    int Adult, Children;
    String BedName;
    int BedAmount;
    int NoOfAvailableRoom;

    public RoomType() {
    }

    public RoomType(int RoomTypeID, String Name, double Price, String Img, String Description, int Adult, int Children) {
        this.RoomTypeID = RoomTypeID;
        this.Name = Name;
        this.Price = Price;
        this.Img = Img;
        this.Description = Description;
        this.Adult = Adult;
        this.Children = Children;
    }

    //constructor for counting number of available rooms
    public RoomType(int RoomTypeID, int NoOfAvailableRoom) {
        this.RoomTypeID = RoomTypeID;
        this.NoOfAvailableRoom = NoOfAvailableRoom;
    }

    //constructor for get available rooms
    public RoomType(int RoomTypeID, String Name, int Adult, int Children) {
        this.RoomTypeID = RoomTypeID;
        this.Name = Name;
        this.Adult = Adult;
        this.Children = Children;
    }

    public int getRoomTypeID() {
        return RoomTypeID;
    }

    public void setRoomTypeID(int RoomTypeID) {
        this.RoomTypeID = RoomTypeID;
    }

    public String getName() {
        return Name;
    }

    public void setName(String Name) {
        this.Name = Name;
    }

    public double getPrice() {
        return Price;
    }

    public void setPrice(double Price) {
        this.Price = Price;
    }

    public String getImg() {
        return Img;
    }

    public void setImg(String Img) {
        this.Img = Img;
    }

    public String getDescription() {
        return Description;
    }

    public void setDescription(String Description) {
        this.Description = Description;
    }

    public int getAdult() {
        return Adult;
    }

    public void setAdult(int Adult) {
        this.Adult = Adult;
    }

    public int getChildren() {
        return Children;
    }

    public void setChildren(int Children) {
        this.Children = Children;
    }

    @Override
    public String toString() {
        return "RoomType{" + "RoomTypeID=" + RoomTypeID + ", Name=" + Name + ", Price=" + Price + ", Img=" + Img + ", Description=" + Description + ", Adult=" + Adult + ", Children=" + Children + '}';
    }

    public String getBedName() {
        return BedName;
    }

    public void setBedName(String BedName) {
        this.BedName = BedName;
    }

    public int getBedAmount() {
        return BedAmount;
    }

    public void setBedAmount(int BedAmount) {
        this.BedAmount = BedAmount;
    }

    public int getNoOfAvailableRoom() {
        return NoOfAvailableRoom;
    }

    public void setNoOfAvailableRoom(int NoOfAvailableRoom) {
        this.NoOfAvailableRoom = NoOfAvailableRoom;
    }

}
