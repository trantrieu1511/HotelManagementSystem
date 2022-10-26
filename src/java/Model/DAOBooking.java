/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import Entity.Room;
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

    public List<Room> countAvailableRoomAsList() {
        String sql = "select rt.RoomTypeID, Count(*) as 'NoOfAvailableRoom' \n"
                + "from Room r full outer join RoomType rt\n"
                + "on r.RoomTypeID = rt.RoomTypeID \n"
                + "where r.isAvailable = 1\n"
                + "group by rt.RoomTypeID";
        List<Room> list = new ArrayList<>();
        try {
            conn = getConnection();
            state = conn.prepareStatement(sql);
            rs = state.executeQuery();
            while (rs.next()) {
                list.add(new Room(
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

    public boolean addBooking(String cusID, int adult, int children, int room, String Remarks) {
        String sql = "insert into Booking(CusID, BookDate, NumOfAdult, NumOfChildren, NumOfRoom, SpecialRequests) "
                + "values(?, GETDATE(), ?, ?, ?, ?)";
        try {
            conn = getConnection();
            state = conn.prepareStatement(sql);
            state.setString(1, cusID);
            state.setInt(2, adult);
            state.setInt(3, children);
            state.setInt(4, room);
            state.setString(5, Remarks);
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

    public boolean cancelBooking(String cusID) { //cancel latest booking
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

    public boolean cancelBookingByBookID(String bookID) { //cancel booking by bookID
        String sql = "update Booking\n"
                + "set \n"
                + "isCancelled = 1,\n"
                + "PaymentStatus = 1\n"
                + "where \n"
                + "BookID = ?";
        try {
            conn = getConnection();
            state = conn.prepareStatement(sql);
            state.setString(1, bookID);
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

    public boolean deleteBooking(String bookID) {
        String sql = "delete from Booking where bookID = " + bookID;
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

    static List<RoomType> listRcmd = new ArrayList<>();

    public static void main(String[] args) {
        DAOBooking daoB = new DAOBooking();
        List<Room> list = daoB.countAvailableRoomAsList();
////        listRcmd = daoB.listRecommendRoom(listRcmd, 1, 2, 0, 1);

        for (Room room : list) {
            System.out.println(room.getRoomTypeID() + ", " + room.getNoOfAvailableRoom());
        }
        System.out.println(daoB.getLatestCusIDByEmail("nguyenvana@gmail.com"));
        System.out.println(daoB.getLatestBookIDByCusID("CUS00001"));
//        for (RoomType roomType : listRcmd) {
//            System.out.println(roomType);
//        }
//        System.out.println(daoB.getNoOfAvailableRoomOfARoomType(1));
    }
}
