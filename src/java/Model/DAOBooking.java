/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

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

    public List<RoomType> listAvailableRoom() {
        String sql = "select rt.RoomTypeID, Count(*) as 'NoOfAvailableRoom' from Booking b full outer join BookDetail bd\n"
                + "on b.BookID = bd.BookID full outer join Room r\n"
                + "on bd.RoomID = r.RoomID full outer join RoomType rt\n"
                + "on r.RoomTypeID = rt.RoomTypeID \n"
                + "where PaymentStatus = 1 or PaymentStatus is null\n"
                + "group by rt.RoomTypeID";
        List<RoomType> list = new ArrayList<>();
        try {
            conn = getConnection();
            state = conn.prepareStatement(sql);
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
        String sql = "select * from RoomType where ? / Adult = ? and Children >= ? and RoomTypeID = ?";
        try {
            conn = getConnection();
            state = conn.prepareStatement(sql);
            state.setInt(1, Adult);
            state.setInt(2, Room);
            state.setInt(3, Children);
            state.setInt(4, RoomTypeID);
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

    static List<RoomType> listRcmd = new ArrayList<>();

    public static void main(String[] args) {
        DAOBooking daoB = new DAOBooking();
//        List<RoomType> list = daoB.listAvailableRoom();
        listRcmd = daoB.listRecommendRoom(listRcmd, 1, 2, 0, 1);
//        for (RoomType roomType : listRcmd) {
//            System.out.println(roomType.getRoomTypeID() + ", " + roomType.getNoOfAvailableRoom());
//        }
        for (RoomType roomType : listRcmd) {
            System.out.println(roomType);
        }
//        System.out.println(daoB.getNoOfAvailableRoomOfARoomType(1));
    }
}
