/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import Entity.BookDetail;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 *
 * @author DELL
 */
public class DAOBookingDetail extends DBConnect {

    Connection conn = null;
    PreparedStatement state = null;
    Statement st = null;
    ResultSet rs = null;

    public boolean addBookingDetail(BookDetail bookDetail, String dateDiff) {
        String sql = "insert into BookDetail "
                + "values("
                + "?,?,"
                + "'" + bookDetail.getCheckIn() + "',"
                + "'" + bookDetail.getCheckOut() + "',"
                + Integer.parseInt(dateDiff) + "*(select Price from RoomType rt join Room r "
                + "on rt.RoomTypeID = r.RoomTypeID where RoomID = ?))";
        try {
            conn = getConnection();
            state = conn.prepareStatement(sql);
            state.setInt(1, bookDetail.getBookID());
            state.setInt(2, bookDetail.getRoomID());
            state.setInt(3, bookDetail.getRoomID());
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
