<%-- 
    Document   : customer-booking
    Created on : Oct 12, 2022, 3:12:11 PM
    Author     : DELL
--%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/js/bootstrap.bundle.min.js"></script>
        <!-- FontAwesome JS-->
        <script src="https://kit.fontawesome.com/310efd8ed3.js" crossorigin="anonymous"></script>
        <title>My booking</title>
        <style>
            #rate-recommend-table{
                width: 900px; 
                height: 8rem;
                border: transparent;
                border-radius: 3px;
                box-shadow: 0 1px 8px 0 rgba(0,0,0,0.12),0 2px 3px -1px rgba(0,0,0,0.2);
                margin-top: 3rem;
            }
            .rate-recommend-table-td{
                border-top: 1px solid #e6e6e6;
                border-right: 1px solid #e6e6e6;
            }
            .rate-recommend-table-th{
                color: black;
                background: white;
                border: transparent;
                border-radius: 3px;
            }
            .data{
                vertical-align: top;
                padding-top: 10px;
                padding-bottom: 10px;
                padding-left: 10px;
            }
            @media only screen and (min-width: 1200px) {
                #rate-recommend-table{
                    width: 100%; 
                    height: 100%;
                }
            }
            .submit-section{
                text-align: center;
            }
            .submit-section input{
                padding: 10px 3rem;
            }
        </style>
    </head>
    <body>
        <jsp:include page="page-header.jsp"></jsp:include>

            <div class="container" style="margin-top: 3rem;">
                <h2>Booking</h2>

                <a href="home#booking-section">Continue book</a>
                <table id="rate-recommend-table" border="1">
                    <thead>
                    </thead>
                    <tbody>
                    <c:if test="${listBookDetail.size()==0}">
                    <div style="margin-top: 2rem">You haven't booked any rooms yet. Be our guest and book at anytime!</div>
                    </c:if>
                    <c:forEach items="${listBookDetail}" var="list">
                    <tr>
                        <td class="rate-recommend-table-td data" style="border-right: 0px;">
                            <div>
                                ${list.getCheckIn()} - ${list.getCheckOut()}
                            </div>
                            <div style="margin-top: 10px; font-weight: 500">
                                <c:if test="${list.isIsCancelled()}">
                                    <span style="color: red">Cancelled</span>
                                </c:if>
                                <c:if test="${!list.isIsCancelled()}">
                                    <span style="color: lightgreen">Staying</span>
                                </c:if>
                            </div>
                        </td>
                        <td class="rate-recommend-table-td data" style="border-right: 0px;">
                            <strong>VND <fmt:formatNumber type="number" maxFractionDigits="3" value="${list.getTotalPrice()}"/></strong>
                        </td>
                        <td class="rate-recommend-table-td" style="border-right: 0px; width: 3%;">
                            <div class="dropdown dropdown-action">
                                <a href="#" style="padding: 15px 15px;" data-toggle="dropdown" aria-expanded="false"><i class="fa fa-ellipsis-vertical"></i></a>
                                <div class="dropdown-menu dropdown-menu-right">
                                    <a class="dropdown-item" href="customer?do=viewBookingDetail&bookID=${list.getBookID()}">View Details</a>
                                    <c:if test="${list.isIsCancelled()}">
                                        <a class="dropdown-item" href="#" data-toggle="modal" data-target="#remove-booking${list.getBookID()}">Remove booking</a>
                                    </c:if>
                                </div>
                            </div>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
            <!-- Remove Booking Modal -->
            <c:forEach items="${listBookDetail}" var="list">
                <div id="remove-booking${list.getBookID()}" class="modal custom-modal fade" role="dialog">
                    <div class="modal-dialog modal-dialog-centered" role="document">
                        <div class="modal-content">
                            <!--                                    <div class="modal-header" style="text-align: center;">
                                                                    <h5 class="modal-title">Are you sure to log out?</h5>
                                                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                                        <span aria-hidden="true">&times;</span>
                                                                    </button>
                                                                </div>-->
                            <div class="modal-body">
                                <div style="text-align: center;">
                                    <div class="form-header">
                                        <h4>Remove booking</h4>
                                    </div>
                                    <hr>
                                    <p>Are you sure want to delete this booking?</p>
                                </div>
                                <form action="customer" method="post">
                                    <input type="hidden" name="do" value="removeBooking">
                                    <input type="hidden" name="bookID" value="${list.getBookID()}">
                                    <!--<input type="text" name="cusID" value="${sessionScope.Customer.getCusID()}">-->
                                    <div class="submit-section" style="display: flex; justify-content: space-around;">
                                        <input type="submit" class="btn btn-primary" value="Yes">
                                        <a href="#" class="btn btn-light" style="padding: 10px 35px;" data-dismiss="modal">Cancel</a>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </c:forEach>
            <!-- /Remove Booking Modal -->
        </div>

        <style type="text/css">
            body{
                /*margin-top:20px;*/
                color: #1a202c;
                text-align: left;
                /*                background-color: #e2e8f0;    */
            }
            .main-body {
                padding: 15px;
            }
            .card {
                box-shadow: 0 1px 3px 0 rgba(0,0,0,.1), 0 1px 2px 0 rgba(0,0,0,.06);
            }

            .card {
                position: relative;
                display: flex;
                flex-direction: column;
                min-width: 0;
                word-wrap: break-word;
                background-color: #fff;
                background-clip: border-box;
                border: 0 solid rgba(0,0,0,.125);
                border-radius: .25rem;
            }

            .card-body {
                flex: 1 1 auto;
                min-height: 1px;
                padding: 1rem;
            }

            .gutters-sm {
                margin-right: -8px;
                margin-left: -8px;
            }

            .gutters-sm>.col, .gutters-sm>[class*=col-] {
                padding-right: 8px;
                padding-left: 8px;
            }
            .mb-3, .my-3 {
                margin-bottom: 1rem!important;
            }

            .bg-gray-300 {
                background-color: #e2e8f0;
            }
            .h-100 {
                height: 100%!important;
            }
            .shadow-none {
                box-shadow: none!important;
            }

        </style>
    </body>
</html>
