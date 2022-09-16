<%-- 
    Document   : register
    Created on : Sep 12, 2022, 4:02:50 PM
    Author     : DELL
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register Page</title>
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <link href="css/loginformcss2.css" rel="stylesheet" id="bootstrap-css">
        <!------ Include the above in your HEAD tag ---------->
        <script type="text/javascript">
            function checkPassword(checkpassword) {
                var password = document.getElementById('password').value;
                if ((checkpassword.value && password) != "") {
                    if (checkpassword.value != password) {
                        document.getElementById('wrong_pass_alert').style.color = 'red';
                        document.getElementById('wrong_pass_alert').innerHTML
                                = '☒ Use same password! Confirm password does not match';
                        document.getElementById('create').disabled = true;
                        document.getElementById('create').style.opacity = (0.4);
                    } else {
                        document.getElementById('wrong_pass_alert').style.color = 'green';
                        document.getElementById('wrong_pass_alert').innerHTML =
                                '🗹 Password Matched';
                        document.getElementById('create').disabled = false;
                        document.getElementById('create').style.opacity = (1);
                    }

                } else {
                    document.getElementById('wrong_pass_alert').innerHTML
                            = '';
                    document.getElementById('create').disabled = false;
                    document.getElementById('create').style.opacity = (1);
                }
            }
            function checkconfirmPassword(checkpassword) {
                var confirm_password = document.getElementById('confirm_password').value;
                if ((checkpassword.value && confirm_password) != "") {
                    if (checkpassword.value != confirm_password) {
                        document.getElementById('wrong_pass_alert').style.color = 'red';
                        document.getElementById('wrong_pass_alert').innerHTML
                                = '☒ Use same password! Confirm password does not match';
                        document.getElementById('create').disabled = true;
                        document.getElementById('create').style.opacity = (0.4);
                    } else {
                        document.getElementById('wrong_pass_alert').style.color = 'green';
                        document.getElementById('wrong_pass_alert').innerHTML =
                                '🗹 Password Matched';
                        document.getElementById('create').disabled = false;
                        document.getElementById('create').style.opacity = (1);
                    }

                } else {
                    document.getElementById('wrong_pass_alert').innerHTML
                            = '';
                    document.getElementById('create').disabled = false;
                    document.getElementById('create').style.opacity = (1);
                }
            }

        </script>
        <style>
            div.col-sm-6{
                padding: 0px;
            }
            #formContent{
                max-width: 650px;
                text-align: left;
            }
        </style>
    </head>
    <body>
        <jsp:include page="page-header.jsp"></jsp:include>
        <%--<c:if test="${succeed!=null}">--%>
        <div class="msgbox" style="
             /*border: 2px solid aliceblue;*/
             /*background-color: aliceblue;*/
             padding: 15px; 
             margin: 0% 25% 0% 25%;
             text-align: center">
            <c:if test="${succeed==true}">
                <div style="color: deepskyblue; margin-bottom: 10px">${mess}</div>
            </c:if>
            <c:if test="${succeed==false}">
                <div style="color: red; margin-bottom: 10px">${mess}</div>
            </c:if>
        </div>
        <%--</c:if>--%>
        <div class="" style="
             display: flex;
             align-items: center;
             flex-direction: column;
             /* justify-content: center; */
             width: 100%;
             min-height: 100%;
             padding: 20px;
             ">
            <div id="formContent" style="padding-left: 35px">
                <!-- Tabs Titles -->

                <!-- Icon -->
                <div class="">
                    <!--<img src="http://danielzawadzki.com/codepen/01/icon.svg" id="icon" alt="User Icon" />-->
                    <div style="margin-top: 15px; font-size: x-large;
                         font-weight: 600;">Register to our Hotel</div>
                </div>
                <hr>

                <div>Please fill info into the <span class="text-danger">*</span> field below to register.</div>

                <!-- Register Form -->
                <form action="authentication" accept-charset="utf-8" method="POST">
                    <input type="hidden" name="do" value="register">
                    <div class="row" style="
                         margin-top: 35px; 
                         margin-bottom: 15px; 
                         margin-left: 5px;
                         margin-right: 5px;">
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label class="col-form-label">First Name <span class="text-danger">*</span></label>
                                <input class="form-control" type="text" name="FirstName" id="first_name" placeholder="e.g: Johnson" required pattern="[A-Za-zàáãạảăắằẳẵặâấầẩẫậèéẹẻẽêềếểễệđìíĩỉịòóõọỏôốồổỗộơớờởỡợùúũụủưứừửữựỳỵỷỹýÀÁÃẠẢĂẮẰẲẴẶÂẤẦẨẪẬÈÉẸẺẼÊỀẾỂỄỆĐÌÍĨỈỊÒÓÕỌỎÔỐỒỔỖỘƠỚỜỞỠỢÙÚŨỤỦƯỨỪỬỮỰỲỴỶỸÝ ]{1,12}"
                                       title="FirstName not contain: 
                                       Special character e.g: !@#$%^&,. etc.., spacing and numeric characters (0-9);  
                                       allow uppercase and lowercase letters, max length: 12">
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label class="col-form-label">Last Name <span class="text-danger">*</span></label>
                                <input class="form-control" type="text" name="LastName" id="last_name" placeholder="e.g: Harry" required pattern="[A-Za-zàáãạảăắằẳẵặâấầẩẫậèéẹẻẽêềếểễệđìíĩỉịòóõọỏôốồổỗộơớờởỡợùúũụủưứừửữựỳỵỷỹýÀÁÃẠẢĂẮẰẲẴẶÂẤẦẨẪẬÈÉẸẺẼÊỀẾỂỄỆĐÌÍĨỈỊÒÓÕỌỎÔỐỒỔỖỘƠỚỜỞỠỢÙÚŨỤỦƯỨỪỬỮỰỲỴỶỸÝ ]{1,12}"
                                       title="LastName not contain: 
                                       Special character e.g: !@#$%^&,. etc.., spacing and numeric characters (0-9);  
                                       allow uppercase and lowercase letters, max length: 12">
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label class="col-form-label">Email <span class="text-danger">*</span></label>
                                <input class="form-control" type="text" name="Email" id="email" placeholder="e.g: abc@mail.com" required pattern="[a-zA-Z0-9]{1,12}[@][a-z]{1,6}[.][a-z]{1,6}"
                                       title="email not allow: Unicode characters, 
                                       special character other than @ and . and spacing characters;  
                                       allow uppercase, lowercase letters and numeric characters (0-9);
                                       maximum length of parts of email: 
                                       username: 20, mail server: 12, domain: 12; 
                                       max length: 46">
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label class="col-form-label">Password <span class="text-danger">*</span></label>
                                <input class="form-control" type="password" name="Password" id="password" placeholder="Enter your password"
                                       onkeyup="checkconfirmPassword(this)" required pattern="[a-zA-Z0-9]{1,12}"
                                       title="Password not contain: Unicode characters, 
                                       special character e.g: !@#$%^&,. etc.. and spacing characters; 
                                       allow uppercase, lowercase letters and numeric characters (0-9), max length: 12">
                            </div>

                        </div>
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label class="col-form-label">Confirm Password <span class="text-danger">*</span></label>
                                <input class="form-control" type="password" name="ConfirmPassword" id="confirm_password" placeholder="Re-enter your password"
                                       onkeyup="checkPassword(this)" required pattern="[a-zA-Z0-9]{1,12}"
                                       title="Confirm Password not contain: Unicode characters, 
                                       special character e.g: !@#$%^&,. etc.. and spacing characters; 
                                       allow uppercase, lowercase letters and numeric characters (0-9), max length: 12">
                            </div>
                            <span id="wrong_pass_alert"></span>
                        </div>
                        <!--                        <div class="col-sm-6">
                                                    <div class="form-group">
                                                        <label class="col-form-label">Phone <span class="text-danger">*</span></label>
                                                        <input class="form-control" type="text" name="PhoneNumber" id="phone_number" title="phone number must be 10-digit number" pattern="[0-9]{10}">
                                                    </div>
                                                </div>-->
                    </div>
                    <div class="submit-section" style="text-align: center; margin-right: 30px;">
                        <input type="submit" class="" id="create" value="register">
                    </div>
                </form>
            </div>
        </div>
    </body>
</html>
