<%-- 
    Document   : allRoomTypes
    Created on : Oct 19, 2022, 4:04:14 PM
    Author     : DELL
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>All RoomTypes Page</title>
    </head>
    <body>
        <section class="ftco-section ftco-no-pb ftco-room">
            <div class="container-fluid px-0">
                <div class="row no-gutters justify-content-center mb-5 pb-3">
                    <div class="col-md-7 heading-section text-center ftco-animate">
                        <span class="subheading">MyHotel Rooms</span>
                        <h2 class="mb-4">Hotel Master's Rooms</h2>
                    </div>
                </div>
                <div class="row no-gutters">
                    <c:forEach items="${listRoomType}" var="listRt">
                        <div class="col-lg-6">
                            <div class="room-wrap d-md-flex ftco-animate">
                                <a href="roomtype?do=viewDetail&RoomTypeID=${listRt.getRoomTypeID()}" class="img" style="background-image: url(${listRt.getImg()});"></a>
                                <div class="half left-arrow d-flex align-items-center">
                                    <div class="text p-4 text-center">
                                        <!--<p class="star mb-0"><span class="ion-ios-star"></span><span class="ion-ios-star"></span><span class="ion-ios-star"></span><span class="ion-ios-star"></span><span class="ion-ios-star"></span></p>-->
                                        <p class="mb-0"><span class="price mr-1">VND ${listRt.getPrice()}</span> <span class="per">per night</span></p>
                                        <h3 class="mb-3"><a href="roomtype?do=viewDetail&RoomTypeID=${listRt.getRoomTypeID()}">${listRt.getName()}</a></h3>
                                        <p class="pt-1"><a href="roomtype?do=viewDetail&RoomTypeID=${listRt.getRoomTypeID()}" class="btn-custom px-3 py-2 rounded">View Details <span class="icon-long-arrow-right"></span></a></p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </section>
    </body>
</html>
