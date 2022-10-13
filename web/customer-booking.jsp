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
        <title>My booking</title>
    </head>
    <body>
        <h2>Booking & Trips</h2>

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
                    <th class="rate-recommend-table-th"></th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${listRecommendRooms}" var="list">
                    <tr>
                        <td class="rate-recommend-table-td room-data">
                            <div><a href="#roomtype${list.getRoomTypeID()}" onclick="focusOnRoomType(${list.getRoomTypeID()}, ${room}, ${dateDiff*room*list.getPrice()});">${room} × ${list.getName()}</a></div>
                            <div>
                                <strong>Price for: ${list.getAdult()} adults + ${list.getChildren()} child</strong>
                            </div>
                            <div>
                                <c:forEach items="${listRoomTypeDetail}" var="rtd">
                                    <c:if test="${rtd.getRoomTypeID()==list.getRoomTypeID()}">
                                        <div>
                                            <!--<li>-->
                                            ${rtd.getBedAmount()} x ${rtd.getName()}
                                            <!--</li>-->
                                        </div>
                                    </c:if>
                                </c:forEach>
                            </div>
                            <c:if test="${listRecommendRooms.size()-1!=listRecommendRooms.lastIndexOf(list)}">
                                <div style="font-weight: bold">
                                    Or:
                                </div>
                            </c:if>
                        </td>
                        <td class="rate-recommend-table-td room-data" style="border-right: 0px;">
                            <c:if test="${dateDiff > 1}">
                                <div>
                                    <strong>Price for: ${dateDiff} nights stay</strong>
                                </div>
                            </c:if>
                            <c:if test="${dateDiff == 1}">
                                <div>
                                    <strong>Price for a night stay</strong>
                                </div>
                            </c:if>
                            <strong>VND ${dateDiff*room*list.getPrice()}</strong>
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
    </body>
</html>
