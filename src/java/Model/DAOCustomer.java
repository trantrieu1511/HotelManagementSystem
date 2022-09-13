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

/**
 *
 * @author DELL
 */
public class DAOCustomer extends DBConnect {

    Connection conn = null;
    PreparedStatement state = null;
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

    public static void main(String[] args) {
        DAOCustomer dao = new DAOCustomer();
        Customer cus = dao.loginUsingEmail("nguyenvana@gmail.com", "nguyenvana");
        Customer cus2 = dao.loginUsingPhone("0945656677", "nguyenvana");
        System.out.println(cus);
        System.out.println(cus2);
    }

}
