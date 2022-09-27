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
        <style>
            .wrapper{
                background-color: #f7f7ff;
            }
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
            #formContent{
                /*box-shadow: none;*/
                /*border: 1px solid black;*/
            }

        </style>
    </head>
    <body>
        <jsp:include page="page-header.jsp"></jsp:include>
            <div class="wrapper">
                <div id="formContent">
                    <!-- Tabs Titles -->

                    <!-- Icon -->
                    <div class="">
                        <!--<img src="http://danielzawadzki.com/codepen/01/icon.svg" id="icon" alt="User Icon" />-->
                        <div style="margin-top: 15px; font-size: x-large;
                             font-weight: 600;">Login to our Hotel</div>
                    </div>
                    <hr>

                    <!-- Login Form -->
                    <form action="authentication" method="POST">
                        <input type="hidden" name="do" value="customerLogin">
                        <div style="text-align: left; margin-left: 35px;
                             ">Email: <span class="text-danger">*</span></div>
                        <input type="text" id="login" class="" name="EmailOrPhone" required="" placeholder="enter email or phone number"
                               onkeyup="checkEmailOrPhone()">
                        <br>
                        <div style="text-align: left; margin-left: 35px; margin-top: 15px;
                             ">Password: <span class="text-danger">*</span></div>
                        <input type="password" id="password" class="" name="Password" required="" placeholder="enter password" pattern="[a-zA-Z0-9]{1,25}"
                               title="Password must not contain: Unicode characters, 
                               special character e.g: !@#$%^&,. etc.. and whitespaces; 
                               Allow uppercase, lowercase letters and numeric characters (0-9), max length: 25">
                        <br>
                        <span class="text-danger">${mess}</span>
                    <input type="submit" class="" value="Log In" style="
                           margin-top: 2rem;
                           padding-left: 168px;
                           padding-right: 168px;
                           box-shadow: none;
                           ">
                </form>

                <!-- Remind Password -->
                <div id="formFooter">
                    <a class="underlineHover" href="#">Forgot Password?</a><br>
                    Don't have an account? Register <a class="underlineHover" href="register.jsp">here</a>
                </div>

            </div>
        </div>
    </body>
</html>
