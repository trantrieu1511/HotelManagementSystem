/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 *
 * @author Trieu
 */
public class DBConnect {

    public Connection getConnection() {
        Connection conn = null;
        try {
            // URL: connection string: address, port, database of server
            // call drivers
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            // connection
            conn = DriverManager.getConnection("jdbc:sqlserver://localhost:1433;databaseName=MyHotel", "sa", "12345678");
            System.out.println("connected");
        } catch (ClassNotFoundException ex) {
            ex.printStackTrace();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return conn;
    }

    public ResultSet getData(String sql) throws Exception {
        try {
            Statement state = getConnection().createStatement(
                    ResultSet.TYPE_SCROLL_SENSITIVE,
                    ResultSet.CONCUR_UPDATABLE);
            ResultSet rs = state.executeQuery(sql);
            return rs;
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return null;
    }

    public void closeConnection(Connection conn) {

        if (conn != null) {
            try {
                conn.close();
            } catch (Exception ex) {
            }
        }
    }

    public void closeStatement(Statement state) {

        if (state != null) {
            try {
                state.close();
            } catch (Exception e) {
            }
        }
    }

    public void closePrepareStatement(PreparedStatement pre) {

        if (pre != null) {
            try {
                pre.close();
            } catch (Exception e) {
            }
        }
    }

    public void closeResultSet(ResultSet rs) {

        if (rs != null) {
            try {
                rs.close();
            } catch (Exception e) {
            }
        }
    }

    public static void main(String[] args) {
        new DBConnect().getConnection();
    }
}
