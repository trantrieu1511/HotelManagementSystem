<%-- 
    Document   : customer-booking
    Created on : Oct 12, 2022, 3:12:11 PM
    Author     : DELL
--%>

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
                padding-top: 5px;
                padding-left: 10px;
            }
            @media only screen and (min-width: 1200px) {
                #rate-recommend-table{
                    width: 100%; 
                    height: 100%;
                }
            }
        </style>
    </head>
    <body>
        <jsp:include page="page-header.jsp"></jsp:include>

            <div class="container" style="margin-top: 3rem;">
                <h2>Booking & Trips</h2>

                <table id="rate-recommend-table" border="1">
                    <thead>
                    </thead>
                    <tbody>
                    <c:forEach items="${listRecommendRooms}" var="list">
                        <tr>
                            <td class="rate-recommend-table-td data">
                                <div>

                                </div>
                            </td>
                            <td class="rate-recommend-table-td data" style="border-right: 0px;">
                                <strong>VND 200,000</strong>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
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
