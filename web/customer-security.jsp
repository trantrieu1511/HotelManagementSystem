<%-- 
    Document   : customer-security
    Created on : Sep 16, 2022, 2:27:31 PM
    Author     : DELL
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Customer Security Page</title>
        <!--  This file has been downloaded from bootdey.com @bootdey on twitter -->
        <!--  All snippets are MIT license http://bootdey.com/license -->
        <title>profile with data and skills - Bootdey.com</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/js/bootstrap.bundle.min.js"></script>
        <script src="js/customer-account-settings.js"></script>
        <script type="text/javascript">
            <c:if test="${message!=''}">
            window.onload = function () {
                alert("${message}");
            }
            </c:if>
            $(function () {
                $('input[type="text"]').change(function () {
                    this.value = $.trim(this.value);
                });
            })
        </script>
    </head>
    <body>
        <jsp:include page="page-header.jsp"></jsp:include>
            <div class="container">
                <div class="main-body"> 

                    <div class="row gutters-sm">
                    <jsp:include page="settings-menu.jsp"></jsp:include>
                        <div class="col-md-8">
                            <div class="card mb-3">
                                <div class="card-body">
                                    <div class="mt-3">
                                        <h4>Security</h4>
                                        <p class="text-secondary mb-1">Adjust your security settings.</p>
                                    </div>
                                    <hr>
                                    <div class="row">
                                        <div class="col-sm-3">
                                            <h6 class="mb-0">Password</h6>
                                        </div>
                                        <div class="col-sm-7 text-secondary" id="passwordDiv">
                                        ${cusInfo.getPassword()}
                                    </div>
                                    <form class="col-sm-7 text-secondary" id="passwordForm" action="customer" hidden="">
                                        <input type="hidden" name="do" value="editPassword">
                                        <div class="row">
                                            <div class="col-sm-12 col-md-6">
                                                <div class="form-group">
                                                    <label class="col-form-label">Password <span class="text-danger">*</span></label>
                                                    <input class="form-control" type="password" name="Password" id="password" placeholder="Enter your password"
                                                           onkeyup="checkconfirmPassword(this)" required pattern="[a-zA-Z0-9]{1,12}"
                                                           title="Password not contain: Unicode characters, 
                                                           special character e.g: !@#$%^&,. etc.. and whitespaces; 
                                                           allow uppercase, lowercase letters and numeric characters (0-9), max length: 12">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="submit-section">
                                            <button class="btn btn-info submit-btn">Save</button>
                                        </div>
                                    </form>
                                    <div class="col-sm-2 text-secondary">
                                        <a href="" id="btnEditPassword" class="btnEdit" onclick="event.preventDefault(); editPassword(true);" style="text-decoration: none">Edit</a>
                                        <a href="" id="btnCancelEditPassword" onclick="event.preventDefault(); editPassword(false);" style="text-decoration: none" hidden="">Cancel</a>
                                    </div>
                                </div>
                                <hr>
                                <div class="row">
                                    <div class="col-sm-3">
                                        <h6 class="mb-0">Delete Account</h6>
                                    </div>
                                    <div class="col-sm-6 text-secondary">
                                        Permanently delete your account
                                    </div>
                                    <div class="col-sm-3 text-secondary">
                                        <a href="" id="editPassword" onclick="event.preventDefault()" style="text-decoration: none">Delete account</a>
                                    </div>
                                </div>
                                <hr>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <style type="text/css">
            body{
                margin-top:20px;
                color: #1a202c;
                text-align: left;
                background-color: #e2e8f0;    
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

        <script type="text/javascript">

        </script>
    </body>
</html>
