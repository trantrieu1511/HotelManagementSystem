<%-- 
    Document   : booking-confirmed
    Created on : Oct 10, 2022, 4:37:15 PM
    Author     : DELL
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Booking Confirmed Page</title>
        <!--  This file has been downloaded from bootdey.com @bootdey on twitter -->
        <!--  All snippets are MIT license http://bootdey.com/license -->
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/js/bootstrap.bundle.min.js"></script>
        <!-- PDF JS -->
        <script src="js/html2pdf.bundle.min.js"></script>
        <style>
            body{
                background: whitesmoke;
            }
            .container{
                width: 100%;
                padding-right: 0px; 
                padding-left: 0px; 
                margin-right: auto;
                margin-left: auto;
            }
            label{
                font-weight: 500;
            }
            .details{
                font-weight: 500;
            }
            .important-details{
                font-weight: bold;
            }
            .least-important-details{
                font-size: smaller;
            }
            h6, h5, h4, h3{
                font-weight: bold;
                margin-bottom: 1rem;
            }
            .left{
                border-right: 1px solid gainsboro;
            }
            .almost-done{
                display: inline-block;
                margin-top: 1rem;
                margin-bottom: 1rem;
                padding: 0.4em 0.8em;
                border-radius: 4px;
                background: #d2edd5;
                margin: auto;
                color: #006607;
                text-align: left;
            }
            #customerDetailForm{
                padding: 0px;
            }
            @media only screen and (max-width: 260px) {
                .container{
                    padding: 0px;
                }
            }
            /*            @media only screen and (max-width: 520px) {
                            .left{
                                border: none;
                            }
                        }*/
            @media (max-width: 520px){
                .col-sm-6 {
                    -ms-flex: 0 0 50%;
                    flex: 0 0 100%;
                    max-width: 50%;
                }
                /*                .left{
                                    border: none;
                                }*/
            }
            .svg-checkmark{
                fill: green;
            }
        </style>

    </head>
    <body>
        <jsp:include page="page-header.jsp"></jsp:include>
            <div class="container" style="margin-top: 2rem">
                <div class="main-body">
                    <div class="card" style="border-radius: 0px;">
                        <div class="card-body">
                            <div class="row">
                                <div class="col-lg-8">
                                    <h6 style="margin-bottom: 15px">Thanks ${FirstName}</h6>
                                <h5 style="margin-bottom: 15px">Your booking at our Hotel is confirmed</h5>
                                <div style="margin-bottom: 15px; margin-left: 5px;">
                                    <%--<c:if test="${Date().getTime()>0}">--%>
                                    <!--ok?-->
                                    <%--</c:if>--%>
                                    <svg class="svg-checkmark" xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24"><path d="M9 22l-10-10.598 2.798-2.859 7.149 7.473 13.144-14.016 2.909 2.806z"/></svg>
                                    <!--                                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24"><path d="M0 11.386l1.17-1.206c1.951.522 5.313 1.731 8.33 3.597 3.175-4.177 9.582-9.398 13.456-11.777l1.044 1.073-14 18.927-10-10.614z"/></svg>-->
                                    <!--<svg class="bk-icon -streamline-checkmark_selected" fill="#008009" height="18" role="presentation" width="18" viewBox="0 0 128 128" aria-hidden="true" focusable="false"><path d="M56.62 93.54a4 4 0 0 1-2.83-1.18L28.4 67a4 4 0 1 1 5.65-5.65l22.13 22.1 33-44a4 4 0 1 1 6.4 4.8L59.82 91.94a4.06 4.06 0 0 1-2.92 1.59zM128 64c0-35.346-28.654-64-64-64C28.654 0 0 28.654 0 64c0 35.346 28.654 64 64 64 35.33-.039 63.961-28.67 64-64zm-8 0c0 30.928-25.072 56-56 56S8 94.928 8 64 33.072 8 64 8c30.914.033 55.967 25.086 56 56z"></path></svg>-->
                                    <span style="margin-left: 10px;">You can now 
                                        <a href="#action-section" 
                                           onclick="document.getElementById('action-section').style.backgroundColor = 'aliceblue';">modify or cancel</a> 
                                        your booking until check-in</span>
                                </div>
                                <div style="margin-left: 5px;">
                                    <svg class="svg-checkmark" xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24"><path d="M9 22l-10-10.598 2.798-2.859 7.149 7.473 13.144-14.016 2.909 2.806z"/></svg>
                                    <!--<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24"><path d="M0 11.386l1.17-1.206c1.951.522 5.313 1.731 8.33 3.597 3.175-4.177 9.582-9.398 13.456-11.777l1.044 1.073-14 18.927-10-10.614z"/></svg>-->
                                    <!--<svg class="bk-icon -streamline-checkmark_selected" fill="#008009" height="18" role="presentation" width="18" viewBox="0 0 128 128" aria-hidden="true" focusable="false"><path d="M56.62 93.54a4 4 0 0 1-2.83-1.18L28.4 67a4 4 0 1 1 5.65-5.65l22.13 22.1 33-44a4 4 0 1 1 6.4 4.8L59.82 91.94a4.06 4.06 0 0 1-2.92 1.59zM128 64c0-35.346-28.654-64-64-64C28.654 0 0 28.654 0 64c0 35.346 28.654 64 64 64 35.33-.039 63.961-28.67 64-64zm-8 0c0 30.928-25.072 56-56 56S8 94.928 8 64 33.072 8 64 8c30.914.033 55.967 25.086 56 56z"></path></svg>-->
                                    <span style="margin-left: 10px;">Your <strong>payment</strong> will be handled by our Hotel. The '<strong>Price</strong>' section below has more details</span>
                                </div>
                            </div>
                            <div class="col-lg-4">
                                <div style="text-align: center; font-weight: 500;">
                                    Print it as PDF to your device.
                                </div>
                                <div style="margin-bottom: 15px">
                                    <button id="dl-pdf" class="btn btn-primary" style="width: 100%; margin-top: 1rem;">
                                        Print confirmation
                                    </button>
                                </div>
                                <div>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <h4 style="margin-bottom: 15px">Check your details</h4>
                <div class="row">
                    <div class="col-lg-9" style="padding-right: 0px;">
                        <div class="card" style="border-radius: 0px;">
                            <div class="card-body">
                                <h5>MyHotel</h5>
                                <div class="row">
                                    <div class="col-sm-4">
                                        <h6>Booking details</h6>
                                    </div>
                                    <div class="col-sm-8 text-secondary">
                                        ${dateDiff} night, ${listRoom.size()} room
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-sm-4">
                                        <h6>You book for</h6>
                                    </div>
                                    <div class="col-sm-8 text-secondary">
                                        <c:if test="${adult>1}">
                                            ${adult} adults
                                        </c:if>
                                        <c:if test="${adult==1}">
                                            ${adult} adult
                                        </c:if>
                                        <c:if test="${children>1}">
                                            ,&nbsp;
                                            ${children} children
                                        </c:if>
                                        <c:if test="${children==1}">
                                            ,&nbsp;
                                            ${children} child
                                        </c:if>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-sm-4">
                                        <h6>Check-in</h6>
                                    </div>
                                    <div class="col-sm-8 text-secondary">
                                        ${checkInDate} (14:00 – 00:00)
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-sm-4">
                                        <h6>Check-out</h6>
                                    </div>
                                    <div class="col-sm-8 text-secondary">
                                        ${checkOutDate} (01:00 – 12:00)
                                    </div>
                                </div>
                                <div class="card" style="border: 1px solid #ebf3ff; box-shadow: none; background: aliceblue">
                                    <div class="card-body">
                                        <div>
                                            <div style="display: flex; justify-content: space-between;">
                                                <div style="font-size: x-large">
                                                    Price
                                                </div>
                                                <div style="font-size: x-large; font-weight: 500;">
                                                    VND ${totalPrice}
                                                </div>
                                            </div>
                                        </div>
                                        <hr>
                                        <div>
                                            <strong>
                                                The final price shown is the amount you will pay to the property.
                                            </strong>
                                            <div>
                                                Booking.com does not charge guests any reservation, administration or other fees.<br>
                                                Your card issuer may charge you a foreign transaction fee.
                                            </div>
                                        </div>
                                        <hr>
                                        <div>
                                            <strong>
                                                Payment information
                                            </strong>
                                            <div>
                                                We handles all payments.<br>
                                                Our property accepts the following forms of payment American Express, Visa, JCB, Bankcard, UnionPay
                                                debit card, UnionPay credit card
                                            </div>
                                        </div>
                                        <hr>
                                        <div>
                                            <strong>
                                                Additional information
                                            </strong>
                                            <div>
                                                Please note that additional supplements (e.g. extra bed) are not added in this total.<br>
                                                If you cancel, applicable taxes may still be charged by the property.<br>
                                                If you don't show up at this booking, and you don't cancel beforehand, the property is liable to charge you
                                                the full reservation amount.<br>
                                                Please remember to read the Important information below, as this may contain important details not
                                                mentioned here.
                                            </div>
                                        </div>
                                    </div>
                                </div>

                            </div>
                        </div>
                        <h4 style="margin-bottom: 15px">Property details</h4>
                        <div class="card" style="border-radius: 0px;">
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-sm-4">
                                        <h6>Address</h6>
                                    </div>
                                    <div class="col-sm-8 text-secondary">
                                        abc streets, abc state, abc district, abc country
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-sm-4">
                                        <h6>Phone</h6>
                                    </div>
                                    <div class="col-sm-8 text-secondary">
                                        +84868342491
                                    </div>
                                </div>
                                <hr>
                                <c:forEach items="${listRoom}" var="list">
                                    <div class="row">
                                        <div class="col-sm-12">
                                            <h5>${list.getName()}</h5>
                                            <div class="text-secondary">
                                                This room has a balcony, oven and microwave.
                                            </div>
                                        </div>
                                    </div>
                                    <br>
                                    <div class="row">
                                        <div class="col-sm-4">
                                            <h6>Your stay includes:</h6>
                                        </div>
                                        <div class="col-sm-8 text-secondary">
                                            (non-smoking preference)<br>
                                            (other services and conveniences/ room features...)
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-sm-4">
                                            <h6>Maximum capacity</h6>
                                        </div>
                                        <div class="col-sm-8 text-secondary">
                                            ${list.getAdult()+list.getChildren()} guest maximum, of which ${list.getAdult()} adults maximum.
                                            ${list.getChildren()} children maximum, ...

                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-sm-4">
                                            <h6>Prepayment</h6>
                                        </div>
                                        <div class="col-sm-8 text-secondary">
                                            No prepayment is needed.
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-sm-4">
                                            <h6>Cancellation cost</h6>
                                        </div>
                                        <div class="col-sm-8 text-secondary">
                                            <small style="color: green;">Free cancellation</small>
                                            VND 0
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-sm-4">
                                            <h6>Children and beds</h6>
                                        </div>
                                        <div class="col-sm-8 text-secondary">
                                            <div style="font-weight: 500; margin-bottom: 10px;">
                                                Child policies
                                            </div>
                                            <div style="margin-bottom: 10px;">
                                                Children of any age are welcome.<br>
                                                Children aged 18 years and above are considered adults at this property.
                                            </div>
                                            <div style="font-weight: 500; margin-bottom: 10px;">
                                                Cot and extra bed policies
                                            </div>
                                            No cots and extra beds are available.
                                        </div>
                                    </div>
                                    <br>
                                </c:forEach>
                            </div>
                        </div>
                        <!--                        <div class="card" style="border-radius: 0px;">
                                                    <div class="card-body">
                                                        <h4 style="margin-bottom: 20px;">Share your feedback</h4>
                                                        To help us improve, we would love to hear what you thought about using MyHotel.com today.
                                                        <div style="margin-top: 20px;">
                                                            <strong>
                                                                <a href="#">Share feedback</a>
                                                            </strong>
                                                        </div>
                                                    </div>
                                                </div>-->
                        <div style="text-align: right; font-weight: 500; margin-bottom: 1rem;">
                            Look forward to your stay!<br>
                            MyHotel.com Manager
                        </div>
                    </div>
                    <div class="col-lg-3" style="padding-left: 3px;">
                        <div class="card" onmouseover="this.style.backgroundColor = 'transparent';" id="action-section" style="background: transparent; border: 1px solid white; border-radius: 0px; height: 100%;">
                            <div class="card-body">
                                <div style="top: 0;
                                     position: sticky;">
                                    <h6 style="margin-bottom: 5px;">Is everything correct?</h6>
                                    <small>
                                        You can always view or change your booking online - no registration required.
                                    </small>
                                    <div style="margin-top: 1rem;">
                                        <strong>
                                            <c:if test="${sessionScope.Customer!=null}">
                                                <form action="booking" method="post">
                                                    <input type="hidden" name="do" value="cancelBooking">
                                                    <input type="hidden" name="checkInDate" value="${checkInDate}">
                                                    <input type="hidden" name="checkOutDate" value="${checkOutDate}">
                                                    <input type="hidden" name="dateDiff" value="${dateDiff}">
                                                    <input type="hidden" name="totalRoom" value="${listRoom.size()}">
                                                    <c:forEach items="${RoomID}" var="roomID">
                                                        <input type="hidden" name="RoomID" value="${roomID}">
                                                    </c:forEach>
                                                    <button style="text-decoration: underline; border: 0px;">
                                                        <svg clip-rule="evenodd" fill-rule="evenodd" stroke-linejoin="round" stroke-miterlimit="2" viewBox="0 0 24 24" width="24" height="24" xmlns="http://www.w3.org/2000/svg"><path d="m12.002 2.005c5.518 0 9.998 4.48 9.998 9.997 0 5.518-4.48 9.998-9.998 9.998-5.517 0-9.997-4.48-9.997-9.998 0-5.517 4.48-9.997 9.997-9.997zm0 8.933-2.721-2.722c-.146-.146-.339-.219-.531-.219-.404 0-.75.324-.75.749 0 .193.073.384.219.531l2.722 2.722-2.728 2.728c-.147.147-.22.34-.22.531 0 .427.35.75.751.75.192 0 .384-.073.53-.219l2.728-2.728 2.729 2.728c.146.146.338.219.53.219.401 0 .75-.323.75-.75 0-.191-.073-.384-.22-.531l-2.727-2.728 2.717-2.717c.146-.147.219-.338.219-.531 0-.425-.346-.75-.75-.75-.192 0-.385.073-.531.22z" fill-rule="nonzero"/></svg>
                                                        Cancel your booking
                                                    </button>
                                                </form>
                                            </c:if>
                                            <c:if test="${sessionScope.Customer==null}">
                                                <form action="booking" method="post">
                                                    <input type="hidden" name="do" value="cancelBooking">
                                                    <input type="hidden" name="status" value="not-sign-in">
                                                    <input type="hidden" name="cusID" value="${cusID}">
                                                    <input type="hidden" name="checkInDate" value="${checkInDate}">
                                                    <input type="hidden" name="checkOutDate" value="${checkOutDate}">
                                                    <input type="hidden" name="dateDiff" value="${dateDiff}">
                                                    <input type="hidden" name="totalRoom" value="${listRoom.size()}">
                                                    <c:forEach items="${RoomID}" var="roomID">
                                                        <input type="hidden" name="RoomID" value="${roomID}">
                                                    </c:forEach>
                                                    <button style="text-decoration: underline; border: 0px;">
                                                        <svg clip-rule="evenodd" fill-rule="evenodd" stroke-linejoin="round" stroke-miterlimit="2" viewBox="0 0 24 24" width="24" height="24" xmlns="http://www.w3.org/2000/svg"><path d="m12.002 2.005c5.518 0 9.998 4.48 9.998 9.997 0 5.518-4.48 9.998-9.998 9.998-5.517 0-9.997-4.48-9.997-9.998 0-5.517 4.48-9.997 9.997-9.997zm0 8.933-2.721-2.722c-.146-.146-.339-.219-.531-.219-.404 0-.75.324-.75.749 0 .193.073.384.219.531l2.722 2.722-2.728 2.728c-.147.147-.22.34-.22.531 0 .427.35.75.751.75.192 0 .384-.073.53-.219l2.728-2.728 2.729 2.728c.146.146.338.219.53.219.401 0 .75-.323.75-.75 0-.191-.073-.384-.22-.531l-2.727-2.728 2.717-2.717c.146-.147.219-.338.219-.531 0-.425-.346-.75-.75-.75-.192 0-.385.073-.531.22z" fill-rule="nonzero"/></svg>
                                                        Cancel your booking
                                                    </button>
                                                </form>
                                            </c:if>
                                        </strong>
                                    </div>
                                    <div style="margin-top: 2rem;">
                                        <a class="btn btn-primary" href="#" data-toggle="modal" data-target="#check-booking" style="width: 100%;">View booking</a>
                                    </div>
                                    <small>
                                        Tip: You can make changes to this booking at anytime
                                    </small>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Check Booking Modal -->
                    <div id="check-booking" class="modal custom-modal fade" role="dialog">
                        <div class="modal-dialog modal-dialog-centered modal" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title">Your booking summary</h5>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <div class="modal-body">
                                    <div class="details" style="margin-top: 1rem;">Total length of stay:</div>
                                    <c:if test="${dateDiff==1}">
                                        <div class="important-details">${dateDiff} night</div>
                                    </c:if>
                                    <c:if test="${dateDiff>1}">
                                        <div class="important-details">${dateDiff} nights</div>
                                    </c:if>
                                    <br>
                                    <div class="row">
                                        <div class="col-lg-6 col-sm-6 col-md-6 left">
                                            <div class="details">CheckIn</div>
                                            <span class="important-details">${checkInDate}</span>
                                            <div class="text-secondary">14:00 – 00:00</div>
                                        </div>
                                        <div class="col-lg-6 col-sm-6 col-md-6">
                                            <div class="details">CheckOut</div>
                                            <span class="important-details">${checkOutDate.split(" ")[0]}</span>
                                            <div class="text-secondary">01:00 – 12:00</div>
                                        </div>
                                    </div>
                                    <hr>
                                    <div class="row">
                                        <div class="col-lg-6 col-sm-6 col-md-6">
                                            <div class="details">You selected:</div>
                                        </div>
                                        <div class="col-lg-6 col-sm-6 col-md-6">
                                            <c:forEach items="${listRoomType}" var="listRt">
                                                <c:forEach begin="0" end="${fn:length(roomTypeID)}" var="i">
                                                    <c:if test="${listRt.getRoomTypeID()==roomTypeID[i]}">
                                                        <div class="text-secondary">${amount[i]} x ${listRt.getName()} <div style="color: green;">Free cancellation</div></div>
                                                    </c:if>
                                                </c:forEach>
                                            </c:forEach>
                                        </div>
                                    </div><hr>
                                    <div class="row">
                                        <div class="col-lg-6 col-sm-6 col-md-6">
                                            <h6 style="margin-bottom: 0px;">Price</h6>
                                        </div>
                                        <div class="col-lg-6 col-sm-6 col-md-6">
                                            <h6 style="margin-bottom: 0px;">VND ${totalPrice}</h6>
                                        </div>
                                    </div>
                                    <div class="text-secondary" style="font-size: small;">
                                        (for ${dateDiff} nights & all guests)
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- /Check Booking Modal -->
                </div>
            </div>
        </div>

        <!--PDF div-->
        <div class="container" style="margin-top: 2rem" hidden>
            <div class="main-body" id="PDF" style="margin-right: 15px;">
                <div class="card" style="border-radius: 0px;">
                    <div class="card-body">
                        <div class="row">
                            <div class="col-lg-8">
                                <h6 style="margin-bottom: 15px">Thanks ${FirstName}</h6>
                                <h5 style="margin-bottom: 15px">Your booking at our Hotel is confirmed</h5>
                                <div style="margin-bottom: 15px; margin-left: 5px;">
                                    <%--<c:if test="${Date().getTime()>0}">--%>
                                    <!--ok?-->
                                    <%--</c:if>--%>
                                    <svg class="svg-checkmark" xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24"><path d="M9 22l-10-10.598 2.798-2.859 7.149 7.473 13.144-14.016 2.909 2.806z"/></svg>
                                    <!--                                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24"><path d="M0 11.386l1.17-1.206c1.951.522 5.313 1.731 8.33 3.597 3.175-4.177 9.582-9.398 13.456-11.777l1.044 1.073-14 18.927-10-10.614z"/></svg>-->
                                    <!--<svg class="bk-icon -streamline-checkmark_selected" fill="#008009" height="18" role="presentation" width="18" viewBox="0 0 128 128" aria-hidden="true" focusable="false"><path d="M56.62 93.54a4 4 0 0 1-2.83-1.18L28.4 67a4 4 0 1 1 5.65-5.65l22.13 22.1 33-44a4 4 0 1 1 6.4 4.8L59.82 91.94a4.06 4.06 0 0 1-2.92 1.59zM128 64c0-35.346-28.654-64-64-64C28.654 0 0 28.654 0 64c0 35.346 28.654 64 64 64 35.33-.039 63.961-28.67 64-64zm-8 0c0 30.928-25.072 56-56 56S8 94.928 8 64 33.072 8 64 8c30.914.033 55.967 25.086 56 56z"></path></svg>-->
                                    <span style="margin-left: 10px;">You can now 
                                        <a href="#action-section" 
                                           onclick="document.getElementById('action-section').style.backgroundColor = 'aliceblue';">modify or cancel</a> 
                                        your booking until check-in</span>
                                </div>
                                <div style="margin-left: 5px;">
                                    <svg class="svg-checkmark" xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24"><path d="M9 22l-10-10.598 2.798-2.859 7.149 7.473 13.144-14.016 2.909 2.806z"/></svg>
                                    <!--<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24"><path d="M0 11.386l1.17-1.206c1.951.522 5.313 1.731 8.33 3.597 3.175-4.177 9.582-9.398 13.456-11.777l1.044 1.073-14 18.927-10-10.614z"/></svg>-->
                                    <!--<svg class="bk-icon -streamline-checkmark_selected" fill="#008009" height="18" role="presentation" width="18" viewBox="0 0 128 128" aria-hidden="true" focusable="false"><path d="M56.62 93.54a4 4 0 0 1-2.83-1.18L28.4 67a4 4 0 1 1 5.65-5.65l22.13 22.1 33-44a4 4 0 1 1 6.4 4.8L59.82 91.94a4.06 4.06 0 0 1-2.92 1.59zM128 64c0-35.346-28.654-64-64-64C28.654 0 0 28.654 0 64c0 35.346 28.654 64 64 64 35.33-.039 63.961-28.67 64-64zm-8 0c0 30.928-25.072 56-56 56S8 94.928 8 64 33.072 8 64 8c30.914.033 55.967 25.086 56 56z"></path></svg>-->
                                    <span style="margin-left: 10px;">Your <strong>payment</strong> will be handled by our Hotel. The '<strong>Price</strong>' section below has more details</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <h4 style="margin-bottom: 15px">Check your details</h4>
                <div class="card" style="border-radius: 0px;">
                    <div class="card-body">
                        <h5>MyHotel</h5>
                        <div class="row">
                            <div class="col-sm-4">
                                <h6>Booking details</h6>
                            </div>
                            <div class="col-sm-8 text-secondary">
                                ${dateDiff} night, ${listRoom.size()} room
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-4">
                                <h6>You book for</h6>
                            </div>
                            <div class="col-sm-8 text-secondary">
                                <c:if test="${adult>1}">
                                    ${adult} adults
                                </c:if>
                                <c:if test="${adult==1}">
                                    ${adult} adult
                                </c:if>
                                <c:if test="${children>1}">
                                    ,&nbsp;
                                    ${children} children
                                </c:if>
                                <c:if test="${children==1}">
                                    ,&nbsp;
                                    ${children} child
                                </c:if>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-4">
                                <h6>Check-in</h6>
                            </div>
                            <div class="col-sm-8 text-secondary">
                                ${checkInDate} (14:00 – 00:00)
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-4">
                                <h6>Check-out</h6>
                            </div>
                            <div class="col-sm-8 text-secondary">
                                ${checkOutDate} (01:00 – 12:00)
                            </div>
                        </div>
                        <div class="card" style="border: 1px solid #ebf3ff; box-shadow: none; background: aliceblue">
                            <div class="card-body">
                                <div>
                                    <div style="display: flex; justify-content: space-between;">
                                        <div style="font-size: x-large">
                                            Price
                                        </div>
                                        <div style="font-size: x-large; font-weight: 500;">
                                            VND ${totalPrice}
                                        </div>
                                    </div>
                                </div>
                                <hr>
                                <div>
                                    <strong>
                                        The final price shown is the amount you will pay to the property.
                                    </strong>
                                    <div>
                                        Booking.com does not charge guests any reservation, administration or other fees.<br>
                                        Your card issuer may charge you a foreign transaction fee.
                                    </div>
                                </div>
                                <hr>
                                <div>
                                    <strong>
                                        Payment information
                                    </strong>
                                    <div>
                                        We handles all payments.<br>
                                        Our property accepts the following forms of payment American Express, Visa, JCB, Bankcard, UnionPay
                                        debit card, UnionPay credit card
                                    </div>
                                </div>
                                <hr>
                                <div>
                                    <strong>
                                        Additional information
                                    </strong>
                                    <div>
                                        Please note that additional supplements (e.g. extra bed) are not added in this total.<br>
                                        If you cancel, applicable taxes may still be charged by the property.<br>
                                        If you don't show up at this booking, and you don't cancel beforehand, the property is liable to charge you
                                        the full reservation amount.<br>
                                        Please remember to read the Important information below, as this may contain important details not
                                        mentioned here.
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <h4 style="margin-bottom: 15px">Property details</h4>
                <div class="card" style="border-radius: 0px;">
                    <div class="card-body">
                        <div class="row">
                            <div class="col-sm-4">
                                <h6>Address</h6>
                            </div>
                            <div class="col-sm-8 text-secondary">
                                abc streets, abc state, abc district, abc country
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-4">
                                <h6>Phone</h6>
                            </div>
                            <div class="col-sm-8 text-secondary">
                                +84868342491
                            </div>
                        </div>
                        <hr>
                        <c:forEach items="${listRoom}" var="list">
                            <div class="row">
                                <div class="col-sm-12">
                                    <h5>${list.getName()}</h5>
                                    <div class="text-secondary">
                                        This room has a balcony, oven and microwave.
                                    </div>
                                </div>
                            </div>
                            <br>
                            <div class="row">
                                <div class="col-sm-4">
                                    <h6>Your stay includes:</h6>
                                </div>
                                <div class="col-sm-8 text-secondary">
                                    (non-smoking preference)<br>
                                    (other services and conveniences/ room features...)
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-4">
                                    <h6>Maximum capacity</h6>
                                </div>
                                <div class="col-sm-8 text-secondary">
                                    ${list.getAdult()+list.getChildren()} guest maximum, of which ${list.getAdult()} adults maximum.
                                    ${list.getChildren()} children maximum, ...

                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-4">
                                    <h6>Prepayment</h6>
                                </div>
                                <div class="col-sm-8 text-secondary">
                                    No prepayment is needed.
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-4">
                                    <h6>Cancellation cost</h6>
                                </div>
                                <div class="col-sm-8 text-secondary">
                                    <small style="color: green;">Free cancellation</small>
                                    VND 0
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-4">
                                    <h6>Children and beds</h6>
                                </div>
                                <div class="col-sm-8 text-secondary">
                                    <div style="font-weight: 500; margin-bottom: 10px;">
                                        Child policies
                                    </div>
                                    <div style="margin-bottom: 10px;">
                                        Children of any age are welcome.<br>
                                        Children aged 18 years and above are considered adults at this property.
                                    </div>
                                    <div style="font-weight: 500; margin-bottom: 10px;">
                                        Cot and extra bed policies
                                    </div>
                                    No cots and extra beds are available.
                                </div>
                            </div>
                            <br>
                        </c:forEach>
                    </div>
                </div>
                <div style="text-align: right; font-weight: 500; margin-bottom: 1rem;">
                    Look forward to your stay!<br>
                    MyHotel.com Manager
                </div>
            </div>
        </div>
        <!--/PDF div-->

        <script type="text/javascript">
            document.getElementById('dl-pdf').onclick = function () {
                var element = document.getElementById('PDF');
                var date = new Date();
//                var objDate = new Date(date).toLocaleString("en-us", {month: "long"});//July
                var objDate = new Date(date).toLocaleString("en-us", {month: "short"}); //Jul
//                alert(objDate);

                var opt = {
                    margin: 0.25,
                    filename: 'Booking_of_' + objDate + '.pdf',
                    image: {type: 'jpeg', quality: 1},
                    html2canvas: {scale: 2},
                    jsPDF: {unit: 'in', format: 'letter', orientation: 'landscape'}
                };

                html2pdf(element, opt);
            }
        </script>

        <style type="text/css">
            body{
                /*background: #f7f7ff;*/
                /*margin-top: 20px;*/
            }
            .card {
                position: relative;
                display: flex;
                flex-direction: column;
                min-width: 0;
                word-wrap: break-word;
                background-color: #fff;
                background-clip: border-box;
                border: 0 solid transparent;
                border-radius: .25rem;
                margin-bottom: 1.5rem;
                box-shadow: 0 2px 6px 0 rgb(218 218 253 / 65%), 0 2px 6px 0 rgb(206 206 238 / 54%);
            }
            .me-2 {
                margin-right: .5rem!important;
            }
            nav{
                background-color: midnightblue;
            }
            .nav-item a, .navbar-brand {
                color: white;
            }
            .nav-item a:hover, .navbar-brand:hover {
                color: blue;
            }
            a.dropdown-item{
                color: black;
            }
            .div-section{
                margin-top: 10px;
            }
            .submit-section{
                text-align: center;
            }
            .submit-section input{
                padding: 10px 3rem;
            }
        </style>
    </body>
</html>
