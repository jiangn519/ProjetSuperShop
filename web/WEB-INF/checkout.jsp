<%-- 
    Document   : shoppingcart
    Created on : 2019-5-2, 20:37:31
    Author     : lin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" errorPage="/WEB-INF/erreur/erreur.jsp"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <!-- Head BEGIN -->
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Shopping cart | Metronic Shop UI</title>
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
        <!-- Fonts END -->

        <!-- Global styles START -->          
        <link href="assets/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet">
        <link href="assets/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <!-- Global styles END --> 

        <!-- Page level plugin styles START -->
        <link href="assets/plugins/fancybox/source/jquery.fancybox.css" rel="stylesheet">
        <link href="assets/plugins/owl.carousel/assets/owl.carousel.css" rel="stylesheet">
        <link href="assets/plugins/uniform/css/uniform.default.css" rel="stylesheet" type="text/css">
        <link href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css" rel="stylesheet" type="text/css"><!-- for slider-range -->
        <link href="assets/plugins/rateit/src/rateit.css" rel="stylesheet" type="text/css">
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
    <!-- Body BEGIN -->
    <body class="ecommerce">
        <%@include file="header.jsp"  %>
        <div class="main">
            <div class="container">
                <!-- BEGIN CONFIRM -->
                
                <div id="confirm" class="panel panel-default">
                    <div class="panel-heading">
                        <h2 class="panel-title">

                            Confirm Order
                            </a>
                        </h2>
                    </div>
                    <div class="goods-page">
                        <div class="goods-data clearfix">
                            <div class="table-wrapper-responsive">
                                <table summary="Shopping cart" id="tableCart">
                                    <tr>
                                        <th class="goods-page-image">Image</th>
                                        <th class="goods-page-description">Description</th>
                                        <th class="goods-page-ref-no">Ref No</th>
                                        <th class="goods-page-quantity">Quantity</th>
                                        <th class="goods-page-price">Unit price</th>
                                        <th class="goods-page-total" colspan="2">Total</th>
                                    </tr>

                                    <c:forEach var ="anOrder" items="${sessionScope.shoppingcart}" varStatus="id">
                                        <tr>
                                            <td class="goods-page-image">
                                                <a href="DetailleServelet?no=${anOrder.noprd}"><img src="images/${anOrder.photo}/1.jpg" alt="${anOrder.nameprd}"></a>
                                            </td>
                                            <td class="goods-page-description">
                                                <h3><a href="DetailleServelet?no=${anOrder.noprd}">${anOrder.nameprd}</a></h3>
                                                <p><strong>Size: </strong> ${anOrder.size}</p>

                                            </td>
                                            <td class="goods-page-ref-no">
                                                <span id="produit-id"> ${anOrder.noprd}</span>
                                            </td>
                                            <td class="goods-page-quantity">
                                                <div class="product-quantity">

                                                    ${anOrder.quantityCart}

                                                </div>
                                            </td>
                                            <td class="goods-page-price">
                                                <strong><span>$</span>${anOrder.pricesale}</strong>
                                            </td>
                                            <td class="goods-page-total">
                                                <strong><span>$</span><fmt:formatNumber type="number" maxFractionDigits="2" pattern="##,###.00" value="${anOrder.pricesale*anOrder.quantityCart}" /></strong>
                                            </td>
                                           
                                        </tr>

                                    </c:forEach> 

                                </table>
                            </div>

                            <div class="shopping-total">
                                <ul>
                                    <li>
                                        <em>Sub total</em>
                                        <strong class="price"><span>$</span ><span id="produit-total"><fmt:formatNumber type="number" maxFractionDigits="2" pattern="##,###.00" value="${sessionScope.total}" /></span></strong>
                                    </li>
                                    <li>
                                        <em>Shipping cost</em>
                                        <strong class="price"><span>$</span>10.00</strong>
                                    </li>
                                    <li class="shopping-total-price">
                                        <em>Total</em>
                                        <strong class="price"><span>$</span><span id="produit-totalT"><fmt:formatNumber type="number" maxFractionDigits="2" pattern="##,###.00" value="${sessionScope.total+10}" /></span></strong>
                                    </li>
                                </ul>
                            </div>
                        </div>
                        <div class="clearfix"></div>
                        
                        <form name="confirm" action="CheckoutServlet?confirm=true" method="POST">
                        <button class="btn btn-primary pull-right" type="submit" id="button-confirm">Confirm Order</button>
                        </form>
                        <form name="cancel" action="ListServelet" method="Post">
                        <button type="button" class="btn btn-default pull-right margin-right-20">Cancel</button>
                        </form>
                        <br><br>
                        <br>
                    </div>
                </div>
                <!-- END CONFIRM -->

            </div>
        </div>        


        <%@include file="footer.jsp"  %>
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
        <script src="assets/plugins/uniform/jquery.uniform.min.js" type="text/javascript"></script>
        <script src="assets/plugins/rateit/src/jquery.rateit.js" type="text/javascript"></script>
        <script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js" type="text/javascript"></script><!-- for slider-range -->

        <script src="assets/corporate/scripts/layout.js" type="text/javascript"></script>
        <script type="text/javascript">
                                                    jQuery(document).ready(function () {
                                                        Layout.init();
                                                        Layout.initOWL();
                                                        Layout.initTwitter();
                                                        Layout.initImageZoom();
                                                        Layout.initTouchspin();
                                                        Layout.initUniform();
                                                        Layout.initSliderRange();
                                                    });
        </script>
        <!-- END PAGE LEVEL JAVASCRIPTS -->

    </body>
    <!-- END BODY -->
</html>

