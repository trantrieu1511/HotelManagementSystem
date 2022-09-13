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
public class Account extends Customer {

    String CusID, Username, Password;
    int Roll;

    public Account() {
    }

    public Account(String CusID, String Username, String Password, int Roll) {
        this.CusID = CusID;
        this.Username = Username;
        this.Password = Password;
        this.Roll = Roll;
    }

    public Account(int Id, String CusID, String FirstName, String LastName, boolean Gender, String DOB, String Address, String Email, String PhoneNumber, String CusID_Acc, String Username, String Password, int Roll) {
        super(Id, CusID, FirstName, LastName, Gender, DOB, Address, Email, PhoneNumber);
        this.CusID = CusID_Acc;
        this.Username = Username;
        this.Password = Password;
        this.Roll = Roll;
    }

    public String getCusID() {
        return CusID;
    }

    public void setCusID(String CusID) {
        this.CusID = CusID;
    }

    public String getUsername() {
        return Username;
    }

    public void setUsername(String Username) {
        this.Username = Username;
    }

    public String getPassword() {
        return Password;
    }

    public void setPassword(String Password) {
        this.Password = Password;
    }

    public int getRoll() {
        return Roll;
    }

    public void setRoll(int Roll) {
        this.Roll = Roll;
    }

    @Override
    public String toString() {
        return super.toString() + " " + "Account{" + "CusID=" + CusID + ", Username=" + Username + ", Password=" + Password + ", Roll=" + Roll + '}';
    }

}
