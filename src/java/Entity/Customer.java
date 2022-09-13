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
public class Customer {

    int Id;
    String CusID, FirstName, LastName;
    boolean Gender;
    String DOB, Address, Email, PhoneNumber;

    public Customer() {
    }

    public Customer(int Id, String CusID, String FirstName, String LastName, boolean Gender, String DOB, String Address, String Email, String PhoneNumber) {
        this.Id = Id;
        this.CusID = CusID;
        this.FirstName = FirstName;
        this.LastName = LastName;
        this.Gender = Gender;
        this.DOB = DOB;
        this.Address = Address;
        this.Email = Email;
        this.PhoneNumber = PhoneNumber;
    }

    public int getId() {
        return Id;
    }

    public void setId(int Id) {
        this.Id = Id;
    }

    public String getCusID() {
        return CusID;
    }

    public void setCusID(String CusID) {
        this.CusID = CusID;
    }

    public String getFirstName() {
        return FirstName;
    }

    public void setFirstName(String FirstName) {
        this.FirstName = FirstName;
    }

    public String getLastName() {
        return LastName;
    }

    public void setLastName(String LastName) {
        this.LastName = LastName;
    }

    public boolean isGender() {
        return Gender;
    }

    public void setGender(boolean Gender) {
        this.Gender = Gender;
    }

    public String getDOB() {
        return DOB;
    }

    public void setDOB(String DOB) {
        this.DOB = DOB;
    }

    public String getAddress() {
        return Address;
    }

    public void setAddress(String Address) {
        this.Address = Address;
    }

    public String getEmail() {
        return Email;
    }

    public void setEmail(String Email) {
        this.Email = Email;
    }

    public String getPhoneNumber() {
        return PhoneNumber;
    }

    public void setPhoneNumber(String PhoneNumber) {
        this.PhoneNumber = PhoneNumber;
    }

    @Override
    public String toString() {
        return "Customer{" + "Id=" + Id + ", CusID=" + CusID + ", FirstName=" + FirstName + ", LastName=" + LastName + ", Gender=" + Gender + ", DOB=" + DOB + ", Address=" + Address + ", Email=" + Email + ", PhoneNumber=" + PhoneNumber + '}';
    }

}
