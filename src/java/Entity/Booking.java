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
public class Booking {

    int BookID;
    String CusID, BookDate;
    int NumOfAdult, NumOfChildren, NumOfRoom;
    boolean PaymentStatus, isCancelled;
    double TotalPrice;

    public Booking() {
    }

    public Booking(int BookID, String CusID, String BookDate, boolean PaymentStatus, boolean isCancelled) {
        this.BookID = BookID;
        this.CusID = CusID;
        this.BookDate = BookDate;
        this.PaymentStatus = PaymentStatus;
        this.isCancelled = isCancelled;
    }

    public Booking(int BookID, String BookDate, boolean PaymentStatus, boolean isCancelled, double TotalPrice) {
        this.BookID = BookID;
        this.BookDate = BookDate;
        this.PaymentStatus = PaymentStatus;
        this.isCancelled = isCancelled;
        this.TotalPrice = TotalPrice;
    }

    public Booking(int BookID, String CusID, String BookDate, int NumOfAdult, int NumOfChildren, int NumOfRoom, boolean PaymentStatus, boolean isCancelled, double TotalPrice) {
        this.BookID = BookID;
        this.CusID = CusID;
        this.BookDate = BookDate;
        this.NumOfAdult = NumOfAdult;
        this.NumOfChildren = NumOfChildren;
        this.NumOfRoom = NumOfRoom;
        this.PaymentStatus = PaymentStatus;
        this.isCancelled = isCancelled;
        this.TotalPrice = TotalPrice;
    }

    public int getBookID() {
        return BookID;
    }

    public void setBookID(int BookID) {
        this.BookID = BookID;
    }

    public String getCusID() {
        return CusID;
    }

    public void setCusID(String CusID) {
        this.CusID = CusID;
    }

    public String getBookDate() {
        return BookDate;
    }

    public void setBookDate(String BookDate) {
        this.BookDate = BookDate;
    }

    public boolean isPaymentStatus() {
        return PaymentStatus;
    }

    public void setPaymentStatus(boolean PaymentStatus) {
        this.PaymentStatus = PaymentStatus;
    }

    public boolean isIsCancelled() {
        return isCancelled;
    }

    public void setIsCancelled(boolean isCancelled) {
        this.isCancelled = isCancelled;
    }

    public int getNumOfAdult() {
        return NumOfAdult;
    }

    public void setNumOfAdult(int NumOfAdult) {
        this.NumOfAdult = NumOfAdult;
    }

    public int getNumOfChildren() {
        return NumOfChildren;
    }

    public void setNumOfChildren(int NumOfChildren) {
        this.NumOfChildren = NumOfChildren;
    }

    public int getNumOfRoom() {
        return NumOfRoom;
    }

    public void setNumOfRoom(int NumOfRoom) {
        this.NumOfRoom = NumOfRoom;
    }

    @Override
    public String toString() {
        return "Booking{" + "BookID=" + BookID + ", CusID=" + CusID + ", BookDate=" + BookDate + ", NumOfAdult=" + NumOfAdult + ", NumOfChildren=" + NumOfChildren + ", NumOfRoom=" + NumOfRoom + ", PaymentStatus=" + PaymentStatus + ", isCancelled=" + isCancelled + ", TotalPrice=" + TotalPrice + '}';
    }

    
}
