<%-- 
    Document   : booking
    Created on : Sep 23, 2022, 5:30:28 PM
    Author     : DELL
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Booking Info Page</title>
        <!--  This file has been downloaded from bootdey.com @bootdey on twitter -->
        <!--  All snippets are MIT license http://bootdey.com/license -->
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/js/bootstrap.bundle.min.js"></script>
        <style>
            body{
                background: white;
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
            /*            #progress {
                            position: relative;
                            margin-bottom: 30px;   
                        }
                        #progress-bar {
                            position: absolute;
                            background: lightseagreen;
                            height: 5px;
                            width: 0%;
                            top: 50%;
                            left: 0;
                        }
                        #progress-num {
                            margin: 0;
                            padding: 0;
                            list-style: none;
                            display: flex;
                            justify-content: space-between;
                        }
                        #progress-num::before {
                            content: "";
                            background-color: lightgray;
                            position: absolute;
                            top: 50%;
                            left: 0;
                            height: 1px;
                            width: 100%;
                            z-index: -1;
                        }
                        #progress-num .step {
                            border: 3px solid lightgray;
                            border-radius: 100%;
                            width: 25px;
                            height: 25px;
                            line-height: 25px;
                            text-align: center;
                            background-color: #fff;
                            font-family: sans-serif;
                            font-size: 14px;    
                            position: relative;
                            z-index: 1;
                        }*/
            /*            #progress-num .step.active {
                            border-color: lightseagreen;
                            background-color: lightseagreen;
                            color: #fff;
                        }
                        #progress-num .step.active::before {
                            border-color: lightseagreen;
                            background-color: lightseagreen;
                            color: #fff;
                        }*/
            .progressbar {
                counter-reset: step;
                padding: 0;
                display: flex;
                /* for demo */
                /*margin: 100px auto 0;*/
                max-width: 100%;
            }

            .progressbar li {
                /*float: left;*/
                list-style: none;
                position: relative;
                text-align: center;
                width: 100%;
            }

            .progressbar li:before {
                background: #fff;
                border: 2px solid #bebebe;
                border-radius: 50%;
                color: #bebebe;
                content: counter(step);
                counter-increment: step;
                display: block;
                font-weight: 700;
                height: 30px;
                line-height: 27px;
                margin: 0 auto 10px;
                text-align: center;
                width: 30px;
            }

            .progressbar li:after {
                background: #979797;
                content: '';
                height: 3px;
                left: -50%;
                position: absolute;
                top: 15px;
                width: 100%;
                z-index: -1;
            }

            .progressbar li:first-child:after {
                content: none;
            }

            .progressbar li.active:after,
            .progressbar li.complete:after {
                background: #3aac5d;
            }

            .progressbar li.active:before,
            .progressbar li.complete:before {
                background: #3aac5d;
                border-color: #3aac5d;
                color: #fff;
            }

            .progressbar li.active {
                color: #3aac5d;
                font-weight: 700;
            }
        </style>
        <script type="text/javascript">
//            const progressBar = document.getElementById("progress-bar");
//            const progressNext = document.getElementById("progress-next");
//            const progressPrev = document.getElementById("progress-prev");
//            const steps = document.querySelectorAll(".step");
//            const active = 1;
//            progressNext.addEventListener("click", progressnext);
//            function progressnext() {
//                active++;
//                if (active > steps.length) {
//                    active = steps.length;
//                }
//                updateProgress();
//            }
//            progressPrev.addEventListener("click", progressPrevious);
//            function progressPrevious() {
//                active--;
//                if (active < 1) {
//                    active = 1;
//                }
//                updateProgress();
//            }
//            const updateProgress = () => {
//                // toggle active class on list items
//                steps.forEach((step, i) => {
//                    if (i < active) {
//                        step.classList.add("active");
//                    } else {
//                        step.classList.remove("active");
//                    }
//                });
//                // set progress bar width  
//                progressBar.style.width =
//                        ((active - 1) / (steps.length - 1)) * 100 + "%";
//                // enable disable prev and next buttons
//                if (active === 1) {
//                    progressPrev.disabled = true;
//                } else if (active === steps.length) {
//                    progressNext.disabled = true;
//                } else {
//                    progressPrev.disabled = false;
//                    progressNext.disabled = false;
//                }
//            };
            function checkEmailOrPhone() {
                var emailOrPhone = document.getElementById('login');
                if (emailOrPhone.value.toString().includes("@")) { //email
                    emailOrPhone.pattern = "[a-zA-Z0-9]{1,18}[@][a-z]{1,8}[.][a-z]{1,8}";
                    emailOrPhone.title = "Email must not contain: Unicode characters, special character e.g: !@#$%^&,. etc.. and whitespaces; \n\
        Allow uppercase, lowercase letters and numeric characters (0-9), max length: 25";
                } else {
                    emailOrPhone.pattern = "[0-9]{10}";
                    emailOrPhone.title = "Phone number must be 10-digit number or please enter your email";
                }
            }
            $(function () {
                $("#sign-in").on("show.bs.modal", function (e) {
                    var text = $(e.relatedTarget).attr('data');
                    const myArray = text.split(" ");
            <c:forEach begin="1" end="${fn:length(roomTypeID)}" var="i">
                    var roomTypeID${i} = $(e.relatedTarget).attr('data-roomTypeID${i}');
            </c:forEach>
            <c:forEach begin="1" end="${fn:length(amount)}" var="i">
                    var amount${i} = $(e.relatedTarget).attr('data-amount${i}');
            </c:forEach>
                    var totalPrice = myArray[0];
                    var dateDiff = myArray[1];
                    var checkInDate = $(e.relatedTarget).attr('data-checkInDate');
                    var checkOutDate = $(e.relatedTarget).attr('data-checkOutDate');
            <c:forEach begin="1" end="${fn:length(roomTypeID)}" var="i">
                    document.getElementById('roomTypeID${i}').value = roomTypeID${i};
            </c:forEach>
            <c:forEach begin="1" end="${fn:length(amount)}" var="i">
                    document.getElementById('amount${i}').value = amount${i};
            </c:forEach>
//                    $(e.currentTarget).find('input[name="roomTypeID"]').val(roomTypeID);
//                    $(e.currentTarget).find('input[name="amount"]').val(amount);
                    $(e.currentTarget).find('input[name="totalPrice"]').val(totalPrice);
                    $(e.currentTarget).find('input[name="dateDiff"]').val(dateDiff);
                    $(e.currentTarget).find('input[name="checkInDate"]').val(checkInDate);
                    $(e.currentTarget).find('input[name="checkOutDate"]').val(checkOutDate);
                });
            });
            $(function () {
                $("#confirm-logout").on("show.bs.modal", function (e) {
                    var text = $(e.relatedTarget).attr('data');
                    const myArray = text.split(" ");
            <c:forEach begin="1" end="${fn:length(roomTypeID)}" var="i">
                    var roomTypeID${i} = $(e.relatedTarget).attr('data-roomTypeID${i}');
            </c:forEach>
            <c:forEach begin="1" end="${fn:length(amount)}" var="i">
                    var amount${i} = $(e.relatedTarget).attr('data-amount${i}');
            </c:forEach>
                    var totalPrice = myArray[0];
                    var dateDiff = myArray[1];
                    var checkInDate = $(e.relatedTarget).attr('data-checkInDate');
                    var checkOutDate = $(e.relatedTarget).attr('data-checkOutDate');
            <c:forEach begin="1" end="${fn:length(roomTypeID)}" var="i">
                    document.getElementById('roomTypeID1${i}').value = roomTypeID${i};
            </c:forEach>
            <c:forEach begin="1" end="${fn:length(amount)}" var="i">
                    document.getElementById('amount1${i}').value = amount${i};
            </c:forEach>
//                    $(e.currentTarget).find('input[name="roomTypeID"]').val(roomTypeID);
//                    $(e.currentTarget).find('input[name="amount"]').val(amount);
                    $(e.currentTarget).find('input[name="totalPrice"]').val(totalPrice);
                    $(e.currentTarget).find('input[name="dateDiff"]').val(dateDiff);
                    $(e.currentTarget).find('input[name="checkInDate"]').val(checkInDate);
                    $(e.currentTarget).find('input[name="checkOutDate"]').val(checkOutDate);
                });
            });
        </script>
    </head>
    <body>
        <nav class="navbar navbar-expand-lg navbar-blue ftco_navbar bg-blue ftco-navbar-light" id="ftco-navbar">
            <div class="container">
                <a class="navbar-brand" href="home">My<span>Hotel</span></a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav" aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="oi oi-menu"></span> Menu
                </button>

                <div class="collapse navbar-collapse" id="ftco-nav">
                    <ul class="navbar-nav ml-auto">
                        <!--<li class="nav-item active"><a href="home.jsp" class="nav-link">Home</a></li>-->
                        <li class="nav-item"><a href="rooms.jsp" class="nav-link">Our Rooms</a></li>
                        <li class="nav-item"><a href="restaurant.html" class="nav-link">Restaurant</a></li>
                        <li class="nav-item"><a href="about.html" class="nav-link">About Us</a></li>
                        <li class="nav-item"><a href="blog.html" class="nav-link">Blog</a></li>
                        <li class="nav-item"><a href="contact.jsp" class="nav-link">Contact</a></li>
                            <c:if test="${sessionScope.Customer==null}">
                            <li class="nav-item">
                                <a class="nav-link" href="#" id="btn-sign-in" data-toggle="modal" data-target="#sign-in" 
                                   <c:forEach begin="0" end="${fn:length(roomTypeID)-1}" var="i">
                                       data-roomTypeID${i+1}="${roomTypeID[i]}"
                                   </c:forEach>
                                   <c:forEach begin="0" end="${fn:length(amount)-1}" var="i">
                                       data-amount${i+1}="${amount[i]}"
                                   </c:forEach>
                                   data="${totalPrice} ${dateDiff}"
                                   data-checkInDate="${checkInDate}"
                                   data-checkOutDate="${checkOutDate}"
                                   onclick="this.style.backgroundColor = 'midnightblue'"
                                   >Sign in
                                </a>
                            </li>
                        </c:if>
                        <c:if test="${sessionScope.Customer!=null}">
                            <li class="nav-item dropdown has-arrow main-drop">
                                <a href="profile.jsp" class="dropdown-toggle nav-link" data-toggle="dropdown">${sessionScope.Customer.getLastName()} ${sessionScope.Customer.getFirstName()}</a>
                                <div class="dropdown-menu">
                                    <a class="dropdown-item" href="customer">Manage Account</a>
                                    <!--<a class="dropdown-item" href="settings.html">Settings</a>-->
                                    <a class="dropdown-item" href="#" data-toggle="modal" data-target="#confirm-logout"
                                       <c:forEach begin="0" end="${fn:length(roomTypeID)-1}" var="i">
                                           data-roomTypeID${i+1}="${roomTypeID[i]}"
                                       </c:forEach>
                                       <c:forEach begin="0" end="${fn:length(amount)-1}" var="i">
                                           data-amount${i+1}="${amount[i]}"
                                       </c:forEach>
                                       data="${totalPrice} ${dateDiff}"
                                       data-checkInDate="${checkInDate}"
                                       data-checkOutDate="${checkOutDate}"
                                       >Sign out
                                    </a>
                                </div>
                            </li>
                        </c:if>
                    </ul>
                </div>
            </div>
        </nav>
        <!-- END nav -->
        <div class="container" style="margin-top: 2rem">
            <div class="main-body">
                <ul class="progressbar">
                    <li class="complete"><strong>Your selection</strong></li>
                    <li class="active"><strong>Your details</strong></li>
                </ul>
                <!--                    <div id="progress">
                                        <div id="progress-bar"></div>
                                        <ul id="progress-num">
                                            <li class="step active">
                                                <svg class="bk-icon -streamline-checkmark_fill bui-nav-progress__icon" fill="currentColor" height="24" width="24" viewBox="0 0 128 128" role="presentation" aria-hidden="true" focusable="false"><path d="M56.33 102a6 6 0 0 1-4.24-1.75L19.27 67.54A6.014 6.014 0 1 1 27.74 59l27.94 27.88 44-58.49a6 6 0 1 1 9.58 7.22l-48.17 64a5.998 5.998 0 0 1-4.34 2.39z"></path></svg>
                                                <div><strong>Your selection</strong></div>
                                            </li>
                                            <li class="step active">
                                                <strong>Your details</strong>
                                            </li>
                                            <li class="step">3</li>
                                        </ul>
                                    </div>-->

                <!--                    <button id="progress-prev" class="btn" disabled>Prev</button>
                                    <button id="progress-next" class="btn">Next</button>-->

                <div class="row">
                    <div class="col-lg-4">
                        <div class="card">
                            <div class="card-body">
                                <h6>Your booking details</h6>
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
                                <div class="details" style="margin-top: 1rem;">Total length of stay:</div>
                                <c:if test="${dateDiff==1}">
                                    <div class="important-details">${dateDiff} night</div>
                                </c:if>
                                <c:if test="${dateDiff!=1}">
                                    <div class="important-details">${dateDiff} night</div>
                                </c:if>    
                                <hr>
                                <div class="details">You selected:</div>
                                <c:forEach items="${listRoomType}" var="listRt">
                                    <c:forEach begin="0" end="${fn:length(roomTypeID)}" var="i">
                                        <c:if test="${listRt.getRoomTypeID()==roomTypeID[i]}">
                                            <div class="text-secondary">${amount[i]} x ${listRt.getName()}</div>
                                        </c:if>
                                    </c:forEach>
                                </c:forEach>

                                <!--                                    <div class="details">Sleeps (up to):</div>
                                                                    <div class="text-secondary">2 adults + 1 child</div>-->
                                <!--                                    <div class="important-details" style="color: green; margin-top: 1rem; font-size: smaller;">
                                                                        <svg class="bk-icon -streamline-checkmark_selected" height="16" width="16" viewBox="0 0 128 128" role="presentation" aria-hidden="true" focusable="false"><path d="M56.62 93.54a4 4 0 0 1-2.83-1.18L28.4 67a4 4 0 1 1 5.65-5.65l22.13 22.1 33-44a4 4 0 1 1 6.4 4.8L59.82 91.94a4.06 4.06 0 0 1-2.92 1.59zM128 64c0-35.346-28.654-64-64-64C28.654 0 0 28.654 0 64c0 35.346 28.654 64 64 64 35.33-.039 63.961-28.67 64-64zm-8 0c0 30.928-25.072 56-56 56S8 94.928 8 64 33.072 8 64 8c30.914.033 55.967 25.086 56 56z"></path></svg>
                                                                        This should be a great fit!
                                                                    </div>-->

                            </div>
                        </div>
                        <div class="card" style="background: #ebf3ff;">
                            <div class="card-body">
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
                        <div class="card">
                            <div class="card-body">
                                <h6>Your payment schedule</h6>
                                <div>
                                    No payment today. You'll pay when you stay.
                                </div>
                            </div>
                        </div>
                        <div class="card">
                            <div class="card-body">
                                <h6>How much will it cost to cancel?
                                </h6>
                                <ul style="list-style: none; padding: 0px;">
                                    <li>
                                        Free cancellation until ${checkOutDate.split(" ")[1]} ${checkOutDate.split(" ")[0]}
                                    </li>
                                    <li>
                                        From 18:00 on ${checkOutDate.split(" ")[0]}: &nbsp;&nbsp;&nbsp;
                                        <strong>VND 100,000</strong>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-8">
                        <div class="card">
                            <div class="card-body">
                                <h4 style="margin-bottom: 15px">Good to know:</h4>
                                <div style="margin-bottom: 15px">
                                    <svg class="bk-icon -streamline-credit_card_crossed" fill="#008009" height="18" role="presentation" width="18" viewBox="0 0 128 128" aria-hidden="true" focusable="false"><path d="M88.72 108a4 4 0 0 1-4 4H12c-6.627 0-12-5.373-12-12V28a4 4 0 0 1 8 0v12h12.11a4 4 0 0 1 0 8H8v52a4 4 0 0 0 4 4h72.72a4 4 0 0 1 4 4zM116 16H43.1a4 4 0 0 0 0 8H116a4 4 0 0 1 4 4v12H66.86a4 4 0 0 0 0 8H120v52a4 4 0 0 0 8 0V28c0-6.627-5.373-12-12-12zM44.3 64H28a4 4 0 0 0 0 8h16.3a4 4 0 0 0 0-8zM24 84a4 4 0 0 0 4 4h29.88a4 4 0 0 0 0-8H28a4 4 0 0 0-4 4zM6.83 1.17a4.002 4.002 0 1 0-5.66 5.66l120 120a4.002 4.002 0 1 0 5.66-5.66z"></path></svg>
                                    <span style="margin-left: 10px;">Booking for tonight? No credit card needed!</span>
                                </div>
                                <div>
                                    <svg class="bk-icon -streamline-checkmark_selected" fill="#008009" height="18" role="presentation" width="18" viewBox="0 0 128 128" aria-hidden="true" focusable="false"><path d="M56.62 93.54a4 4 0 0 1-2.83-1.18L28.4 67a4 4 0 1 1 5.65-5.65l22.13 22.1 33-44a4 4 0 1 1 6.4 4.8L59.82 91.94a4.06 4.06 0 0 1-2.92 1.59zM128 64c0-35.346-28.654-64-64-64C28.654 0 0 28.654 0 64c0 35.346 28.654 64 64 64 35.33-.039 63.961-28.67 64-64zm-8 0c0 30.928-25.072 56-56 56S8 94.928 8 64 33.072 8 64 8c30.914.033 55.967 25.086 56 56z"></path></svg>
                                    <span style="margin-left: 10px;">No payment is required to secure this booking. You'll pay during your stay.</span>
                                </div>
                            </div>
                        </div>
                        <c:if test="${sessionScope.Customer == null}">
                            <div class="card">
                                <div class="card-body">
                                    <h6 style="margin-bottom: 15px">Please sign in:</h6>
                                    <div class="text-secondary" style="margin-bottom: 15px">
                                        Save time! Sign in to book with your saved details.
                                    </div>
                                    <div>
                                        <!--                                        <a class="btn btn-primary" href="#"
                                                                                   onclick="document.getElementById('btn-sign-in').style.backgroundColor = 'cadetblue'">
                                                                                    Sign in
                                                                                </a>-->
                                        <a class="btn btn-primary" href="#"
                                           data-toggle="modal" data-target="#sign-in"
                                           <c:forEach begin="0" end="${fn:length(roomTypeID)-1}" var="i">
                                               data-roomTypeID${i+1}="${roomTypeID[i]}"
                                           </c:forEach>
                                           <c:forEach begin="0" end="${fn:length(amount)-1}" var="i">
                                               data-amount${i+1}="${amount[i]}"
                                           </c:forEach>
                                           data="${totalPrice} ${dateDiff}"
                                           data-checkInDate="${checkInDate}"
                                           data-checkOutDate="${checkOutDate}"
                                           >
                                            Sign in
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </c:if>

                        <!-- Sign in Modal -->
                        <div id="sign-in" class="modal custom-modal fade" role="dialog">
                            <div class="modal-dialog modal-dialog-centered modal-sm" role="document">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title">Welcome to our Hotel</h5>
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                            <span aria-hidden="true">&times;</span>
                                        </button>
                                    </div>
                                    <div class="modal-body">
                                        <form action="booking" method="post">
                                            <input type="hidden" name="do" value="customerLogin">
                                            <!--<input type="hidden" name="isBooking" value="true">-->
                                            <c:forEach begin="1" end="${fn:length(roomTypeID)}" var="i">
                                                <input type="hidden" id="roomTypeID${i}" name="roomTypeID" value="">
                                            </c:forEach>
                                            <c:forEach begin="1" end="${fn:length(amount)}" var="i">
                                                <input type="hidden" id="amount${i}" name="amount" value="">
                                            </c:forEach>
                                            <input type="hidden" name="totalPrice" value="">
                                            <input type="hidden" name="dateDiff" value="">
                                            <input type="hidden" name="checkInDate" value="">
                                            <input type="hidden" name="checkOutDate" value="">
                                            <div class="row">
                                                <div class="col-sm-12">
                                                    <div class="form-group">
                                                        <label class="col-form-label">Email <span class="text-danger">*</span></label>
                                                        <input type="text" id="login" class="form-control" name="EmailOrPhone" required="" placeholder="enter email or phone number"
                                                               onkeyup="checkEmailOrPhone()">
                                                    </div>
                                                </div>
                                                <div class="col-sm-12">
                                                    <div class="form-group">
                                                        <label class="col-form-label">Password <span class="text-danger">*</span></label>
                                                        <input type="password" id="password" class="form-control" name="Password" required="" placeholder="enter password" pattern="[a-zA-Z0-9]{1,25}"
                                                               title="Password must not contain: Unicode characters, 
                                                               special character e.g: !@#$%^&,. etc.. and whitespaces; 
                                                               Allow uppercase, lowercase letters and numeric characters (0-9), max length: 25">
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="submit-section">
                                                <input type="submit" class="btn btn-primary" value="Sign in" style="
                                                       margin-top: 25px;
                                                       width: 100%;
                                                       padding: 8px 0px;">
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- /Sign in Modal -->

                        <form class="col-sm-12" id="customerDetailForm" action="booking">
                            <input type="text" name="do" value="finishReserve">
                            <input type="text" name="adult" value="${adult}">
                            <input type="text" name="children" value="${children}">
                            <input type="text" name="totalPrice" value="${totalPrice}">
                            <input type="text" name="dateDiff" value="${dateDiff}">
                            <input type="text" name="checkInDate" value="${checkInDate}">
                            <input type="text" name="checkOutDate" value="${checkOutDate}">
                            <c:forEach items="${roomTypeID}" var="roomTypeID">
                                <input type="text" name="roomTypeID" value="${roomTypeID}">
                            </c:forEach>
                            <c:forEach items="${amount}" var="amount">
                                <input type="text" name="amount" value="${amount}">
                            </c:forEach>
                            <div class="card" style="background: #ebf3ff;">
                                <div class="card-body">
                                    <h4>Enter your details</h4>
                                    <div class="almost-done">Almost done! Just fill in the <span class="text-danger">*</span> required info</div>
                                    <div class="row">
                                        <div class="col-sm-12 col-md-5 col-lg-4">
                                            <div class="form-group">
                                                <label class="col-form-label" for="first_name">First Name <span class="text-danger">*</span></label>
                                                <input class="form-control" type="text" name="FirstName" id="first_name" required pattern="[A-Za-zàáãạảăắằẳẵặâấầẩẫậèéẹẻẽêềếểễệđìíĩỉịòóõọỏôốồổỗộơớờởỡợùúũụủưứừửữựỳỵỷỹýÀÁÃẠẢĂẮẰẲẴẶÂẤẦẨẪẬÈÉẸẺẼÊỀẾỂỄỆĐÌÍĨỈỊÒÓÕỌỎÔỐỒỔỖỘƠỚỜỞỠỢÙÚŨỤỦƯỨỪỬỮỰỲỴỶỸÝ ]{1,12}"
                                                       title="FirstName not contain: 
                                                       Special character e.g: !@#$%^&,. etc.., spacing and numeric characters (0-9);  
                                                       allow uppercase and lowercase letters, max length: 12"
                                                       onkeydown="event.preventDefault()"
                                                       value="${Customer.getFirstName()}">
                                            </div>
                                        </div>
                                        <div class="col-sm-12 col-md-5 col-lg-4">
                                            <div class="form-group">
                                                <label class="col-form-label" for="last_name">Last Name <span class="text-danger">*</span></label>
                                                <input class="form-control" type="text" name="LastName" id="last_name" required pattern="[A-Za-zàáãạảăắằẳẵặâấầẩẫậèéẹẻẽêềếểễệđìíĩỉịòóõọỏôốồổỗộơớờởỡợùúũụủưứừửữựỳỵỷỹýÀÁÃẠẢĂẮẰẲẴẶÂẤẦẨẪẬÈÉẸẺẼÊỀẾỂỄỆĐÌÍĨỈỊÒÓÕỌỎÔỐỒỔỖỘƠỚỜỞỠỢÙÚŨỤỦƯỨỪỬỮỰỲỴỶỸÝ ]{1,12}"
                                                       title="LastName not contain: 
                                                       Special character e.g: !@#$%^&,. etc.., spacing and numeric characters (0-9);  
                                                       allow uppercase and lowercase letters, max length: 12"
                                                       value="${Customer.getLastName()}">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-sm-12 col-md-6 col-lg-6">
                                            <div class="form-group">
                                                <label class="col-form-label" for="email">Email <span class="text-danger">*</span></label>
                                                <input class="form-control" type="text" name="Email" id="email" required pattern="[a-zA-Z0-9]{1,12}[@][a-z]{1,6}[.][a-z]{1,6}"
                                                       title="email not allow: Unicode characters, 
                                                       special character other than @ and . and spacing characters;  
                                                       allow uppercase, lowercase letters and numeric characters (0-9);
                                                       maximum length of parts of email: 
                                                       username: 20, mail server: 12, domain: 12; 
                                                       max length: 46"
                                                       placeholder="Watch out for typos"
                                                       value="${Customer.getEmail()}">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-sm-12 col-md-6 col-lg-6">
                                            <div class="form-group">
                                                <label class="col-form-label" for="Country">Country <span class="text-danger">*</span></label>
                                                <select class="form-control" name="Country" id="Country" required>
                                                    <option value="">
                                                        --
                                                        -- Select country/region --
                                                        --
                                                    </option>
                                                    <option value="af" data-prefix="">
                                                        Afghanistan
                                                    </option>
                                                    <option value="al" data-prefix="">
                                                        Albania
                                                    </option>
                                                    <option value="dz" data-prefix="">
                                                        Algeria
                                                    </option>
                                                    <option value="as" data-prefix="">
                                                        American Samoa
                                                    </option>
                                                    <option value="ad" data-prefix="">
                                                        Andorra
                                                    </option>
                                                    <option value="ao" data-prefix="">
                                                        Angola
                                                    </option>
                                                    <option value="ai" data-prefix="">
                                                        Anguilla
                                                    </option>
                                                    <option value="aq" data-prefix="">
                                                        Antarctica
                                                    </option>
                                                    <option value="ag" data-prefix="">
                                                        Antigua &amp; Barbuda
                                                    </option>
                                                    <option value="ar" data-prefix="">
                                                        Argentina
                                                    </option>
                                                    <option value="am" data-prefix="">
                                                        Armenia
                                                    </option>
                                                    <option value="aw" data-prefix="">
                                                        Aruba
                                                    </option>
                                                    <option value="au" data-prefix="">
                                                        Australia
                                                    </option>
                                                    <option value="at" data-prefix="">
                                                        Austria
                                                    </option>
                                                    <option value="az" data-prefix="">
                                                        Azerbaijan
                                                    </option>
                                                    <option value="bs" data-prefix="">
                                                        Bahamas
                                                    </option>
                                                    <option value="bh" data-prefix="">
                                                        Bahrain
                                                    </option>
                                                    <option value="bd" data-prefix="">
                                                        Bangladesh
                                                    </option>
                                                    <option value="bb" data-prefix="">
                                                        Barbados
                                                    </option>
                                                    <option value="by" data-prefix="">
                                                        Belarus
                                                    </option>
                                                    <option value="be" data-prefix="">
                                                        Belgium
                                                    </option>
                                                    <option value="bz" data-prefix="">
                                                        Belize
                                                    </option>
                                                    <option value="bj" data-prefix="">
                                                        Benin
                                                    </option>
                                                    <option value="bm" data-prefix="">
                                                        Bermuda
                                                    </option>
                                                    <option value="bt" data-prefix="">
                                                        Bhutan
                                                    </option>
                                                    <option value="bo" data-prefix="">
                                                        Bolivia
                                                    </option>
                                                    <option value="bq" data-prefix="">
                                                        Bonaire St Eustatius and Saba
                                                    </option>
                                                    <option value="ba" data-prefix="">
                                                        Bosnia and Herzegovina
                                                    </option>
                                                    <option value="bw" data-prefix="">
                                                        Botswana
                                                    </option>
                                                    <option value="bv" data-prefix="">
                                                        Bouvet Island
                                                    </option>
                                                    <option value="br" data-prefix="">
                                                        Brazil
                                                    </option>
                                                    <option value="io" data-prefix="">
                                                        British Indian Ocean Territory
                                                    </option>
                                                    <option value="bn" data-prefix="">
                                                        Brunei Darussalam
                                                    </option>
                                                    <option value="bg" data-prefix="">
                                                        Bulgaria
                                                    </option>
                                                    <option value="bf" data-prefix="">
                                                        Burkina Faso
                                                    </option>
                                                    <option value="bi" data-prefix="">
                                                        Burundi
                                                    </option>
                                                    <option value="kh" data-prefix="">
                                                        Cambodia
                                                    </option>
                                                    <option value="cm" data-prefix="">
                                                        Cameroon
                                                    </option>
                                                    <option value="ca" data-prefix="">
                                                        Canada
                                                    </option>
                                                    <option value="cv" data-prefix="">
                                                        Cape Verde
                                                    </option>
                                                    <option value="ky" data-prefix="">
                                                        Cayman Islands
                                                    </option>
                                                    <option value="cf" data-prefix="">
                                                        Central Africa Republic
                                                    </option>
                                                    <option value="td" data-prefix="">
                                                        Chad
                                                    </option>
                                                    <option value="cl" data-prefix="">
                                                        Chile
                                                    </option>
                                                    <option value="cn" data-prefix="">
                                                        China
                                                    </option>
                                                    <option value="cx" data-prefix="">
                                                        Christmas Island
                                                    </option>
                                                    <option value="cc" data-prefix="">
                                                        Cocos (K) I.
                                                    </option>
                                                    <option value="co" data-prefix="">
                                                        Colombia
                                                    </option>
                                                    <option value="km" data-prefix="">
                                                        Comoros
                                                    </option>
                                                    <option value="cg" data-prefix="">
                                                        Congo
                                                    </option>
                                                    <option value="ck" data-prefix="">
                                                        Cook Islands
                                                    </option>
                                                    <option value="cr" data-prefix="">
                                                        Costa Rica
                                                    </option>
                                                    <option value="xc" data-prefix="">
                                                        Crimea
                                                    </option>
                                                    <option value="hr" data-prefix="">
                                                        Croatia
                                                    </option>
                                                    <option value="cw" data-prefix="">
                                                        Curaçao
                                                    </option>
                                                    <option value="cy" data-prefix="">
                                                        Cyprus
                                                    </option>
                                                    <option value="cz" data-prefix="">
                                                        Czech Republic
                                                    </option>
                                                    <option value="ci" data-prefix="">
                                                        Côte d'Ivoire
                                                    </option>
                                                    <option value="cd" data-prefix="">
                                                        Democratic Republic of Congo
                                                    </option>
                                                    <option value="dk" data-prefix="">
                                                        Denmark
                                                    </option>
                                                    <option value="dj" data-prefix="">
                                                        Djibouti
                                                    </option>
                                                    <option value="dm" data-prefix="">
                                                        Dominica
                                                    </option>
                                                    <option value="do" data-prefix="">
                                                        Dominican Republic
                                                    </option>
                                                    <option value="tl" data-prefix="">
                                                        East Timor
                                                    </option>
                                                    <option value="ec" data-prefix="">
                                                        Ecuador
                                                    </option>
                                                    <option value="eg" data-prefix="">
                                                        Egypt
                                                    </option>
                                                    <option value="sv" data-prefix="">
                                                        El Salvador
                                                    </option>
                                                    <option value="gq" data-prefix="">
                                                        Equatorial Guinea
                                                    </option>
                                                    <option value="er" data-prefix="">
                                                        Eritrea
                                                    </option>
                                                    <option value="ee" data-prefix="">
                                                        Estonia
                                                    </option>
                                                    <option value="et" data-prefix="">
                                                        Ethiopia
                                                    </option>
                                                    <option value="fk" data-prefix="">
                                                        Falkland Islands (Malvinas)
                                                    </option>
                                                    <option value="fo" data-prefix="">
                                                        Faroe Islands
                                                    </option>
                                                    <option value="fj" data-prefix="">
                                                        Fiji
                                                    </option>
                                                    <option value="fi" data-prefix="">
                                                        Finland
                                                    </option>
                                                    <option value="fr" data-prefix="">
                                                        France
                                                    </option>
                                                    <option value="gf" data-prefix="">
                                                        French Guiana
                                                    </option>
                                                    <option value="pf" data-prefix="">
                                                        French Polynesia
                                                    </option>
                                                    <option value="tf" data-prefix="">
                                                        French Southern Territories
                                                    </option>
                                                    <option value="ga" data-prefix="">
                                                        Gabon
                                                    </option>
                                                    <option value="gm" data-prefix="">
                                                        Gambia
                                                    </option>
                                                    <option value="ge" data-prefix="">
                                                        Georgia
                                                    </option>
                                                    <option value="de" data-prefix="">
                                                        Germany
                                                    </option>
                                                    <option value="gh" data-prefix="">
                                                        Ghana
                                                    </option>
                                                    <option value="gi" data-prefix="">
                                                        Gibraltar
                                                    </option>
                                                    <option value="gr" data-prefix="">
                                                        Greece
                                                    </option>
                                                    <option value="gl" data-prefix="">
                                                        Greenland
                                                    </option>
                                                    <option value="gd" data-prefix="">
                                                        Grenada
                                                    </option>
                                                    <option value="gp" data-prefix="">
                                                        Guadeloupe
                                                    </option>
                                                    <option value="gu" data-prefix="">
                                                        Guam
                                                    </option>
                                                    <option value="gt" data-prefix="">
                                                        Guatemala
                                                    </option>
                                                    <option value="gg" data-prefix="">
                                                        Guernsey
                                                    </option>
                                                    <option value="gn" data-prefix="">
                                                        Guinea
                                                    </option>
                                                    <option value="gw" data-prefix="">
                                                        Guinea-Bissau
                                                    </option>
                                                    <option value="gy" data-prefix="">
                                                        Guyana
                                                    </option>
                                                    <option value="ht" data-prefix="">
                                                        Haiti
                                                    </option>
                                                    <option value="hm" data-prefix="">
                                                        Heard and McDonald Islands
                                                    </option>
                                                    <option value="hn" data-prefix="">
                                                        Honduras
                                                    </option>
                                                    <option value="hk" data-prefix="">
                                                        Hong Kong
                                                    </option>
                                                    <option value="hu" data-prefix="">
                                                        Hungary
                                                    </option>
                                                    <option value="is" data-prefix="">
                                                        Iceland
                                                    </option>
                                                    <option value="in" data-prefix="">
                                                        India
                                                    </option>
                                                    <option value="id" data-prefix="">
                                                        Indonesia
                                                    </option>
                                                    <option value="ir" data-prefix="">
                                                        Iran
                                                    </option>
                                                    <option value="iq" data-prefix="">
                                                        Iraq
                                                    </option>
                                                    <option value="ie" data-prefix="">
                                                        Ireland
                                                    </option>
                                                    <option value="im" data-prefix="">
                                                        Isle of Man
                                                    </option>
                                                    <option value="il" data-prefix="">
                                                        Israel
                                                    </option>
                                                    <option value="it" data-prefix="">
                                                        Italy
                                                    </option>
                                                    <option value="jm" data-prefix="">
                                                        Jamaica
                                                    </option>
                                                    <option value="jp" data-prefix="">
                                                        Japan
                                                    </option>
                                                    <option value="je" data-prefix="">
                                                        Jersey
                                                    </option>
                                                    <option value="jo" data-prefix="">
                                                        Jordan
                                                    </option>
                                                    <option value="kz" data-prefix="">
                                                        Kazakhstan
                                                    </option>
                                                    <option value="ke" data-prefix="">
                                                        Kenya
                                                    </option>
                                                    <option value="ki" data-prefix="">
                                                        Kiribati
                                                    </option>
                                                    <option value="xk" data-prefix="">
                                                        Kosovo
                                                    </option>
                                                    <option value="kw" data-prefix="">
                                                        Kuwait
                                                    </option>
                                                    <option value="kg" data-prefix="">
                                                        Kyrgyzstan
                                                    </option>
                                                    <option value="la" data-prefix="">
                                                        Laos
                                                    </option>
                                                    <option value="lv" data-prefix="">
                                                        Latvia
                                                    </option>
                                                    <option value="lb" data-prefix="">
                                                        Lebanon
                                                    </option>
                                                    <option value="ls" data-prefix="">
                                                        Lesotho
                                                    </option>
                                                    <option value="lr" data-prefix="">
                                                        Liberia
                                                    </option>
                                                    <option value="ly" data-prefix="">
                                                        Libya
                                                    </option>
                                                    <option value="li" data-prefix="">
                                                        Liechtenstein
                                                    </option>
                                                    <option value="lt" data-prefix="">
                                                        Lithuania
                                                    </option>
                                                    <option value="lu" data-prefix="">
                                                        Luxembourg
                                                    </option>
                                                    <option value="mo" data-prefix="">
                                                        Macao
                                                    </option>
                                                    <option value="mg" data-prefix="">
                                                        Madagascar
                                                    </option>
                                                    <option value="mw" data-prefix="">
                                                        Malawi
                                                    </option>
                                                    <option value="my" data-prefix="">
                                                        Malaysia
                                                    </option>
                                                    <option value="mv" data-prefix="">
                                                        Maldives
                                                    </option>
                                                    <option value="ml" data-prefix="">
                                                        Mali
                                                    </option>
                                                    <option value="mt" data-prefix="">
                                                        Malta
                                                    </option>
                                                    <option value="mh" data-prefix="">
                                                        Marshall Islands
                                                    </option>
                                                    <option value="mq" data-prefix="">
                                                        Martinique
                                                    </option>
                                                    <option value="mr" data-prefix="">
                                                        Mauritania
                                                    </option>
                                                    <option value="mu" data-prefix="">
                                                        Mauritius
                                                    </option>
                                                    <option value="yt" data-prefix="">
                                                        Mayotte
                                                    </option>
                                                    <option value="mx" data-prefix="">
                                                        Mexico
                                                    </option>
                                                    <option value="fm" data-prefix="">
                                                        Micronesia
                                                    </option>
                                                    <option value="md" data-prefix="">
                                                        Moldova
                                                    </option>
                                                    <option value="mc" data-prefix="">
                                                        Monaco
                                                    </option>
                                                    <option value="mn" data-prefix="">
                                                        Mongolia
                                                    </option>
                                                    <option value="me" data-prefix="">
                                                        Montenegro
                                                    </option>
                                                    <option value="ms" data-prefix="">
                                                        Montserrat
                                                    </option>
                                                    <option value="ma" data-prefix="">
                                                        Morocco
                                                    </option>
                                                    <option value="mz" data-prefix="">
                                                        Mozambique
                                                    </option>
                                                    <option value="mm" data-prefix="">
                                                        Myanmar
                                                    </option>
                                                    <option value="na" data-prefix="">
                                                        Namibia
                                                    </option>
                                                    <option value="nr" data-prefix="">
                                                        Nauru
                                                    </option>
                                                    <option value="np" data-prefix="">
                                                        Nepal
                                                    </option>
                                                    <option value="nl" data-prefix="">
                                                        Netherlands
                                                    </option>
                                                    <option value="nc" data-prefix="">
                                                        New Caledonia
                                                    </option>
                                                    <option value="nz" data-prefix="">
                                                        New Zealand
                                                    </option>
                                                    <option value="ni" data-prefix="">
                                                        Nicaragua
                                                    </option>
                                                    <option value="ne" data-prefix="">
                                                        Niger
                                                    </option>
                                                    <option value="ng" data-prefix="">
                                                        Nigeria
                                                    </option>
                                                    <option value="nu" data-prefix="">
                                                        Niue
                                                    </option>
                                                    <option value="nf" data-prefix="">
                                                        Norfolk Island
                                                    </option>
                                                    <option value="kp" data-prefix="">
                                                        North Korea
                                                    </option>
                                                    <option value="mk" data-prefix="">
                                                        North Macedonia
                                                    </option>
                                                    <option value="xy" data-prefix="">
                                                        Northern Cyprus
                                                    </option>
                                                    <option value="mp" data-prefix="">
                                                        Northern Mariana Islands
                                                    </option>
                                                    <option value="no" data-prefix="">
                                                        Norway
                                                    </option>
                                                    <option value="om" data-prefix="">
                                                        Oman
                                                    </option>
                                                    <option value="pk" data-prefix="">
                                                        Pakistan
                                                    </option>
                                                    <option value="pw" data-prefix="">
                                                        Palau
                                                    </option>
                                                    <option value="ps" data-prefix="">
                                                        Palestinian Territory
                                                    </option>
                                                    <option value="pa" data-prefix="">
                                                        Panama
                                                    </option>
                                                    <option value="pg" data-prefix="">
                                                        Papua New Guinea
                                                    </option>
                                                    <option value="py" data-prefix="">
                                                        Paraguay
                                                    </option>
                                                    <option value="pe" data-prefix="">
                                                        Peru
                                                    </option>
                                                    <option value="ph" data-prefix="">
                                                        Philippines
                                                    </option>
                                                    <option value="pn" data-prefix="">
                                                        Pitcairn
                                                    </option>
                                                    <option value="pl" data-prefix="">
                                                        Poland
                                                    </option>
                                                    <option value="pt" data-prefix="">
                                                        Portugal
                                                    </option>
                                                    <option value="pr" data-prefix="">
                                                        Puerto Rico
                                                    </option>
                                                    <option value="qa" data-prefix="">
                                                        Qatar
                                                    </option>
                                                    <option value="re" data-prefix="">
                                                        Reunion
                                                    </option>
                                                    <option value="ro" data-prefix="">
                                                        Romania
                                                    </option>
                                                    <option value="ru" data-prefix="">
                                                        Russia
                                                    </option>
                                                    <option value="rw" data-prefix="">
                                                        Rwanda
                                                    </option>
                                                    <option value="bl" data-prefix="">
                                                        Saint Barthelemy
                                                    </option>
                                                    <option value="kn" data-prefix="">
                                                        Saint Kitts and Nevis
                                                    </option>
                                                    <option value="lc" data-prefix="">
                                                        Saint Lucia
                                                    </option>
                                                    <option value="mf" data-prefix="">
                                                        Saint Martin
                                                    </option>
                                                    <option value="vc" data-prefix="">
                                                        Saint Vincent &amp; Grenadines
                                                    </option>
                                                    <option value="ws" data-prefix="">
                                                        Samoa
                                                    </option>
                                                    <option value="sm" data-prefix="">
                                                        San Marino
                                                    </option>
                                                    <option value="sa" data-prefix="">
                                                        Saudi Arabia
                                                    </option>
                                                    <option value="sn" data-prefix="">
                                                        Senegal
                                                    </option>
                                                    <option value="rs" data-prefix="">
                                                        Serbia
                                                    </option>
                                                    <option value="sc" data-prefix="">
                                                        Seychelles
                                                    </option>
                                                    <option value="sl" data-prefix="">
                                                        Sierra Leone
                                                    </option>
                                                    <option value="sg" data-prefix="">
                                                        Singapore
                                                    </option>
                                                    <option value="sx" data-prefix="">
                                                        Sint Maarten
                                                    </option>
                                                    <option value="sk" data-prefix="">
                                                        Slovakia
                                                    </option>
                                                    <option value="si" data-prefix="">
                                                        Slovenia
                                                    </option>
                                                    <option value="sb" data-prefix="">
                                                        Solomon Islands
                                                    </option>
                                                    <option value="so" data-prefix="">
                                                        Somalia
                                                    </option>
                                                    <option value="za" data-prefix="">
                                                        South Africa
                                                    </option>
                                                    <option value="gs" data-prefix="">
                                                        South Georgia and the South Sandwi&amp;hellip;
                                                    </option>
                                                    <option value="kr" data-prefix="">
                                                        South Korea
                                                    </option>
                                                    <option value="ss" data-prefix="">
                                                        South Sudan
                                                    </option>
                                                    <option value="es" data-prefix="">
                                                        Spain
                                                    </option>
                                                    <option value="lk" data-prefix="">
                                                        Sri Lanka
                                                    </option>
                                                    <option value="sh" data-prefix="">
                                                        St Helena
                                                    </option>
                                                    <option value="pm" data-prefix="">
                                                        St Pierre and Miquelon
                                                    </option>
                                                    <option value="sd" data-prefix="">
                                                        Sudan
                                                    </option>
                                                    <option value="sr" data-prefix="">
                                                        Suriname
                                                    </option>
                                                    <option value="sj" data-prefix="">
                                                        Svalbard &amp; Jan Mayen
                                                    </option>
                                                    <option value="sz" data-prefix="">
                                                        Swaziland
                                                    </option>
                                                    <option value="se" data-prefix="">
                                                        Sweden
                                                    </option>
                                                    <option value="ch" data-prefix="">
                                                        Switzerland
                                                    </option>
                                                    <option value="sy" data-prefix="">
                                                        Syria
                                                    </option>
                                                    <option value="st" data-prefix="">
                                                        São Tomé and Príncipe
                                                    </option>
                                                    <option value="tw" data-prefix="">
                                                        Taiwan
                                                    </option>
                                                    <option value="tj" data-prefix="">
                                                        Tajikistan
                                                    </option>
                                                    <option value="tz" data-prefix="">
                                                        Tanzania
                                                    </option>
                                                    <option value="th" data-prefix="">
                                                        Thailand
                                                    </option>
                                                    <option value="tg" data-prefix="">
                                                        Togo
                                                    </option>
                                                    <option value="tk" data-prefix="">
                                                        Tokelau
                                                    </option>
                                                    <option value="to" data-prefix="">
                                                        Tonga
                                                    </option>
                                                    <option value="tt" data-prefix="">
                                                        Trinidad and Tobago
                                                    </option>
                                                    <option value="tn" data-prefix="">
                                                        Tunisia
                                                    </option>
                                                    <option value="tr" data-prefix="">
                                                        Turkey
                                                    </option>
                                                    <option value="tm" data-prefix="">
                                                        Turkmenistan
                                                    </option>
                                                    <option value="tc" data-prefix="">
                                                        Turks &amp; Caicos Islands
                                                    </option>
                                                    <option value="tv" data-prefix="">
                                                        Tuvalu
                                                    </option>
                                                    <option value="vg" data-prefix="">
                                                        UK Virgin Islands
                                                    </option>
                                                    <option value="vi" data-prefix="">
                                                        US Virgin Islands
                                                    </option>
                                                    <option value="ug" data-prefix="">
                                                        Uganda
                                                    </option>
                                                    <option value="ua" data-prefix="">
                                                        Ukraine
                                                    </option>
                                                    <option value="ae" data-prefix="">
                                                        United Arab Emirates
                                                    </option>
                                                    <option value="gb" data-prefix="">
                                                        United Kingdom
                                                    </option>
                                                    <option value="us" data-prefix="">
                                                        United States
                                                    </option>
                                                    <option value="um" data-prefix="">
                                                        United States Minor Outlying Islan&amp;hellip;
                                                    </option>
                                                    <option value="uy" data-prefix="">
                                                        Uruguay
                                                    </option>
                                                    <option value="uz" data-prefix="">
                                                        Uzbekistan
                                                    </option>
                                                    <option value="vu" data-prefix="">
                                                        Vanuatu
                                                    </option>
                                                    <option value="va" data-prefix="">
                                                        Vatican City
                                                    </option>
                                                    <option value="ve" data-prefix="">
                                                        Venezuela
                                                    </option>
                                                    <option value="vn" data-prefix="" selected="selected">
                                                        Vietnam
                                                    </option>
                                                    <option value="wf" data-prefix="">
                                                        Wallis and Futuna
                                                    </option>
                                                    <option value="ye" data-prefix="">
                                                        Yemen
                                                    </option>
                                                    <option value="zm" data-prefix="">
                                                        Zambia
                                                    </option>
                                                    <option value="zw" data-prefix="">
                                                        Zimbabwe
                                                    </option>
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-sm-12 col-md-6">
                                            <div class="form-group">
                                                <label class="col-form-label" for="phone_number">Phone <span class="text-danger">*</span></label>
                                                <input class="form-control" type="text" name="PhoneNumber" id="phone_number" required pattern="[0-9]{10}"
                                                       title="phone number must be 10-digit number"
                                                       value="${Customer.getPhoneNumber()}">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <c:forEach items="${listRoom}" var="listR">
                                <div class="card" style="background: #ebf3ff;">
                                    <div class="card-body">
                                        <input type="text" name="RoomID" value="${listR.getRoomID()}">
                                        <input type="text" name="RoomName" value="${listR.getRoomName()}">
                                        <h4>${listR.getName()}</h4>
                                        <svg class="bk-icon -streamline-checkmark_selected" fill="#008009" height="16" role="presentation" width="16" viewBox="0 0 128 128" aria-hidden="true" focusable="false"><path d="M56.62 93.54a4 4 0 0 1-2.83-1.18L28.4 67a4 4 0 1 1 5.65-5.65l22.13 22.1 33-44a4 4 0 1 1 6.4 4.8L59.82 91.94a4.06 4.06 0 0 1-2.92 1.59zM128 64c0-35.346-28.654-64-64-64C28.654 0 0 28.654 0 64c0 35.346 28.654 64 64 64 35.33-.039 63.961-28.67 64-64zm-8 0c0 30.928-25.072 56-56 56S8 94.928 8 64 33.072 8 64 8c30.914.033 55.967 25.086 56 56z"></path></svg>
                                        <strong style="color: green;">Free cancellation</strong> <small style="color: green;">until 18:00 on ${checkOutDate.split(" ")[0]}</small>
                                        <div class="div-section">
                                            <svg class="bk-icon -streamline-no_smoking" fill="#333333" height="16" width="16" viewBox="0 0 24 24" role="presentation" aria-hidden="true" focusable="false"><path d="M19.5 9h2.25a.75.75 0 0 1 .75.75v3a.75.75 0 0 1-.75.75h-7.5a.75.75 0 0 0 0 1.5h7.5A2.25 2.25 0 0 0 24 12.75v-3a2.25 2.25 0 0 0-2.25-2.25H19.5a.75.75 0 0 0 0 1.5zM5.25 13.5h-1.5l.75.75v-6L3.75 9h7.5a.75.75 0 0 0 0-1.5h-7.5a.75.75 0 0 0-.75.75v6c0 .414.336.75.75.75h1.5a.75.75 0 0 0 0-1.5zM15 12v2.25a.75.75 0 0 0 1.5 0V12a.75.75 0 0 0-1.5 0zM0 8.25v6a.75.75 0 0 0 1.5 0v-6a.75.75 0 0 0-1.5 0zm1.28 15.53l22.5-22.5A.75.75 0 0 0 22.72.22L.22 22.72a.75.75 0 1 0 1.06 1.06zM4.5.75A2.25 2.25 0 0 1 2.25 3 2.25 2.25 0 0 0 0 5.25a.75.75 0 0 0 1.5 0 .75.75 0 0 1 .75-.75A3.75 3.75 0 0 0 6 .75a.75.75 0 0 0-1.5 0z"></path></svg>
                                            No smoking
                                        </div>
                                        <hr>
                                        <div class="div-section">
                                            <strong>Max persons: </strong>
                                            <c:forEach var="i" begin="1" end="${listR.getAdult()}">
                                                <svg class="bk-icon -streamline-person_half" height="16" width="16" viewBox="0 0 24 24" role="presentation" aria-hidden="true" focusable="false"><path d="M16.5 6a4.5 4.5 0 1 1-9 0 4.5 4.5 0 0 1 9 0zM18 6A6 6 0 1 0 6 6a6 6 0 0 0 12 0zM3 23.25a9 9 0 1 1 18 0 .75.75 0 0 0 1.5 0c0-5.799-4.701-10.5-10.5-10.5S1.5 17.451 1.5 23.25a.75.75 0 0 0 1.5 0z"></path></svg>
                                            </c:forEach>
                                            +
                                            <c:forEach var="i" begin="1" end="${listR.getChildren()}">
                                                <svg class="bk-icon -streamline-person_child" height="16" width="16" viewBox="0 0 128 128" role="presentation" aria-hidden="true" focusable="false"><path d="M104.5 127.8a4 4 0 0 1-4-4c0-20.158-16.342-36.5-36.5-36.5s-36.5 16.342-36.5 36.5a4 4 0 0 1-8 0c0-24.577 19.923-44.5 44.5-44.5s44.5 19.923 44.5 44.5a4 4 0 0 1-4 4zM64 77.67c-14.326.072-25.998-11.484-26.07-25.81-.072-14.326 11.484-25.998 25.81-26.07 14.326-.071 25.998 11.484 26.07 25.81v.13C89.827 66.012 78.282 77.615 64 77.67zm0-43.87c-9.908-.072-17.998 7.902-18.07 17.81-.071 9.907 7.902 17.997 17.81 18.07 9.908.07 17.998-7.903 18.07-17.81v-.14c.022-9.865-7.945-17.886-17.81-17.93z"></path></svg>
                                            </c:forEach>
                                        </div>
                                        <!--                                        <div class="row div-section">
                                                                                    <div class="col-sm-12 col-md-6 col-lg-6">
                                                                                        <div class="form-group">
                                                                                            <label class="col-form-label" for="full_name">Full guest name <span class="text-danger">*</span></label>
                                                                                            <input class="form-control" type="text" name="full_name" id="full_name" required pattern="[A-Za-zàáãạảăắằẳẵặâấầẩẫậèéẹẻẽêềếểễệđìíĩỉịòóõọỏôốồổỗộơớờởỡợùúũụủưứừửữựỳỵỷỹýÀÁÃẠẢĂẮẰẲẴẶÂẤẦẨẪẬÈÉẸẺẼÊỀẾỂỄỆĐÌÍĨỈỊÒÓÕỌỎÔỐỒỔỖỘƠỚỜỞỠỢÙÚŨỤỦƯỨỪỬỮỰỲỴỶỸÝ ]{1,12}"
                                                                                                   title="Full name not contain: 
                                                                                                   Special character e.g: !@#$%^&,. etc.., spacing and numeric characters (0-9);  
                                                                                                   allow uppercase and lowercase letters, max length: 12"
                                                                                                   value="${Customer.getLastName()} ${Customer.getFirstName()}">
                                                                                        </div>
                                                                                    </div>
                                                                                </div>-->
                                        <hr>
                                    </div>
                                </div>
                            </c:forEach>
                            <div class="card" style="background: #ebf3ff;">
                                <div class="card-body">
                                    <h4 style="margin-bottom: 15px">Special Requests</h4>
                                    <div style="margin-bottom: 15px">
                                        Special requests cannot be guaranteed – but the property will do its best to meet your needs. You can always make a special request after your booking is complete!
                                    </div>
                                    <strong>Please write your requests in English or Vietnamese.</strong><small> (optional)</small>
                                    <div>
                                        <textarea name="Remarks" id="Remarks" style="height: 100px; width: 100%;"></textarea>    
                                    </div>
                                </div>
                            </div>
                            <div class="card" style="background: #ebf3ff;">
                                <div class="card-body">
                                    <h4 style="margin-bottom: 15px">Your arrival time</h4>
                                    <div style="margin-bottom: 15px">
                                        <svg class="bk-icon -streamline-checkmark_selected" fill="#008009" height="24" width="24" viewBox="0 0 128 128" role="presentation" aria-hidden="true" focusable="false"><path d="M56.62 93.54a4 4 0 0 1-2.83-1.18L28.4 67a4 4 0 1 1 5.65-5.65l22.13 22.1 33-44a4 4 0 1 1 6.4 4.8L59.82 91.94a4.06 4.06 0 0 1-2.92 1.59zM128 64c0-35.346-28.654-64-64-64C28.654 0 0 28.654 0 64c0 35.346 28.654 64 64 64 35.33-.039 63.961-28.67 64-64zm-8 0c0 30.928-25.072 56-56 56S8 94.928 8 64 33.072 8 64 8c30.914.033 55.967 25.086 56 56z"></path></svg>
                                        <span style="margin-left: 10px;">Your rooms will be ready for check-in between 14:00 and 00:00</span>
                                    </div>
                                    <div>
                                        <svg class="bk-icon -streamline-front_desk" fill="#008009" height="24" width="24" viewBox="0 0 24 24" role="presentation" aria-hidden="true" focusable="false"><path d="M14.244 14.156a6.75 6.75 0 0 0-6.75-5.906A6.747 6.747 0 0 0 .73 14.397a.75.75 0 0 0 1.494.134 5.25 5.25 0 0 1 5.27-4.781 5.253 5.253 0 0 1 5.262 4.594.75.75 0 1 0 1.488-.188zM10.125 4.125a2.625 2.625 0 1 1-5.25 0V1.5h5.25v2.625zm1.5 0V1.5a1.5 1.5 0 0 0-1.5-1.5h-5.25a1.5 1.5 0 0 0-1.5 1.5v2.625a4.125 4.125 0 0 0 8.25 0zM23.25 22.5H.75l.75.75v-7.5a.75.75 0 0 1 .75-.75h19.5a.75.75 0 0 1 .75.75v7.5l.75-.75zm0 1.5a.75.75 0 0 0 .75-.75v-7.5a2.25 2.25 0 0 0-2.25-2.25H2.25A2.25 2.25 0 0 0 0 15.75v7.5c0 .414.336.75.75.75h22.5zM4.376 5.017a9.42 9.42 0 0 1 3.12-.517 9.428 9.428 0 0 1 3.133.519.75.75 0 0 0 .49-1.418A10.917 10.917 0 0 0 7.498 3a10.91 10.91 0 0 0-3.611.6.75.75 0 0 0 .49 1.417zM15.75 14.27a3.001 3.001 0 0 1 6 .16.75.75 0 1 0 1.5.04 4.501 4.501 0 1 0-9-.24.75.75 0 1 0 1.5.04zm3.75-3.77V8.25a.75.75 0 0 0-1.5 0v2.25a.75.75 0 0 0 1.5 0zM17.25 9h3a.75.75 0 0 0 0-1.5h-3a.75.75 0 0 0 0 1.5z"></path></svg>
                                        <span style="margin-left: 10px;">24-hour front desk – Help whenever you need it!</span>
                                    </div>
                                </div>
                            </div>
                            <div style="text-align: right; font-weight: 500; margin-bottom: 10px;">
                                Pressing the button on the right will finish your booking details: 
                            </div>
                            <div style="text-align: right; margin-bottom: 3rem;">
                                <a class="btn btn-light" data-toggle="modal" data-target="#check-booking" style="padding-left: 20px; padding-right: 20px; border-right: 0px;
                                   padding-top: 12px; padding-bottom: 12px; margin-right: 10px;">
                                    <span>
                                        Check your booking
                                    </span>
                                </a>
                                <button class="btn btn-primary" style="padding-left: 20px; padding-right: 20px; border-right: 0px;
                                        padding-top: 12px; padding-bottom: 12px;">
                                    <span style="color: white;">
                                        <svg style="fill: white; margin-right: 3px;" class="bk-icon -streamline-lock_closed" height="24" role="presentation" width="24" viewBox="0 0 24 24" aria-hidden="true" focusable="false"><path d="M19.5 16.5v5.25a.75.75 0 0 1-.75.75H5.25a.75.75 0 0 1-.75-.75v-10.5a.75.75 0 0 1 .75-.75h13.5a.75.75 0 0 1 .75.75v5.25zm1.5 0v-5.25A2.25 2.25 0 0 0 18.75 9H5.25A2.25 2.25 0 0 0 3 11.25v10.5A2.25 2.25 0 0 0 5.25 24h13.5A2.25 2.25 0 0 0 21 21.75V16.5zM7.5 9.75V6a4.5 4.5 0 0 1 9 0v3.75a.75.75 0 0 0 1.5 0V6A6 6 0 0 0 6 6v3.75a.75.75 0 0 0 1.5 0zM12 15a1.125 1.125 0 1 0 .004 0h-.006a.75.75 0 0 0 .004 1.5H12a.375.375 0 1 1 0-.75.375.375 0 0 1 0 .75.75.75 0 0 0 0-1.5z"></path></svg>
                                    </span>
                                    <span>
                                        Complete booking
                                    </span>
                                </button>
                            </div>
                        </form>

                        <!-- Check Booking Modal -->
                        <div id="check-booking" class="modal custom-modal fade" role="dialog">
                            <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title">Your booking details</h5>
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                            <span aria-hidden="true">&times;</span>
                                        </button>
                                    </div>
                                    <div class="modal-body">
                                        <div class="details" style="margin-top: 1rem;">Total length of stay:</div>
                                        <c:if test="${dateDiff==1}">
                                            <div class="important-details">${dateDiff} night</div>
                                        </c:if>
                                        <c:if test="${dateDiff!=1}">
                                            <div class="important-details">${dateDiff} night</div>
                                        </c:if>
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

                        <!-- Confirm Logout Modal -->
                        <div id="confirm-logout" class="modal custom-modal fade" role="dialog">
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
                                                <h4>Sign out</h4>
                                            </div>
                                            <hr>
                                            <p>Are you sure want to sign out?</p>
                                        </div>
                                        <form action="booking" method="post">
                                            <input type="hidden" name="do" value="logout">
                                            <c:forEach begin="1" end="${fn:length(roomTypeID)}" var="i">
                                                <input type="hidden" id="roomTypeID1${i}" name="roomTypeID" value="">
                                            </c:forEach>
                                            <c:forEach begin="1" end="${fn:length(amount)}" var="i">
                                                <input type="hidden" id="amount1${i}" name="amount" value="">
                                            </c:forEach>
                                            <input type="hidden" name="totalPrice" value="">
                                            <input type="hidden" name="dateDiff" value="">
                                            <input type="hidden" name="checkInDate" value="">
                                            <input type="hidden" name="checkOutDate" value="">
                                            <div class="submit-section" style="display: flex; justify-content: space-around;">
                                                <input type="submit" class="btn btn-primary" value="Yes">
                                                <a href="#" class="btn btn-light" style="padding: 10px 35px;" data-dismiss="modal">Cancel</a>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- /Confirm Logout Modal -->
                    </div>
                </div>
            </div>
        </div>

        <style type="text/css">
            body{
                /*background: #f7f7ff;*/
                margin-top: 20px;
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

        <script type="text/javascript">

        </script>
    </body>
</html>
