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
                /*margin-right: 0px;*/
                /*margin-left: 0px;*/
                align-items: flex-end;
            }
            div.py-md-4{
                padding: 0px!important;
                /*text-align:*/ 
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
            #adult, #children, #room, #checkInDate, #checkOutDate{
                border-radius: 0px;
                box-shadow: none;
            }
            .btn-secondary{
                border: none;
                border-radius: 0px;
            }
            .view-room{
                color: black;
            }
            img{
                padding-bottom: 10px;
            }
            .view-room:hover{
                color: #007bff;
            }
            label{
                font-weight: 500;
            }
            .rate-table-full{
                display: flex;
                width: 1300px; 
                height: 100%;
            }
            #rate-recommend-table{
                width: 1300px; 
                height: 8rem;
                border: transparent;
                border-radius: 3px;
                box-shadow: 0 1px 8px 0 rgba(0,0,0,0.12),0 2px 3px -1px rgba(0,0,0,0.2);
            }
            #rate-table{
                width: 1000px; 
                height: 8rem;
            }
            .fake-table{
                border: 1px solid #5bbaff;
                border-right: white;
                border-left: white;
                border-top: white;
            }
            .fake-table-head{
                padding-top: 68px;
                padding-right: 295px;
                background-color: midnightblue;
                border: 1px solid darkblue;
            }
            .fake-table-body{
                /*padding-top: 5px;*/
                /*text-align: center;*/
                padding-left: 5%;
                padding-right: 5%;
                border: 1px solid #5bbaff;
                border-right: white;
                border-left: white;
                border-bottom: white;
                border-top: white;
                top: 0;
                position: sticky;
            }
            .room-data{
                vertical-align: top;
                padding-top: 5px;
                padding-left: 10px;
            }
            .fake-table-body-ul{
                margin-top: 5%;
                margin-bottom: 0%;
                padding-left: 20px;
            }
            .fake-table-body-li{
                padding-bottom: 10px;
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
            @media only screen and (min-width: 1200px) {
                .rate-table-full{
                    width: 100%; 
                    height: 100%;
                }
                #rate-table{
                    width: 100%; 
                    height: 100%;
                }
                #rate-recommend-table{
                    width: 100%; 
                    height: 100%;
                }
                .fake-table-head{
                    padding-top: 68px;
                    padding-right: 190px;
                    background-color: midnightblue;
                    border: 1px solid darkblue;
                }
            }
        </style>
        <script type="text/javascript">
            window.onload = function () {
//                var today = new Date().toISOString().split('T')[0];
////                alert(today);
//                document.getElementById('checkInDate').setAttribute('min', today);
//                document.getElementById('checkOutDate').setAttribute('min', today);
                var dates = {
                    convert: function (d) {
                        // Converts the date in d to a date-object. The input can be:
                        //   a date object: returned without modification
                        //  an array      : Interpreted as [year,month,day]. NOTE: month is 0-11.
                        //   a number     : Interpreted as number of milliseconds
                        //                  since 1 Jan 1970 (a timestamp) 
                        //   a string     : Any format supported by the javascript engine, like
                        //                  "YYYY/MM/DD", "MM/DD/YYYY", "Jan 31 2009" etc.
                        //  an object     : Interpreted as an object with year, month and date
                        //                  attributes.  **NOTE** month is 0-11.
                        return (
                                d.constructor === Date ? d :
                                d.constructor === Array ? new Date(d[0], d[1], d[2]) :
                                d.constructor === Number ? new Date(d) :
                                d.constructor === String ? new Date(d) :
                                typeof d === "object" ? new Date(d.year, d.month, d.date) :
                                NaN
                                );
                    },
                    compare: function (a, b) {
                        // Compare two dates (could be of any type supported by the convert
                        // function above) and returns:
                        //  -1 : if a < b
                        //   0 : if a = b
                        //   1 : if a > b
                        // NaN : if a or b is an illegal date
                        // NOTE: The code inside isFinite does an assignment (=).
                        return (
                                isFinite(a = this.convert(a).valueOf()) &&
                                isFinite(b = this.convert(b).valueOf()) ?
                                (a > b) - (a < b) :
                                NaN
                                );
                    },
                    inRange: function (d, start, end) {
                        // Checks if date in d is between dates in start and end.
                        // Returns a boolean or NaN:
                        //    true  : if d is between start and end (inclusive)
                        //    false : if d is before start or after end
                        //    NaN   : if one or more of the dates is illegal.
                        // NOTE: The code inside isFinite does an assignment (=).
                        return (
                                isFinite(d = this.convert(d).valueOf()) &&
                                isFinite(start = this.convert(start).valueOf()) &&
                                isFinite(end = this.convert(end).valueOf()) ?
                                start <= d && d <= end :
                                NaN
                                );
                    }
                }
                $(function () {
                    var today = new Date(); // The Date object returns today's timestamp
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
                        var startDate = picker.startDate.format('YYYY-MM-DD');
                        var endDate = picker.endDate.format('YYYY-MM-DD');
                        if (startDate === endDate) {
                            var today = dates.convert(startDate);
                            var tomorrow = dates.convert(endDate);
                            tomorrow.setDate(today.getDate() + 1);
                            tomorrow = ((tomorrow.getDate() > 9) ? tomorrow.getDate() : ('0' + tomorrow.getDate())) + '/' +
                                    ((tomorrow.getMonth() > 8) ? (tomorrow.getMonth() + 1) : ('0' + (tomorrow.getMonth() + 1))) + '/' +
                                    tomorrow.getFullYear();
                            today = ((today.getDate() > 9) ? today.getDate() : ('0' + today.getDate())) + '/' +
                                    ((today.getMonth() > 8) ? (today.getMonth() + 1) : ('0' + (today.getMonth() + 1))) + '/' +
                                    today.getFullYear();
//                            alert('today: ' + today + ', tommorow: ' + tomorrow);

                            $('input[name="daterange"]').val(today + " - " + tomorrow);
                        }
                    });
                });
            }
            function checkAmount(value) {
                const collection = document.getElementsByClassName("amount")
//                var nodeList = document.querySelectorAll(".amount");
                for (let i = 0; i < collection.length; i++) {
                    if (value === "" && collection[i].value === "") {
                        collection[i].required = true;
                    }
                    if (value === "" && collection[i].value !== "") {
                        collection[i].required = false;
                    }
                    if (value !== "" && collection[i].value === "") {
                        collection[i].required = false;
                    }
                    if (value !== "" && collection[i].value !== "") {
                        collection[i].required = false;
                    }
                }
            }
        </script>
    </head>
    <body>
        <jsp:include page="page-header.jsp"></jsp:include>
            <div class="container">
                <div class="main-body">
                    <!--                <h2>
                                        Recommended:
                                    </h2>
                                    <br>-->
                    <!--                    <div style="margin-bottom: 5px;">
                                            <strong>2 rooms for 2 adults, 1 child</strong>
                                        </div>-->
                    <table id="rate-recommend-table" border="1">
                        <thead>
                            <tr>
                            <c:if test="${message!=''}">
                                <th class="rate-recommend-table-th">
                                    ${message}
                                </th>
                            </c:if>
                            <c:if test="${notice!=''}">
                                <th class="rate-recommend-table-th" style="color: red;">
                                    ${notice}
                                </th>
                            </c:if>
                            <!--<th class="rate-recommend-table-th"></th>-->
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${listRecommendRooms}" var="list">
                            <tr>
                                <td class="rate-recommend-table-td room-data">
                                    <div>${room} × ${list.getName()}</div>
                                    <div>
                                        <strong>Price for: ${list.getAdult()} adults + ${list.getChildren()} child</strong>
                                    </div>
                                    <div>
                                        <c:forEach items="${listRoomTypeDetail}" var="rtd">
                                            <c:if test="${rtd.getRoomTypeID()==list.getRoomTypeID()}">
                                                <div>
                                                    <!--<li>-->
                                                    ${rtd.getName()} x ${rtd.getBedAmount()}
                                                    <!--</li>-->
                                                </div>
                                            </c:if>
                                        </c:forEach>
                                    </div>
                                    <c:if test="${listRecommendRooms.size()-1!=listRecommendRooms.lastIndexOf(list)}">
                                        <div>
                                            Or:
                                        </div>
                                    </c:if>
                                </td>
                                <td class="rate-recommend-table-td room-data">
                                    <strong>VND ${room*list.getPrice()}</strong>
                                </td>
                                <!--                                <td style="text-align: center; border-top: 1px solid #e6e6e6;">
                                                                    <a href="#rate-table" class="btn btn-secondary" style="color: white; border-color: darkblue; background-color: midnightblue; 
                                                                       margin-top: 1rem; margin-bottom: 1rem; width: 70%">
                                                                        Reserve your selection
                                                                    </a>
                                                                </td>-->
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
                <hr>
                <h2>
                    Availability
                </h2>
                <section class="ftco-booking ftco-section ftco-no-pt ftco-no-pb">
                    <div class="container">
                        <div class="row no-gutters">
                            <div class="col-lg-12">
                                <form action="booking" class="booking-form aside-stretch" method="post">
                                    <input type="hidden" name="do" value="checkAvailabiltyOfRoom">
                                    <input type="hidden" name="action" value="changeSearch">
                                    <div class="row">
                                        <div class="col-md d-flex py-md-4">
                                            <div class="form-group align-self-stretch d-flex align-items-end">
                                                <div class="wrap align-self-stretch py-3 px-4">
                                                    <!--<label for="checkInDate">Check-in Date</label>-->
                                                    <input type="text" id="checkInDate" name="daterange" required="" onkeydown="event.preventDefault()" class="form-control" placeholder="Check-in date"
                                                           value="${checkInDate==null? "01/01/1990":checkInDate} - ${checkOutDate==null? "01/01/1990":checkOutDate}">
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
                                                                <option value="1" ${adult == 1 ? "selected":""}>1 Adult</option>
                                                                <c:forEach var="i" begin="2" end="10">
                                                                    <option value="${i}" ${adult == i ? "selected":""}>${i} Adults</option>
                                                                </c:forEach>
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
                                                                <option value="0" ${children == 0 ? "selected":""}>0 Child</option>
                                                                <option value="1" ${children == 1 ? "selected":""}>1 Child</option>
                                                                <c:forEach var="i" begin="2" end="6">
                                                                    <option value="${i}" ${children == i ? "selected":""}>${i} Children</option>
                                                                </c:forEach>
                                                                <!--                                                                <option value="2">2 Children</option>
                                                                                                                                <option value="3">3 Children</option>
                                                                                                                                <option value="4">4 Children</option>
                                                                                                                                <option value="5">5 Children</option>-->
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
                                                            <select name="room" id="room" class="form-control">
                                                                <option value="1">1 room</option>
                                                                <c:forEach var="i" begin="2" end="6">
                                                                    <option value="${i}" ${room == i ? "selected":""}>${i} Rooms</option>
                                                                </c:forEach>
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
                <form action="booking" method="post">
                    <input type="hidden" name="do" value="proceedBooking">
                    <section class="rate-table-full">
                        <table id="rate-table" border="1" style="border-color: #5bbaff; border-left: transparent;">
                            <thead>
                                <tr>
                                    <th>Accommodation</th>
                                    <th>Sleep</th>
                                    <th>Today's price</th>
                                    <th>Your choices</th>
                                    <th>Select amount</th>
                                    <!--<th></th>-->
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${listRoomType}" var="rt">
                                    <tr>
                                        <td class="room-data">
                                            <a class="view-room" href="#"><div>
                                                    <h4>${rt.getName()}</h4>
                                                </div>
                                                <img src="${rt.getImg()}" width="200" height="150">
                                            </a>

                                            <div>
                                                <strong>
                                                    Bed:
                                                </strong>
                                            </div>
                                            <c:forEach items="${listRoomTypeDetail}" var="rtd">
                                                <c:if test="${rt.getRoomTypeID()==rtd.getRoomTypeID()}">
                                                    <ul style="margin-bottom: 0%;
                                                        padding-left: 20px;">
                                                        <li>
                                                            ${rtd.getName()} x ${rtd.getBedAmount()}
                                                        </li>
                                                    </ul>
                                                </c:if>
                                            </c:forEach>
                                            <!--${rt.getDescription()}-->
                                        </td>
                                        <td class="room-data" style="width: 8%;">
                                            <div>
                                                <i class="fa-solid fa-user"></i> x ${rt.getAdult()}
                                            </div>
                                            <div>
                                                <i class="fa-solid fa-user fa-xs"></i> x ${rt.getChildren()}    
                                            </div>
                                        </td>
                                        <td class="room-data">
                                            <div><strong>VND ${rt.getPrice()}</strong></div>
                                        </td>
                                        <td class="room-data" style="width: 25%">
                                            <div style="color: green;">
                                                <svg class="bk-icon -streamline-checkmark_fill" fill="#008009" height="16" width="16" viewBox="0 0 128 128" role="presentation" aria-hidden="true" focusable="false"><path d="M56.33 102a6 6 0 0 1-4.24-1.75L19.27 67.54A6.014 6.014 0 1 1 27.74 59l27.94 27.88 44-58.49a6 6 0 1 1 9.58 7.22l-48.17 64a5.998 5.998 0 0 1-4.34 2.39z"></path></svg>
                                                <strong>Free cancellation</strong>
                                            </div>
                                            <div style="color: green;">
                                                <svg class="bk-icon -streamline-checkmark_fill" fill="#008009" height="16" width="16" viewBox="0 0 128 128" role="presentation" aria-hidden="true" focusable="false"><path d="M56.33 102a6 6 0 0 1-4.24-1.75L19.27 67.54A6.014 6.014 0 1 1 27.74 59l27.94 27.88 44-58.49a6 6 0 1 1 9.58 7.22l-48.17 64a5.998 5.998 0 0 1-4.34 2.39z"></path></svg>
                                                <strong>NO PREPAYMENT NEEDED</strong> - pay at the property 
                                            </div>
                                        </td>
                                        <td style="width: 5%; text-align: center; vertical-align: top; padding-top: 5px;">
                                            <div class="icon"><span class="ion-ios-arrow-down"></span></div>
                                            <select name="amount" id="amount" class="amount" style="width: 80%;" required="" onchange="checkAmount(this.value);">
                                                <option value="">0</option>
                                                <c:forEach items="${listAvailableRooms}" var="list">
                                                    <c:forEach var="j" begin="1" end="${list.getNoOfAvailableRoom()}">
                                                        <c:if test="${list.getRoomTypeID()==rt.getRoomTypeID()}">
                                                            <option value="${j}">${j} (VND ${j*rt.getPrice()})</option>
                                                        </c:if>
                                                    </c:forEach>
                                                </c:forEach>
                                            </select>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                        <div class="fake-table">
                            <div class="fake-table-head">

                            </div>
                            <div class="fake-table-body">
                                <button class="btn btn-secondary" style="color: white; border-color: darkblue; background-color: midnightblue; 
                                        margin-top: 5%; width: 70%;
                                        width: 100%; padding: 10px 0px;">
                                    I'll Reserve
                                </button>
                                <div>
                                    <ul class="fake-table-body-ul">
                                        <li class="">
                                            It only takes 2 minutes
                                        </li>
                                        <li >
                                            Confirmation is immediate
                                        </li>
                                        <li class="fake-table-body-li">
                                            No booking or credit card fees!
                                        </li>
                                    </ul>
                                </div>
                                <div style="border: 1px solid #008009;
                                     padding: 3px 5px;
                                     color: #008009;
                                     border-radius: 3px;
                                     font-size: 12px;
                                     margin-top: 6px;
                                     margin-bottom: 6px;">
                                    <b>No credit card</b> needed!
                                </div>
                            </div>
                        </div>
                    </section>
                </form>

                <%--<c:forEach items="${listRoomType}" var="rt">--%>
<!--                    <div id="RT${rt.getRoomTypeID()}" class="modal custom-modal fade" role="dialog">
                        <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title">Your selection</h5>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <div class="modal-body">
                                    <form action="booking" method="post" accept-charset="utf-8">
                                        <input type="hidden" name="do" value="proceedBooking">
                                        <div class="row">
                                            <ul style="list-style: none;">
                                                <li>
                                                    <strong>${rt.getName()}</strong>
                                                </li>
                                                <li>
                                                    <label for="amount">Select amount <span class="text-danger">*</span></label>
                                                    <select name="amount" id="amount" class="" style="width: 80%;">
                <c:forEach items="${listAvailableRooms}" var="list">
                    <c:forEach var="j" begin="1" end="${list.getNoOfAvailableRoom()}">
                        <c:if test="${list.getRoomTypeID()==rt.getRoomTypeID()}">
                            <option value="${j}">${j} (${j*rt.getPrice()})</option>
                        </c:if>
                    </c:forEach>
                </c:forEach>
            </select>
        </li>
        <li>${rt.getPrice()}</li>
        <li>
            <img src="${rt.getImg()}" height="200" width="250"> 
        </li>
        <li>Adult x ${rt.getAdult()}</li>
        <li>Children x ${rt.getChildren()}</li>
        <li>
            <div class="submit-section">
                <input type="submit" class="btn btn-primary submit-btn" id="create" value="I'll reserve it" style="border-radius: 0px;">
            </div>
        </li>
    </ul>
                                                <div class="col-md-12">
                                                    <strong>${rt.getName()}</strong>
                                                </div>

                                                <div class="col-md-3">
                                                    <label for="amount">Select amount <span class="text-danger">*</span></label>
                                                    <select name="amount" id="amount" class="" style="width: 80%;">
                <c:forEach items="${listAvailableRooms}" var="list">
                    <c:forEach var="j" begin="1" end="${list.getNoOfAvailableRoom()}">
                        <c:if test="${list.getRoomTypeID()==rt.getRoomTypeID()}">
                            <option value="${j}">${j} (${j*rt.getPrice()})</option>
                        </c:if>
                    </c:forEach>
                </c:forEach>
            </select>
        </div>
            </div>
        </form>
    </div>
</div>
</div>
</div>-->
                <%--</c:forEach>--%>
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
