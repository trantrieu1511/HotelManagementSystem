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
    public int getId() {
        return Id;
    }

    @Override
    public void setId(int Id) {
        this.Id = Id;
    }

    @Override
    public String getFirstName() {
        return FirstName;
    }

    @Override
    public void setFirstName(String FirstName) {
        this.FirstName = FirstName;
    }

    @Override
    public String getLastName() {
        return LastName;
    }

    @Override
    public void setLastName(String LastName) {
        this.LastName = LastName;
    }

    @Override
    public boolean isGender() {
        return Gender;
    }

    @Override
    public void setGender(boolean Gender) {
        this.Gender = Gender;
    }

    @Override
    public String getDOB() {
        return DOB;
    }

    @Override
    public void setDOB(String DOB) {
        this.DOB = DOB;
    }

    @Override
    public String getAddress() {
        return Address;
    }

    @Override
    public void setAddress(String Address) {
        this.Address = Address;
    }

    @Override
    public String getEmail() {
        return Email;
    }

    @Override
    public void setEmail(String Email) {
        this.Email = Email;
    }

    @Override
    public String getPhoneNumber() {
        return PhoneNumber;
    }

    @Override
    public void setPhoneNumber(String PhoneNumber) {
        this.PhoneNumber = PhoneNumber;
    }

    @Override
    public String toString() {
        return super.toString() + " " + "Account{" + "CusID=" + CusID + ", Username=" + Username + ", Password=" + Password + ", Roll=" + Roll + '}';
    }

}
