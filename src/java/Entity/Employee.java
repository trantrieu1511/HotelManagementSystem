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
public class Employee {

    int EmpID;
//    int Id;
//    String EmpID;
    String FirstName, LastName;
    boolean Gender;
    String DOB, HireDate, Address, Email, PhoneNumber, Username, Password, ReportsTo;

    public Employee() {
    }

    public Employee(int EmpID, String FirstName, String LastName, boolean Gender, String DOB, String HireDate, String Address, String Email, String PhoneNumber, String Username, String Password, String ReportsTo) {
        this.EmpID = EmpID;
        this.FirstName = FirstName;
        this.LastName = LastName;
        this.Gender = Gender;
        this.DOB = DOB;
        this.HireDate = HireDate;
        this.Address = Address;
        this.Email = Email;
        this.PhoneNumber = PhoneNumber;
        this.Username = Username;
        this.Password = Password;
        this.ReportsTo = ReportsTo;
    }

    public int getEmpID() {
        return EmpID;
    }

    public void setEmpID(int EmpID) {
        this.EmpID = EmpID;
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

    public String getHireDate() {
        return HireDate;
    }

    public void setHireDate(String HireDate) {
        this.HireDate = HireDate;
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

    public String getReportsTo() {
        return ReportsTo;
    }

    public void setReportsTo(String ReportsTo) {
        this.ReportsTo = ReportsTo;
    }

    @Override
    public String toString() {
        return "Employee{EmpID=" + EmpID + ", FirstName=" + FirstName + ", LastName=" + LastName + ", Gender=" + Gender + ", DOB=" + DOB + ", HireDate=" + HireDate + ", Address=" + Address + ", Email=" + Email + ", PhoneNumber=" + PhoneNumber + ", Username=" + Username + ", Password=" + Password + ", ReportsTo=" + ReportsTo + '}';
    }

}
