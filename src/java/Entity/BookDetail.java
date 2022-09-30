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
public class BookDetail {

    int BD_ID, BookID, RoomID;
    String CheckIn, CheckOut;
    double Amount;

    public BookDetail() {
    }

    public BookDetail(int BD_ID, int BookID, int RoomID, String CheckIn, String CheckOut, double Amount) {
        this.BD_ID = BD_ID;
        this.BookID = BookID;
        this.RoomID = RoomID;
        this.CheckIn = CheckIn;
        this.CheckOut = CheckOut;
        this.Amount = Amount;
    }

    public int getBD_ID() {
        return BD_ID;
    }

    public void setBD_ID(int BD_ID) {
        this.BD_ID = BD_ID;
    }

    public int getBookID() {
        return BookID;
    }

    public void setBookID(int BookID) {
        this.BookID = BookID;
    }

    public int getRoomID() {
        return RoomID;
    }

    public void setRoomID(int RoomID) {
        this.RoomID = RoomID;
    }

    public String getCheckIn() {
        return CheckIn;
    }

    public void setCheckIn(String CheckIn) {
        this.CheckIn = CheckIn;
    }

    public String getCheckOut() {
        return CheckOut;
    }

    public void setCheckOut(String CheckOut) {
        this.CheckOut = CheckOut;
    }

    public double getAmount() {
        return Amount;
    }

    public void setAmount(double Amount) {
        this.Amount = Amount;
    }

    @Override
    public String toString() {
        return "BookDetail{" + "BD_ID=" + BD_ID + ", BookID=" + BookID + ", RoomID=" + RoomID + ", CheckIn=" + CheckIn + ", CheckOut=" + CheckOut + ", Amount=" + Amount + '}';
    }

}
