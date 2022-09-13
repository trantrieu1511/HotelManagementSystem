/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import Entity.Account;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author DELL
 */
public class DAOAccount extends DBConnect {

    Connection conn = null;
    PreparedStatement state = null;
    ResultSet rs = null;

    public Account login(String username, String password) {
        String sql = "select * from Account a join Customer c "
                + "on a.CusID = c.CusID "
                + "where Username = ? and Password = ?";
        try {
            conn = getConnection();
            state = conn.prepareStatement(sql);
            state.setString(1, username);
            state.setString(2, password);
            rs = state.executeQuery();
            if (rs.next()) {
                return new Account(
                        rs.getInt("Id"),
                        rs.getString("CusID"),
                        rs.getString("FirstName"),
                        rs.getString("LastName"),
                        rs.getBoolean("Gender"),
                        rs.getString("DOB"),
                        rs.getString("Address"),
                        rs.getString("Email"),
                        rs.getString("PhoneNumber"),
                        rs.getString("CusID"),
                        rs.getString("Username"),
                        rs.getString("Password"),
                        rs.getInt("Roll")
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
        DAOAccount dao = new DAOAccount();
        Account acc = dao.login("trantrieu123", "12345678");
        System.out.println(acc);
    }

}
