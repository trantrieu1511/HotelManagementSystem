<%-- 
    Document   : personal-details
    Created on : Sep 15, 2022, 9:08:09 PM
    Author     : DELL
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Personal Detail Page</title>
        <!--  This file has been downloaded from bootdey.com @bootdey on twitter -->
        <!--  All snippets are MIT license http://bootdey.com/license -->
        <title>profile with data and skills - Bootdey.com</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/js/bootstrap.bundle.min.js"></script>
    </head>
    <body>
        <jsp:include page="page-header.jsp"></jsp:include>
            <div class="container">
                <div class="main-body">

                    <!-- Breadcrumb -->
                    <!--                <nav aria-label="breadcrumb" class="main-breadcrumb">
                                        <ol class="breadcrumb">
                                            <li class="breadcrumb-item"><a href="index.html">Home</a></li>
                                            <li class="breadcrumb-item"><a href="javascript:void(0)">User</a></li>
                                            <li class="breadcrumb-item active" aria-current="page">User Profile</li>
                                        </ol>
                                    </nav>-->
                    <!-- /Breadcrumb -->

                    <div class="row gutters-sm">
                    <jsp:include page="settings-menu.jsp"></jsp:include>
                        <div class="col-md-8">
                            <div class="card mb-3">
                                <div class="card-body">
                                    <div class="mt-3">
                                        <h4>Personal Detail</h4>
                                        <p class="text-secondary mb-1">Update your information and find out how it's used.</p>
                                        <!--<p class="text-muted font-size-sm">Bay Area, San Francisco, CA</p>-->
                                        <!--                                        <button class="btn btn-primary">Follow</button>
                                                                                <button class="btn btn-outline-primary">Message</button>-->
                                    </div>
                                    <hr>
                                    <div class="row">
                                        <div class="col-sm-3">
                                            <h6 class="mb-0">Full Name</h6>
                                        </div>
                                        <div class="col-sm-7 text-secondary">
                                        ${cusInfo.getLastName()} ${cusInfo.getFirstName()}
                                    </div>
                                    <div class="col-sm-2 text-secondary">
                                        <a href="" id="editName" onclick="event.preventDefault()" style="text-decoration: none">Edit</a>
                                    </div>
                                </div>
                                <hr>
                                <div class="row">
                                    <div class="col-sm-3">
                                        <h6 class="mb-0">Email</h6>
                                    </div>
                                    <div class="col-sm-7 text-secondary">
                                        ${cusInfo.getEmail()}
                                    </div>
                                    <div class="col-sm-2 text-secondary">
                                        <a href="" id="editEmail" onclick="event.preventDefault()" style="text-decoration: none">Edit</a>
                                    </div>
                                </div>
                                <hr>
                                <div class="row">
                                    <div class="col-sm-3">
                                        <h6 class="mb-0">PhoneNumber</h6>
                                    </div>
                                    <div class="col-sm-7 text-secondary">
                                        ${cusInfo.getPhoneNumber()}
                                        <c:if test="${cusInfo.getPhoneNumber()==null}">
                                            <span>Enter your phone number</span>
                                        </c:if>
                                    </div>
                                    <div class="col-sm-2 text-secondary">
                                        <a href="" id="editPhoneNumber" onclick="event.preventDefault()" style="text-decoration: none">Edit</a>
                                    </div>
                                </div>
                                <hr>
                                <div class="row">
                                    <div class="col-sm-3">
                                        <h6 class="mb-0">Gender</h6>
                                    </div>
                                    <div class="col-sm-7 text-secondary">
                                        <c:if test="${cusInfo.isGender() == true}">
                                            Male
                                        </c:if>
                                        <c:if test="${cusInfo.isGender() == false}">
                                            Female
                                        </c:if>
                                        <c:if test="${cusInfo.isGender()==null}">
                                            <span>Select your gender</span>
                                        </c:if>
                                    </div>
                                    <div class="col-sm-2 text-secondary">
                                        <a href="" id="editGender" onclick="event.preventDefault()" style="text-decoration: none">Edit</a>
                                    </div>
                                </div>
                                <hr>
                                <div class="row">
                                    <div class="col-sm-3">
                                        <h6 class="mb-0">DOB</h6>
                                    </div>
                                    <div class="col-sm-7 text-secondary">
                                        ${cusInfo.getDOB()}
                                        <c:if test="${cusInfo.getDOB()==null}">
                                            <span>Enter your dob</span>
                                        </c:if>
                                    </div>
                                    <div class="col-sm-2 text-secondary">
                                        <a href="" id="editDOB" onclick="event.preventDefault()" style="text-decoration: none">Edit</a>
                                    </div>
                                </div>
                                <hr>
                                <div class="row">
                                    <div class="col-sm-3">
                                        <h6 class="mb-0">Address</h6>
                                    </div>
                                    <div class="col-sm-7 text-secondary">
                                        ${cusInfo.getAddress()}
                                        <c:if test="${cusInfo.getAddress()==null}">
                                            <span>Enter your address</span>
                                        </c:if>
                                    </div>
                                    <div class="col-sm-2 text-secondary">
                                        <a href="" id="editAddress" onclick="event.preventDefault()" style="text-decoration: none">Edit</a>
                                    </div>
                                </div>
                                <hr>
                                <!--                                <div class="row">
                                                                    <div class="col-sm-3">
                                                                        <h6 class="mb-0">Password</h6>
                                                                    </div>
                                                                    <div class="col-sm-7 text-secondary">
                                ${cusInfo.getPassword()}
                            </div>
                            <div class="col-sm-2 text-secondary">
                                <a href="" id="editPassword" onclick="event.preventDefault()" style="text-decoration: none">Edit</a>
                            </div>
                        </div>
                        <hr>-->
                                <!--                                <div class="row">
                                                                    <div class="col-sm-12">
                                                                        <a class="btn btn-info " target="__blank" href="">Edit</a>
                                                                    </div>
                                                                </div>-->
                            </div>
                        </div>

                        <!--                        <div class="row gutters-sm">
                                                    <div class="col-sm-6 mb-3">
                                                        <div class="card h-100">
                                                            <div class="card-body">
                                                                <h6 class="d-flex align-items-center mb-3"><i class="material-icons text-info mr-2">assignment</i>Project Status</h6>
                                                                <small>Web Design</small>
                                                                <div class="progress mb-3" style="height: 5px">
                                                                    <div class="progress-bar bg-primary" role="progressbar" style="width: 80%" aria-valuenow="80" aria-valuemin="0" aria-valuemax="100"></div>
                                                                </div>
                                                                <small>Website Markup</small>
                                                                <div class="progress mb-3" style="height: 5px">
                                                                    <div class="progress-bar bg-primary" role="progressbar" style="width: 72%" aria-valuenow="72" aria-valuemin="0" aria-valuemax="100"></div>
                                                                </div>
                                                                <small>One Page</small>
                                                                <div class="progress mb-3" style="height: 5px">
                                                                    <div class="progress-bar bg-primary" role="progressbar" style="width: 89%" aria-valuenow="89" aria-valuemin="0" aria-valuemax="100"></div>
                                                                </div>
                                                                <small>Mobile Template</small>
                                                                <div class="progress mb-3" style="height: 5px">
                                                                    <div class="progress-bar bg-primary" role="progressbar" style="width: 55%" aria-valuenow="55" aria-valuemin="0" aria-valuemax="100"></div>
                                                                </div>
                                                                <small>Backend API</small>
                                                                <div class="progress mb-3" style="height: 5px">
                                                                    <div class="progress-bar bg-primary" role="progressbar" style="width: 66%" aria-valuenow="66" aria-valuemin="0" aria-valuemax="100"></div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-sm-6 mb-3">
                                                        <div class="card h-100">
                                                            <div class="card-body">
                                                                <h6 class="d-flex align-items-center mb-3"><i class="material-icons text-info mr-2">assignment</i>Project Status</h6>
                                                                <small>Web Design</small>
                                                                <div class="progress mb-3" style="height: 5px">
                                                                    <div class="progress-bar bg-primary" role="progressbar" style="width: 80%" aria-valuenow="80" aria-valuemin="0" aria-valuemax="100"></div>
                                                                </div>
                                                                <small>Website Markup</small>
                                                                <div class="progress mb-3" style="height: 5px">
                                                                    <div class="progress-bar bg-primary" role="progressbar" style="width: 72%" aria-valuenow="72" aria-valuemin="0" aria-valuemax="100"></div>
                                                                </div>
                                                                <small>One Page</small>
                                                                <div class="progress mb-3" style="height: 5px">
                                                                    <div class="progress-bar bg-primary" role="progressbar" style="width: 89%" aria-valuenow="89" aria-valuemin="0" aria-valuemax="100"></div>
                                                                </div>
                                                                <small>Mobile Template</small>
                                                                <div class="progress mb-3" style="height: 5px">
                                                                    <div class="progress-bar bg-primary" role="progressbar" style="width: 55%" aria-valuenow="55" aria-valuemin="0" aria-valuemax="100"></div>
                                                                </div>
                                                                <small>Backend API</small>
                                                                <div class="progress mb-3" style="height: 5px">
                                                                    <div class="progress-bar bg-primary" role="progressbar" style="width: 66%" aria-valuenow="66" aria-valuemin="0" aria-valuemax="100"></div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>-->
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
