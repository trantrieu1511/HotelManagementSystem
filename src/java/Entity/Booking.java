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
    boolean PaymentStatus, isCancelled;

    public Booking() {
    }

    public Booking(int BookID, String CusID, String BookDate, boolean PaymentStatus, boolean isCancelled) {
        this.BookID = BookID;
        this.CusID = CusID;
        this.BookDate = BookDate;
        this.PaymentStatus = PaymentStatus;
        this.isCancelled = isCancelled;
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

    @Override
    public String toString() {
        return "Booking{" + "BookID=" + BookID + ", CusID=" + CusID + ", BookDate=" + BookDate + ", PaymentStatus=" + PaymentStatus + ", isCancelled=" + isCancelled + '}';
    }

}
