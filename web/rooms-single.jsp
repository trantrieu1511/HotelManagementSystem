<%-- 
    Document   : rooms-single
    Created on : Sep 19, 2022, 3:52:26 PM
    Author     : DELL
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Rooms-single Page</title>
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
                                <p class="breadcrumbs mb-2"><span class="mr-2"><a href="index.html">Home</a></span> <span class="mr-2"><a href="rooms.html">Rooms</a></span> <span>Rooms Single</span></p>
                                <h1 class="mb-4 bread">Rooms Details</h1>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <section class="ftco-section">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-8">
                            <div class="row">
                                <div class="col-md-12 ftco-animate">
                                    <div class="single-slider owl-carousel">
                                        <div class="item">
                                            <div class="room-img" style="background-image: url(images/room-4.jpg);"></div>
                                        </div>
                                        <div class="item">
                                            <div class="room-img" style="background-image: url(images/room-5.jpg);"></div>
                                        </div>
                                        <div class="item">
                                            <div class="room-img" style="background-image: url(images/room-6.jpg);"></div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-12 room-single mt-4 mb-5 ftco-animate">
                                    <h2 class="mb-4">${roomType.getName()} <span>- (${listRoom.size()} rooms)</span></h2>
                                <p>When she reached the first hills of the Italic Mountains, she had a last view back on the skyline of her hometown Bookmarksgrove, the headline of Alphabet Village and the subline of her own road, the Line Lane. Pityful a rethoric question ran over her cheek, then she continued her way.</p>
                                <div class="d-md-flex mt-5 mb-5">
                                    <ul class="list">
                                        <li><span>Max:</span> ${roomType.getAdult()+roomType.getChildren()} Persons (
                                            <c:if test="${roomType.getAdult()>1}">
                                                ${roomType.getAdult()} adults
                                            </c:if>
                                            <c:if test="${roomType.getAdult()==1}">
                                                ${roomType.getAdult()} adult
                                            </c:if>
                                            <c:if test="${roomType.getAdult()>1}">
                                                , ${roomType.getChildren()} children
                                            </c:if>
                                            <c:if test="${roomType.getAdult()==1}">
                                                , ${roomType.getChildren()} child
                                            </c:if>
                                            )
                                        </li>
                                        <li><span>Size:</span> 45 m2</li>
                                    </ul>
                                    <ul class="list ml-md-5">
                                        <li><span>View:</span> Sea View</li>
                                        <li><span>Bed:</span> 
                                            <c:forEach items="${listRtd}" var="listRtd">
                                                ${listRtd.getBedAmount()} x ${listRtd.getName()} <br>
                                            </c:forEach>
                                        </li>
                                    </ul>
                                </div>
                                <p>When she reached the first hills of the Italic Mountains, she had a last view back on the skyline of her hometown Bookmarksgrove, the headline of Alphabet Village and the subline of her own road, the Line Lane. Pityful a rethoric question ran over her cheek, then she continued her way.</p>
                            </div>
                            <div class="col-md-12 room-single ftco-animate mb-5 mt-4">
                                <h3 class="mb-4">Take A Tour</h3>
                                <div class="block-16">
                                    <figure>
                                        <img src="images/room-4.jpg" alt="Image placeholder" class="img-fluid">
                                        <a href="https://vimeo.com/45830194" class="play-button popup-vimeo"><span class="icon-play"></span></a>
                                    </figure>
                                </div>
                            </div>

                            <div class="col-md-12 properties-single ftco-animate mb-5 mt-4">
                                <h4 class="mb-4">Review &amp; Ratings</h4>
                                <div class="row">
                                    <div class="col-md-6">
                                        <form method="post" class="star-rating">
                                            <div class="form-check">
                                                <input type="checkbox" class="form-check-input" id="exampleCheck1">
                                                <label class="form-check-label" for="exampleCheck1">
                                                    <p class="rate"><span><i class="icon-star"></i><i class="icon-star"></i><i class="icon-star"></i><i class="icon-star"></i><i class="icon-star"></i> 100 Ratings</span></p>
                                                </label>
                                            </div>
                                            <div class="form-check">
                                                <input type="checkbox" class="form-check-input" id="exampleCheck1">
                                                <label class="form-check-label" for="exampleCheck1">
                                                    <p class="rate"><span><i class="icon-star"></i><i class="icon-star"></i><i class="icon-star"></i><i class="icon-star"></i><i class="icon-star-o"></i> 30 Ratings</span></p>
                                                </label>
                                            </div>
                                            <div class="form-check">
                                                <input type="checkbox" class="form-check-input" id="exampleCheck1">
                                                <label class="form-check-label" for="exampleCheck1">
                                                    <p class="rate"><span><i class="icon-star"></i><i class="icon-star"></i><i class="icon-star"></i><i class="icon-star-o"></i><i class="icon-star-o"></i> 5 Ratings</span></p>
                                                </label>
                                            </div>
                                            <div class="form-check">
                                                <input type="checkbox" class="form-check-input" id="exampleCheck1">
                                                <label class="form-check-label" for="exampleCheck1">
                                                    <p class="rate"><span><i class="icon-star"></i><i class="icon-star"></i><i class="icon-star-o"></i><i class="icon-star-o"></i><i class="icon-star-o"></i> 0 Ratings</span></p>
                                                </label>
                                            </div>
                                            <div class="form-check">
                                                <input type="checkbox" class="form-check-input" id="exampleCheck1">
                                                <label class="form-check-label" for="exampleCheck1">
                                                    <p class="rate"><span><i class="icon-star"></i><i class="icon-star-o"></i><i class="icon-star-o"></i><i class="icon-star-o"></i><i class="icon-star-o"></i> 0 Ratings</span></p>
                                                </label>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div> <!-- .col-md-8 -->
                    <div class="col-lg-4 sidebar ftco-animate pl-md-5">
                        <!--                            <div class="sidebar-box">
                                                        <form action="#" class="search-form">
                                                            <div class="form-group">
                                                                <span class="icon ion-ios-search"></span>
                                                                <input type="text" class="form-control" placeholder="Search...">
                                                            </div>
                                                        </form>
                                                    </div>-->
                        <!--                            <div class="sidebar-box ftco-animate">
                                                        <div class="categories">
                                                            <h3>Categories</h3>
                                                            <li><a href="#">Properties <span>(12)</span></a></li>
                                                            <li><a href="#">Home <span>(22)</span></a></li>
                                                            <li><a href="#">House <span>(37)</span></a></li>
                                                            <li><a href="#">Villa <span>(42)</span></a></li>
                                                            <li><a href="#">Apartment <span>(14)</span></a></li>
                                                            <li><a href="#">Condominium <span>(140)</span></a></li>
                                                        </div>
                                                    </div>-->

                        <div class="sidebar-box ftco-animate">
                            <h3>Recent Blog</h3>
                            <div class="block-21 mb-4 d-flex">
                                <a class="blog-img mr-4" style="background-image: url(images/image_1.jpg);"></a>
                                <div class="text">
                                    <h3 class="heading"><a href="#">Even the all-powerful Pointing has no control about the blind texts</a></h3>
                                    <div class="meta">
                                        <div><a href="#"><span class="icon-calendar"></span> Oct 30, 2019</a></div>
                                        <div><a href="#"><span class="icon-person"></span> Admin</a></div>
                                        <div><a href="#"><span class="icon-chat"></span> 19</a></div>
                                    </div>
                                </div>
                            </div>
                            <div class="block-21 mb-4 d-flex">
                                <a class="blog-img mr-4" style="background-image: url(images/image_2.jpg);"></a>
                                <div class="text">
                                    <h3 class="heading"><a href="#">Even the all-powerful Pointing has no control about the blind texts</a></h3>
                                    <div class="meta">
                                        <div><a href="#"><span class="icon-calendar"></span> Oct 30, 2019</a></div>
                                        <div><a href="#"><span class="icon-person"></span> Admin</a></div>
                                        <div><a href="#"><span class="icon-chat"></span> 19</a></div>
                                    </div>
                                </div>
                            </div>
                            <div class="block-21 mb-4 d-flex">
                                <a class="blog-img mr-4" style="background-image: url(images/image_3.jpg);"></a>
                                <div class="text">
                                    <h3 class="heading"><a href="#">Even the all-powerful Pointing has no control about the blind texts</a></h3>
                                    <div class="meta">
                                        <div><a href="#"><span class="icon-calendar"></span> Oct 30, 2019</a></div>
                                        <div><a href="#"><span class="icon-person"></span> Admin</a></div>
                                        <div><a href="#"><span class="icon-chat"></span> 19</a></div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="sidebar-box ftco-animate">
                            <h3>Tag Cloud</h3>
                            <div class="tagcloud">
                                <a href="#" class="tag-cloud-link">dish</a>
                                <a href="#" class="tag-cloud-link">menu</a>
                                <a href="#" class="tag-cloud-link">food</a>
                                <a href="#" class="tag-cloud-link">sweet</a>
                                <a href="#" class="tag-cloud-link">tasty</a>
                                <a href="#" class="tag-cloud-link">delicious</a>
                                <a href="#" class="tag-cloud-link">desserts</a>
                                <a href="#" class="tag-cloud-link">drinks</a>
                            </div>
                        </div>

                        <div class="sidebar-box ftco-animate">
                            <h3>Paragraph</h3>
                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ducimus itaque, autem necessitatibus voluptate quod mollitia delectus aut, sunt placeat nam vero culpa sapiente consectetur similique, inventore eos fugit cupiditate numquam!</p>
                        </div>
                    </div>
                </div>
            </div>
        </section> <!-- .section -->

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
