/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Entity.Room;
import Entity.RoomType;
import Entity.RoomTypeDetail;
import Model.DAORoom;
import Model.DAORoomType;
import Model.DAORoomTypeDetail;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author DELL
 */
@WebServlet(name = "ControllerRoomType", urlPatterns = {"/roomtype"})
public class ControllerRoomType extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    List<RoomType> listRoomType = new ArrayList<>();
    List<RoomTypeDetail> listRtd = new ArrayList<>();
    List<Room> listAvailableRoom = new ArrayList<>();
    List<Room> listRoom = new ArrayList<>();
    List<String> listOfRoomViews = null;

    DAORoom daoR = new DAORoom();
    DAORoomType daoRt = new DAORoomType();
    DAORoomTypeDetail daoRtd = new DAORoomTypeDetail();

    RoomType roomType = new RoomType();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String service = request.getParameter("do");
            if (service == null) {
                service = "viewAllRoomTypes";
            }
            if (service.equals("viewAllRoomTypes")) {
                listRoomType.clear();
                listRoomType = daoRt.listAllRoomType();
                request.setAttribute("listRoomType", listRoomType);
                RequestDispatcher dispatch = request.getRequestDispatcher("rooms.jsp");
                dispatch.forward(request, response);
            }
            if (service.equals("viewDetail")) {
                String RT_ID = request.getParameter("RoomTypeID");
                listRtd.clear();
                listRoom.clear();
//                listAvailableRoom.clear();
                roomType = daoRt.getRoomTypeByID(RT_ID);
                listRtd = daoRtd.getListOfRoomTypeDetailByRT_ID(RT_ID);
//                listAvailableRoom = daoR.getListAvailableRoomsByRT_ID(RT_ID);
                listRoom = daoR.getListOfRoomsByRT_ID(RT_ID);
                listOfRoomViews = daoR.getListOfViewsByRT_ID(RT_ID);
                request.setAttribute("roomType", roomType);
                request.setAttribute("listRtd", listRtd);
//                request.setAttribute("listAvailableRoom", listAvailableRoom);
                request.setAttribute("listRoom", listRoom);
                request.setAttribute("listOfRoomView", listOfRoomViews);
                RequestDispatcher dispatch = request.getRequestDispatcher("rooms-single.jsp");
                dispatch.forward(request, response);
            }
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
