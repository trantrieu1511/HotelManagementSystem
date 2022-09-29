/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Entity.RoomType;
import Entity.RoomTypeDetail;
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
@WebServlet(name = "ControllerBooking", urlPatterns = {"/booking"})
public class ControllerBooking extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String service = request.getParameter("do");
            RoomType rt = new RoomType();
            RoomTypeDetail rtd = new RoomTypeDetail();
            DAORoomType daoRt = new DAORoomType();
            DAORoomTypeDetail daoRtd = new DAORoomTypeDetail();
            if (service.equals("checkAvailabiltyOfRoom")) {
                String checkInDate = request.getParameter("checkInDate");
                String checkOutDate = request.getParameter("checkOutDate");
                String adult = request.getParameter("adult");
                String children = request.getParameter("children");
//                String room = request.getParameter("room");
//                rt = daoRt.getRecommendedRoomType(adult, children, room);
                List<RoomType> listRt = daoRt.listRoomType();
                List<RoomTypeDetail> listRtd = daoRtd.listRoomTypeDetail();
                request.setAttribute("listRoomType", listRt);
                request.setAttribute("listRoomTypeDetail", listRtd);
                RequestDispatcher dispatch = request.getRequestDispatcher("display-rate.jsp");
                dispatch.forward(request, response);
            }
            if (service.equals("proceedBooking")) {
                RequestDispatcher dispatch = request.getRequestDispatcher("booking.jsp");
                dispatch.forward(request, response);
            }
        } catch (Exception ex) {
            ex.printStackTrace();
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
