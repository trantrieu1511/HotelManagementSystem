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
                + "rt.Adult, rt.Children, rt.Price, rt.[Description]\n"
                + "from Room r full outer join RoomType rt\n"
                + "on r.RoomTypeID = rt.RoomTypeID \n"
                + "where r.isAvailable = 1 and\n"
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
                        rs.getDouble("Price"),
                        rs.getString("Description")
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

    public boolean setRoomToUnavailable(String RoomID) {
        String sql = "update Room set\n"
                + "isAvailable = 0\n"
                + "where RoomID = ?";
        try {
            conn = getConnection();
            state = conn.prepareStatement(sql);
            state.setString(1, RoomID);
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

    public boolean setRoomToAvailable(String RoomID) {
        String sql = "update Room set\n"
                + "isAvailable = 1\n"
                + "where RoomID = ?";
        try {
            conn = getConnection();
            state = conn.prepareStatement(sql);
            state.setString(1, RoomID);
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

    public List<Room> getListAvailableRoomsByRT_ID(String RT_ID) {
        String sql = "select r.RoomID, r.[Name] as RoomName, \n"
                + "r.[Floor], r.[View], rt.RoomTypeID, rt.[Name] as RoomTypeName, \n"
                + "rt.Adult, rt.Children, rt.Price, rt.[Description]\n"
                + "from Room r full outer join RoomType rt\n"
                + "on r.RoomTypeID = rt.RoomTypeID \n"
                + "where r.isAvailable = 1 and\n"
                + "rt.RoomTypeID = " + RT_ID + "\n"
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
                        rs.getDouble("Price"),
                        rs.getString("Description")
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

    public List<Room> getListOfRoomsByRT_ID(String RT_ID) {
        String sql = "select r.RoomID, r.[Name] as RoomName, \n"
                + "r.[Floor], r.[View], rt.RoomTypeID, rt.[Name] as RoomTypeName, \n"
                + "rt.Adult, rt.Children, rt.Price, rt.[Description]\n"
                + "from Room r full outer join RoomType rt\n"
                + "on r.RoomTypeID = rt.RoomTypeID \n"
                + "where rt.RoomTypeID = " + RT_ID + "\n"
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
                        rs.getDouble("Price"),
                        rs.getString("Description")
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

    public List<String> getListOfViewsByRT_ID(String RT_ID) {
        String sql = "select distinct r.[View]\n"
                + "from Room r full outer join RoomType rt\n"
                + "on r.RoomTypeID = rt.RoomTypeID \n"
                + "where rt.RoomTypeID = ?";
        List<String> views = new ArrayList<>();
        try {
            conn = getConnection();
            state = conn.prepareStatement(sql);
            state.setString(1, RT_ID);
            rs = state.executeQuery();
            while (rs.next()) {
                views.add(rs.getString("View"));
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            closeResultSet(rs);
            closePrepareStatement(state);
            closeConnection(conn);
        }
        return views;
    }

    public static void main(String[] args) {
        DAORoom daoR = new DAORoom();
        List<Room> listRooms = new ArrayList<>();
//        List<Room> list = daoR.listAvailableRooms("1", "2");
        String[] roomTypeID = new String[]{
            "1", "", "3", "", ""
        };
//        for (int i = 0; i < roomTypeID.length; i++) {
//            if (!"".equals(roomTypeID[i])) {
//                daoR.listAvailableRooms(roomTypeID[i], "3").forEach((Room room) -> {
//                    listRooms.add(room);
//                });
//            }
//        }

//        listRooms = daoR.getListAvailableRoomsByRT_ID("2");
        listRooms = daoR.getListOfRoomsByRT_ID("2");

        listRooms.forEach((room) -> {
//            System.out.println(room.getRoomID() + " " + room.getRoomName() + " " + room.getFloor() + " " + room.getView()
//                    + " " + room.getRoomTypeID() + " " + room.getName() + " " + room.getAdult() + " " + room.getChildren()
//                    + " " + room.getPrice()
//            );
            System.out.println(room);
        }
        );

        List<String> views = daoR.getListOfViewsByRT_ID("1");
        views.forEach(view -> {
            System.out.println(view);
        });

//        list.forEach((room) -> {
//            System.out.println(room);
//        });
//        System.out.println(roomTypeID[2]);
    }
}
