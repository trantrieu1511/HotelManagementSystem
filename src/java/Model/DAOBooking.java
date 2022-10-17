/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import Entity.Customer;
import Entity.RoomType;
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
public class DAOBooking extends DBConnect {

    Connection conn = null;
    PreparedStatement state = null;
    Statement st = null;
    ResultSet rs = null;

    public List<RoomType> countAvailableRoomAsList(String checkIn) {
        String sql = "select rt.RoomTypeID, Count(*) as 'NoOfAvailableRoom' from Booking b full outer join BookDetail bd\n"
                + "on b.BookID = bd.BookID full outer join Room r\n"
                + "on bd.RoomID = r.RoomID full outer join RoomType rt\n"
                + "on r.RoomTypeID = rt.RoomTypeID \n"
                + "where \n"
                + "(select MAX(CheckOut) from BookDetail) <= ? and\n"
                + "b.PaymentStatus = 1 or \n"
                + "b.PaymentStatus is null \n"
                + "group by rt.RoomTypeID";
        List<RoomType> list = new ArrayList<>();
        try {
            conn = getConnection();
            state = conn.prepareStatement(sql);
            state.setString(1, checkIn);
            rs = state.executeQuery();
            while (rs.next()) {
                list.add(new RoomType(
                        rs.getInt("RoomTypeID"),
                        rs.getInt("NoOfAvailableRoom")
                ));
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
//            return false;
        } finally {
            closeResultSet(rs);
            closePrepareStatement(state);
            closeConnection(conn);
        }
        return list;
    }

    public List<RoomType> listRecommendRoom(List<RoomType> listRecommendRooms, int RoomTypeID, int Adult, int Children, int Room) {
        String sql = "select * from RoomType where ? / Adult = ? and RoomTypeID = ?";
        try {
            conn = getConnection();
            state = conn.prepareStatement(sql);
            state.setInt(1, Adult);
            state.setInt(2, Room);
//            state.setInt(3, Children);
            state.setInt(3, RoomTypeID);
            rs = state.executeQuery();
            while (rs.next()) {
                listRecommendRooms.add(new RoomType(
                        rs.getInt("RoomTypeID"),
                        rs.getString("Name"),
                        rs.getDouble("Price"),
                        rs.getString("Img"),
                        rs.getString("Description"),
                        rs.getInt("Adult"),
                        rs.getInt("Children"))
                );
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
//            return false;
        } finally {
            closeResultSet(rs);
            closePrepareStatement(state);
            closeConnection(conn);
        }
        return listRecommendRooms;
    }

    public boolean addBooking(String cusID, String Remarks) {
        String sql = "insert into Booking(CusID, BookDate, SpecialRequests) values(?, GETDATE(), ?)";
        try {
            conn = getConnection();
            state = conn.prepareStatement(sql);
            state.setString(1, cusID);
            state.setString(2, Remarks);
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

    public String getLatestCusIDByEmail(String Email) {
        String sql = "select top 1 * from Customer\n"
                + "where Email = ?\n"
                + "order by CusID desc";
        try {
            conn = getConnection();
            state = conn.prepareStatement(sql);
            state.setString(1, Email);
            rs = state.executeQuery();
            if (rs.next()) {
                return rs.getString("CusID");
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

    public int getLatestBookIDByCusID(String cusID) {
        String sql = "select top 1 * from Booking where CusID = ?\n"
                + "order by BookID desc";
        try {
            conn = getConnection();
            state = conn.prepareStatement(sql);
            state.setString(1, cusID);
            rs = state.executeQuery();
            if (rs.next()) {
                return rs.getInt("BookID");
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            closeResultSet(rs);
            closePrepareStatement(state);
            closeConnection(conn);
        }
        return 0;
    }

    public boolean cancelBooking(String cusID) {
        String sql = "update Booking\n"
                + "set \n"
                + "isCancelled = 1,\n"
                + "PaymentStatus = 1\n"
                + "where \n"
                + "BookID = (select top 1 BookID from Booking where CusID = ? \n"
                + "order by BookID desc)";
        try {
            conn = getConnection();
            state = conn.prepareStatement(sql);
            state.setString(1, cusID);
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

    static List<RoomType> listRcmd = new ArrayList<>();

    public static void main(String[] args) {
        DAOBooking daoB = new DAOBooking();
//        List<RoomType> list = daoB.listAvailableRoom("2022-10-05");
////        listRcmd = daoB.listRecommendRoom(listRcmd, 1, 2, 0, 1);
//        for (RoomType roomType : list) {
//            System.out.println(roomType.getRoomTypeID() + ", " + roomType.getNoOfAvailableRoom());
//        }
        System.out.println(daoB.getLatestCusIDByEmail("vuivanve@gmail.com"));
//        for (RoomType roomType : listRcmd) {
//            System.out.println(roomType);
//        }
//        System.out.println(daoB.getNoOfAvailableRoomOfARoomType(1));
    }
}
