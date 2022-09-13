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
        <title>JSP Page</title>
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <link href="../css/loginformcss2.css" rel="stylesheet" id="bootstrap-css">
        <!------ Include the above in your HEAD tag ---------->
    </head>
    <body>
        <div class="wrapper">
            <div id="formContent">
                <!-- Tabs Titles -->

                <!-- Icon -->
                <div class="">
                    <!--<img src="http://danielzawadzki.com/codepen/01/icon.svg" id="icon" alt="User Icon" />-->
                    <div style="margin-top: 15px;">Login to our Hotel</div>
                </div>
                <hr>

                <!-- Login Form -->
                <form action="authentication" method="POST">
                    <input type="hidden" name="do" value="login">
                    <div style="text-align: left; margin-left: 35px;
                         ">Username: <span class="text-danger">*</span></div>
                    <input type="text" id="login" class="" name="Username"  placeholder="enter username" pattern="[a-zA-Z0-9]{1,25}"
                           title="Username must not contain: Unicode characters, 
                           special character e.g: !@#$%^&,. etc.. and whitespaces; 
                           Allow uppercase, lowercase letters and numeric characters (0-9), max length: 25">
                    <div style="text-align: left; margin-left: 35px;
                         ">Password: <span class="text-danger">*</span></div>
                    <input type="password" id="password" class="" name="Password" required="" placeholder="enter password" pattern="[a-zA-Z0-9]{1,25}"
                           title="Password must not contain: Unicode characters, 
                           special character e.g: !@#$%^&,. etc.. and whitespaces; 
                           Allow uppercase, lowercase letters and numeric characters (0-9), max length: 25">
                    <input type="submit" class="" value="Log In">
                </form>

                <!-- Remind Password -->
                <div id="formFooter">
                    <a class="underlineHover" href="#">Forgot Password?</a><br>
                    Or Register a new Account <a class="underlineHover" href="register.jsp">here</a>
                </div>

            </div>
        </div>
    </body>
</html>
