<%-- 
    Document   : booking
    Created on : Sep 23, 2022, 5:30:28 PM
    Author     : DELL
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        </script>
    </head>
    <body>
        <jsp:include page="page-header.jsp"></jsp:include>
            <div class="container" style="margin-top: 2rem">
                <div class="main-body">
                    <ul class="progressbar">
                        <li class="complete"><strong>Your selection</strong></li>
                        <li class="active"><strong>Your details</strong></li>
                        <li class="">Final step</li>
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
                                            <span class="important-details">Tue, 27/09/2022</span>
                                            <div class="text-secondary">14:00 – 00:00</div>
                                        </div>
                                        <div class="col-lg-6 col-sm-6 col-md-6">
                                            <div class="details">CheckOut</div>
                                            <span class="important-details">Wed, 28/09/2022</span>
                                            <div class="text-secondary">01:00 – 12:00</div>
                                        </div>
                                    </div>
                                    <div class="details" style="margin-top: 1rem;">Total length of stay:</div>
                                    <div class="important-details">1 night</div>
                                    <hr>
                                    <div class="details">You selected:</div>
                                    <div class="text-secondary">x1 Standard Room</div>
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
                                            <h6 style="margin-bottom: 0px;">VND 100,000</h6>
                                        </div>
                                    </div>
                                    <div class="text-secondary" style="font-size: small;">
                                        (for 1 nights & all guests)
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
                                            Free cancellation until 17:59 on 27 Sept
                                        </li>
                                        <li>
                                            From 18:00 on 27 Sept: &nbsp;&nbsp;&nbsp;
                                            <strong>VND 50,000</strong>
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
                            <form class="col-sm-12" id="customerDetailForm" action="customer">
                                <input type="hidden" name="do" value="finishReserve">
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
                                                       value="${Customer.getEmail()}">
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
                            <div class="card" style="background: #ebf3ff;">
                                <div class="card-body">
                                    <h4>Standard Room</h4>
                                    <svg class="bk-icon -streamline-checkmark_selected" fill="#008009" height="16" role="presentation" width="16" viewBox="0 0 128 128" aria-hidden="true" focusable="false"><path d="M56.62 93.54a4 4 0 0 1-2.83-1.18L28.4 67a4 4 0 1 1 5.65-5.65l22.13 22.1 33-44a4 4 0 1 1 6.4 4.8L59.82 91.94a4.06 4.06 0 0 1-2.92 1.59zM128 64c0-35.346-28.654-64-64-64C28.654 0 0 28.654 0 64c0 35.346 28.654 64 64 64 35.33-.039 63.961-28.67 64-64zm-8 0c0 30.928-25.072 56-56 56S8 94.928 8 64 33.072 8 64 8c30.914.033 55.967 25.086 56 56z"></path></svg>
                                    <strong style="color: green;">Free cancellation</strong> <small style="color: green;">until 18:00 on 27 September 2022</small>
                                    <div class="div-section">
                                        <svg class="bk-icon -streamline-no_smoking" fill="#333333" height="16" width="16" viewBox="0 0 24 24" role="presentation" aria-hidden="true" focusable="false"><path d="M19.5 9h2.25a.75.75 0 0 1 .75.75v3a.75.75 0 0 1-.75.75h-7.5a.75.75 0 0 0 0 1.5h7.5A2.25 2.25 0 0 0 24 12.75v-3a2.25 2.25 0 0 0-2.25-2.25H19.5a.75.75 0 0 0 0 1.5zM5.25 13.5h-1.5l.75.75v-6L3.75 9h7.5a.75.75 0 0 0 0-1.5h-7.5a.75.75 0 0 0-.75.75v6c0 .414.336.75.75.75h1.5a.75.75 0 0 0 0-1.5zM15 12v2.25a.75.75 0 0 0 1.5 0V12a.75.75 0 0 0-1.5 0zM0 8.25v6a.75.75 0 0 0 1.5 0v-6a.75.75 0 0 0-1.5 0zm1.28 15.53l22.5-22.5A.75.75 0 0 0 22.72.22L.22 22.72a.75.75 0 1 0 1.06 1.06zM4.5.75A2.25 2.25 0 0 1 2.25 3 2.25 2.25 0 0 0 0 5.25a.75.75 0 0 0 1.5 0 .75.75 0 0 1 .75-.75A3.75 3.75 0 0 0 6 .75a.75.75 0 0 0-1.5 0z"></path></svg>
                                        No smoking
                                    </div>
                                    <div class="div-section">
                                        <strong>Max persons: </strong>
                                        <c:forEach var="i" begin="1" end="2">
                                            <svg class="bk-icon -streamline-person_half" height="16" width="16" viewBox="0 0 24 24" role="presentation" aria-hidden="true" focusable="false"><path d="M16.5 6a4.5 4.5 0 1 1-9 0 4.5 4.5 0 0 1 9 0zM18 6A6 6 0 1 0 6 6a6 6 0 0 0 12 0zM3 23.25a9 9 0 1 1 18 0 .75.75 0 0 0 1.5 0c0-5.799-4.701-10.5-10.5-10.5S1.5 17.451 1.5 23.25a.75.75 0 0 0 1.5 0z"></path></svg>
                                        </c:forEach>
                                        +
                                        <c:forEach var="i" begin="1" end="2">
                                            <svg class="bk-icon -streamline-person_child" height="16" width="16" viewBox="0 0 128 128" role="presentation" aria-hidden="true" focusable="false"><path d="M104.5 127.8a4 4 0 0 1-4-4c0-20.158-16.342-36.5-36.5-36.5s-36.5 16.342-36.5 36.5a4 4 0 0 1-8 0c0-24.577 19.923-44.5 44.5-44.5s44.5 19.923 44.5 44.5a4 4 0 0 1-4 4zM64 77.67c-14.326.072-25.998-11.484-26.07-25.81-.072-14.326 11.484-25.998 25.81-26.07 14.326-.071 25.998 11.484 26.07 25.81v.13C89.827 66.012 78.282 77.615 64 77.67zm0-43.87c-9.908-.072-17.998 7.902-18.07 17.81-.071 9.907 7.902 17.997 17.81 18.07 9.908.07 17.998-7.903 18.07-17.81v-.14c.022-9.865-7.945-17.886-17.81-17.93z"></path></svg>
                                        </c:forEach>
                                    </div>
                                    <div class="row div-section">
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
                                    </div>
                                    <hr>
                                </div>
                            </div>
                            <div class="card" style="background: #ebf3ff;">
                                <div class="card-body">
                                    <h4 style="margin-bottom: 15px">Special Requests</h4>
                                    <div style="margin-bottom: 15px">
                                        Special requests cannot be guaranteed – but the property will do its best to meet your needs. You can always make a special request after your booking is complete!
                                    </div>
                                    <strong>Please write your requests in English or Vietnamese.</strong><small> (optional)</small>
                                    <div>
                                        <textarea name="remarks" id="remarks" style="height: 100px; width: 100%;"></textarea>    
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
                            <div style="text-align: right; margin-bottom: 3rem;">
                                <button class="btn btn-primary" style="padding-left: 3rem; padding-right: 3rem; border-right: 0px;
                                        padding-top: 12px; padding-bottom: 12px;">Final details ></button>
                            </div>
                        </form>
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

        </style>

        <script type="text/javascript">

        </script>
    </body>
</html>
