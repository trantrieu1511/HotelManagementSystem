/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import Entity.BookDetail;
import Entity.Room;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

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
            state.setInt(1, bookDetail.getBDBookID());
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

    public List<BookDetail> getBookingByCusID(int cusID) {
        String sql = "select distinct b.BookID, b.BookDate ,b.PaymentStatus, b.isCancelled, bd.CheckIn, bd.CheckOut, SUM(bd.Amount) as 'TotalPrice' "
                + "from Booking b full outer join BookDetail bd\n"
                + "on b.BookID = bd.BookID where b.CusID = ?\n"
                + "group by b.BookID, b.BookDate, bd.CheckIn, bd.CheckOut, b.PaymentStatus, b.isCancelled";
        List<BookDetail> list = new ArrayList<>();
        try {
            conn = getConnection();
            state = conn.prepareStatement(sql);
//            state.setString(1, cusID);
            state.setInt(1, cusID);
            rs = state.executeQuery();
            while (rs.next()) {
                list.add(new BookDetail(
                        rs.getString("CheckIn"),
                        rs.getString("CheckOut"),
                        rs.getInt("BookID"),
                        rs.getString("BookDate"),
                        rs.getBoolean("PaymentStatus"),
                        rs.getBoolean("isCancelled"),
                        rs.getDouble("TotalPrice"))
                );
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            closeResultSet(rs);
            closePrepareStatement(state);
            closeConnection(conn);
        }
        return list;
    }

    public BookDetail getBookDetailByBookID(String bookID) {
        String sql = "select distinct b.BookID, b.BookDate, b.NumOfAdult, b.NumOfChildren, b.NumOfRoom, "
                + " b.PaymentStatus, b.isCancelled, bd.CheckIn, bd.CheckOut, SUM(bd.Amount) as 'TotalPrice' "
                + "from Booking b full outer join BookDetail bd\n"
                + "on b.BookID = bd.BookID where b.bookID = ?\n"
                + "group by b.BookID, b.BookDate, b.NumOfAdult, b.NumOfChildren, b.NumOfRoom, b.PaymentStatus, "
                + "b.isCancelled, bd.CheckIn, bd.CheckOut";
        try {
            conn = getConnection();
            state = conn.prepareStatement(sql);
            state.setString(1, bookID);
            rs = state.executeQuery();
            while (rs.next()) {
                return new BookDetail(
                        rs.getString("CheckIn"),
                        rs.getString("CheckOut"),
                        rs.getInt("BookID"),
                        rs.getString("BookDate"),
                        rs.getInt("NumOfAdult"),
                        rs.getInt("NumOfChildren"),
                        rs.getInt("NumOfRoom"),
                        rs.getBoolean("PaymentStatus"),
                        rs.getBoolean("isCancelled"),
                        rs.getDouble("TotalPrice"));
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

    public boolean deleteBookingDetails(String bookID) {
        String sql = "delete from BookDetail where bookID = " + bookID;
        try {
            conn = getConnection();
            state = conn.prepareStatement(sql);
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

    public static void main(String[] args) {
        DAOBookingDetail daoBd = new DAOBookingDetail();
        DAOBooking daoB = new DAOBooking();
//        List<BookDetail> list = daoBd.getBookingByCusID("CUS00001");
        BookDetail bookDetail = daoBd.getBookDetailByBookID("4");
//        for (BookDetail bookDetail : list) {
//            System.out.println(bookDetail);
//        }
        System.out.println(bookDetail);
//        boolean statusAdd = daoBd.addBookingDetail(new BookDetail(1,
//                1, "2022-10-25", "2022-10-26"), "1");
//        if (statusAdd) {
//            System.out.println("Add BookDetail Successfully");
//        } else {
//            System.out.println("Add BookDetail Failed");
//        }
    }
}
