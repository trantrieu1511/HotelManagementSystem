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
        <script src="js/customer-account-settings.js"></script>
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
                                        <div class="col-sm-7 text-secondary" id="fullNameDiv">
                                        ${cusInfo.getLastName()} ${cusInfo.getFirstName()}
                                    </div>
                                    <form class="col-sm-7 text-secondary" id="fullNameForm" action="customer" hidden="">
                                        <input type="hidden" name="do" value="editFullName">
                                        <div class="row">
                                            <div class="col-sm-12 col-md-6">
                                                <div class="form-group">
                                                    <label class="col-form-label" for="first_name">First Name <span class="text-danger">*</span></label>
                                                    <input class="form-control" type="text" name="FirstName" id="first_name" placeholder="e.g: Johnson" required pattern="[A-Za-zàáãạảăắằẳẵặâấầẩẫậèéẹẻẽêềếểễệđìíĩỉịòóõọỏôốồổỗộơớờởỡợùúũụủưứừửữựỳỵỷỹýÀÁÃẠẢĂẮẰẲẴẶÂẤẦẨẪẬÈÉẸẺẼÊỀẾỂỄỆĐÌÍĨỈỊÒÓÕỌỎÔỐỒỔỖỘƠỚỜỞỠỢÙÚŨỤỦƯỨỪỬỮỰỲỴỶỸÝ ]{1,12}"
                                                           title="FirstName not contain: 
                                                           Special character e.g: !@#$%^&,. etc.., spacing and numeric characters (0-9);  
                                                           allow uppercase and lowercase letters, max length: 12">
                                                </div>
                                            </div>
                                            <div class="col-sm-12 col-md-6">
                                                <div class="form-group">
                                                    <label class="col-form-label" for="last_name">Last Name <span class="text-danger">*</span></label>
                                                    <input class="form-control" type="text" name="LastName" id="last_name" placeholder="e.g: Harry" required pattern="[A-Za-zàáãạảăắằẳẵặâấầẩẫậèéẹẻẽêềếểễệđìíĩỉịòóõọỏôốồổỗộơớờởỡợùúũụủưứừửữựỳỵỷỹýÀÁÃẠẢĂẮẰẲẴẶÂẤẦẨẪẬÈÉẸẺẼÊỀẾỂỄỆĐÌÍĨỈỊÒÓÕỌỎÔỐỒỔỖỘƠỚỜỞỠỢÙÚŨỤỦƯỨỪỬỮỰỲỴỶỸÝ ]{1,12}"
                                                           title="LastName not contain: 
                                                           Special character e.g: !@#$%^&,. etc.., spacing and numeric characters (0-9);  
                                                           allow uppercase and lowercase letters, max length: 12">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="submit-section">
                                            <button class="btn btn-info submit-btn">Save</button>
                                        </div>
                                        <!--<input type="submit" value="Save">-->
                                    </form>
                                    <div class="col-sm-2 text-secondary">
                                        <a href="" id="btnEditName" class="btnEdit" onclick="event.preventDefault(); checkEditName();" style="text-decoration: none">Edit</a>
                                        <a href="" id="btnCancelEditName" onclick="event.preventDefault(); cancelEditName();" style="text-decoration: none" hidden="">Cancel</a>
                                    </div>
                                </div>
                                <hr>
                                <div class="row">
                                    <div class="col-sm-3">
                                        <h6 class="mb-0">Email</h6>
                                    </div>
                                    <div class="col-sm-7 text-secondary" id="emailDiv">
                                        ${cusInfo.getEmail()}
                                    </div>
                                    <form class="col-sm-7 text-secondary" id="emailForm" action="customer" hidden="">
                                        <input type="hidden" name="do" value="editEmail">
                                        <div class="row">
                                            <div class="col-sm-12 col-md-6">
                                                <div class="form-group">
                                                    <label class="col-form-label" for="email">Email <span class="text-danger">*</span></label>
                                                    <input class="form-control" type="text" name="Email" id="email" placeholder="e.g: abc@mail.com" required pattern="[a-zA-Z0-9]{1,12}[@][a-z]{1,6}[.][a-z]{1,6}"
                                                           title="email not allow: Unicode characters, 
                                                           special character other than @ and . and spacing characters;  
                                                           allow uppercase, lowercase letters and numeric characters (0-9);
                                                           maximum length of parts of email: 
                                                           username: 20, mail server: 12, domain: 12; 
                                                           max length: 46">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="submit-section">
                                            <button class="btn btn-info submit-btn">Save</button>
                                        </div>
                                    </form>
                                    <div class="col-sm-2 text-secondary">
                                        <a href="" id="btnEditEmail" class="btnEdit" onclick="event.preventDefault(); editEmail(true);" style="text-decoration: none">Edit</a>
                                        <a href="" id="btnCancelEditEmail" onclick="event.preventDefault(); editEmail(false);" style="text-decoration: none" hidden="">Cancel</a>
                                    </div>
                                </div>
                                <hr>
                                <div class="row">
                                    <div class="col-sm-3">
                                        <h6 class="mb-0">PhoneNumber</h6>
                                    </div>
                                    <div class="col-sm-7 text-secondary" id="phoneNumberDiv">
                                        ${cusInfo.getPhoneNumber()}
                                        <c:if test="${cusInfo.getPhoneNumber()==null}">
                                            <span>Enter your phone number</span>
                                        </c:if>
                                    </div>
                                    <form class="col-sm-7 text-secondary" id="phoneNumberForm" action="customer" hidden="">
                                        <input type="hidden" name="do" value="editPhoneNumber">
                                        <div class="row">
                                            <div class="col-sm-12 col-md-6">
                                                <div class="form-group">
                                                    <label class="col-form-label" for="phone_number">Phone <span class="text-danger">*</span></label>
                                                    <input class="form-control" type="text" name="PhoneNumber" id="phone_number" required pattern="[0-9]{10}"
                                                           title="phone number must be 10-digit number">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="submit-section">
                                            <button class="btn btn-info submit-btn">Save</button>
                                        </div>
                                    </form>
                                    <div class="col-sm-2 text-secondary">
                                        <a href="" id="btnEditPhoneNumber" class="btnEdit" onclick="event.preventDefault(); editPhoneNumber(true);" style="text-decoration: none">Edit</a>
                                        <a href="" id="btnCancelEditPhoneNumber" onclick="event.preventDefault(); editPhoneNumber(false);" style="text-decoration: none" hidden="">Cancel</a>
                                    </div>
                                </div>
                                <hr>
                                <div class="row">
                                    <div class="col-sm-3">
                                        <h6 class="mb-0">Gender</h6>
                                    </div>
                                    <div class="col-sm-7 text-secondary" id="genderDiv">
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
                                    <style>
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
                                    </style>
                                    <form class="col-sm-7 text-secondary" id="genderForm" action="customer" hidden="">
                                        <input type="hidden" name="do" value="editGender">
                                        <div class="row">
                                            <div class="col-sm-12 col-md-6">
                                                <div class="form-group">
                                                    <label class="col-form-label" for="Gender">Gender <span class="text-danger">*</span></label><br>
                                                    <!--                                                    <select id="Gender" name="Gender">
                                                                                                            <option value="true">Male</option>
                                                                                                            <option value="false">Female</option>
                                                                                                        </select>-->
                                                    <div class="row">
                                                        <div class="col-sm-12 col-md-6">
                                                            <!--<span class="form-control">-->
                                                            <input type="radio" name="Gender" id="Male" value="true">
                                                            <label class="col-form-label" for="Male">Male</label>
                                                            <!--</span>-->
                                                        </div>
                                                        <div class="col-sm-12 col-md-6" style="padding-right: 0px">
                                                            <!--<span class="form-control">-->
                                                            <input type="radio" name="Gender" id="Female" value="false">
                                                            <label class="col-form-label" for="Female">Female</label>
                                                            <!--</span>-->
                                                        </div>
                                                        <!--&nbsp;&nbsp;&nbsp;&nbsp;-->
                                                    </div>

                                                </div>
                                            </div>
                                        </div>
                                        <div class="submit-section">
                                            <button class="btn btn-info submit-btn">Save</button>
                                        </div>
                                    </form>
                                    <div class="col-sm-2 text-secondary">
                                        <a href="" id="btnEditGender" class="btnEdit" onclick="event.preventDefault(); editGender(true);" style="text-decoration: none">Edit</a>
                                        <a href="" id="btnCancelEditGender" onclick="event.preventDefault(); editGender(false);" style="text-decoration: none" hidden="">Cancel</a>
                                    </div>
                                </div>
                                <hr>
                                <div class="row">
                                    <div class="col-sm-3">
                                        <h6 class="mb-0">DOB</h6>
                                    </div>
                                    <div class="col-sm-7 text-secondary" id="dobDiv">
                                        ${cusInfo.getDOB()}
                                        <c:if test="${cusInfo.getDOB()==null}">
                                            <span>Enter your dob</span>
                                        </c:if>
                                    </div>
                                    <form class="col-sm-7 text-secondary" id="dobForm" action="customer" hidden="">
                                        <input type="hidden" name="do" value="editDOB">
                                        <div class="row">
                                            <!--                                            <div class="col-sm-12 col-md-6">
                                                                                            <label for="Day">Date of Birth <span class="text-danger">*</span></label>
                                                                                            <div class="form-group">
                                            
                                                                                                <input type="text" name="Day" id="Day" placeholder="Day">
                                                                                            </div>
                                                                                        </div>
                                                                                        <div class="col-sm-12 col-md-6">
                                                                                            <div class="form-group">
                                            
                                                                                                <select name="Month">
                                                                                                    <option value="1"></option>
                                                                                                    <option></option>
                                                                                                </select>
                                                                                                <input type="text" name="Month" id="Month" placeholder="Month">
                                                                                            </div>
                                                                                        </div>
                                                                                        <div class="col-sm-12 col-md-6">
                                                                                            <div class="form-group">
                                            
                                                                                                <input type="text" name="Year" id="Year" placeholder="Year">
                                                                                            </div>
                                                                                        </div>-->
                                            <div class="col-sm-12 col-md-6">
                                                <div class="form-group">
                                                    <label class="col-form-label" for="DOB">Date of Birth <span class="text-danger">*</span></label>
                                                    <input class="form-control" type="date" name="DOB" id="DOB" required="" onkeydown="event.preventDefault()">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="submit-section">
                                            <button class="btn btn-info submit-btn">Save</button>
                                        </div>
                                    </form>
                                    <div class="col-sm-2 text-secondary">
                                        <a href="" id="btnEditDOB" class="btnEdit" onclick="event.preventDefault(); editDOB(true);" style="text-decoration: none">Edit</a>
                                        <a href="" id="btnCancelEditDOB" onclick="event.preventDefault(); editDOB(false);" style="text-decoration: none" hidden="">Cancel</a>
                                    </div>
                                </div>
                                <hr>
                                <div class="row">
                                    <div class="col-sm-3">
                                        <h6 class="mb-0">Address</h6>
                                    </div>
                                    <div class="col-sm-7 text-secondary" id="addressDiv">
                                        ${cusInfo.getAddress()}
                                        <c:if test="${cusInfo.getAddress()==null}">
                                            <span>Enter your address</span>
                                        </c:if>
                                    </div>
                                    <form class="col-sm-7 text-secondary" id="addressForm" action="customer" hidden="">
                                        <input type="hidden" name="do" value="editAddress">
                                        <div class="row">
                                            <div class="col-sm-12 col-md-6">
                                                <div class="form-group">
                                                    <label for="address">Address <span class="text-danger">*</span></label>
                                                    <input type="text" class="form-control" id="address" name="Address" value="" required pattern="[A-Za-z0-9àáãạảăắằẳẵặâấầẩẫậèéẹẻẽêềếểễệđìíĩỉịòóõọỏôốồổỗộơớờởỡợùúũụủưứừửữựỳỵỷỹýÀÁÃẠẢĂẮẰẲẴẶÂẤẦẨẪẬÈÉẸẺẼÊỀẾỂỄỆĐÌÍĨỈỊÒÓÕỌỎÔỐỒỔỖỘƠỚỜỞỠỢÙÚŨỤỦƯỨỪỬỮỰỲỴỶỸÝ., ]{1,100}"
                                                           title="Address must not contain: 
                                                           Special character e.g: !@#$%^&,. etc..; 
                                                           Allow uppercase, lowercase letters, whitespaces 
                                                           and numeric characters (0-9), max length: 100"
                                                           >
                                                </div>
                                            </div>
                                        </div>
                                        <div class="submit-section">
                                            <button class="btn btn-info submit-btn">Save</button>
                                        </div>
                                    </form>
                                    <div class="col-sm-2 text-secondary">
                                        <a href="" id="btnEditAddress" class="btnEdit" onclick="event.preventDefault(); editAddress(true);" style="text-decoration: none">Edit</a>
                                        <a href="" id="btnCancelEditAddress" onclick="event.preventDefault(); editAddress(false);" style="text-decoration: none" hidden="">Cancel</a>
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
