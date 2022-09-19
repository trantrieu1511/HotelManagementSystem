<%-- 
    Document   : Contact
    Created on : Sep 19, 2022, 3:12:12 PM
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Contact Page</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <link href="https://fonts.googleapis.com/css?family=Nunito+Sans:200,300,400,600,700&display=swap" rel="stylesheet">

        <link rel="stylesheet" href="css/open-iconic-bootstrap.min.css">
        <link rel="stylesheet" href="css/animate.css">

        <link rel="stylesheet" href="css/owl.carousel.min.css">
        <link rel="stylesheet" href="css/owl.theme.default.min.css">
        <link rel="stylesheet" href="css/magnific-popup.css">

        <link rel="stylesheet" href="css/aos.css">

        <link rel="stylesheet" href="css/ionicons.min.css">

        <link rel="stylesheet" href="css/bootstrap-datepicker.css">
        <link rel="stylesheet" href="css/jquery.timepicker.css">


        <link rel="stylesheet" href="css/flaticon.css">
        <link rel="stylesheet" href="css/icomoon.css">
        <link rel="stylesheet" href="css/style.css">
    </head>
    <body>
        <jsp:include page="page-header.jsp"></jsp:include>
            <div class="hero-wrap" style="background-image: url('images/bg_3.jpg');">
                <div class="overlay"></div>
                <div class="container">
                    <div class="row no-gutters slider-text d-flex align-itemd-center justify-content-center">
                        <div class="col-md-9 ftco-animate text-center d-flex align-items-end justify-content-center">
                            <div class="text">
                                <p class="breadcrumbs mb-2"><span class="mr-2"><a href="index.html">Home</a></span> <span>Contact Us</span></p>
                                <h1 class="mb-4 bread">Contact Us</h1>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <section class="ftco-section contact-section bg-light">
                <div class="container">
                    <div class="row d-flex mb-5 contact-info">
                        <div class="col-md-12 mb-4">
                            <h2 class="h3">Contact Information</h2>
                        </div>
                        <div class="w-100"></div>
                        <div class="col-md-3 d-flex">
                            <div class="info rounded bg-white p-4">
                                <p><span>Address:</span> 198 West 21th Street, Suite 721 New York NY 10016</p>
                            </div>
                        </div>
                        <div class="col-md-3 d-flex">
                            <div class="info rounded bg-white p-4">
                                <p><span>Phone:</span> <a href="tel://1234567920">+ 1235 2355 98</a></p>
                            </div>
                        </div>
                        <div class="col-md-3 d-flex">
                            <div class="info rounded bg-white p-4">
                                <p><span>Email:</span> <a href="mailto:info@yoursite.com">info@yoursite.com</a></p>
                            </div>
                        </div>
                        <div class="col-md-3 d-flex">
                            <div class="info rounded bg-white p-4">
                                <p><span>Website</span> <a href="#">yoursite.com</a></p>
                            </div>
                        </div>
                    </div>
                    <div class="row block-9">
                        <div class="col-md-6 order-md-last d-flex">
                            <form action="#" class="bg-white p-5 contact-form">
                                <div class="form-group">
                                    <input type="text" class="form-control" placeholder="Your Name">
                                </div>
                                <div class="form-group">
                                    <input type="text" class="form-control" placeholder="Your Email">
                                </div>
                                <div class="form-group">
                                    <input type="text" class="form-control" placeholder="Subject">
                                </div>
                                <div class="form-group">
                                    <textarea name="" id="" cols="30" rows="7" class="form-control" placeholder="Message"></textarea>
                                </div>
                                <div class="form-group">
                                    <input type="submit" value="Send Message" class="btn btn-primary py-3 px-5">
                                </div>
                            </form>

                        </div>

                        <div class="col-md-6 d-flex">
                            <div id="map" class="bg-white"></div>
                        </div>
                    </div>
                </div>
            </section>
        <jsp:include page="page-footer.jsp"></jsp:include>

        <script src="js/jquery.min.js"></script>
        <script src="js/jquery-migrate-3.0.1.min.js"></script>
        <script src="js/popper.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/jquery.easing.1.3.js"></script>
        <script src="js/jquery.waypoints.min.js"></script>
        <script src="js/jquery.stellar.min.js"></script>
        <script src="js/owl.carousel.min.js"></script>
        <script src="js/jquery.magnific-popup.min.js"></script>
        <script src="js/aos.js"></script>
        <script src="js/jquery.animateNumber.min.js"></script>
        <script src="js/bootstrap-datepicker.js"></script>
        <script src="js/scrollax.min.js"></script>
        <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
        <script src="js/google-map.js"></script>
        <script src="js/main.js"></script>

    </body>
</html>
