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
public class BookDetail extends Booking {

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

    //add BookDetail constructor
    public BookDetail(int BookID, int RoomID, String CheckIn, String CheckOut) {
        this.BookID = BookID;
        this.RoomID = RoomID;
        this.CheckIn = CheckIn;
        this.CheckOut = CheckOut;
    }

    public BookDetail(String CheckIn, String CheckOut, int BookID, String BookDate, boolean PaymentStatus, boolean isCancelled, double TotalPrice) {
        super(BookID, BookDate, PaymentStatus, isCancelled, TotalPrice);
        this.CheckIn = CheckIn;
        this.CheckOut = CheckOut;
    }

    public int getBD_ID() {
        return BD_ID;
    }

    public void setBD_ID(int BD_ID) {
        this.BD_ID = BD_ID;
    }

    public int getBDBookID() {
        return BookID;
    }

    public void setBDBookID(int BookID) {
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

    public double getTotalPrice() {
        return TotalPrice;
    }

    public void setTotalPrice(double TotalPrice) {
        this.TotalPrice = TotalPrice;
    }

    @Override
    public String toString() {
        return super.toString() + "BookDetail{" + "BD_ID=" + BD_ID + ", BookID=" + BookID + ", RoomID=" + RoomID + ", CheckIn=" + CheckIn + ", CheckOut=" + CheckOut + ", Amount=" + Amount + '}';
    }

}
