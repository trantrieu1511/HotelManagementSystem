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
public class BedType {

    int BedTypeID;
    String Name;

    public BedType() {
    }

    public BedType(int BedTypeID, String Name) {
        this.BedTypeID = BedTypeID;
        this.Name = Name;
    }

    public BedType(String Name) {
        this.Name = Name;
    }

    public int getBedTypeID() {
        return BedTypeID;
    }

    public void setBedTypeID(int BedTypeID) {
        this.BedTypeID = BedTypeID;
    }

    public String getName() {
        return Name;
    }

    public void setName(String Name) {
        this.Name = Name;
    }

    @Override
    public String toString() {
        return "BedType{" + "BedTypeID=" + BedTypeID + ", Name=" + Name + '}';
    }

}
