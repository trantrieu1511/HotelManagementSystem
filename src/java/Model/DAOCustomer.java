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
import java.text.ParseException;
import java.text.SimpleDateFormat;

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

    public Customer getCustomerDetails(int Id) {
        String sql = "select * from Customer where Id = ?";
        try {
            conn = getConnection();
            state = conn.prepareStatement(sql);
            state.setInt(1, Id);
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
        System.out.println(dao.getCustomerDetails(1));
    }

    public boolean editFullName(String firstName, String lastName, String cusId) {
        String sql = "update Customer set FirstName = ?, LastName = ? where "
                + "CusID = ?";
        try {
            conn = getConnection();
            state = conn.prepareStatement(sql);
            state.setString(1, firstName);
            state.setString(2, lastName);
            state.setString(3, cusId);
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

    public boolean editEmail(String email, String cusId) {
        String sql = "update Customer set Email = ? where CusID = ?";
        try {
            conn = getConnection();
            state = conn.prepareStatement(sql);
            state.setString(1, email);
            state.setString(2, cusId);
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

    public boolean editPhoneNumber(String phoneNumber, String cusId) {
        String sql = "update Customer set PhoneNumber = ? where CusID = ?";
        try {
            conn = getConnection();
            state = conn.prepareStatement(sql);
            state.setString(1, phoneNumber);
            state.setString(2, cusId);
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

    public boolean editGender(String isMale, String cusId) {
        String sql = "update Customer set Gender = ? where CusID = ?";
        try {
            conn = getConnection();
            state = conn.prepareStatement(sql);
            state.setString(1, isMale);
            state.setString(2, cusId);
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

    SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd");
    SimpleDateFormat sdf2 = new SimpleDateFormat("dd/MM/yyyy");

    public boolean editDOB(String dob, String cusId) {
        String sql = "update Customer set DOB = ? where CusID = ?";
        try {
            conn = getConnection();
            state = conn.prepareStatement(sql);
            state.setString(1, sdf2.format(sdf1.parse(dob)));
            state.setString(2, cusId);
            state.executeUpdate();
        } catch (SQLException | ParseException ex) {
            ex.printStackTrace();
            return false;
        } finally {
            closeResultSet(rs);
            closePrepareStatement(state);
            closeConnection(conn);
        }
        return true;
    }

    public boolean editAddress(String address, String cusId) {
        String sql = "update Customer set Address = ? where CusID = ?";
        try {
            conn = getConnection();
            state = conn.prepareStatement(sql);
            state.setString(1, address);
            state.setString(2, cusId);
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

    public boolean editPassword(String password, String cusId) {
        String sql = "update Customer set [Password] = ? where CusID = ?";
        try {
            conn = getConnection();
            state = conn.prepareStatement(sql);
            state.setString(1, password);
            state.setString(2, cusId);
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
}
