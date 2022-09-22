<%-- 
    Document   : after-delete
    Created on : Sep 18, 2022, 11:34:37 PM
    Author     : DELL
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>After Delete Account Page</title>
        <!--  This file has been downloaded from bootdey.com @bootdey on twitter -->
        <!--  All snippets are MIT license http://bootdey.com/license -->
        <title>profile with data and skills - Bootdey.com</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/js/bootstrap.bundle.min.js"></script>
    </head>
    <c:if test="${sessionScope.Customer == null}">
        <c:redirect url="login.jsp"></c:redirect>
    </c:if>
    <body>
        <jsp:include page="page-header.jsp"></jsp:include>
        <c:if test="${deleteSucceed==true}">
            <!--<div style="color: deepskyblue; margin-bottom: 10px">${mess}<a href="login.jsp">here</a></div>-->
            <h1 style="color: deepskyblue; margin-left: 3rem; margin-bottom: 10px">${message}</h1>
        </c:if>
        <c:if test="${deleteSucceed==false}">
            <!--<div style="color: red; margin-bottom: 10px">${mess}</div>-->
            <h1 style="color: deepskyblue; margin-left: 3rem; margin-bottom: 10px">${message}</h1>
        </c:if>
        <div style="margin-left: 3rem;">Click the MyHotel in nav-bar to navigate back to home page</div>
    </body>
</html>
