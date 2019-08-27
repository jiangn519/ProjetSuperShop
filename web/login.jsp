<%-- 
    Document   : login
    Created on : 2019-4-30, 14:54:05
    Author     : lin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" errorPage="/WEB-INF/erreur/erreur.jsp"%>
<!DOCTYPE html>
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
        <script type="text/javascript" src="scripts/loginAjax.js"></script>
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
        <%@include file="WEB-INF/header.jsp"  %>
        <div class="main">
            <div class="container">
                <ul class="breadcrumb">
                    <li><a href="index.jsp">Home</a></li>
                    <li><a href="">Login</a></li>                    
                </ul>
                <!-- BEGIN SIDEBAR & CONTENT -->
                <div class="row margin-bottom-40">
                    <!-- BEGIN CONTENT -->
                    <div class="col-md-12 col-sm-12">

                        <!-- BEGIN CHECKOUT PAGE -->
                        <div class="panel-group checkout-page accordion scrollable" id="checkout-page">

                            <!-- BEGIN CHECKOUT -->
                            <div id="checkout" class="panel panel-default">

                                <div id="checkout-content" class="panel-collapse collapse in">
                                    <div class="panel-body row">
                                        <div class="col-md-4 col-sm-4"></div>

                                        <div class="col-md-4 col-sm-4">
                                            <div><h3>Sign in</h3>   <span id="state"></span>  </div>      
                                            <form role="form" action="" method="POST">
                                                <div class="form-group">
                                                    <label for="email-login">User name</label>
                                                    <input type="text" id="email-login" class="form-control" name="loginname">
                                                </div>
                                                <div class="form-group">
                                                    <label for="password-login">Password</label>
                                                    <input type="password" id="password-login" class="form-control" name="loginpwd">
                                                </div>
                                                <a href="javascript:;">Forgotten Password?</a>
                                                <div class="row padding-top-20">         
                                                    <div class="col-md-4 col-sm-4">
                                                        <input class="btn btn-primary" type="button"  value="Login" onClick="check()" >
                                                    </div>
                                                    <div class="col-md-4 col-sm-4">
                                                        <input class="btn btn-primary" type="button"  value="New account" onClick="register()" >
                                                    </div>
                                                </div>
                                                <hr>
                                                <div class="login-socio">
                                                    <p class="text-muted">or login using:</p>
                                                    <ul class="social-icons">
                                                        <li><a href="javascript:;" data-original-title="facebook" class="facebook" title="facebook"></a></li>
                                                        <li><a href="javascript:;" data-original-title="Twitter" class="twitter" title="Twitter"></a></li>
                                                        <li><a href="javascript:;" data-original-title="Google Plus" class="googleplus" title="Google Plus"></a></li>
                                                        <li><a href="javascript:;" data-original-title="Linkedin" class="linkedin" title="LinkedIn"></a></li>
                                                    </ul>
                                                </div>
                                            </form>
                                        </div>
                                        <div class="col-md-4 col-sm-4"></div>
                                    </div>
                                </div>
                            </div>
                            <!-- END CHECKOUT -->

                        </div>
                        <!-- END CHECKOUT PAGE -->
                    </div>
                    <!-- END CONTENT -->
                </div>
                <!-- END SIDEBAR & CONTENT -->
            </div>
        </div>

        <%@include file="WEB-INF/footer.jsp"  %>

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
