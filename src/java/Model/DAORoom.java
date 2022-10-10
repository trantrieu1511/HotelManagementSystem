/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

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
public class DAORoom extends DBConnect {

    Connection conn = null;
    PreparedStatement state = null;
    Statement st = null;
    ResultSet rs = null;

    public List<Room> listAvailableRooms(String roomTypeID, String amount) {
        String sql = "select distinct top " + amount + " r.RoomID, r.[Name] as RoomName, \n"
                + "r.[Floor], r.[View], rt.RoomTypeID, rt.[Name] as RoomTypeName, \n"
                + "rt.Adult, rt.Children, rt.Price\n"
                + "from Booking b full outer join BookDetail bd\n"
                + "on b.BookID = bd.BookID full outer join Room r\n"
                + "on bd.RoomID = r.RoomID full outer join RoomType rt\n"
                + "on r.RoomTypeID = rt.RoomTypeID \n"
                + "where \n"
                + "(select MAX(CheckOut) from BookDetail) <= '2022-10-10' and\n"
                + "b.PaymentStatus = 1 and\n"
                + "rt.RoomTypeID = " + roomTypeID + " or \n"
                + "b.PaymentStatus is null and\n"
                + "rt.RoomTypeID = " + roomTypeID + "\n"
                + "order by r.RoomID asc";
        List<Room> list = new ArrayList<>();
        try {
            conn = getConnection();
            state = conn.prepareStatement(sql);
            rs = state.executeQuery();
            while (rs.next()) {
                list.add(new Room(
                        rs.getInt("RoomID"),
                        rs.getString("RoomName"),
                        rs.getInt("Floor"),
                        rs.getString("View"),
                        rs.getInt("RoomTypeID"),
                        rs.getString("RoomTypeName"),
                        rs.getInt("Adult"),
                        rs.getInt("Children"),
                        rs.getDouble("Price")
                ));
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

    public static void main(String[] args) {
        DAORoom daoR = new DAORoom();
        List<Room> listRooms = new ArrayList<>();
//        List<Room> list = daoR.listAvailableRooms("1", "2");
        String[] roomTypeID = new String[]{
            "1", "", "3", "", ""
        };
        for (int i = 0; i < roomTypeID.length; i++) {
            if (!"".equals(roomTypeID[i])) {
                daoR.listAvailableRooms(roomTypeID[i], "3").forEach((Room room) -> {
                    listRooms.add(room);
                });
            }
        }

        listRooms.forEach((room) -> {
            System.out.println(room.getRoomID() + " " + room.getRoomName() + " " + room.getFloor() + " " + room.getView()
                    + " " + room.getRoomTypeID() + " " + room.getName() + " " + room.getAdult() + " " + room.getChildren()
                    + " " + room.getPrice()
            );
//            System.out.println(room);
        }
        );
//        list.forEach((room) -> {
//            System.out.println(room);
//        });
//        System.out.println(roomTypeID[2]);
    }
}
