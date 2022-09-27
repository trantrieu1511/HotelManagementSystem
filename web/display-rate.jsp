<%-- 
    Document   : displayRate
    Created on : Sep 23, 2022, 9:23:33 AM
    Author     : DELL
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Display Rate Page</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/js/bootstrap.bundle.min.js"></script>
        <!-- FontAwesome JS-->
        <script src="https://kit.fontawesome.com/310efd8ed3.js" crossorigin="anonymous"></script>
        <!-- Date-range picker -->
        <script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
        <script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
        <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
        <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />
        <%--<c:if test="${sessionScope.Customer == null}">--%>
        <%--<c:redirect url="login.jsp"></c:redirect>--%>
        <%--</c:if>--%>
        <style>
            th{
                color: white;
                border-color: darkblue;
                background-color: midnightblue;
                padding: 10px;
            }
            .row{
                margin-right: 0px;
                margin-left: 0px;
                align-items: flex-end;
            }
            div.py-md-4{
                padding: 0px!important;
                text-align: 
            }
            .py-3 {
                padding: 0px!important;
            }
            .px-4{
                padding: 0px!important;
            }
            .d-flex{
                display: block!important;
            }
            section{
                /*border: 1px solid darkblue;*/
                /*margin-bottom: 1rem;*/
                margin-top: 1rem;
            }
            #adult, #children, #checkInDate, #checkOutDate{
                border-radius: 0px;
                box-shadow: none;
            }
            label{
                font-weight: 500;
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
            #rate-table{
                width: 900px; 
                height: 8rem;
            }
            #rate-recommend-table{
                width: 900px; 
                height: 8rem;
            }
            td{
                border-right: 1px solid gainsboro;
            }
            table{
                border-radius: 5px;
            }
            @media only screen and (min-width: 1200px) {
                #rate-table{
                    width: 100%; 
                    height: 100%;
                }
                #rate-recommend-table{
                    width: 100%; 
                    height: 100%;
                }
            }
        </style>
        <script type="text/javascript">
//            window.onload = function () {
//                var today = new Date().toISOString().split('T')[0];
////                alert(today);
//                document.getElementById('checkInDate').setAttribute('min', today);
//                document.getElementById('checkOutDate').setAttribute('min', today);
//            }

//            $(function () {
//                $('input[name="daterange"]').daterangepicker({
//                    opens: 'left'
//                }, function (start, end, label) {
//                    console.log("A new date selection was made: " + start.format('YYYY-MM-DD') + ' to ' + end.format('YYYY-MM-DD'));
//                });
//            });
            $(function () {
                var today = new Date();
                today = ((today.getDate() > 9) ? today.getDate() : ('0' + today.getDate())) + '/' +
                        ((today.getMonth() > 8) ? (today.getMonth() + 1) : ('0' + (today.getMonth() + 1))) + '/' +
                        today.getFullYear();
                $('input[name="daterange"]').daterangepicker({
                    "showDropdowns": true,
                    "locale": {
                        "format": "DD/MM/YYYY",
                        "separator": " - ",
                        "applyLabel": "Apply",
                        "cancelLabel": "Cancel",
                        "fromLabel": "From",
                        "toLabel": "To",
                        "customRangeLabel": "Custom",
                        "weekLabel": "W",
                        "daysOfWeek": [
                            "Su",
                            "Mo",
                            "Tu",
                            "We",
                            "Th",
                            "Fr",
                            "Sa"
                        ],
                        "monthNames": [
                            "January",
                            "February",
                            "March",
                            "April",
                            "May",
                            "June",
                            "July",
                            "August",
                            "September",
                            "October",
                            "November",
                            "December"
                        ],
                        "firstDay": 1
                    },
                    "autoApply": true,
//                    "startDate": today,
//                    "endDate": (end.format('DD/MM/YYYY') === today ? "25/09/2022" : end),
                    "minDate": today
                }, function (start, end, label) {
                    console.log('New date range selected: ' + start.format('DD/MM/YYYY') + ' to ' + end.format('DD/MM/YYYY') + ' (predefined range: ' + label + ')');
                }).on('hide.daterangepicker', function (ev, picker) {
                    var day1 = picker.startDate.format('DD/MM/YYYY');
                    var day2 = picker.endDate.format('DD/MM/YYYY');
                    if (day1 === day2) {
                        var tomorrow = new Date(); // The Date object returns today's timestamp
                        tomorrow.setDate(tomorrow.getDate() + 1);
                        tomorrow = ((tomorrow.getDate() > 9) ? tomorrow.getDate() : ('0' + tomorrow.getDate())) + '/' +
                                ((tomorrow.getMonth() > 8) ? (tomorrow.getMonth() + 1) : ('0' + (tomorrow.getMonth() + 1))) + '/' +
                                tomorrow.getFullYear();
                        $('input[name="daterange"]').val(day1 + " - " + tomorrow);
                    }
                });
            });
//            $('#daterange').on('show.daterangepicker', function (ev, picker) {
//            //do something, like clearing an input
//            var date = $('#daterange').split(' - ');
//            if (date)
//            });
        </script>
    </head>
    <body>
        <jsp:include page="page-header.jsp"></jsp:include>
        <div class="container">
            <div class="main-body">
                <h3>
                    Recommended for:
                </h3>
                <br>
                <div style="margin-bottom: 5px;">
                    <strong>2 rooms for 2 adults, 1 child</strong>
                </div>
                <table id="rate-recommend-table" border="0" style="
                       box-shadow: 0px 0px 5px 0px black;
                       ">
                    <tbody>
                        <tr>
                            <td>
                                2 × Superior Double or Twin Room
                                Price for: 2 adults + 1 child
                            </td>
                            <td style="width: 8%;">
                                VND 100,000
                            </td>
                            <td style="text-align: center">
                                <a href="#rate-table" class="btn btn-secondary" style="color: white; border-color: darkblue; background-color: midnightblue; 
                                   margin-top: 1rem; margin-bottom: 1rem; width: 70%">
                                    Reserve your selection
                                </a>
                            </td>
                        </tr>
                    </tbody>
                </table>
                <hr>
                <h2>
                    Availability
                </h2>
                <br>
                <section class="ftco-booking ftco-section ftco-no-pt ftco-no-pb">
                    <div class="container">
                        <div class="row no-gutters">
                            <div class="col-lg-12">
                                <form action="customer" class="booking-form aside-stretch" method="post">
                                    <input type="hidden" name="do" value="checkAvailabiltyOfRoom">
                                    <div class="row">
                                        <div class="col-md d-flex py-md-4">
                                            <div class="form-group align-self-stretch d-flex align-items-end">
                                                <div class="wrap align-self-stretch py-3 px-4">
                                                    <!--<label for="checkInDate">Check-in Date</label>-->
                                                    <input type="text" id="checkInDate" name="daterange" required="" onkeydown="event.preventDefault()" class="form-control" placeholder="Check-in date"
                                                           value="">
                                                </div>
                                            </div>
                                        </div>
                                        <!--                                        <div class="col-md d-flex py-md-4">
                                                                                    <div class="form-group align-self-stretch d-flex align-items-end">
                                                                                        <div class="wrap align-self-stretch py-3 px-4">
                                                                                            <label for="checkOutDate">Check-out Date</label>
                                                                                            <input type="text" id="checkOutDate" name="checkOutDate" required="" onkeydown="event.preventDefault()" class="form-control checkout_date" placeholder="Check-out date">
                                                                                        </div>
                                                                                    </div>
                                                                                </div>-->
                                        <div class="col-md d-flex py-md-4">
                                            <div class="form-group align-self-stretch d-flex align-items-end">
                                                <div class="wrap align-self-stretch py-3 px-4">
                                                    <!--<label for="adult">Guests</label>-->
                                                    <div class="form-field">
                                                        <div class="select-wrap">
                                                            <div class="icon"><span class="ion-ios-arrow-down"></span></div>
                                                            <select name="adult" id="adult" class="form-control">
                                                                <option value="1">1 Adult</option>
                                                                <option value="2">2 Adults</option>
                                                                <option value="3">3 Adults</option>
                                                                <option value="4">4 Adults</option>
                                                                <option value="5">5 Adults</option>
                                                                <option value="6">6 Adults</option>
                                                            </select>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md d-flex py-md-4">
                                            <div class="form-group align-self-stretch d-flex align-items-end">
                                                <div class="wrap align-self-stretch py-3 px-4">
                                                    <!--<label for="children">Children</label>-->
                                                    <div class="form-field">
                                                        <div class="select-wrap">
                                                            <div class="icon"><span class="ion-ios-arrow-down"></span></div>
                                                            <select name="children" id="children" class="form-control">
                                                                <option value="1">1 Child</option>
                                                                <option value="2">2 Children</option>
                                                                <option value="3">3 Children</option>
                                                                <option value="4">4 Children</option>
                                                                <option value="5">5 Children</option>
                                                            </select>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md d-flex py-md-4">
                                            <div class="form-group ">
                                                <button href="#" class="btn btn-primary " style="width: 100%; border-radius: 0px;"><span>Change Search</span></button>
                                            </div>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </section>
                <table id="rate-table" border="1">
                    <thead>
                        <tr>
                            <th>Acommodation</th>
                            <th>Sleep</th>
                            <th>Today's price</th>
                            <th>Your choices</th>
                            <th>Select amount</th>
                            <th></th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>a</td>
                            <td style="width: 8%;">
                                <i class="fa-solid fa-user"></i>
                                <i class="fa-solid fa-user"></i>
                                +
                                <i class="fa-solid fa-user fa-xs"></i>
                            </td>
                            <td>a</td>
                            <td>My choices</td>
                            <td style="width: 5%; text-align: center"><div class="icon"><span class="ion-ios-arrow-down"></span></div>
                                <select name="amount" id="amount" class="">
                                    <option value="1">1</option>
                                    <option value="2">2</option>
                                    <option value="3">3</option>
                                    <option value="4">4</option>
                                    <option value="5">5</option>
                                </select></td>
                            <td style="text-align: center">
                                <a href="booking?do=proceedBooking" class="btn btn-secondary" style="color: white; border-color: darkblue; background-color: midnightblue; 
                                   margin-top: 1rem; width: 70%">
                                    I'll Reserve
                                </a>
                            </td>
                        </tr>
                    </tbody>
                </table>

            </div>
        </div>

        <style type="text/css">
            body{
                margin-top:20px;
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
