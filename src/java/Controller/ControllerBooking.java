/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Entity.BookDetail;
import Entity.Customer;
import Entity.Room;
import Entity.RoomType;
import Entity.RoomTypeDetail;
import Model.DAOBooking;
import Model.DAOBookingDetail;
import Model.DAOCustomer;
import Model.DAORoom;
import Model.DAORoomType;
import Model.DAORoomTypeDetail;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author DELL
 */
@WebServlet(name = "ControllerBooking", urlPatterns = {"/booking"})
public class ControllerBooking extends HttpServlet {

    List<Room> listRooms = new ArrayList<>();

    DAOCustomer daoCus = new DAOCustomer();
    DAORoom daoR = new DAORoom();
    DAORoomType daoRt = new DAORoomType();
    DAORoomTypeDetail daoRtd = new DAORoomTypeDetail();
    DAOBooking daoB = new DAOBooking();
    DAOBookingDetail daoBd = new DAOBookingDetail();

    boolean statusAdd = false;
    boolean statusUpdate = false;
    String checkInDate_date = "";
    String checkInDate = "";
    String checkOutDate_date = "";
    String checkOutDate = "";
    String dateDiff = "";
    String[] roomTypeID = null;
    String[] amount = null;
    String totalPrice = "";
    String[] roomID = null;
    int cusID = 0;

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
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String service = request.getParameter("do");
            HttpSession session = request.getSession();

//            List<Room> listRooms = new ArrayList<>();
            RoomType rt = new RoomType();
            RoomTypeDetail rtd = new RoomTypeDetail();
            Customer cus = new Customer();

            cus = (Customer) session.getAttribute("Customer");

            if (service.equals("checkAvailabiltyOfRoom")) {
                String action = request.getParameter("action");
                if (action == null) {
                    checkInDate = request.getParameter("checkInDate");
                    checkOutDate = request.getParameter("checkOutDate");
//                    out.print(checkInDate);
//                    out.print("<br>");
//                    out.print(checkOutDate);
                    checkAvailabiltyOfRoom(request, response);
                } else {
                    String daterange = request.getParameter("daterange");
                    String split[] = daterange.split(" - ");
                    checkInDate_date = split[0];
                    checkOutDate_date = split[1];
                    checkInDate = sdf3.format(sdf5.parse(checkInDate_date));
                    checkOutDate = sdf3.format(sdf5.parse(checkOutDate_date));
//                    out.print(checkInDate);
//                    out.print("<br>");
//                    out.print(checkOutDate);
                    checkAvailabiltyOfRoom(request, response);
                }
            }
            if (service.equals("proceedBooking")) {
                getCurrentBookingDetail(request, response);
                RequestDispatcher dispatch = request.getRequestDispatcher("booking.jsp");
                dispatch.forward(request, response);
            }
            if (service.equals("finishReserve")) {
                getCurrentBookingDetail(request, response);
                String FirstName = request.getParameter("FirstName");
                String LastName = request.getParameter("LastName");
                String Email = request.getParameter("Email");
                String Country = request.getParameter("Country");
                String Phone = request.getParameter("PhoneNumber");
                String Remarks = request.getParameter("Remarks");
                checkInDate = sdf3.format(sdf5.parse(checkInDate));
                checkOutDate = sdf3.format(sdf5.parse(checkOutDate));
                roomID = request.getParameterValues("RoomID");

                request.setAttribute("FirstName", FirstName);
                request.setAttribute("RoomID", roomID);
//                for (int i = 0; i < roomID.length; i++) {
//                    out.print(roomID[i] + " ");
//                }
                if (cus != null) {//Customer has signed in
                    statusAdd = daoB.addBooking(cus.getCusID(), adult, children, room, Remarks);
                    if (statusAdd) {//Add succeeded
                        System.out.println("Add Booking Successfully!");
                        for (int i = 0; i < roomID.length; i++) {
                            statusAdd = daoBd.addBookingDetail(new BookDetail(daoB.getLatestBookIDByCusID(cus.getCusID()),
                                    Integer.parseInt(roomID[i]), checkInDate, checkOutDate), dateDiff);
                            statusUpdate = daoR.setRoomToUnavailable(roomID[i]);
                            if (statusAdd && statusUpdate) {
                                System.out.println("Add BookDetail Successfully x " + (i + 1));
                                System.out.println("Set room: " + roomID[i] + " to unavailable successfully");

                            } else {
                                System.out.println("Add BookDetail Failed x " + (i + 1));
                                System.out.println("Set room to unavailable failed x " + (i + 1));
                            }
                        }
                        if (statusAdd && statusUpdate) {
                            RequestDispatcher dispatch = request.getRequestDispatcher("booking-confirmed.jsp");
                            dispatch.forward(request, response);
                        } else {
                            response.sendRedirect("error404.jsp");
                        }
                    } else {//Add Failed
                        System.out.println("Add Booking Failed!");
                    }
                } else { //Customer has not yet signed in
                    statusAdd = daoCus.addCustomer(new Customer(
                            FirstName, LastName, Country, Email,
                            Phone, ""));
                    if (statusAdd) {//Add succeeded
                        System.out.println("Add Customer Successfully!");
                        cusID = daoB.getLatestCusIDByEmail(Email);
                        statusAdd = daoB.addBooking(cusID, adult, children, room, Remarks);
                        if (statusAdd) {//Add succeeded
                            System.out.println("Add Booking Successfully!");
                            for (int i = 0; i < roomID.length; i++) {
                                statusAdd = daoBd.addBookingDetail(new BookDetail(daoB.getLatestBookIDByCusID(cusID),
                                        Integer.parseInt(roomID[i]), checkInDate, checkOutDate), dateDiff);
                                statusUpdate = daoR.setRoomToUnavailable(roomID[i]);
                                if (statusAdd && statusUpdate) {
                                    System.out.println("Add BookDetail Successfully x " + (i + 1));
                                    System.out.println("Set room: " + roomID[i] + " to unavailable successfully");
                                    request.setAttribute("cusID", cusID);
                                } else {
                                    System.out.println("Add BookDetail Failed x " + (i + 1));
                                    System.out.println("Set room to unavailable failed x " + (i + 1));
                                }
                            }
                            if (statusAdd && statusUpdate) {
                                RequestDispatcher dispatch = request.getRequestDispatcher("booking-confirmed.jsp");
                                dispatch.forward(request, response);
                            } else {
                                response.sendRedirect("error404.jsp");
                            }
                        } else {//Add Failed
                            System.out.println("Add Booking Failed!");
                        }
                    } else {//Add Failed
                        System.out.println("Add Customer Failed!");
                    }
                }
            }
            if (service.equals("cancelBooking")) {
                String status = request.getParameter("status");
                checkInDate = request.getParameter("checkInDate");
                checkOutDate = request.getParameter("checkOutDate");
                dateDiff = request.getParameter("dateDiff");
//                room = Integer.parseInt(request.getParameter("totalRoom"));
                roomID = request.getParameterValues("RoomID");
                boolean isCancelled = false;

                request.setAttribute("totalRoom", roomID.length);
                request.setAttribute("dateDiff", dateDiff);
                request.setAttribute("checkInDate", checkInDate);
                request.setAttribute("checkOutDate", checkOutDate);

                if (status != null && status.equals("not-sign-in")) {
                    cusID = Integer.parseInt(request.getParameter("cusID"));
                    isCancelled = daoB.cancelBooking(cusID);
                    if (isCancelled) {
                        System.out.println("booking of customer: " + cusID + " is cancelled.");
                        for (int i = 0; i < roomID.length; i++) {
                            statusUpdate = daoR.setRoomToAvailable(roomID[i]);
                            if (statusUpdate) {
                                System.out.println("Set room: " + roomID[i] + " to available successfully");
                            } else {
                                System.out.println("Set room to available failed x " + (i + 1));
                            }
                        }
                        if (statusUpdate) {
                            RequestDispatcher dispatch = request.getRequestDispatcher("booking-cancelled.jsp");
                            dispatch.forward(request, response);
                        } else {
                            response.sendRedirect("error404.jsp");
                        }
                    } else {
                        System.out.println("cancelled booking failed.");
                        response.sendRedirect("error404.jsp");
                    }
                } else { //Customer signed in
                    if (cus == null) {
                        response.sendRedirect("booking-confirmed-out-of-session.jsp");
                    } else {
                        isCancelled = daoB.cancelBooking(cus.getCusID());
                        if (isCancelled) {
                            System.out.println("booking of customer: " + cus.getCusID() + " is cancelled.");
                            for (int i = 0; i < roomID.length; i++) {
                                statusUpdate = daoR.setRoomToAvailable(roomID[i]);
                                if (statusUpdate) {
                                    System.out.println("Set room: " + roomID[i] + " to available successfully");
                                } else {
                                    System.out.println("Set room to available failed x " + (i + 1));
                                }
                            }
                            if (statusUpdate) {
                                RequestDispatcher dispatch = request.getRequestDispatcher("booking-cancelled.jsp");
                                dispatch.forward(request, response);
                            } else {
                                response.sendRedirect("error404.jsp");
                            }
                        } else {
                            System.out.println("cancelled booking failed.");
                            response.sendRedirect("error404.jsp");
                        }
                    }
                }
            }
            if (service.equals("customerLogin")) {
                String email = "";
                String phone = "";
                String password = request.getParameter("Password");

                if (request.getParameter("EmailOrPhone").contains("@")) {
                    email = request.getParameter("EmailOrPhone");
                    cus = daoCus.loginUsingEmail(email, password);
                } else {
                    phone = request.getParameter("EmailOrPhone");
                    cus = daoCus.loginUsingPhone(phone, password);
                }
                if (cus == null) {
                    if (email == "") {
                        request.setAttribute("mess", "Phone or Password is incorrect! "
                                + "Please try again!");
                    } else {
                        request.setAttribute("mess", "Email or Password is incorrect! "
                                + "Please try again!");
                    }
                    RequestDispatcher dispatch = request.getRequestDispatcher("login.jsp?action=isBooking");
                    dispatch.forward(request, response);
                } else {
                    session.setAttribute("Customer", cus);
                    getCurrentBookingDetail(request, response);
                    RequestDispatcher dispatch = request.getRequestDispatcher("booking.jsp");
                    dispatch.forward(request, response);
                }
            }
            if (service.equals("logout")) {
                java.util.Enumeration em = session.getAttributeNames();
                while (em.hasMoreElements()) {
                    String key = em.nextElement().toString();
                    if (key.equals("Customer") || key.equals("Employee")) {
                        session.removeAttribute(key);
                    }
                }
                getCurrentBookingDetail(request, response);
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

    SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm");
    SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy-MM-dd HH:mm");
    SimpleDateFormat sdf3 = new SimpleDateFormat("yyyy-MM-dd");
    SimpleDateFormat sdf4 = new SimpleDateFormat("dd/MM/yyyy HH:mm");
    SimpleDateFormat sdf5 = new SimpleDateFormat("dd/MM/yyyy");
    List<RoomType> listRecommendRooms = new ArrayList<>();
    String message = "";
    String notice = "";
    int adult = 0;
    int remained_adult = 0;
    int children = 0;
    int room = 0;
    int count_unavailableRoomType = 0;
    List<RoomType> listRt = new ArrayList<>();
    List<RoomTypeDetail> listRtd = new ArrayList<>();
    List<Room> listCountAvailableRooms = new ArrayList<>();

    public void checkAvailabiltyOfRoom(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, ParseException {
        adult = Integer.parseInt(request.getParameter("adult"));
        children = Integer.parseInt(request.getParameter("children"));
        room = Integer.parseInt(request.getParameter("room"));
        listRt.clear();
        listRt = daoRt.listAllRoomType();
        listRtd.clear();
        listRtd = daoRtd.listRoomTypeDetail();
        listCountAvailableRooms.clear();
        listCountAvailableRooms = daoB.countAvailableRoomAsList();

        //recommend rooms
        listRecommendRooms.clear();
        if (room > adult) {
            adult = 2;
            children = 0;
            room = 1;
            listRecommendRooms = daoB.listRecommendRoom(listRecommendRooms, 0, adult, children, room);
        }
        listRt.forEach(itemRt -> {
            listCountAvailableRooms.forEach(itemAr -> {
                if (itemRt.getRoomTypeID() == itemAr.getRoomTypeID()) {
                    if (itemAr.getNoOfAvailableRoom() == 0) {
                        count_unavailableRoomType++;
                        if (count_unavailableRoomType == listCountAvailableRooms.size()) {
                            notice = "Sorry for the inconvenience, there are currently "
                                    + "no room left in our hotel this time period. "
                                    + "You can comeback again at another time!";
                        }
                        listRecommendRooms = daoB.listRecommendRoom(listRecommendRooms, 0, adult, children, room);
                    } else {
                        listRecommendRooms = daoB.listRecommendRoom(listRecommendRooms, itemRt.getRoomTypeID(), adult, children, room);
                    }
                }
            });
        });

        if (listRecommendRooms.isEmpty()) {
            message = "Choose the rooms you need below in the list: ";
        } else {
            message = "Choices we have for you: ";
        }

        //date-diff
        Date checkIn = sdf3.parse(checkInDate);
        Date checkOut = sdf3.parse(checkOutDate);
        long Difference_In_Time = checkOut.getTime() - checkIn.getTime();

        // To calculate the no. of days between two dates
        int Difference_In_Days = (int) (Difference_In_Time / (1000 * 3600 * 24));
        if (Difference_In_Days < 0) {
            Difference_In_Days = 0;
        }

        request.setAttribute("listRoomType", listRt);
        request.setAttribute("listRoomTypeDetail", listRtd);
        request.setAttribute("listCountAvailableRooms", listCountAvailableRooms);
        request.setAttribute("listRecommendRooms", listRecommendRooms);
        request.setAttribute("adult", adult);
        request.setAttribute("children", children);
        request.setAttribute("room", room);
//        request.setAttribute("checkInDate_datediff", sdf3.format(sdf2.parse(checkInDate)));
        request.setAttribute("checkInDate", sdf5.format(sdf3.parse(checkInDate)));
//        request.setAttribute("checkOutDate_datediff", sdf3.format(sdf2.parse(checkOutDate)));
        request.setAttribute("checkOutDate", sdf5.format(sdf3.parse(checkOutDate)));
        request.setAttribute("message", message);
        request.setAttribute("notice", notice);
        request.setAttribute("dateDiff", Difference_In_Days);
        RequestDispatcher dispatch = request.getRequestDispatcher("display-rate.jsp");
        dispatch.forward(request, response);
    }

    private void getCurrentBookingDetail(HttpServletRequest request, HttpServletResponse response) throws ParseException {
        adult = Integer.parseInt(request.getParameter("adult"));
        children = Integer.parseInt(request.getParameter("children"));
        room = Integer.parseInt(request.getParameter("room"));
        listRooms.clear();
        listRt.clear();
        listRt = daoRt.listAllRoomType();
        roomTypeID = request.getParameterValues("roomTypeID");
        amount = request.getParameterValues("amount");
        dateDiff = request.getParameter("dateDiff");
        totalPrice = request.getParameter("totalPrice");
        checkInDate = request.getParameter("checkInDate");
        checkOutDate = request.getParameter("checkOutDate");

        //get available Rooms
        for (int i = 0; i < roomTypeID.length; i++) {
            if (!"".equals(roomTypeID[i])) {
                daoR.listAvailableRooms(roomTypeID[i], amount[i]).forEach((Room room) -> {
                    listRooms.add(room);
                });
            }
        }
        request.setAttribute("adult", adult);
        request.setAttribute("children", children);
        request.setAttribute("room", room);
        request.setAttribute("roomTypeID", roomTypeID);
        request.setAttribute("amount", amount);
        request.setAttribute("totalPrice", totalPrice);
        request.setAttribute("dateDiff", dateDiff);
        request.setAttribute("checkInDate", checkInDate);
        request.setAttribute("checkOutDate", checkOutDate);
        request.setAttribute("listRoomType", listRt);
        request.setAttribute("listRoom", listRooms);
    }
}
