<%-- 
    Document   : rooms
    Created on : Sep 19, 2022, 3:44:16 PM
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>All Rooms Page</title>
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
                                <p class="breadcrumbs mb-2"><span class="mr-2"><a href="index.html">Home</a></span> <span>Rooms</span></p>
                                <h1 class="mb-4 bread">Rooms</h1>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <section class="ftco-section ftco-no-pb ftco-room">
                <div class="container-fluid px-0">
                    <div class="row no-gutters justify-content-center mb-5 pb-3">
                        <div class="col-md-7 heading-section text-center ftco-animate">
                            <span class="subheading">MyHotel Rooms</span>
                            <h2 class="mb-4">Hotel Master's Rooms</h2>
                        </div>
                    </div>  
                    <div class="row no-gutters">
                        <div class="col-lg-6">
                            <div class="room-wrap d-md-flex ftco-animate">
                                <a href="#" class="img" style="background-image: url(images/room-6.jpg);"></a>
                                <div class="half left-arrow d-flex align-items-center">
                                    <div class="text p-4 text-center">
                                        <p class="star mb-0"><span class="ion-ios-star"></span><span class="ion-ios-star"></span><span class="ion-ios-star"></span><span class="ion-ios-star"></span><span class="ion-ios-star"></span></p>
                                        <p class="mb-0"><span class="price mr-1">$120.00</span> <span class="per">per night</span></p>
                                        <h3 class="mb-3"><a href="rooms-single.jsp">King Room</a></h3>
                                        <p class="pt-1"><a href="rooms-single.jsp" class="btn-custom px-3 py-2 rounded">View Details <span class="icon-long-arrow-right"></span></a></p>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="room-wrap d-md-flex ftco-animate">
                                <a href="#" class="img" style="background-image: url(images/room-1.jpg);"></a>
                                <div class="half left-arrow d-flex align-items-center">
                                    <div class="text p-4 text-center">
                                        <p class="star mb-0"><span class="ion-ios-star"></span><span class="ion-ios-star"></span><span class="ion-ios-star"></span><span class="ion-ios-star"></span><span class="ion-ios-star"></span></p>
                                        <p class="mb-0"><span class="price mr-1">$120.00</span> <span class="per">per night</span></p>
                                        <h3 class="mb-3"><a href="rooms.html">Suite Room</a></h3>
                                        <p class="pt-1"><a href="rooms-single.html" class="btn-custom px-3 py-2 rounded">View Details <span class="icon-long-arrow-right"></span></a></p>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="col-lg-6">
                            <div class="room-wrap d-md-flex ftco-animate">
                                <a href="#" class="img order-md-last" style="background-image: url(images/room-2.jpg);"></a>
                                <div class="half right-arrow d-flex align-items-center">
                                    <div class="text p-4 text-center">
                                        <p class="star mb-0"><span class="ion-ios-star"></span><span class="ion-ios-star"></span><span class="ion-ios-star"></span><span class="ion-ios-star"></span><span class="ion-ios-star"></span></p>
                                        <p class="mb-0"><span class="price mr-1">$120.00</span> <span class="per">per night</span></p>
                                        <h3 class="mb-3"><a href="rooms.html">Family Room</a></h3>
                                        <p class="pt-1"><a href="rooms-single.html" class="btn-custom px-3 py-2 rounded">View Details <span class="icon-long-arrow-right"></span></a></p>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="room-wrap d-md-flex ftco-animate">
                                <a href="#" class="img order-md-last" style="background-image: url(images/room-3.jpg);"></a>
                                <div class="half right-arrow d-flex align-items-center">
                                    <div class="text p-4 text-center">
                                        <p class="star mb-0"><span class="ion-ios-star"></span><span class="ion-ios-star"></span><span class="ion-ios-star"></span><span class="ion-ios-star"></span><span class="ion-ios-star"></span></p>
                                        <p class="mb-0"><span class="price mr-1">$120.00</span> <span class="per">per night</span></p>
                                        <h3 class="mb-3"><a href="rooms.html">Deluxe Room</a></h3>
                                        <p class="pt-1"><a href="rooms-single.html" class="btn-custom px-3 py-2 rounded">View Details <span class="icon-long-arrow-right"></span></a></p>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="col-lg-6">
                            <div class="room-wrap d-md-flex ftco-animate">
                                <a href="#" class="img" style="background-image: url(images/room-4.jpg);"></a>
                                <div class="half left-arrow d-flex align-items-center">
                                    <div class="text p-4 text-center">
                                        <p class="star mb-0"><span class="ion-ios-star"></span><span class="ion-ios-star"></span><span class="ion-ios-star"></span><span class="ion-ios-star"></span><span class="ion-ios-star"></span></p>
                                        <p class="mb-0"><span class="price mr-1">$120.00</span> <span class="per">per night</span></p>
                                        <h3 class="mb-3"><a href="rooms.html">Luxury Room</a></h3>
                                        <p class="pt-1"><a href="rooms-single.html" class="btn-custom px-3 py-2 rounded">View Details <span class="icon-long-arrow-right"></span></a></p>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="room-wrap d-md-flex ftco-animate">
                                <a href="#" class="img" style="background-image: url(images/room-5.jpg);"></a>
                                <div class="half left-arrow d-flex align-items-center">
                                    <div class="text p-4 text-center">
                                        <p class="star mb-0"><span class="ion-ios-star"></span><span class="ion-ios-star"></span><span class="ion-ios-star"></span><span class="ion-ios-star"></span><span class="ion-ios-star"></span></p>
                                        <p class="mb-0"><span class="price mr-1">$120.00</span> <span class="per">per night</span></p>
                                        <h3 class="mb-3"><a href="rooms.html">Superior Room</a></h3>
                                        <p class="pt-1"><a href="rooms-single.html" class="btn-custom px-3 py-2 rounded">View Details <span class="icon-long-arrow-right"></span></a></p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>

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

        <jsp:include page="page-footer.jsp"></jsp:include>
    </body>
</html>
