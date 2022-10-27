<%-- 
    Document   : pageheader
    Created on : Sep 13, 2022, 1:52:14 PM
    Author     : DELL
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Header Page</title>
        <style>
            nav{
                background-color: midnightblue;
            }
            .navbar-toggler {
                color: white;
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
        </style>
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
                        <li class="nav-item"><a href="roomtype" class="nav-link">Our Rooms</a></li>
                        <li class="nav-item"><a href="restaurant.jsp" class="nav-link">Restaurant</a></li>
                        <li class="nav-item"><a href="about.jsp" class="nav-link">About Us</a></li>
                        <li class="nav-item"><a href="blog.jsp" class="nav-link">Blog</a></li>
                        <li class="nav-item"><a href="contact.jsp" class="nav-link">Contact</a></li>
                            <c:if test="${sessionScope.Customer==null}">
                            <li class="nav-item"><a href="login.jsp" class="nav-link">Login</a></li>
                            </c:if>
                            <c:if test="${sessionScope.Customer!=null}">
                            <li class="nav-item dropdown has-arrow main-drop">
                                <a href="profile.jsp" class="dropdown-toggle nav-link" data-toggle="dropdown">${sessionScope.Customer.getLastName()} ${sessionScope.Customer.getFirstName()}</a>
                                <div class="dropdown-menu">
                                    <a class="dropdown-item" href="customer">
                                        <span style="margin-right: 10px;">
                                            <svg class="bk-icon -streamline-person_half" height="24" width="24" viewBox="0 0 24 24" role="presentation" aria-hidden="true" focusable="false"><path d="M16.5 6a4.5 4.5 0 1 1-9 0 4.5 4.5 0 0 1 9 0zM18 6A6 6 0 1 0 6 6a6 6 0 0 0 12 0zM3 23.25a9 9 0 1 1 18 0 .75.75 0 0 0 1.5 0c0-5.799-4.701-10.5-10.5-10.5S1.5 17.451 1.5 23.25a.75.75 0 0 0 1.5 0z"></path></svg>
                                        </span>
                                        Manage account</a>
                                    <a class="dropdown-item" href="customer?do=manageBooking">
                                        <span style="margin-right: 10px;">
                                            <svg class="bk-icon -streamline-suitcase" height="24" width="24" viewBox="0 0 24 24" role="presentation" aria-hidden="true" focusable="false"><path d="M22.5 14.249v4.5a2.25 2.25 0 0 1-2.25 2.25H3.75a2.25 2.25 0 0 1-2.25-2.25v-9a2.25 2.25 0 0 1 2.25-2.25h16.5a2.25 2.25 0 0 1 2.25 2.25v4.5zm1.5 0v-4.5a3.75 3.75 0 0 0-3.75-3.75H3.75A3.75 3.75 0 0 0 0 9.749v9a3.75 3.75 0 0 0 3.75 3.75h16.5a3.75 3.75 0 0 0 3.75-3.75v-4.5zm-18-7.5v15a.75.75 0 0 0 1.5 0v-15a.75.75 0 0 0-1.5 0zm10.5 0v15a.75.75 0 0 0 1.5 0v-15a.75.75 0 0 0-1.5 0zm0 0v-3a2.25 2.25 0 0 0-2.25-2.25h-4.5a2.25 2.25 0 0 0-2.25 2.25v3a.75.75 0 0 0 1.5 0v-3a.75.75 0 0 1 .75-.75h4.5a.75.75 0 0 1 .75.75v3a.75.75 0 0 0 1.5 0z"></path></svg>        
                                        </span>
                                        Booking
                                    </a>
                                    <!--<a class="dropdown-item" href="settings.html">Settings</a>-->
                                    <a class="dropdown-item" href="authentication?do=logout">
                                        <span style="margin-right: 10px;">
                                            <svg class="bk-icon -streamline-sign_out" height="24" width="24" viewBox="0 0 128 128" role="presentation" aria-hidden="true" focusable="false"><path d="M1.19 66.83l20 20a4.002 4.002 0 1 0 5.66-5.66L13.67 68H88a4 4 0 0 0 0-8H13.67l13.18-13.17a4.002 4.002 0 1 0-5.66-5.66l-20 20c-.183.186-.35.387-.5.6 0 0 0 .11-.08.16a3 3 0 0 0-.28.53 2.25 2.25 0 0 0-.08.24 3 3 0 0 0-.15.51 3.94 3.94 0 0 0 0 1.58c.036.174.086.344.15.51.022.081.049.162.08.24.076.182.17.357.28.52 0 .06.05.11.08.16.15.216.317.42.5.61zm31.13 35c20.876 19.722 53.787 18.787 73.509-2.089 14.874-15.743 18.432-39.058 8.931-58.521-10.77-22.12-42-37.41-69.52-24a52 52 0 0 0-12.91 8.93 4.004 4.004 0 0 1-5.49-5.83 60.002 60.002 0 0 1 14.9-10.29C67.26-2.37 106.48 6 122 37.74c14.519 29.787 2.142 65.704-27.645 80.223-22.44 10.938-49.308 6.839-67.465-10.293a4 4 0 0 1 5.48-5.82z"></path></svg>
                                        </span>
                                        Logout
                                    </a>
                                </div>
                            </li>
                        </c:if>
                    </ul>
                </div>
            </div>
        </nav>
        <!-- END nav -->
    </body>
</html>
