<%-- 
    Document   : booking-cancelled
    Created on : Oct 11, 2022, 2:54:59 PM
    Author     : DELL
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Booking cancelled page</title>
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
            @media (max-width: 520px){
                .col-sm-6 {
                    -ms-flex: 0 0 50%;
                    flex: 0 0 100%;
                    max-width: 50%;
                }
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
            }
            .cancelled-content{
                margin-bottom: 10px;
            }
        </style>
        <script type="text/javascript">

        </script>
    </head>
    <body>
        <jsp:include page="page-header.jsp"></jsp:include>
            <div class="container" style="margin-top: 2rem">
                <div class="main-body">
                    <div class="row">
                        <div class="col-lg-7">
                            <h3 style="margin-bottom: 15px">Your booking was <span style="color: green;">cancelled for FREE</span></h3>
                            <div>
                                <ul style="list-style: none; padding-left: 20px;">
                                    <li class="cancelled-content">
                                        <svg style="fill: green; margin-right: 10px;" xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24"><path d="M9 22l-10-10.598 2.798-2.859 7.149 7.473 13.144-14.016 2.909 2.806z"/></svg>
                                        <strong>Your booking was successfully cancelled</strong> - you don't have to do anything else!
                                    </li>
                                    <li class="cancelled-content">
                                        <svg style="fill: green; margin-right: 10px;" xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24"><path d="M9 22l-10-10.598 2.798-2.859 7.149 7.473 13.144-14.016 2.909 2.806z"/></svg>
                                        You may have already been charged for all or parts of your stay by our Hotel - 
                                        <strong>this is perfectly normal.</strong> Refunds typically take 10-15 business days, 
                                        though you can also contact us on +84868342491 for more information.
                                    </li>
                                </ul>
                            </div>
                            <div style="margin-top: 2rem;">
                                <a class="btn btn-primary" href="home">
                                    Book again
                                </a>
                            </div>
                        </div>

                        <div class="col-lg-5">
                            <div class="card">
                                <div class="card-body">
                                    <div style="
                                         margin-bottom: 10px;
                                         margin-right: -20px;
                                         margin-left: -20px;
                                         margin-top: -20px;
                                         border-radius: 4px 4px 0px 0px;
                                         padding: 13px 20px;
                                         font-weight: bold;
                                         background: #e6e6e6;
                                         ">
                                        Cancellation summary
                                    </div>
                                    <div style="font-size: large; margin-bottom: 10px;">
                                        MyHotel
                                    </div>
                                    <div class="text-secondary">
                                        Check-in
                                    </div>
                                    <div>
                                    ${checkInDate}
                                </div>
                                <div class="text-secondary">
                                    Check-out
                                </div>
                                <div>
                                    ${checkOutDate}
                                </div>
                                <div class="text-secondary">
                                    Stay details
                                </div>
                                <div>
                                    <c:if test="${dateDiff>1}">
                                        ${dateDiff} nights
                                    </c:if>
                                    <c:if test="${dateDiff==1}">
                                        ${dateDiff} night
                                    </c:if>
                                    <c:if test="${totalRoom==1}">
                                        , ${totalRoom} room
                                    </c:if>
                                    <c:if test="${totalRoom>1}">
                                        , ${totalRoom} rooms
                                    </c:if>
                                </div>
                                <div style="margin-top: 1rem;
                                     background: #ebf3ff;
                                     margin-right: -20px;
                                     margin-left: -20px;
                                     margin-bottom: -20px;
                                     border-radius: 0px 0px 4px 4px;
                                     padding: 20px;">
                                    <div style="display: flex; justify-content: space-between;">
                                        <div>
                                            Cancellation cost:
                                        </div>
                                        <div style="font-weight: bold; font-size: large;">
                                            Free
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
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

