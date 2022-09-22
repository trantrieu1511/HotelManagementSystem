<%-- 
    Document   : manage-account
    Created on : Sep 16, 2022, 12:30:33 PM
    Author     : DELL
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Manage Account Page</title>
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
                <br>
                <div>
                    <h2>
                        Account settings
                    </h2>
                    Manage your experience
                </div>
                <br>

                <div class="row gutters-sm">
                    <div class="col-md-6 mb-3">
                        <div class="card">
                            <div class="card-body">
                                <div class="d-flex flex-column">
                                    <a href="customer?do=displayPersonalDetails" style="text-decoration: none">
                                        <h3>
                                            <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" viewBox="0 0 24 24"><path d="M22.5 17.25a5.25 5.25 0 1 1-10.5 0 5.25 5.25 0 0 1 10.5 0zm1.5 0a6.75 6.75 0 1 0-13.5 0 6.75 6.75 0 0 0 13.5 0zm-7.5-3v6a.75.75 0 0 0 1.5 0v-6a.75.75 0 0 0-1.5 0zM14.25 18h6a.75.75 0 0 0 0-1.5h-6a.75.75 0 0 0 0 1.5zM1.5 17.25a6.003 6.003 0 0 1 8.356-5.518.75.75 0 0 0 .588-1.38A7.504 7.504 0 0 0 0 17.25a.75.75 0 0 0 1.5 0zm9.375-12.375a3.375 3.375 0 1 1-6.75 0 3.375 3.375 0 0 1 6.75 0zm1.5 0a4.875 4.875 0 1 0-9.75 0 4.875 4.875 0 0 0 9.75 0z"></path></svg>
                                            <span class="text-secondary">Personal details</span>
                                        </h3>
                                        <div class="mt-3">
                                            <p class="text-secondary mb-1">Update your information and find out how it's used.</p>
                                            <p class="text-muted font-size-sm">Manage personal details</p>
                                        </div>
                                    </a>
                                </div>
                            </div>
                        </div>
                        <hr>
                        <div class="card">
                            <div class="card-body">
                                <div class="d-flex flex-column">
                                    <a href="customer?do=displayAccountSecurity" style="text-decoration: none">
                                        <h3>
                                            <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" viewBox="0 0 24 24"><path d="M19.5 16.5v5.25a.75.75 0 0 1-.75.75H5.25a.75.75 0 0 1-.75-.75v-10.5a.75.75 0 0 1 .75-.75h13.5a.75.75 0 0 1 .75.75v5.25zm1.5 0v-5.25A2.25 2.25 0 0 0 18.75 9H5.25A2.25 2.25 0 0 0 3 11.25v10.5A2.25 2.25 0 0 0 5.25 24h13.5A2.25 2.25 0 0 0 21 21.75V16.5zM7.5 9.75V6a4.5 4.5 0 0 1 9 0v3.75a.75.75 0 0 0 1.5 0V6A6 6 0 0 0 6 6v3.75a.75.75 0 0 0 1.5 0zM12 15a1.125 1.125 0 1 0 .004 0h-.006a.75.75 0 0 0 .004 1.5H12a.375.375 0 1 1 0-.75.375.375 0 0 1 0 .75.75.75 0 0 0 0-1.5z"></path></svg>
                                            <span class="text-secondary">Security</span>
                                        </h3>
                                        <div class="mt-3">
                                            <p class="text-secondary mb-1">Adjust your security settings.</p>
                                            <p class="text-muted font-size-sm">Manage account security</p>
                                        </div>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!--                    <div class="col-md-8">
                                            <div class="card mb-3">
                                                <div class="card-body">
                                                    <div class="mt-3">
                                                        <h4>Personal Detail</h4>
                                                        <p class="text-secondary mb-1">Update your information and find out how it's used.</p>
                                                        <p class="text-muted font-size-sm">Bay Area, San Francisco, CA</p>
                                                                                                <button class="btn btn-primary">Follow</button>
                                                                                                <button class="btn btn-outline-primary">Message</button>
                                                    </div>
                                                    <hr>
                                                    <div class="row">
                                                        <div class="col-sm-3">
                                                            <h6 class="mb-0">Full Name</h6>
                                                        </div>
                                                        <div class="col-sm-8 text-secondary">
                                                            Kenneth Valdez
                                                        </div>
                                                        <div class="col-sm-1 text-secondary">
                                                            <a href="" id="editName">Edit</a>
                                                        </div>
                                                    </div>
                                                    <hr>
                                                    <div class="row">
                                                        <div class="col-sm-3">
                                                            <h6 class="mb-0">Email</h6>
                                                        </div>
                                                        <div class="col-sm-8 text-secondary">
                                                            fip@jukmuh.al
                                                        </div>
                                                        <div class="col-sm-1 text-secondary">
                                                            <a href="" id="editEmail">Edit</a>
                                                        </div>
                                                    </div>
                                                    <hr>
                                                    <div class="row">
                                                        <div class="col-sm-3">
                                                            <h6 class="mb-0">PhoneNumber</h6>
                                                        </div>
                                                        <div class="col-sm-8 text-secondary">
                                                            (239) 816-9029
                                                        </div>
                                                        <div class="col-sm-1 text-secondary">
                                                            <a href="" id="editPhoneNumber">Edit</a>
                                                        </div>
                                                    </div>
                                                    <hr>
                                                    <div class="row">
                                                        <div class="col-sm-3">
                                                            <h6 class="mb-0">Gender</h6>
                                                        </div>
                                                        <div class="col-sm-8 text-secondary">
                                                            (320) 380-4539
                                                        </div>
                                                        <div class="col-sm-1 text-secondary">
                                                            <a href="" id="editGender">Edit</a>
                                                        </div>
                                                    </div>
                                                    <hr>
                                                    <div class="row">
                                                        <div class="col-sm-3">
                                                            <h6 class="mb-0">DOB</h6>
                                                        </div>
                                                        <div class="col-sm-8 text-secondary">
                                                            15/11/2002
                                                        </div>
                                                        <div class="col-sm-1 text-secondary">
                                                            <a href="" id="editDOB">Edit</a>
                                                        </div>
                                                    </div>
                                                    <hr>
                                                    <div class="row">
                                                        <div class="col-sm-3">
                                                            <h6 class="mb-0">Address</h6>
                                                        </div>
                                                        <div class="col-sm-8 text-secondary">
                                                            Bay Area, San Francisco, CA
                                                        </div>
                                                        <div class="col-sm-1 text-secondary">
                                                            <a href="" id="editAddress">Edit</a>
                                                        </div>
                                                    </div>
                                                    <hr>
                                                                                    <div class="row">
                                                                                        <div class="col-sm-12">
                                                                                            <a class="btn btn-info " target="__blank" href="">Edit</a>
                                                                                        </div>
                                                                                    </div>
                                                </div>
                                            </div>
                    
                                                                    <div class="row gutters-sm">
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
                                                                    </div>
                    
                    
                    
                                        </div>-->
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
