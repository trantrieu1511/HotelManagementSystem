/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Entity.Customer;
import Model.DAOCustomer;
import java.io.IOException;
import java.io.PrintWriter;
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
@WebServlet(name = "ControllerAuthentication", urlPatterns = {"/authentication"})
public class ControllerAuthentication extends HttpServlet {

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
            DAOCustomer daoCus = new DAOCustomer();
            Customer cus = new Customer();

            if (service == null || service.equals("")) {
                response.sendRedirect("login.jsp");
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
                    RequestDispatcher dispatch = request.getRequestDispatcher("login.jsp");
                    dispatch.forward(request, response);
                } else {
                    session.setAttribute("Customer", cus);
                    RequestDispatcher dispatch = request.getRequestDispatcher("home?do=homeView");
                    dispatch.forward(request, response);
                }
            }
            if (service.equals("employeeLogin")) {

            }
            if (service.equals("register")) {
                String firstName = request.getParameter("FirstName");
                String lastName = request.getParameter("LastName");
                String email = request.getParameter("Email");
                String password = request.getParameter("Password");
                String phoneNumber = request.getParameter("PhoneNumber");

                boolean emailIsExisted = daoCus.checkEmailExist(email);
//                boolean phoneNumberIsExisted = daoCus.checkPhoneNumberExist(phoneNumber);
                if (emailIsExisted //                        || phoneNumberIsExisted
                        ) {
                    request.setAttribute("succeed", false);
                    request.setAttribute("mess", "Failed to register! "
                            + "Your email is duplicated with others! "
                            + "Please try again!");
                    RequestDispatcher dispatch = request.getRequestDispatcher("register.jsp");
                    dispatch.forward(request, response);
                } else {
                    boolean registerSucceed = daoCus.register(
                            new Customer(firstName, lastName, email, phoneNumber, password)
                    );
                    if (registerSucceed) {
                        request.setAttribute("succeed", true);
                        request.setAttribute("mess", "You have successfully registered as a member of our Hotel! "
                                + "Use the new info to login!");
                        RequestDispatcher dispatch = request.getRequestDispatcher("register.jsp");
                        dispatch.forward(request, response);
                    } else {
                        request.setAttribute("succeed", false);
                        request.setAttribute("mess", "Failed to register! For dev, please check the system!");
                        RequestDispatcher dispatch = request.getRequestDispatcher("register.jsp");
                        dispatch.forward(request, response);
                    }
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
                response.sendRedirect("home");
            }
        } catch (Exception ex) {
            ex.printStackTrace();
            response.sendRedirect("error404.jsp");
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
