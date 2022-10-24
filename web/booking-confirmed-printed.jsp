<%-- 
    Document   : booking-confirmed-printed
    Created on : Oct 12, 2022, 4:41:24 PM
    Author     : DELL
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Booking Detail Page</title>
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
                font-size: x-small;
            }
            h6, h5, h4, h3{
                font-weight: bold;
                margin-bottom: 1rem;
            }
            .left{
                border-right: 1px solid gainsboro;
                border-left: 0.5mm solid #cecece;
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
            .main-content{
                border: 2px solid black;
                background: whitesmoke;
            }
            .sub-content{
                border: 2px solid black;
                border-top: 1px solid transparent;
                background: white;
            }
            hr{
                margin-top: 5px;
                margin-bottom: 5px;
            }
            .content-body{
                margin: 10px;
            }
        </style>

    </head>
    <body>
        <jsp:include page="page-header.jsp"></jsp:include>
            <div class="container" style="margin-top: 2rem">
                <div class="main-body">
                    <div class="main-content">
                        <div class="content-body">
                            <div class="row">
                                <div class="col-lg-6 col-sm-6 col-md-6">
                                    <div>
                                        <h6>MyHotel</h6>
                                    </div>
                                    <div>
                                        <strong>Address:</strong> MyHotel address
                                    </div>
                                    <div>
                                        <strong>Phone:</strong> +84868342491
                                    </div>
                                </div>
                                <div class="col-lg-4 col-sm-4 col-md-4">
                                    <div class="row">
                                        <div class="col-lg-6 col-sm-6 col-md-6 left">
                                            <div class="least-important-details">CHECKIN</div>
                                            <span class="important-details">${checkInDate}</span>
                                        <div class="text-secondary">14:00 – 00:00</div>
                                    </div>
                                    <div class="col-lg-6 col-sm-6 col-md-6">
                                        <div class="least-important-details">CHECKOUT</div>
                                        <span class="important-details">${checkOutDate.split(" ")[0]}</span>
                                        <div class="text-secondary">01:00 – 12:00</div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-2 col-sm-2 col-md-2">
                                <div class="row">
                                    <div class="col-lg-6 col-sm-6 col-md-6 left">
                                        <div class="least-important-details">UNITS</div>
                                        <div class="important-details">1</div>
                                    </div>
                                    <div class="col-lg-6 col-sm-6 col-md-6">
                                        <div class="least-important-details">NIGHTS</div>
                                        <div class="important-details">1</div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <hr>
                        <div>
                            <h4 style="margin-bottom: 0px;">Price</h4>
                        </div>
                        <div style="display: flex; justify-content: space-between;">
                            <div>
                                <div style="margin-bottom: 15px; font-size: x-large;">Price</div>
                            </div>
                            <div>
                                <div style="margin-bottom: 0px; font-size: x-large;">VND ${totalPrice}</div>
                            </div>
                        </div>
                        <div class="important-details">
                            The final price shown is the amount you will pay to the property.
                        </div>
                        <div class="least-important-details">
                            Our website does not charge guests any reservation, administration or other fees.
                            Your card issuer may charge you a foreign transaction fee.
                        </div>
                        <hr>
                        <div class="important-details">
                            Payment information
                        </div>
                        <div class="least-important-details">
                            We handles all payments.
                        </div>
                        <hr>
                        <div class="important-details">
                            Additional information
                        </div>
                        <div class="least-important-details">
                            Please note that additional supplements (e.g. extra bed) are not added in this total.
                            If you don't show up or cancel, applicable taxes may still be charged by the property.
                            Please remember to read the <strong>Important information</strong> below, as this may contain important details not mentioned here.
                        </div>
                        <hr>
                    </div>
                </div>
                <div class="sub-content">
                    <div class="content-body">
                        <div class="row">
                            <div class="col-lg-9 col-sm-9 col-md-9 left least-important-details" style="border-left: 0px;">
                                <div class="important-details">
                                    Standard Studio
                                </div>
                                <div>
                                    <strong>Guest name:</strong> Triệu Trần / for 2 Adults, 1 child (up to 12 years of age)
                                </div>
                                <div>
                                    <strong>Meal Plan:</strong> There is no meal option with this room.
                                </div>
                                <div>
                                    <strong>Bed Size(s):</strong> 1 single bed (90-130 cm wide)
                                </div>
                            </div>
                            <div class="col-lg-3 col-sm-3 col-md-3">
                                <div>
                                    <div class="least-important-details"><strong>Prepayment :</strong></div>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
                <hr style="margin-top: 2rem;">
            </div>
        </div>

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

