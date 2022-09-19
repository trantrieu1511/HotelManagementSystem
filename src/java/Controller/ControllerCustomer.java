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
@WebServlet(name = "ControllerCustomer", urlPatterns = {"/customer"})
public class ControllerCustomer extends HttpServlet {

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
            Customer cus = (Customer) session.getAttribute("Customer");
            if (cus == null) {
                response.sendRedirect("login.jsp");
            } else {
                int setting_option = 0;
                boolean editSuccess = true;
                boolean hasMessage = false;
                String alert = "";
                String message = "";
                if (service == null) {
                    service = "displayAccountSettings";
                }
                if (service.equals("displayAccountSettings")) {
                    RequestDispatcher dispatch = request.getRequestDispatcher("account-settings.jsp");
                    dispatch.forward(request, response);
                }
                if (service.equals("displayPersonalDetails")) {
                    setting_option = 1;
                    String edit = request.getParameter("edit");
                    if (edit != null && edit.equals("success")) {
//                        alert = "Edit Successfully!";
                    }
                    if (edit != null && edit.equals("fail")) {
                        alert = "Edit Failed! For dev, please "
                                + "check the system for specific error!";
                    }
                    cus = daoCus.getCustomerDetails(cus.getId());
                    session.setAttribute("Customer", cus);
                    request.setAttribute("cusInfo", cus);
                    request.setAttribute("settingOption", setting_option);
                    request.setAttribute("alert", alert);
                    RequestDispatcher dispatch = request.getRequestDispatcher("customer-details.jsp");
                    dispatch.forward(request, response);
                }
                if (service.equals("displayAccountSecurity")) {
                    setting_option = 2;
                    String edit = request.getParameter("edit");
                    String editMessage = request.getParameter("edit-message");
                    if (edit != null && edit.equals("success")) {
//                        alert = "Edit Successfully!";
                    }
                    if (edit != null && edit.equals("fail")) {
                        alert = "Edit Failed! For dev, please "
                                + "check the system for specific error!";
                    }
                    if (editMessage != null && editMessage.equals("sameNewPassword")) {
                        message = "Please enter new password different than your old "
                                + "one!";
                        hasMessage = true;
                    }
                    if (editMessage != null && editMessage.equals("confirmPassIsNotMatch")) {
                        message = "Confirm password is not match with your new password! "
                                + "Please try enter again!";
                        hasMessage = true;
                    }
                    cus = daoCus.getCustomerDetails(cus.getId());
                    session.setAttribute("Customer", cus);
                    request.setAttribute("cusInfo", cus);
                    request.setAttribute("settingOption", setting_option);
                    request.setAttribute("alert", alert);
                    request.setAttribute("message", message);
                    request.setAttribute("hasMessage", hasMessage);
                    RequestDispatcher dispatch = request.getRequestDispatcher("customer-security.jsp");
                    dispatch.forward(request, response);
                }
                if (service.equals("editFullName")) {
                    String firstName = request.getParameter("FirstName");
                    String lastName = request.getParameter("LastName");
//                    out.print(firstName);
//                    out.print(lastName);
                    editSuccess = daoCus.editFullName(firstName, lastName, cus.getCusID());
                    forwardAndDisplayResult(editSuccess, request, response);
                }
                if (service.equals("editEmail")) {
                    String email = request.getParameter("Email");
//                    out.print(email);
                    editSuccess = daoCus.editEmail(email, cus.getCusID());
                    forwardAndDisplayResult(editSuccess, request, response);
                }
                if (service.equals("editPhoneNumber")) {
                    String phoneNumber = request.getParameter("PhoneNumber");
//                    out.print(email);
                    editSuccess = daoCus.editPhoneNumber(phoneNumber, cus.getCusID());
                    forwardAndDisplayResult(editSuccess, request, response);
                }
                if (service.equals("editGender")) {
                    String isMale = request.getParameter("Gender");
//                    out.print(isMale);
                    editSuccess = daoCus.editGender(isMale, cus.getCusID());
                    forwardAndDisplayResult(editSuccess, request, response);
                }
                if (service.equals("editDOB")) {
                    String dob = request.getParameter("DOB");
//                    out.print(dob);
                    editSuccess = daoCus.editDOB(dob, cus.getCusID());
                    forwardAndDisplayResult(editSuccess, request, response);
                }
                if (service.equals("editAddress")) {
                    String address = request.getParameter("Address");
//                    out.print(address);
                    editSuccess = daoCus.editAddress(address, cus.getCusID());
                    forwardAndDisplayResult(editSuccess, request, response);
                }
                if (service.equals("editPassword")) {
                    String oldPassword = request.getParameter("OldPassword");
                    String newPassword = request.getParameter("NewPassword");
                    String confirmPassword = request.getParameter("ConfirmPassword");
//                    out.print(password);
                    if (newPassword.equals(oldPassword)) {
                        response.sendRedirect("customer?do=displayAccountSecurity"
                                + "&edit-message=sameNewPassword");
                        return;
                    }
                    if (!confirmPassword.equals(newPassword)) {
                        response.sendRedirect("customer?do=displayAccountSecurity"
                                + "&edit-message=confirmPassIsNotMatch");
                        return;
                    }
                    editSuccess = daoCus.editPassword(newPassword, cus.getCusID());
                    if (editSuccess) {
                        response.sendRedirect("customer?do=displayAccountSecurity&edit=success");
                    } else {
                        response.sendRedirect("customer?do=displayAccountSecurity&edit=fail");
                    }
                }
                if (service.equals("deleteAccount")) {
                    String Id = request.getParameter("Id");
//                    out.print(Id);
                    boolean deleteSuccess = daoCus.deleteCustomer(Id);
                    if (deleteSuccess) {
                        cus = daoCus.getCustomerDetails(cus.getId());
                        session.setAttribute("Customer", cus);
                        request.setAttribute("message", "Account has been successfully deleted!");
                        request.setAttribute("deleteSucceed", true);
                        RequestDispatcher dispatch = request.getRequestDispatcher("after-delete.jsp");
                        dispatch.forward(request, response);
                    } else {
                        cus = daoCus.getCustomerDetails(cus.getId());
                        session.setAttribute("Customer", cus);
                        request.setAttribute("message", "Edit Failed! For dev, please "
                                + "check the system for specific error!");
                        request.setAttribute("deleteSucceed", false);
                        RequestDispatcher dispatch = request.getRequestDispatcher("after-delete.jsp");
                        dispatch.forward(request, response);
                    }
                }
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

    private void forwardAndDisplayResult(boolean editSuccess, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (editSuccess) {
            response.sendRedirect("customer?do=displayPersonalDetails&edit=success");
        } else {
            response.sendRedirect("customer?do=displayPersonalDetails&edit=fail");
        }
    }
}
