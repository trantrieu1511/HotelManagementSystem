/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import Entity.RoomType;
import Entity.RoomTypeDetail;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author DELL
 */
public class DAORoomType extends DBConnect {

    Connection conn = null;
    PreparedStatement state = null;
    Statement st = null;
    ResultSet rs = null;
//    public RoomType getRecommendedRoomType(String adult, String children, String room) {
//
//    }

    List<RoomType> list = new ArrayList<>();

    public List<RoomType> listRoomType() {
        String sql = "select * from RoomType";
        try {
            conn = getConnection();
            state = conn.prepareStatement(sql);
            rs = state.executeQuery();
            while (rs.next()) {
                list.add(new RoomType(
                        rs.getInt("RoomTypeID"),
                        rs.getString("Name"),
                        rs.getDouble("Price"),
                        rs.getString("Img"),
                        rs.getString("Description"),
                        rs.getInt("Adult"),
                        rs.getInt("Children")));
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

    public static void main(String[] args) {
        DAORoomType daoRt = new DAORoomType();
        List<RoomType> list = daoRt.listRoomType();
        list.forEach((roomType) -> {
            System.out.println(roomType);
        });
    }
}
