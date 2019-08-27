<%-- 
    Document   : index
    Created on : 2019-4-13, 19:37:25
    Author     : lin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" errorPage="/WEB-INF/erreur/erreur.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
    <c:if test="${!(empty locale)}">
        <c:set var="loc" value="${locale}"/>
    </c:if>
    <fmt:setLocale value="${not empty sessionScope.locale ? sessionScope.locale : pageContext.request.locale}" />
    <fmt:bundle basename="ressources_i18n.Messages">
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <title><fmt:message key="superwebsite"/></title>
            <meta http-equiv="X-UA-Compatible" content="IE=edge">
            <meta content="width=device-width, initial-scale=1.0" name="viewport">
            <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">

            <meta content="Metronic Shop UI description" name="description">
            <meta content="Metronic Shop UI keywords" name="keywords">
            <meta content="keenthemes" name="author">

            <meta property="og:site_name" content="-CUSTOMER VALUE-">
            <meta property="og:title" content="-CUSTOMER VALUE-">
            <meta property="og:description" content="-CUSTOMER VALUE-">
            <meta property="og:type" content="website">
            <meta property="og:image" content="-CUSTOMER VALUE-"><!-- link to image for socio -->
            <meta property="og:url" content="-CUSTOMER VALUE-">

            <link rel="shortcut icon" href="favicon.ico">

            <!-- Fonts START -->
            <link href="http://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700|PT+Sans+Narrow|Source+Sans+Pro:200,300,400,600,700,900&amp;subset=all" rel="stylesheet" type="text/css">
            <link href="http://fonts.googleapis.com/css?family=Source+Sans+Pro:200,300,400,600,700,900&amp;subset=all" rel="stylesheet" type="text/css"><!--- fonts for slider on the index page -->  
            <!-- Fonts END -->

            <!-- Global styles START -->          
            <link href="assets/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet">
            <link href="assets/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet">
            <!-- Global styles END --> 

            <!-- Page level plugin styles START -->
            <link href="assets/pages/css/animate.css" rel="stylesheet">
            <link href="assets/plugins/fancybox/source/jquery.fancybox.css" rel="stylesheet">
            <link href="assets/plugins/owl.carousel/assets/owl.carousel.css" rel="stylesheet">
            <!-- Page level plugin styles END -->

            <!-- Theme styles START -->
            <link href="assets/pages/css/components.css" rel="stylesheet">
            <link href="assets/pages/css/slider.css" rel="stylesheet">
            <link href="assets/pages/css/style-shop.css" rel="stylesheet" type="text/css">
            <link href="assets/corporate/css/style.css" rel="stylesheet">
            <link href="assets/corporate/css/style-responsive.css" rel="stylesheet">
            <link href="assets/corporate/css/themes/red.css" rel="stylesheet" id="style-color">
            <link href="assets/corporate/css/custom.css" rel="stylesheet">
            <!-- Theme styles END -->
        </head>
        <!-- Head END -->
        <body>

            <%@include file="WEB-INF/header.jsp" %>
            <!-- BEGIN SLIDER -->
            <div class="page-slider margin-bottom-35">
                <div id="carousel-example-generic" class="carousel slide carousel-slider">
                    <!-- Indicators -->
                    <ol class="carousel-indicators">
                        <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                        <li data-target="#carousel-example-generic" data-slide-to="1"></li>
                        <li data-target="#carousel-example-generic" data-slide-to="2"></li>
                        <li data-target="#carousel-example-generic" data-slide-to="3"></li>
                    </ol>

                    <!-- Wrapper for slides -->
                    <div class="carousel-inner" role="listbox">
                        <!-- First slide -->
                        <div class="item carousel-item-four active">
                            <div class="container">
                                <div class="carousel-position-four text-center">
                                    <h2 class="margin-bottom-20 animate-delay carousel-title-v3 border-bottom-title text-uppercase" data-animation="animated fadeInDown">
                                        Tones of <br/><span class="color-red-v2"><fmt:message key="ShopUIFeatures"/></span><br/> <fmt:message key="designed"/>
                                    </h2>
                                    <p class="carousel-subtitle-v2" data-animation="animated fadeInUp">Lorem ipsum dolor sit amet constectetuer diam <br/>
                                        adipiscing elit euismod ut laoreet dolore.</p>
                                </div>
                            </div>
                        </div>

                        <!-- Second slide -->
                        <div class="item carousel-item-five">
                            <div class="container">
                                <div class="carousel-position-four text-center">
                                    <h2 class="animate-delay carousel-title-v4" data-animation="animated fadeInDown">
                                        <fmt:message key="Unlimted"/>

                                    </h2>
                                    <p class="carousel-subtitle-v2" data-animation="animated fadeInDown">
                                        <fmt:message key="ProductDetail"/><fmt:message key="LayoutOptions"/>
                                    </p>
                                    <p class="carousel-subtitle-v3 margin-bottom-30" data-animation="animated fadeInUp">
                                        <fmt:message key="ProductDetail"/><fmt:message key="FullyResponsive"/>
                                    </p>
                                    <a class="carousel-btn" href="#" data-animation="animated fadeInUp"><fmt:message key="SeeMoreDetails"/></a>
                                </div>
                                <img class="carousel-position-five animate-delay hidden-sm hidden-xs" src="assets/pages/img/shop-slider/slide2/price.png" alt="Price" data-animation="animated zoomIn">
                            </div>
                        </div>

                        <!-- Third slide -->
                        <div class="item carousel-item-six">
                            <div class="container">
                                <div class="carousel-position-four text-center">
                                    <span class="carousel-subtitle-v3 margin-bottom-15" data-animation="animated fadeInDown">
                                        <fmt:message key="FullAdmin"/> &amp; <fmt:message key="Frontend"/>
                                    </span>
                                    <p class="carousel-subtitle-v4" data-animation="animated fadeInDown">
                                        <fmt:message key="eCommerceUI"/>
                                    </p>
                                    <p class="carousel-subtitle-v3" data-animation="animated fadeInDown">
                                        <fmt:message key="IsReadyForYourProject"/>
                                    </p>
                                </div>
                            </div>
                        </div>

                        <!-- Fourth slide -->
                        <div class="item carousel-item-seven">
                            <div class="center-block">
                                <div class="center-block-wrap">
                                    <div class="center-block-body">
                                        <h2 class="carousel-title-v1 margin-bottom-20" data-animation="animated fadeInDown">
                                            <fmt:message key="Themost"/><br/>
                                            <fmt:message key="wantedbijouterie"/>
                                        </h2>
                                        <a class="carousel-btn" href="#" data-animation="animated fadeInUp"><fmt:message key="ButItNow"/></a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Controls -->
                    <a class="left carousel-control carousel-control-shop" href="#carousel-example-generic" role="button" data-slide="prev">
                        <i class="fa fa-angle-left" aria-hidden="true"></i>
                    </a>
                    <a class="right carousel-control carousel-control-shop" href="#carousel-example-generic" role="button" data-slide="next">
                        <i class="fa fa-angle-right" aria-hidden="true"></i>
                    </a>
                </div>
            </div>
            <!-- END SLIDER -->

            <div class="main">
                <div class="container">
                    <!-- BEGIN SALE PRODUCT & NEW ARRIVALS -->
                    <div class="row margin-bottom-40">
                        <!-- BEGIN SALE PRODUCT -->
                        <div class="col-md-12 sale-product">
                            <h2><fmt:message key="NewArrivals"/></h2>
                            <div class="owl-carousel owl-carousel5">

                                <c:forEach var="produit" items="${produitsNew}" begin="0" end="7">
                                    <div>
                                        <div class="product-item">
                                            <div class="pi-img-wrapper">
                                                <img src="images/${produit.photo}/1.jpg" class="img-responsive" alt="${produit.nameprd}">
                                                <div>
                                                    <a href="images/${produit.photo}/1.jpg" class="btn btn-default fancybox-button"><fmt:message key="Zoom"/></a>
                                                    <a href="DetailleServelet?no=${produit.noprd}" class="btn btn-default fancybox-fast-view"><fmt:message key="View"/></a>
                                                </div>
                                            </div>
                                            <h3><a href="javascript:;">${produit.nameprd}</a></h3>
                                            <div class="pi-price">${produit.pricesale}</div>
                                            <a href="ShoppingCartServlet?action=ADD&selectSize=M&quan=1&prdid=${produit.noprd}" class="btn btn-default add2cart"><fmt:message key="Addtocart"/></a>
                                            <div class="sticker sticker-new"></div>
                                        </div>
                                    </div>
                                </c:forEach>

                            </div>
                        </div>
                        <!-- END SALE PRODUCT -->
                    </div>
                </div>
            </div>
            <!-- END SALE PRODUCT & NEW ARRIVALS -->


            <!-- BEGIN SIDEBAR & CONTENT -->
            <div class="container">
                <div class="row margin-bottom-40 ">
                    <!-- BEGIN SIDEBAR -->
                    <div class="sidebar col-lg-3 col-md-3 col-sm-4">        
                        <ul class="list-group margin-bottom-25 sidebar-menu">
                            <c:forEach var="catalogue" items="${catalogues}">
                                <li class="list-group-item clearfix dropdown">
                                    <a href="shop-product-list.html">
                                        <i class="fa fa-angle-right"></i>
                                        ${catalogue.namecat}

                                    </a>
                                    <c:if test="${catalogue.childCat!=null}">
                                        <c:forEach var="catchild" items="${catalogue.childCat}">
                                            <ul class="dropdown-menu">
                                                <li class="list-group-item dropdown clearfix">
                                                    <a href="GenreServlet?catChild=${catchild.nocat}"><i class="fa fa-angle-right"></i> ${catchild.namecat} </a>

                                                </li>
                                            </ul>
                                        </c:forEach>
                                    </c:if>
                                </li>
                            </c:forEach>
                        </ul>
                    </div>


                    <!-- END SIDEBAR -->
                    <!-- BEGIN CONTENT -->
                    <div class="col-lg-9 col-md-9 col-sm-8">                   

                        <div class="row product-list">
                            <c:forEach var="produit" items="${produits}" begin="0" end="14">
                                <!-- BEGIN PRODUCT LIST -->

                                <!-- PRODUCT ITEM START -->
                                <div class="col-lg-4 col-md-6 col-sm-6">
                                    <div class="product-item">
                                        <div class="pi-img-wrapper">
                                            <img src="images/${produit.photo}/1.jpg" class="img-responsive" alt="${produit.nameprd}">
                                            <div>
                                                <a href="images/${produit.photo}/1.jpg" class="btn btn-default fancybox-button"><fmt:message key="Zoom"/></a>
                                                <a href="DetailleServelet?no=${produit.noprd}" class="btn btn-default fancybox-fast-view"><fmt:message key="View"/></a>
                                            </div>
                                        </div>
                                        <h3><a href="shop-item.html">${produit.nameprd}</a></h3>
                                        <div class="pi-price">${produit.pricesale}</div>
                                        <a href="ShoppingCartServlet?action=ADD&selectSize=M&quan=1&prdid=${produit.noprd}" class="btn btn-default add2cart"><fmt:message key="Addtocart"/></a>
                                        <c:if test="${produit.genre=='S'}">
                                            <div class="sticker sticker-sale"></div>
                                        </c:if>
                                        <c:if test="${produit.genre=='N'}">
                                            <div class="sticker sticker-new"></div>
                                        </c:if>
                                    </div>
                                </div>
                                <!-- PRODUCT ITEM END -->
                            </c:forEach>
                        </div> 
                        <!-- END CONTENT -->
                    </div>
                </div>



            </div>
            <!-- END SIDEBAR & CONTENT -->

            <!-- BEGIN BRANDS -->
            <div class="brands">
                <div class="container">
                    <div class="owl-carousel owl-carousel6-brands">
                        <a href="shop-product-list.html"><img src="assets/pages/img/brands/canon.jpg" alt="canon" title="canon"></a>
                        <a href="shop-product-list.html"><img src="assets/pages/img/brands/esprit.jpg" alt="esprit" title="esprit"></a>
                        <a href="shop-product-list.html"><img src="assets/pages/img/brands/gap.jpg" alt="gap" title="gap"></a>
                        <a href="shop-product-list.html"><img src="assets/pages/img/brands/next.jpg" alt="next" title="next"></a>
                        <a href="shop-product-list.html"><img src="assets/pages/img/brands/puma.jpg" alt="puma" title="puma"></a>
                        <a href="shop-product-list.html"><img src="assets/pages/img/brands/zara.jpg" alt="zara" title="zara"></a>
                        <a href="shop-product-list.html"><img src="assets/pages/img/brands/canon.jpg" alt="canon" title="canon"></a>
                        <a href="shop-product-list.html"><img src="assets/pages/img/brands/esprit.jpg" alt="esprit" title="esprit"></a>
                        <a href="shop-product-list.html"><img src="assets/pages/img/brands/gap.jpg" alt="gap" title="gap"></a>
                        <a href="shop-product-list.html"><img src="assets/pages/img/brands/next.jpg" alt="next" title="next"></a>
                        <a href="shop-product-list.html"><img src="assets/pages/img/brands/puma.jpg" alt="puma" title="puma"></a>
                        <a href="shop-product-list.html"><img src="assets/pages/img/brands/zara.jpg" alt="zara" title="zara"></a>
                    </div>
                </div>
            </div>
            <!-- END BRANDS -->

            <%@include file="WEB-INF/footer.jsp"  %>


            <!-- BEGIN fast view of a product -->
            <div id="product-pop-up" style="display: none; width: 700px;">
                <div class="product-page product-pop-up">
                    <div class="row">
                        <div class="col-md-6 col-sm-6 col-xs-3">
                            <div class="product-main-image">
                                <img src="assets/pages/img/products/model7.jpg" alt="Cool green dress with red bell" class="img-responsive">
                            </div>
                            <div class="product-other-images">
                                <a href="javascript:;" class="active"><img alt="Berry Lace Dress" src="assets/pages/img/products/model3.jpg"></a>
                                <a href="javascript:;"><img alt="Berry Lace Dress" src="assets/pages/img/products/model4.jpg"></a>
                                <a href="javascript:;"><img alt="Berry Lace Dress" src="assets/pages/img/products/model5.jpg"></a>
                            </div>
                        </div>
                        <div class="col-md-6 col-sm-6 col-xs-9">
                            <h2><fmt:message key="Coolgreendresswithredbell"/></h2>
                            <div class="price-availability-block clearfix">
                                <div class="price">
                                    <strong><span>$</span>47.00</strong>
                                    <em>$<span>62.00</span></em>
                                </div>
                                <div class="availability">
                                    <fmt:message key="Availability"/> <strong><fmt:message key="InStock"/></strong>
                                </div>
                            </div>
                            <div class="description">
                                <p>Lorem ipsum dolor ut sit ame dolore  adipiscing elit, sed nonumy nibh sed euismod laoreet dolore magna aliquarm erat volutpat Nostrud duis molestie at dolore.</p>
                            </div>
                            <div class="product-page-options">
                                <div class="pull-left">
                                    <label class="control-label"><fmt:message key="Size"/></label>
                                    <select class="form-control input-sm">
                                        <option>L</option>
                                        <option>M</option>
                                        <option>XL</option>
                                    </select>
                                </div>
                                <div class="pull-left">
                                    <label class="control-label"><fmt:message key="menu.Color"/></label>
                                    <select class="form-control input-sm">
                                        <option><fmt:message key="Red"/></option>
                                        <option><fmt:message key="Blue"/></option>
                                        <option><fmt:message key="Black"/></option>
                                    </select>
                                </div>
                            </div>
                            <div class="product-page-cart">
                                <div class="product-quantity">
                                    <input id="product-quantity" type="text" value="1" readonly name="product-quantity" class="form-control input-sm">
                                </div>
                                <button class="btn btn-primary" type="submit"><fmt:message key="Addtocart"/></button>
                                <a href="shop-item.html" class="btn btn-default"><fmt:message key="Moredetails"/></a>
                            </div>
                        </div>

                        <div class="sticker sticker-sale"></div>
                    </div>
                </div>
            </div>
            <!-- END fast view of a product -->

            <!-- Load javascripts at bottom, this will reduce page load time -->
            <!-- BEGIN CORE PLUGINS (REQUIRED FOR ALL PAGES) -->
            <!--[if lt IE 9]>
            <script src="assets/plugins/respond.min.js"></script>  
            <![endif]-->
            <script src="assets/plugins/jquery.min.js" type="text/javascript"></script>
            <script src="assets/plugins/jquery-migrate.min.js" type="text/javascript"></script>
            <script src="assets/plugins/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>      
            <script src="assets/corporate/scripts/back-to-top.js" type="text/javascript"></script>
            <script src="assets/plugins/jquery-slimscroll/jquery.slimscroll.min.js" type="text/javascript"></script>
            <!-- END CORE PLUGINS -->

            <!-- BEGIN PAGE LEVEL JAVASCRIPTS (REQUIRED ONLY FOR CURRENT PAGE) -->
            <script src="assets/plugins/fancybox/source/jquery.fancybox.pack.js" type="text/javascript"></script><!-- pop up -->
            <script src="assets/plugins/owl.carousel/owl.carousel.min.js" type="text/javascript"></script><!-- slider for products -->
            <script src='assets/plugins/zoom/jquery.zoom.min.js' type="text/javascript"></script><!-- product zoom -->
            <script src="assets/plugins/bootstrap-touchspin/bootstrap.touchspin.js" type="text/javascript"></script><!-- Quantity -->

            <script src="assets/corporate/scripts/layout.js" type="text/javascript"></script>
            <script src="assets/pages/scripts/bs-carousel.js" type="text/javascript"></script>
            <script type="text/javascript">
                jQuery(document).ready(function () {
                    Layout.init();
                    Layout.initOWL();
                    Layout.initImageZoom();
                    Layout.initTouchspin();
                    Layout.initTwitter();
                });
            </script>
            <!-- END PAGE LEVEL JAVASCRIPTS -->      

        </fmt:bundle>
    </body>
</html>
