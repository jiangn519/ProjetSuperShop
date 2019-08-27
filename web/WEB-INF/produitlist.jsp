<%-- 
    Document   : newjsp
    Created on : 2019-4-20, 20:11:08
    Author     : lin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" errorPage="/WEB-INF/erreur/erreur.jsp"%>
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
            <title><fmt:message key="MetronicShopUI"/></title>
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
            <script type="text/javascript" src="scripts/rechercheAjax.js"></script>

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
        <body class="ecommerce" >

            <%@include file="header.jsp"  %>



            <div class="title-wrapper">
                <div class="container"><div class="container-inner">
                        <h1><span><fmt:message key="Men"/></span> <fmt:message key="CATEGORY"/></h1>
                        <em><fmt:message key="Over4000Itemsareavailablehere"/></em>
                    </div></div>
            </div>

            <div class="main">
                <div class="container">
                    <ul class="breadcrumb">
                        <li><a href="index.jsp"><fmt:message key="AllProductHome"/></a></li>
                        <li><a href=""><fmt:message key="Allproducts"/></a></li>

                    </ul>
                    <!-- BEGIN SIDEBAR & CONTENT -->
                    <div class="row margin-bottom-40">
                        <!-- BEGIN SIDEBAR -->
                        <div class="sidebar col-md-3 col-sm-5">
                            <ul class="list-group margin-bottom-25 sidebar-menu">
                                <c:forEach var="catalogue" items="${catalogues}">

                                    <li class="list-group-item clearfix dropdown  active">
                                        <a href="javascript:void(0);" class="collapsed"  >
                                            <i class="fa fa-angle-right"></i>
                                            ${catalogue.namecat}                                        
                                        </a>
                                        <c:if test="${catalogue.childCat!=null}">
                                            <c:forEach var="catchild" items="${catalogue.childCat}">
                                                <ul class="dropdown-menu" style="display:block;">
                                                    <li class="list-group-item dropdown clearfix">

                                                        <a href="javascript:void(0);" class="collapsed" onclick="getValue(this)"  nocat="${catchild.nocat}" nocatMere="${catchild.namecatmere}" ><i class="fa fa-angle-right" ></i>${catchild.namecat} </a>

                                                    </li>
                                                </ul>
                                            </c:forEach>
                                        </c:if>  
                                    </li>
                                </c:forEach>       


                            </ul>

                            <div class="sidebar-filter margin-bottom-25">
                                <h2><fmt:message key="Filter"/></h2>
                                <h3><fmt:message key="Type"/> </h3>
                                <div class="checkbox-list">
                                    <label><input type="radio" name="groupradio" value=""  onchange="recherche()" /><fmt:message key="All"/></label>                                
                                    <label><input type="radio" name="groupradio" value="N" onchange="recherche()"/><fmt:message key="NewArrivals"/></label>
                                    <label><input type="radio" name="groupradio" value="S"  onchange="recherche()" /><fmt:message key="Sales"/></label>
                                    <label><input type="radio" name="groupradio" value="Z"  onchange="recherche()" /><fmt:message key="Regularprice"/></label>

                                </div>
                                <h3><fmt:message key="Size"/></h3>
                                <p>
                                    <label for="amount"><fmt:message key="Range"/></label>
                                    <select name="" id="sizeselect" onchange="recherche()">
                                        <option value=""><fmt:message key="choose"/></option>
                                        <option value="1"><fmt:message key="XS"/></option>
                                        <option value="2"><fmt:message key="S"/></option>
                                        <option value="3"><fmt:message key="M"/></option>
                                        <option value="4"><fmt:message key="L"/></option>
                                        <option value="5"><fmt:message key="XL"/></option>
                                        <option value="6"><fmt:message key="XXL"/></option>
                                        <option value="8"><fmt:message key="XXXXL"/></option>
                                    </select>
                                </p>

                                <h3><fmt:message key="Price" /></h3>
                                <p>
                                    <label for="amount"><fmt:message key="Range"/></label>
                                    <select name="" id="priceselect" onchange="recherche()">
                                        <option value=""><fmt:message key="choose"/></option>
                                        <option value="1">$0-$50</option>
                                        <option value="2">$50-$100</option>
                                        <option value="3">$100-$150</option>
                                        <option value="4">$150-$200</option>
                                        <option value="5">>$200</option>
                                    </select>
                                </p>
                                <div id="slider-range" ></div>
                            </div>

                            <div class="sidebar-products clearfix">
                                <h2><fmt:message key="Bestsellers"/></h2>
                                <div class="item">
                                    <a href="shop-item.html"><img src="assets/pages/img/products/k1.jpg" alt="SomeShoesinAnimalwithCutOut"></a>
                                    <h3><a href="shop-item.html"><fmt:message key="SomeShoesinAnimalwithCutOut"/></a></h3>
                                    <div class="price">$31.00</div>
                                </div>
                                <div class="item">
                                    <a href="shop-item.html"><img src="assets/pages/img/products/k4.jpg" alt="Some Shoes in Animal with Cut Out"></a>
                                    <h3><a href="shop-item.html"><fmt:message key="SomeShoesinAnimalwithCutOut"/></a></h3>
                                    <div class="price">$23.00</div>
                                </div>
                                <div class="item">
                                    <a href="shop-item.html"><img src="assets/pages/img/products/k3.jpg" alt="Some Shoes in Animal with Cut Out"></a>
                                    <h3><a href="shop-item.html"><fmt:message key="SomeShoesinAnimalwithCutOut"/></a></h3>
                                    <div class="price">$86.00</div>
                                </div>
                            </div>
                        </div>
                        <!-- END SIDEBAR -->
                        <!-- BEGIN CONTENT -->

                        <div class="col-md-9 col-sm-7">
                            <div class="row list-view-sorting clearfix">
                                <div class="col-md-2 col-sm-2 list-view">
                                    <a href="javascript:;"><i class="fa fa-th-large"></i></a>
                                    <a href="javascript:;"><i class="fa fa-th-list"></i></a>
                                </div>
                                
                            </div>
                            <!-- BEGIN PRODUCT LIST -->
                            <div class="row product-list" id="produitAjax">

                                <!-- PRODUCT ITEM START -->

                                <c:forEach var="produit" items="${produits}">
                                    <div class="col-md-4 col-sm-6 col-xs-12">
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
                                </c:forEach>

                                <!-- PRODUCT ITEM END -->

                            </div>
                            <!-- END PRODUCT LIST -->
                            <!-- BEGIN PAGINATOR -->
                            <div class="row">
                                <div class="col-md-4 col-sm-4 items-info"><fmt:message key="Items"/> 1 <fmt:message key="to"/> 9  <fmt:message key="of"/> 10 <fmt:message key="total"/></div>
                                <div class="col-md-8 col-sm-8">
                                    <ul class="pagination pull-right">
                                        <li><a href="javascript:;">&laquo;</a></li>
                                        <li><a href="javascript:;">1</a></li>
                                        <li><span>2</span></li>
                                        <li><a href="javascript:;">3</a></li>
                                        <li><a href="javascript:;">4</a></li>
                                        <li><a href="javascript:;">5</a></li>
                                        <li><a href="javascript:;">&raquo;</a></li>
                                    </ul>
                                </div>
                            </div>
                            <!-- END PAGINATOR -->
                        </div>
                        <!-- END CONTENT -->
                    </div>
                    <!-- END SIDEBAR & CONTENT -->
                </div>
            </div>

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

            <%@include file="footer.jsp"  %>

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
        </fmt:bundle>
    </body>

</html>


