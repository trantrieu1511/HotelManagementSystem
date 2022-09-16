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
    </head>
    <body>
        <nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar">
            <div class="container">
                <a class="navbar-brand" href="home">My<span>Hotel</span></a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav" aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="oi oi-menu"></span> Menu
                </button>

                <div class="collapse navbar-collapse" id="ftco-nav">
                    <ul class="navbar-nav ml-auto">
                        <!--<li class="nav-item active"><a href="home.jsp" class="nav-link">Home</a></li>-->
                        <li class="nav-item"><a href="rooms.html" class="nav-link">Our Rooms</a></li>
                        <li class="nav-item"><a href="restaurant.html" class="nav-link">Restaurant</a></li>
                        <li class="nav-item"><a href="about.html" class="nav-link">About Us</a></li>
                        <li class="nav-item"><a href="blog.html" class="nav-link">Blog</a></li>
                        <li class="nav-item"><a href="contact.html" class="nav-link">Contact</a></li>
                            <c:if test="${sessionScope.Customer==null}">
                            <li class="nav-item"><a href="login.jsp" class="nav-link">Login</a></li>
                            </c:if>
                            <c:if test="${sessionScope.Customer!=null}">
                            <li class="nav-item dropdown has-arrow main-drop">
                                <a href="profile.jsp" class="dropdown-toggle nav-link" data-toggle="dropdown">${sessionScope.Customer.getLastName()} ${sessionScope.Customer.getFirstName()}</a>
                                <div class="dropdown-menu">
                                    <a class="dropdown-item" href="customer">Manage Account</a>
                                    <!--<a class="dropdown-item" href="settings.html">Settings</a>-->
                                    <a class="dropdown-item" href="authentication?do=logout">Logout</a>
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
