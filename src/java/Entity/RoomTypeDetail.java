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
public class RoomTypeDetail extends BedType {

    int RTD_ID, RoomTypeID, BedTypeID, BedAmount;

    public RoomTypeDetail() {
    }

    public RoomTypeDetail(int RTD_ID, int RoomTypeID, int BedTypeID, int BedAmount) {
        this.RTD_ID = RTD_ID;
        this.RoomTypeID = RoomTypeID;
        this.BedTypeID = BedTypeID;
        this.BedAmount = BedAmount;
    }

    public RoomTypeDetail(int RTD_ID, int RoomTypeID, String Name, int BedAmount) {
        super(Name);
        this.RTD_ID = RTD_ID;
        this.RoomTypeID = RoomTypeID;
        this.BedAmount = BedAmount;
    }

    public int getRTD_ID() {
        return RTD_ID;
    }

    public void setRTD_ID(int RTD_ID) {
        this.RTD_ID = RTD_ID;
    }

    public int getRoomTypeID() {
        return RoomTypeID;
    }

    public void setRoomTypeID(int RoomTypeID) {
        this.RoomTypeID = RoomTypeID;
    }

    public int getBedTypeID() {
        return BedTypeID;
    }

    public void setBedTypeID(int BedTypeID) {
        this.BedTypeID = BedTypeID;
    }

    public int getBedAmount() {
        return BedAmount;
    }

    public void setBedAmount(int BedAmount) {
        this.BedAmount = BedAmount;
    }

    @Override
    public String toString() {
        return super.toString() + " RoomTypeDetail{" + "RTD_ID=" + RTD_ID + ", RoomTypeID=" + RoomTypeID + ", BedTypeID=" + BedTypeID + ", BedAmount=" + BedAmount + '}';
    }

}
