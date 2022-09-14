<%-- 
    Document   : login
    Created on : Sep 10, 2022, 6:24:43 PM
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <link href="css/loginformcss2.css" rel="stylesheet" id="bootstrap-css">
        <!------ Include the above in your HEAD tag ---------->
        <script type="text/javascript">
            function checkEmailOrPhone() {
                var emailOrPhone = document.getElementById('login');
                if (emailOrPhone.value.toString().includes("@")) { //email
                    emailOrPhone.pattern = "[a-zA-Z0-9]{1,18}[@][a-z]{1,8}[.][a-z]{1,8}";
                    emailOrPhone.title = "Email must not contain: Unicode characters, special character e.g: !@#$%^&,. etc.. and whitespaces; \n\
        Allow uppercase, lowercase letters and numeric characters (0-9), max length: 25";
                } else {
                    emailOrPhone.pattern = "[0-9]{10}";
                    emailOrPhone.title = "Phone number must be 10-digit number or please enter your email";
                }
            }
        </script>

    </head>
    <body>
        <div class="wrapper">
            <div id="formContent">
                <!-- Tabs Titles -->

                <!-- Icon -->
                <div class="">
                    <!--<img src="http://danielzawadzki.com/codepen/01/icon.svg" id="icon" alt="User Icon" />-->
                    <div style="margin-top: 15px; font-size: x-large;
                         font-weight: 600;">Register to our Hotel</div>
                </div>
                <hr>

                <!-- Register Form -->
                <form action="authentication" method="POST">
                    <input type="hidden" name="do" value="customerLogin">
                    <div class="row" style="margin-top: 35px; margin-bottom: 15px; margin-left: 30px;">
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label class="col-form-label">First Name <span class="text-danger">*</span></label>
                                <input class="form-control" type="text" name="FirstName" id="first_name" required pattern="[A-Za-zàáãạảăắằẳẵặâấầẩẫậèéẹẻẽêềếểễệđìíĩỉịòóõọỏôốồổỗộơớờởỡợùúũụủưứừửữựỳỵỷỹýÀÁÃẠẢĂẮẰẲẴẶÂẤẦẨẪẬÈÉẸẺẼÊỀẾỂỄỆĐÌÍĨỈỊÒÓÕỌỎÔỐỒỔỖỘƠỚỜỞỠỢÙÚŨỤỦƯỨỪỬỮỰỲỴỶỸÝ ]{1,12}"
                                       title="FirstName not contain: 
                                       Special character e.g: !@#$%^&,. etc.., spacing and numeric characters (0-9);  
                                       allow uppercase and lowercase letters, max length: 12">
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label class="col-form-label">Last Name <span class="text-danger">*</span></label>
                                <input class="form-control" type="text" name="LastName" id="last_name" required pattern="[A-Za-zàáãạảăắằẳẵặâấầẩẫậèéẹẻẽêềếểễệđìíĩỉịòóõọỏôốồổỗộơớờởỡợùúũụủưứừửữựỳỵỷỹýÀÁÃẠẢĂẮẰẲẴẶÂẤẦẨẪẬÈÉẸẺẼÊỀẾỂỄỆĐÌÍĨỈỊÒÓÕỌỎÔỐỒỔỖỘƠỚỜỞỠỢÙÚŨỤỦƯỨỪỬỮỰỲỴỶỸÝ ]{1,12}"
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
                                <input class="form-control" type="password" name="Password" id="password" 
                                       onkeyup="checkconfirmPassword(this)" required pattern="[a-zA-Z0-9]{1,12}"
                                       title="Password not contain: Unicode characters, 
                                       special character e.g: !@#$%^&,. etc.. and spacing characters; 
                                       allow uppercase, lowercase letters and numeric characters (0-9), max length: 12">
                            </div>

                        </div>
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label class="col-form-label">Confirm Password <span class="text-danger">*</span></label>
                                <input class="form-control" type="password" name="ConfirmPassword" id="confirm_password"
                                       onkeyup="checkPassword(this)" required pattern="[a-zA-Z0-9]{1,12}"
                                       title="Confirm Password not contain: Unicode characters, 
                                       special character e.g: !@#$%^&,. etc.. and spacing characters; 
                                       allow uppercase, lowercase letters and numeric characters (0-9), max length: 12">
                            </div>
                            <span id="wrong_pass_alert"></span>
                        </div>
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label class="col-form-label">Phone <span class="text-danger">*</span></label>
                                <input class="form-control" type="text" name="PhoneNumber" id="phone_number" title="phone number must be 10-digit number" pattern="[0-9]{10}">
                            </div>
                        </div>
                    </div>
                    <div class="submit-section" style="text-align: center">
                        <input type="submit" class="" id="create" value="register">
                    </div>
                </form>
            </div>
        </div>
    </body>
</html>
