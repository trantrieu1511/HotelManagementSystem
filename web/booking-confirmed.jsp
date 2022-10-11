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
        <title>Booking Info Page</title>
        <!--  This file has been downloaded from bootdey.com @bootdey on twitter -->
        <!--  All snippets are MIT license http://bootdey.com/license -->
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/js/bootstrap.bundle.min.js"></script>
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
            /*            .col-lg-8{
                            padding-right: 0px;
                        }
                        .col-lg-4{
                            padding-left: 0px;
                        }*/
            /*            .card{
                            border-radius: 0px;
                        }*/
        </style>
        <script type="text/javascript">

        </script>
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
                                <div style="margin-bottom: 15px">
                                    <%--<c:if test="${Date().getTime()>0}">--%>
                                    <!--ok?-->
                                    <%--</c:if>--%>
                                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24"><path d="M0 11.386l1.17-1.206c1.951.522 5.313 1.731 8.33 3.597 3.175-4.177 9.582-9.398 13.456-11.777l1.044 1.073-14 18.927-10-10.614z"/></svg>
                                    <!--<svg class="bk-icon -streamline-checkmark_selected" fill="#008009" height="18" role="presentation" width="18" viewBox="0 0 128 128" aria-hidden="true" focusable="false"><path d="M56.62 93.54a4 4 0 0 1-2.83-1.18L28.4 67a4 4 0 1 1 5.65-5.65l22.13 22.1 33-44a4 4 0 1 1 6.4 4.8L59.82 91.94a4.06 4.06 0 0 1-2.92 1.59zM128 64c0-35.346-28.654-64-64-64C28.654 0 0 28.654 0 64c0 35.346 28.654 64 64 64 35.33-.039 63.961-28.67 64-64zm-8 0c0 30.928-25.072 56-56 56S8 94.928 8 64 33.072 8 64 8c30.914.033 55.967 25.086 56 56z"></path></svg>-->
                                    <span style="margin-left: 10px;">You can now modify or cancel your booking until check-in</span>
                                </div>
                                <div>
                                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24"><path d="M0 11.386l1.17-1.206c1.951.522 5.313 1.731 8.33 3.597 3.175-4.177 9.582-9.398 13.456-11.777l1.044 1.073-14 18.927-10-10.614z"/></svg>
                                    <!--<svg class="bk-icon -streamline-checkmark_selected" fill="#008009" height="18" role="presentation" width="18" viewBox="0 0 128 128" aria-hidden="true" focusable="false"><path d="M56.62 93.54a4 4 0 0 1-2.83-1.18L28.4 67a4 4 0 1 1 5.65-5.65l22.13 22.1 33-44a4 4 0 1 1 6.4 4.8L59.82 91.94a4.06 4.06 0 0 1-2.92 1.59zM128 64c0-35.346-28.654-64-64-64C28.654 0 0 28.654 0 64c0 35.346 28.654 64 64 64 35.33-.039 63.961-28.67 64-64zm-8 0c0 30.928-25.072 56-56 56S8 94.928 8 64 33.072 8 64 8c30.914.033 55.967 25.086 56 56z"></path></svg>-->
                                    <span style="margin-left: 10px;">Your <strong>payment</strong> will be handled by our Hotel. The '<strong>Price</strong>' section below has more details</span>
                                </div>
                            </div>
                            <div class="col-lg-4">
                                <div style="margin-bottom: 15px">
                                    <button class="btn btn-primary" style="width: 100%; margin-top: 1rem;">
                                        Print confirmation
                                    </button>
                                </div>
                                <div>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div>
                    <h4 style="margin-bottom: 15px">Check your details</h4>
                </div>
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
                                        1 night, 1 room
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-sm-4">
                                        <h6>You book for</h6>
                                    </div>
                                    <div class="col-sm-8 text-secondary">
                                        2 adults
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-sm-4">
                                        <h6>Check-in</h6>
                                    </div>
                                    <div class="col-sm-8 text-secondary">
                                        11/10/2022
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-sm-4">
                                        <h6>Check-out</h6>
                                    </div>
                                    <div class="col-sm-8 text-secondary">
                                        12/10/2022
                                    </div>
                                </div>
                                <div class="card" style="border: 1px solid #ebf3ff; box-shadow: none; background: aliceblue">
                                    <div class="card-body">
                                        <div>
                                            <strong>
                                                Price
                                            </strong>
                                            <div>
                                                Booking.com does not charge quests any reservation, administration or other fees
                                                Your card issuer may change you a foreign transaction fee.
                                            </div>
                                        </div>
                                        <hr>
                                        <div>
                                            <strong>
                                                The final price shown is the amount you will pay to the property.
                                            </strong>
                                            <div>
                                                Booking.com does not charge quests any reservation, administration or other fees
                                                Your card issuer may change you a foreign transaction fee.
                                            </div>
                                        </div>
                                        <hr>
                                        <div>
                                            <strong>
                                                The final price shown is the amount you will pay to the property.
                                            </strong>
                                            <div>
                                                Booking.com does not charge quests any reservation, administration or other fees
                                                Your card issuer may change you a foreign transaction fee.
                                            </div>
                                        </div>
                                        <hr>
                                        <div>
                                            <strong>
                                                The final price shown is the amount you will pay to the property.
                                            </strong>
                                            <div>
                                                Booking.com does not charge quests any reservation, administration or other fees
                                                Your card issuer may change you a foreign transaction fee.
                                            </div>
                                        </div>
                                        <hr>
                                        <div>
                                            <strong>
                                                The final price shown is the amount you will pay to the property.
                                            </strong>
                                            <div>
                                                Booking.com does not charge quests any reservation, administration or other fees
                                                Your card issuer may change you a foreign transaction fee.
                                            </div>
                                        </div>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3" style="padding-left: 3px;">
                        <div class="card" style="background: transparent; border: 1px solid white; border-radius: 0px;">
                            <div class="card-body">
                                <h6 style="margin-bottom: 5px;">Is everything correct?</h6>
                                <small>
                                    You can always view or change your booking online - no registration required.
                                </small>
                                <div style="margin-top: 1rem;">
                                    <strong>
                                        <a href="#" style="text-decoration: underline;">
                                            <svg clip-rule="evenodd" fill-rule="evenodd" stroke-linejoin="round" stroke-miterlimit="2" viewBox="0 0 24 24" width="24" height="24" xmlns="http://www.w3.org/2000/svg"><path d="m12.002 2.005c5.518 0 9.998 4.48 9.998 9.997 0 5.518-4.48 9.998-9.998 9.998-5.517 0-9.997-4.48-9.997-9.998 0-5.517 4.48-9.997 9.997-9.997zm0 8.933-2.721-2.722c-.146-.146-.339-.219-.531-.219-.404 0-.75.324-.75.749 0 .193.073.384.219.531l2.722 2.722-2.728 2.728c-.147.147-.22.34-.22.531 0 .427.35.75.751.75.192 0 .384-.073.53-.219l2.728-2.728 2.729 2.728c.146.146.338.219.53.219.401 0 .75-.323.75-.75 0-.191-.073-.384-.22-.531l-2.727-2.728 2.717-2.717c.146-.147.219-.338.219-.531 0-.425-.346-.75-.75-.75-.192 0-.385.073-.531.22z" fill-rule="nonzero"/></svg>
                                            Cancel your booking
                                        </a>
                                    </strong>
                                </div>
                                <div style="margin-top: 2rem;">
                                    <button class="btn btn-primary" style="width: 100%;">View booking</button>
                                </div>
                                <small>
                                    Tip: You can make changes to this booking at anytime
                                </small>
                            </div>
                        </div>
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
    </body>
</html>
