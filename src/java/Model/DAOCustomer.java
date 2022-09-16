/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import Entity.Customer;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 *
 * @author DELL
 */
public class DAOCustomer extends DBConnect {
    
    Connection conn = null;
    PreparedStatement state = null;
    Statement st = null;
    ResultSet rs = null;
    
    public Customer loginUsingEmail(String email, String password) {
        String sql = "select * from Customer where Email = ? and Password = ?";
        try {
            conn = getConnection();
            state = conn.prepareStatement(sql);
            state.setString(1, email);
            state.setString(2, password);
            rs = state.executeQuery();
            if (rs.next()) {
                return new Customer(
                        rs.getInt("Id"),
                        rs.getString("CusID"),
                        rs.getString("FirstName"),
                        rs.getString("LastName"),
                        rs.getBoolean("Gender"),
                        rs.getString("DOB"),
                        rs.getString("Address"),
                        rs.getString("Email"),
                        rs.getString("PhoneNumber"),
                        rs.getString("Password")
                );
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            closeResultSet(rs);
            closePrepareStatement(state);
            closeConnection(conn);
        }
        return null;
    }
    
    public Customer loginUsingPhone(String phone_num, String password) {
        String sql = "select * from Customer where PhoneNumber = ? and Password = ?";
        try {
            conn = getConnection();
            state = conn.prepareStatement(sql);
            state.setString(1, phone_num);
            state.setString(2, password);
            rs = state.executeQuery();
            if (rs.next()) {
                return new Customer(
                        rs.getInt("Id"),
                        rs.getString("CusID"),
                        rs.getString("FirstName"),
                        rs.getString("LastName"),
                        rs.getBoolean("Gender"),
                        rs.getString("DOB"),
                        rs.getString("Address"),
                        rs.getString("Email"),
                        rs.getString("PhoneNumber"),
                        rs.getString("Password")
                );
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            closeResultSet(rs);
            closePrepareStatement(state);
            closeConnection(conn);
        }
        return null;
    }
    
    public boolean register(Customer customer) {
        String sql = "insert into Customer(FirstName,LastName,Email,PhoneNumber,[Password]) "
                + "values(?,?,?,?,?)";
        try {
            conn = getConnection();
            state = conn.prepareStatement(sql);
            state.setString(1, customer.getFirstName());
            state.setString(2, customer.getLastName());
            state.setString(3, customer.getEmail());
            state.setString(4, customer.getPhoneNumber());
            state.setString(5, customer.getPassword());
            state.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
            return false;
        } finally {
            closeResultSet(rs);
            closePrepareStatement(state);
            closeConnection(conn);
        }
        return true;
    }
    
    public boolean checkPhoneNumberExist(String phoneNumber) {
        String sql = "select PhoneNumber from Customer where PhoneNumber = ?";
        try {
            conn = getConnection();
            state = conn.prepareStatement(sql);
            state.setString(1, phoneNumber);
            rs = state.executeQuery();
            if (!rs.next()) {
                return false;
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
//            return false;
        } finally {
            closeResultSet(rs);
            closePrepareStatement(state);
            closeConnection(conn);
        }
        return true;
    }
    
    public boolean checkEmailExist(String email) {
        String sql = "select Email from Customer where Email = ?";
        try {
            conn = getConnection();
            state = conn.prepareStatement(sql);
            state.setString(1, email);
            rs = state.executeQuery();
            if (!rs.next()) {
                return false;
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
//            return false;
        } finally {
            closeResultSet(rs);
            closePrepareStatement(state);
            closeConnection(conn);
        }
        return true;
    }
    
    public Customer getCustomerDetails(String CusID) {
        String sql = "select * from Customer where CusID = ?";
        try {
            conn = getConnection();
            state = conn.prepareStatement(sql);
            state.setString(1, CusID);
            rs = state.executeQuery();
            if (rs.next()) {
                return new Customer(
                        rs.getInt("Id"),
                        rs.getString("CusID"),
                        rs.getString("FirstName"),
                        rs.getString("LastName"),
                        rs.getBoolean("Gender"),
                        rs.getString("DOB"),
                        rs.getString("Address"),
                        rs.getString("Email"),
                        rs.getString("PhoneNumber"),
                        rs.getString("Password")
                );
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            closeResultSet(rs);
            closePrepareStatement(state);
            closeConnection(conn);
        }
        return null;
    }
    
    public static void main(String[] args) {
        DAOCustomer dao = new DAOCustomer();
//        Customer cus = dao.loginUsingEmail("nguyenvana@gmail.com", "nguyenvana");
//        Customer cus2 = dao.loginUsingPhone("0945656677", "nguyenvana");
//        System.out.println(cus.getCusID());
//        System.out.println(cus2);

//        boolean emailIsExisted = dao.checkEmailExist("u@gmail.com");
//        boolean phoneNumberIsExisted = dao.checkPhoneNumberExist("0987654321");
//        if (emailIsExisted || phoneNumberIsExisted) {
//            System.out.println("Existed!");
//        } else {
//            System.out.println("Clear!");
//        }
        System.out.println(dao.getCustomerDetails("VÁ00003"));
    }
}
