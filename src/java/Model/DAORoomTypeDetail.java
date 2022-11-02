/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import Entity.Customer;
import Entity.RoomTypeDetail;
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
public class DAORoomTypeDetail extends DBConnect {

    Connection conn = null;
    PreparedStatement state = null;
    Statement st = null;
    ResultSet rs = null;

    List<RoomTypeDetail> list = new ArrayList<>();

    public List<RoomTypeDetail> listRoomTypeDetail1() {
        String sql = "select * from RoomTypeDetail";
        try {
            conn = getConnection();
            state = conn.prepareStatement(sql);
            rs = state.executeQuery();
            while (rs.next()) {
                list.add(new RoomTypeDetail());
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            closeResultSet(rs);
            closePrepareStatement(state);
            closeConnection(conn);
        }
        return list;
    }

    public List<RoomTypeDetail> listRoomTypeDetail() {
        String sql = "select rtd.RoomTypeID, bt.[Name], \n"
                + "rtd.BedAmount from RoomTypeDetail rtd join BedType bt\n"
                + "on rtd.BedTypeID = bt.BedTypeID";
        try {
            conn = getConnection();
            state = conn.prepareStatement(sql);
            rs = state.executeQuery();
            while (rs.next()) {
                list.add(new RoomTypeDetail(
//                        rs.getInt("RTD_ID"),
                        rs.getInt("RoomTypeID"),
                        rs.getString("Name"),
                        rs.getInt("BedAmount")));
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

    public List<RoomTypeDetail> getListOfRoomTypeDetailByRT_ID(String RT_ID) {
        String sql = "select rtd.RoomTypeID, bt.[Name], \n"
                + "rtd.BedAmount from RoomTypeDetail rtd join BedType bt\n"
                + "on rtd.BedTypeID = bt.BedTypeID where rtd.RoomTypeID = ?";
        try {
            conn = getConnection();
            state = conn.prepareStatement(sql);
            state.setString(1, RT_ID);
            rs = state.executeQuery();
            while (rs.next()) {
                list.add(new RoomTypeDetail(
//                        rs.getInt("RTD_ID"),
                        rs.getInt("RoomTypeID"),
                        rs.getString("Name"),
                        rs.getInt("BedAmount")));
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
        DAORoomTypeDetail daoRtd = new DAORoomTypeDetail();
//        List<RoomTypeDetail> list = daoRtd.listRoomTypeDetail();
        List<RoomTypeDetail> list = daoRtd.getListOfRoomTypeDetailByRT_ID("2");
        for (RoomTypeDetail roomTypeDetail : list) {
            System.out.println(roomTypeDetail);
        }
    }
}
