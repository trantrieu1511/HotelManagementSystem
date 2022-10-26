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
            <c:if test="${alert!=''}">
            window.onload = function () {
                alert("${alert}");
            }
            </c:if>
            $(function () {
                $('input[type="text"]').change(function () {
                    this.value = $.trim(this.value);
                });
            })
        </script>
        <c:if test="${sessionScope.Customer == null}">
            <c:redirect url="login.jsp"></c:redirect>
        </c:if>
        <style type="text/css">
            /*            .btnPassword{
                            background-color: white;
                            border: 0px;
                            padding: 6px 6px;
                        }
                        .btnPassword:hover{
                            background-color: whitesmoke;
                            padding: 6px 6px;
                        }
                        .btnPassword:active{
                            background-color: white;
                            box-shadow: 0 5px #666;
                            transform: translateY(1px);
                            border-style: outset;
                            border: 0px;
                        }*/
            button.btn-default{
                padding: 6px 6px;
                border-radius: 0.25rem;
            }
            button.btn-default:active{
                transform: translateY(1px);
                box-shadow: none;
            }
            button.btn-default:hover{
                background-color: whitesmoke;
                padding: 6px 6px;
                border-radius: 0.25rem;
            }
            #old_password:focus{
                /*                border-color: inherit;
                                -webkit-box-shadow: none;*/
                /*box-shadow: none;*/
                padding: 0px;
                padding-left: 0.75rem;
                padding-right: 1.39rem;
                box-sizing: content-box;
            }
            #new_password:focus{
                padding: 0px;
                padding-left: 0.75rem;
                padding-right: 1.39rem;
                box-sizing: content-box;
            }
            #confirm_password:focus{
                padding: 0px;
                padding-left: 0.75rem;
                padding-right: 1.39rem;
                box-sizing: content-box;
            }
            .form-group1{
                margin-bottom: 1rem;
                display: flex; 
                /*border: 1px solid;*/ 
                align-items: center;
                justify-content: space-between;
                border: 1px solid #ced4da;
                border-radius: 0.25rem;
            }
            /*                                        .form-control {
                                                                                    display: block;
                                                                                    width: 100%;
                                                                                    height: calc(1.5em + 0.75rem + 2px);
                                                                                    padding: 0.375rem 0.75rem;
                                                                                    font-size: 1rem;
                                                                                    font-weight: 400;
                                                                                    line-height: 1.5;
                                                                                    color: #495057;
                                                                                    background-color: #fff;
                                                                                    background-clip: padding-box;
                                                                                    border: 1px solid #ced4da;
                                                                                    border-radius: 0.25rem;
                                                                                    transition: border-color .15s ease-in-out,box-shadow .15s ease-in-out;
                                                                                }*/
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
        </style>
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
                                        <div class="col-sm-7 text-secondary" id="passwordDiv" ${hasMessage ? " hidden" : ""}>
                                        <input type="password" value="${cusInfo.getPassword()}" style="border:0px; background-color: white;" disabled="">
                                    </div>
                                    <form class="col-sm-7 text-secondary" id="passwordForm" action="customer" ${hasMessage == false ? " hidden" : ""}>
                                        <input type="hidden" name="do" value="editPassword">
                                        <div class="row">
                                            <div class="col-sm-12 col-md-12">
                                                <label class="col-form-label">Old password <span class="text-danger">*</span></label>
                                                <div class="form-group1" style="background-color: #e9ecef; opacity: 1;">
                                                    <div style="width: 100%;">
                                                        <input class="form-control" type="password" name="OldPassword" id="old_password" placeholder="Enter your password"
                                                               required pattern="[a-zA-Z0-9]{1,12}"
                                                               title="Password not contain: Unicode characters, 
                                                               special character e.g: !@#$%^&,. etc.. and whitespaces; 
                                                               allow uppercase, lowercase letters and numeric characters (0-9), max length: 12"
                                                               value="${cusInfo.getPassword()}"
                                                               style="border: 0px;"
                                                               readonly="">
                                                    </div>
                                                    <script>
                                                        function showPassword2() {
                                                            var oldPasswordNode = document.querySelector('#old_password');
                                                            var type = (oldPasswordNode.getAttribute('type') === "password" ? "text" : "password");
                                                            oldPasswordNode.setAttribute("type", type);
                                                            if (type == "password") {
                                                                document.getElementById('btnShowPassword').hidden = false;
                                                                document.getElementById('btnHidePassword').hidden = true;
                                                            } else {
                                                                document.getElementById('btnShowPassword').hidden = true;
                                                                document.getElementById('btnHidePassword').hidden = false;
                                                            }
                                                        }
                                                    </script>
                                                    <div>
                                                        <button class="btn btn-default" id="btnShowPassword" onclick="event.preventDefault();showPassword2();">
                                                            <svg xmlns="http://www.w3.org/2000/svg" width="20px" height="20px" viewBox="0 0 24 24"><path d="M12.013 4.501c-3.88-.065-8.202 2.372-11.39 5.88a2.414 2.414 0 0 0-.001 3.232c3.183 3.506 7.481 5.95 11.39 5.885 3.885.066 8.183-2.378 11.367-5.883.83-.92.83-2.314.002-3.232-3.194-3.512-7.515-5.947-11.394-5.882zm0 1.5c3.378-.057 7.328 2.17 10.256 5.389.31.344.31.872-.002 1.219-2.92 3.213-6.848 5.446-10.254 5.39-3.432.056-7.36-2.178-10.279-5.392a.912.912 0 0 1 .002-1.22c2.922-3.216 6.872-5.443 10.251-5.386zM15 12a3 3 0 1 1-6 .004 3 3 0 0 1 6-.007V12zm1.5 0v-.003a4.5 4.5 0 1 0-9-.002 4.5 4.5 0 0 0 9 .005z"></path></svg>
                                                        </button>
                                                        <!--<svg id="svgHidePassword" hidden="" onclick="showPassword(false)" xmlns="http://www.w3.org/2000/svg" width="20px" height="20px" viewBox="0 0 24 24"><path d="M12.013 4.501c-3.88-.065-8.202 2.372-11.39 5.88a2.414 2.414 0 0 0-.001 3.232c3.183 3.506 7.481 5.95 11.39 5.885 3.885.066 8.183-2.378 11.367-5.883.83-.92.83-2.314.002-3.232-3.194-3.512-7.515-5.947-11.394-5.882zm0 1.5c3.378-.057 7.328 2.17 10.256 5.389.31.344.31.872-.002 1.219-2.92 3.213-6.848 5.446-10.254 5.39-3.432.056-7.36-2.178-10.279-5.392a.912.912 0 0 1 .002-1.22c2.922-3.216 6.872-5.443 10.251-5.386zM15 12a3 3 0 1 1-6 .004 3 3 0 0 1 6-.007V12zm1.5 0v-.003a4.5 4.5 0 1 0-9-.002 4.5 4.5 0 0 0 9 .005z"></path></svg>-->
                                                        <button class="btn btn-default" id="btnHidePassword" hidden="" onclick="event.preventDefault();showPassword2();">
                                                            <svg xmlns="http://www.w3.org/2000/svg" width="20px" height="20px" viewBox="0 0 24 24"><path d="M3.302 21.541l18.75-18a.75.75 0 1 0-1.038-1.082l-18.75 18a.75.75 0 1 0 1.038 1.082zm5.44-1.774c1.056.328 2.157.491 3.264.483 3.89.066 8.189-2.378 11.373-5.883.83-.92.83-2.314.002-3.232a21.333 21.333 0 0 0-3.189-2.86.75.75 0 0 0-.884 1.21 19.816 19.816 0 0 1 2.962 2.657c.31.344.31.872-.003 1.219-2.92 3.212-6.848 5.446-10.254 5.39a9.272 9.272 0 0 1-2.827-.416.75.75 0 0 0-.444 1.432zm5.852-14.213a10.298 10.298 0 0 0-2.602-.304C8.134 5.186 3.813 7.623.624 11.13c-.83.92-.83 2.315-.002 3.233.829.908 1.73 1.74 2.697 2.49a.75.75 0 1 0 .92-1.184 20.048 20.048 0 0 1-2.506-2.314.912.912 0 0 1 .003-1.218C4.66 8.921 8.61 6.694 11.988 6.75a8.854 8.854 0 0 1 2.244.26.75.75 0 1 0 .362-1.456zM9 12.75c0-1.656 1.342-3 2.998-3H12a.75.75 0 0 0 0-1.5h-.002a4.499 4.499 0 0 0-4.498 4.5.75.75 0 0 0 1.5 0zm6 0a3 3 0 0 1-3 3 .75.75 0 0 0 0 1.5h.001a4.5 4.5 0 0 0 4.499-4.501.75.75 0 0 0-1.5 0z"></path></svg>
                                                        </button>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-sm-12 col-md-12">
                                                <label class="col-form-label">New password <span class="text-danger">*</span></label>
                                                <div class="form-group1">
                                                    <div style="width: 100%;">
                                                        <input class="form-control" type="password" name="NewPassword" id="new_password" placeholder="Enter your password"
                                                               required pattern="[a-zA-Z0-9]{1,12}"
                                                               title="Password not contain: Unicode characters, 
                                                               special character e.g: !@#$%^&,. etc.. and whitespaces; 
                                                               allow uppercase, lowercase letters and numeric characters (0-9), max length: 12"
                                                               style="border: 0px;">
                                                    </div>
                                                    <div>
                                                        <button class="btn btn-default" id="btnShowPassword2" onclick="event.preventDefault();
                                                                showPassword(true, 2);">
                                                            <svg xmlns="http://www.w3.org/2000/svg" width="20px" height="20px" viewBox="0 0 24 24"><path d="M12.013 4.501c-3.88-.065-8.202 2.372-11.39 5.88a2.414 2.414 0 0 0-.001 3.232c3.183 3.506 7.481 5.95 11.39 5.885 3.885.066 8.183-2.378 11.367-5.883.83-.92.83-2.314.002-3.232-3.194-3.512-7.515-5.947-11.394-5.882zm0 1.5c3.378-.057 7.328 2.17 10.256 5.389.31.344.31.872-.002 1.219-2.92 3.213-6.848 5.446-10.254 5.39-3.432.056-7.36-2.178-10.279-5.392a.912.912 0 0 1 .002-1.22c2.922-3.216 6.872-5.443 10.251-5.386zM15 12a3 3 0 1 1-6 .004 3 3 0 0 1 6-.007V12zm1.5 0v-.003a4.5 4.5 0 1 0-9-.002 4.5 4.5 0 0 0 9 .005z"></path></svg>
                                                        </button>
                                                        <!--<svg id="svgHidePassword" hidden="" onclick="showPassword(false)" xmlns="http://www.w3.org/2000/svg" width="20px" height="20px" viewBox="0 0 24 24"><path d="M12.013 4.501c-3.88-.065-8.202 2.372-11.39 5.88a2.414 2.414 0 0 0-.001 3.232c3.183 3.506 7.481 5.95 11.39 5.885 3.885.066 8.183-2.378 11.367-5.883.83-.92.83-2.314.002-3.232-3.194-3.512-7.515-5.947-11.394-5.882zm0 1.5c3.378-.057 7.328 2.17 10.256 5.389.31.344.31.872-.002 1.219-2.92 3.213-6.848 5.446-10.254 5.39-3.432.056-7.36-2.178-10.279-5.392a.912.912 0 0 1 .002-1.22c2.922-3.216 6.872-5.443 10.251-5.386zM15 12a3 3 0 1 1-6 .004 3 3 0 0 1 6-.007V12zm1.5 0v-.003a4.5 4.5 0 1 0-9-.002 4.5 4.5 0 0 0 9 .005z"></path></svg>-->
                                                        <button class="btn btn-default" id="btnHidePassword2" hidden="" onclick="event.preventDefault();
                                                                showPassword(false, 2);">
                                                            <svg xmlns="http://www.w3.org/2000/svg" width="20px" height="20px" viewBox="0 0 24 24"><path d="M3.302 21.541l18.75-18a.75.75 0 1 0-1.038-1.082l-18.75 18a.75.75 0 1 0 1.038 1.082zm5.44-1.774c1.056.328 2.157.491 3.264.483 3.89.066 8.189-2.378 11.373-5.883.83-.92.83-2.314.002-3.232a21.333 21.333 0 0 0-3.189-2.86.75.75 0 0 0-.884 1.21 19.816 19.816 0 0 1 2.962 2.657c.31.344.31.872-.003 1.219-2.92 3.212-6.848 5.446-10.254 5.39a9.272 9.272 0 0 1-2.827-.416.75.75 0 0 0-.444 1.432zm5.852-14.213a10.298 10.298 0 0 0-2.602-.304C8.134 5.186 3.813 7.623.624 11.13c-.83.92-.83 2.315-.002 3.233.829.908 1.73 1.74 2.697 2.49a.75.75 0 1 0 .92-1.184 20.048 20.048 0 0 1-2.506-2.314.912.912 0 0 1 .003-1.218C4.66 8.921 8.61 6.694 11.988 6.75a8.854 8.854 0 0 1 2.244.26.75.75 0 1 0 .362-1.456zM9 12.75c0-1.656 1.342-3 2.998-3H12a.75.75 0 0 0 0-1.5h-.002a4.499 4.499 0 0 0-4.498 4.5.75.75 0 0 0 1.5 0zm6 0a3 3 0 0 1-3 3 .75.75 0 0 0 0 1.5h.001a4.5 4.5 0 0 0 4.499-4.501.75.75 0 0 0-1.5 0z"></path></svg>
                                                        </button>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-sm-12 col-md-12">
                                                <label class="col-form-label">Confirm new password <span class="text-danger">*</span></label>
                                                <div class="form-group1">
                                                    <div style="width: 100%;">
                                                        <input class="form-control" type="password" name="ConfirmPassword" id="confirm_password" placeholder="Enter your password"
                                                               required pattern="[a-zA-Z0-9]{1,12}"
                                                               title="Confirm Password not contain: Unicode characters, 
                                                               special character e.g: !@#$%^&,. etc.. and whitespaces; 
                                                               allow uppercase, lowercase letters and numeric characters (0-9), max length: 12"
                                                               style="border: 0px;">
                                                    </div>
                                                    <div>
                                                        <button class="btn btn-default" id="btnShowPassword3" onclick="event.preventDefault();showPassword(true, 3);">
                                                            <svg xmlns="http://www.w3.org/2000/svg" width="20px" height="20px" viewBox="0 0 24 24"><path d="M12.013 4.501c-3.88-.065-8.202 2.372-11.39 5.88a2.414 2.414 0 0 0-.001 3.232c3.183 3.506 7.481 5.95 11.39 5.885 3.885.066 8.183-2.378 11.367-5.883.83-.92.83-2.314.002-3.232-3.194-3.512-7.515-5.947-11.394-5.882zm0 1.5c3.378-.057 7.328 2.17 10.256 5.389.31.344.31.872-.002 1.219-2.92 3.213-6.848 5.446-10.254 5.39-3.432.056-7.36-2.178-10.279-5.392a.912.912 0 0 1 .002-1.22c2.922-3.216 6.872-5.443 10.251-5.386zM15 12a3 3 0 1 1-6 .004 3 3 0 0 1 6-.007V12zm1.5 0v-.003a4.5 4.5 0 1 0-9-.002 4.5 4.5 0 0 0 9 .005z"></path></svg>
                                                        </button>
                                                        <!--<svg id="svgHidePassword" hidden="" onclick="showPassword(false)" xmlns="http://www.w3.org/2000/svg" width="20px" height="20px" viewBox="0 0 24 24"><path d="M12.013 4.501c-3.88-.065-8.202 2.372-11.39 5.88a2.414 2.414 0 0 0-.001 3.232c3.183 3.506 7.481 5.95 11.39 5.885 3.885.066 8.183-2.378 11.367-5.883.83-.92.83-2.314.002-3.232-3.194-3.512-7.515-5.947-11.394-5.882zm0 1.5c3.378-.057 7.328 2.17 10.256 5.389.31.344.31.872-.002 1.219-2.92 3.213-6.848 5.446-10.254 5.39-3.432.056-7.36-2.178-10.279-5.392a.912.912 0 0 1 .002-1.22c2.922-3.216 6.872-5.443 10.251-5.386zM15 12a3 3 0 1 1-6 .004 3 3 0 0 1 6-.007V12zm1.5 0v-.003a4.5 4.5 0 1 0-9-.002 4.5 4.5 0 0 0 9 .005z"></path></svg>-->
                                                        <button class="btn btn-default" id="btnHidePassword3" hidden="" onclick="event.preventDefault();
                                                                showPassword(false, 3);">
                                                            <svg xmlns="http://www.w3.org/2000/svg" width="20px" height="20px" viewBox="0 0 24 24"><path d="M3.302 21.541l18.75-18a.75.75 0 1 0-1.038-1.082l-18.75 18a.75.75 0 1 0 1.038 1.082zm5.44-1.774c1.056.328 2.157.491 3.264.483 3.89.066 8.189-2.378 11.373-5.883.83-.92.83-2.314.002-3.232a21.333 21.333 0 0 0-3.189-2.86.75.75 0 0 0-.884 1.21 19.816 19.816 0 0 1 2.962 2.657c.31.344.31.872-.003 1.219-2.92 3.212-6.848 5.446-10.254 5.39a9.272 9.272 0 0 1-2.827-.416.75.75 0 0 0-.444 1.432zm5.852-14.213a10.298 10.298 0 0 0-2.602-.304C8.134 5.186 3.813 7.623.624 11.13c-.83.92-.83 2.315-.002 3.233.829.908 1.73 1.74 2.697 2.49a.75.75 0 1 0 .92-1.184 20.048 20.048 0 0 1-2.506-2.314.912.912 0 0 1 .003-1.218C4.66 8.921 8.61 6.694 11.988 6.75a8.854 8.854 0 0 1 2.244.26.75.75 0 1 0 .362-1.456zM9 12.75c0-1.656 1.342-3 2.998-3H12a.75.75 0 0 0 0-1.5h-.002a4.499 4.499 0 0 0-4.498 4.5.75.75 0 0 0 1.5 0zm6 0a3 3 0 0 1-3 3 .75.75 0 0 0 0 1.5h.001a4.5 4.5 0 0 0 4.499-4.501.75.75 0 0 0-1.5 0z"></path></svg>
                                                        </button>
                                                    </div>
                                                </div>
                                            </div>
                                            <div id="message" style="color: red; padding-left: 15px">
                                                ${message}
                                            </div>
                                        </div>
                                        <div class="submit-section">
                                            <button class="btn btn-info submit-btn">Save</button>
                                        </div>
                                    </form>
                                    <div class="col-sm-2 text-secondary">
                                        <a href="" id="btnEditPassword" class="btnEdit" onclick="event.preventDefault(); editPassword(true);" style="text-decoration: none" ${hasMessage ? " hidden" : ""}>Edit</a>
                                        <a href="" id="btnCancelEditPassword" onclick="event.preventDefault();
                                                editPassword(false);" style="text-decoration: none" ${hasMessage == false ? " hidden" : ""}>Cancel</a>
                                    </div>
                                </div>
                                <hr>
                                <div class="row">
                                    <div class="col-sm-3">
                                        <h6 class="mb-0">Delete Account</h6>
                                    </div>
                                    <div class="col-sm-6 text-secondary" id="deleteAccDiv">
                                        Permanently delete your account
                                    </div>
                                    <form class="col-sm-6 text-secondary" action="customer" method="post" id="deleteAccForm" hidden="">
                                        <input type="hidden" name="do" value="deleteAccount">
                                        <input type="hidden" name="Id" value="${cusInfo.getId()}">
                                        <div class="row">
                                            <div class="col-sm-12 col-md-12">
                                                <div class="form-group">
                                                    <label class="col-form-label">Do you really want to delete your account? Once it has been done, you cannot undo it!</label>
                                                </div>
                                            </div>
                                            <div class="col-sm-12 col-md-12">
                                                <div class="form-group">
                                                    <label class="col-form-label">Click yes to proceed delete!</label>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="submit-section">
                                            <button class="btn btn-info submit-btn">Yes</button>
                                        </div>
                                    </form>
                                    <div class="col-sm-3 text-secondary" id="submit-section">
                                        <a href="" id="btnEditDeleteAcc" class="btnEdit" onclick="event.preventDefault(), editDeleteAcc(true)" style="text-decoration: none">Delete account</a>
                                        <a href="" id="btnCancelEditDeleteAcc" onclick="event.preventDefault(), editDeleteAcc(false)" style="text-decoration: none" hidden="">Cancel</a>
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
                /*margin-top:20px;*/
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
