
<%@page contentType="text/html" pageEncoding="UTF-8"  errorPage="/WEB-INF/erreur/erreur.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<c:set var="Client" value="${sessionScope.Client}"/>
<html>
    <!-- Head BEGIN -->
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login | Metronic Shop UI</title>
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
        <script type="text/javascript" src="scripts/register.js"></script>
        <!-- Fonts START -->
        <link href="http://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700|PT+Sans+Narrow|Source+Sans+Pro:200,300,400,600,700,900&amp;subset=all" rel="stylesheet" type="text/css"> 
        <!-- Fonts END -->

        <!-- Global styles START -->          
        <link href="assets/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet">
        <link href="assets/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <!-- Global styles END --> 

        <!-- Page level plugin styles START -->
        <link href="assets/plugins/fancybox/source/jquery.fancybox.css" rel="stylesheet">
        <link href="assets/plugins/owl.carousel/assets/owl.carousel.css" rel="stylesheet">
        <link href="assets/plugins/uniform/css/uniform.default.css" rel="stylesheet" type="text/css">
        <!-- Page level plugin styles END -->

        <!-- Theme styles START -->
        <link href="assets/pages/css/components.css" rel="stylesheet">
        <link href="assets/corporate/css/style.css" rel="stylesheet">
        <link href="assets/pages/css/style-shop.css" rel="stylesheet" type="text/css">
        <link href="assets/corporate/css/style-responsive.css" rel="stylesheet">
        <link href="assets/corporate/css/themes/red.css" rel="stylesheet" id="style-color">
        <link href="assets/corporate/css/custom.css" rel="stylesheet">
        <!-- Theme styles END -->
    </head>
    <!-- Head END -->
    <body>
        <%@include file="/WEB-INF/header.jsp"  %>
        <div class="main">
            <div class="container">
                <ul class="breadcrumb">
                    <li><a href="index.html">Home</a></li>                    
                    <li class="active">My Account </li>
                </ul>
                <!-- BEGIN SIDEBAR & CONTENT -->
                <div class="row margin-bottom-40">
                    <!-- BEGIN SIDEBAR -->
                    <div class="sidebar col-md-3 col-sm-3">
                        <ul class="list-group margin-bottom-25 sidebar-menu">
                            <li class="list-group-item clearfix"><a href="MyAccount?cat=edit"><i class="fa fa-angle-right"></i> Edit your account</a></li>
                            <li class="list-group-item clearfix"><a href="MyAccount?cat=pwd"><i class="fa fa-angle-right"></i> Change your password</a></li>
                            <li class="list-group-item clearfix"><a href="javascript:;"><i class="fa fa-angle-right"></i> Wish list</a></li>
                            <li class="list-group-item clearfix"><a href="javascript:;"><i class="fa fa-angle-right"></i> Command</a></li>
                            <li class="list-group-item clearfix"><a href="javascript:;"><i class="fa fa-angle-right"></i> Newsletter</a></li>
                        </ul>
                    </div>
                    <!-- END SIDEBAR -->

                    <!-- BEGIN CONTENT -->
                    <div class="col-md-9 col-sm-7">
                        <h1>My Account  Information</h1>
                        <div class="content-page">
                            <div class="row form-group">
                                <label class="col-lg-2 control-label" for="first-name">Username</label>
                                <div class="col-lg-6">
                                    
                                    <input type="text" name="username" id="username" class="form-control" value="${sessionScope.user}" readonly>
                                </div>
                            </div>
                            <div class="row form-group">
                                <label class="col-lg-2 control-label" for="first-name">First Name </label>
                                <div class="col-lg-6">
                                    <input type="text" name="first-name"  id="first-name" class="form-control" value="<c:out value="${sessionScope.Client.firstname}" />" readonly>
                                </div>
                            </div>
                            <div class="row form-group">
                                <label class="col-lg-2 control-label" for="last-name">Last Name </label>
                                <div class="col-lg-6">
                                    <input type="text" name="last-name" id="last-name" class="form-control" value="<c:out value="${sessionScope.Client.lastname}" />" readonly> 
                                </div>
                            </div>
                            <div class="row form-group">
                                <label class="col-lg-2 control-label" for="email">E-Mail </label>
                                <div class="col-lg-6">
                                    <input type="email" name="email" id="email" class="form-control" value="<c:out value="${sessionScope.Client.email}" />" readonly>
                                </div>
                            </div>
                            <div class="row form-group">
                                <label class="col-lg-2 control-label" for="telephone">Telephone </label>
                                <div class="col-lg-6">
                                    <input type="text" name="telephone" id="telephone" class="form-control" value="<c:out value="${sessionScope.Client.tel}" />" readonly>
                                </div>
                            </div>
                            <div class="row form-group">
                                <label class="col-lg-2 control-label" for="address">address</label>
                                <div class="col-lg-6">
                                    <input type="text" name="address" id="address"  class="form-control" value="<c:out value="${sessionScope.Client.address}" />" readonly>
                                </div>
                            </div>
                            <div class="row form-group">
                                <label class="col-lg-2 control-label" for="postcode">postcode</label>
                                <div class="col-lg-6">
                                    <input type="text" name="postcode" id="postcode"  class="form-control" value="<c:out value="${sessionScope.Client.postcode}" />" readonly>
                                </div>
                            </div>


                        </div>
                    </div>
                    <!-- END CONTENT -->
                </div>
                <!-- END SIDEBAR & CONTENT -->
            </div>
        </div>

        <%@include file="/WEB-INF/footer.jsp"  %>

        <!-- Load javascripts at bottom, this will reduce page load time -->
        <!-- BEGIN CORE PLUGINS(REQUIRED FOR ALL PAGES) -->
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
        <script src="assets/plugins/uniform/jquery.uniform.min.js" type="text/javascript"></script>

        <script src="assets/corporate/scripts/layout.js" type="text/javascript"></script>
        <script src="assets/pages/scripts/checkout.js" type="text/javascript"></script>
        <script type="text/javascript">

        </script>
        <!-- END PAGE LEVEL JAVASCRIPTS -->

    </body>
</html>

