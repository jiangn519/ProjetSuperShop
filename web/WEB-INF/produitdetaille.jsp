<%-- 
    Document   : detailproduit
    Created on : 2019-4-14, 21:44:56
    Author     : lin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" errorPage="/WEB-INF/erreur/erreur.jsp"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <!-- Head BEGIN -->
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Product Detail</title>
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
    <body class="ecommerce">
        <%@include file="header.jsp"  %>

        <div class="main">
            <div class="container">
                <c:if test="${produit!=null}">
                    <ul class="breadcrumb">
                        <li><a href="index.html">Home</a></li>
                        <li><a href="">${produit.catNameMere}</a></li>
                        <li class="active">${produit.catName}</li>
                    </ul>
                </c:if>
                <!-- BEGIN SIDEBAR & CONTENT -->
                <div class="row margin-bottom-40">
                    <!-- BEGIN SIDEBAR -->
                    <div class="sidebar col-md-3 col-sm-5">
                        <ul class="list-group margin-bottom-25 sidebar-menu">


                            <c:forEach var="catalogue" items="${catalogues}">

                                <li class="list-group-item clearfix dropdown  active">
                                    <a href="shop-product-list.html" class="collapsed">
                                        <i class="fa fa-angle-right"></i>
                                        ${catalogue.namecat}

                                    </a>
                                    <c:if test="${catalogue.childCat!=null}">
                                        <c:forEach var="catchild" items="${catalogue.childCat}">
                                            <ul class="dropdown-menu" style="display:block;">
                                                <li class="list-group-item dropdown clearfix">
                                                    <a href="GenreServlet?catChild=${catchild.nocat}" class="collapsed"><i class="fa fa-angle-right"></i>${catchild.namecat} </a>
                                                </li>
                                            </ul>
                                        </c:forEach>
                                    </c:if>  
                                </li>
                            </c:forEach> 

                        </ul>

                        <div class="sidebar-products clearfix">
                            <h2>Bestsellers</h2>
                            <div class="item">
                                <a href="shop-item.html"><img src="assets/pages/img/products/k1.jpg" alt="Some Shoes in Animal with Cut Out"></a>
                                <h3><a href="shop-item.html">Some Shoes in Animal with Cut Out</a></h3>
                                <div class="price">$31.00</div>
                            </div>
                            <div class="item">
                                <a href="shop-item.html"><img src="assets/pages/img/products/k4.jpg" alt="Some Shoes in Animal with Cut Out"></a>
                                <h3><a href="shop-item.html">Some Shoes in Animal with Cut Out</a></h3>
                                <div class="price">$23.00</div>
                            </div>
                            <div class="item">
                                <a href="shop-item.html"><img src="assets/pages/img/products/k3.jpg" alt="Some Shoes in Animal with Cut Out"></a>
                                <h3><a href="shop-item.html">Some Shoes in Animal with Cut Out</a></h3>
                                <div class="price">$86.00</div>
                            </div>
                        </div>
                    </div>
                    <!-- END SIDEBAR -->

                    <!-- BEGIN CONTENT -->
                     <form name="addCart" action="ShoppingCartServlet" method="POST">
                    <c:if test="${produit!=null}">
                        <div class="col-md-9 col-sm-7">
                            <div class="product-page">
                                <div class="row">
                                    <div class="col-md-6 col-sm-6">
                                        <div class="product-main-image">
                                            <img src="images/${produit.photo}/1.jpg" alt="${produit.nameprd}" class="img-responsive" data-BigImgsrc="images/${produit.photo}">
                                        </div>
                                        <div class="product-other-images">
                                            <a href="images/${produit.photo}/1.jpg" class="fancybox-button" rel="photos-lib"><img alt="Berry Lace Dress" src="images/${produit.photo}/1.jpg"></a>
                                            <a href="images/${produit.photo}/2.jpg" class="fancybox-button" rel="photos-lib"><img alt="Berry Lace Dress" src="images/${produit.photo}/2.jpg"></a>
                                            <a href="images/${produit.photo}/3.jpg" class="fancybox-button" rel="photos-lib"><img alt="Berry Lace Dress" src="images/${produit.photo}/3.jpg"></a>
                                        </div>
                                        <c:if test="${produit.genre=='N'}">
                                            <div class="sticker sticker-new"></div>
                                        </c:if>   

                                    </div>
                                    <div class="col-md-6 col-sm-6">
                                        <h1>${produit.nameprd}</h1>
                                        <div class="price-availability-block clearfix">

                                            <div class="price">  
                                                <c:if test="${produit.pricesale==produit.price}">
                                                    <strong style="color:black"><span>$</span>${produit.pricesale}</strong>

                                                </c:if>
                                                <c:if test="${produit.pricesale!=produit.price}">
                                                    <strong><span>$</span>${produit.pricesale}</strong>
                                                    <em>$<span>${produit.price}</span></em>
                                                </c:if>
                                            </div>

                                            <div class="availability">
                                                Availability: <strong>In Stock</strong>
                                            </div>
                                        </div>
                                        <div class="description">
                                            <p>${produit.namedescription}</p>
                                        </div>
                                        <div class="product-page-options">
                                            <div class="pull-left">
                                                <label class="control-label">Size:</label>
                                                <select class="form-control input-sm" id="sizeselectpro" onchange="rechercheQuantity(this)" nop="${produit.noprd}" name="selectSize">
                                                    <option>Choose</option>
                                                    <c:forEach var="ds" items="${detailsizes}">
                                                        <option>${ds.namesize}</option>
                                                    </c:forEach>
                                                </select>
                                            </div>
                                            <div class="pull-left">
                                                <label class="control-label">Quantity in stock:</label>
                                                <div class="product-quantity">
                                                    <label class="control-label" id="product-quantity"></label>
                                                </div>
                                            </div>
                                        </div>
                                       
                                            <div class="product-page-cart">
                                                <div class="product-quantity">
                                                    <input id="choose-quantity" type="text" value="1" class="form-control input-sm" name="quan">
                                                </div>
                                                <button class="btn btn-primary" type="submit">Add to cart</button>
                                                <input  type="hidden" name="action" value="ADD">
                                                <input type="hidden" name= "prdid" value=${produit.noprd}>
                                            </div>
                                                       
                                        <div class="review">
                                            <input type="range" value="4" step="0.25" id="backing4">
                                            <div class="rateit" data-rateit-backingfld="#backing4" data-rateit-resetable="false"  data-rateit-ispreset="true" data-rateit-min="0" data-rateit-max="5">
                                            </div>
                                            <a href="javascript:;">7 reviews</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="javascript:;">Write a review</a>
                                        </div>
                                        <ul class="social-icons">
                                            <li><a class="facebook" data-original-title="facebook" href="javascript:;"></a></li>
                                            <li><a class="twitter" data-original-title="twitter" href="javascript:;"></a></li>
                                            <li><a class="googleplus" data-original-title="googleplus" href="javascript:;"></a></li>
                                            <li><a class="evernote" data-original-title="evernote" href="javascript:;"></a></li>
                                            <li><a class="tumblr" data-original-title="tumblr" href="javascript:;"></a></li>
                                        </ul>
                                    </div>

                                    <div class="product-page-content">
                                        <ul id="myTab" class="nav nav-tabs">
                                            <li><a href="#Description" data-toggle="tab">Description</a></li>
                                            <li><a href="#Information" data-toggle="tab">Information</a></li>
                                            <li class="active"><a href="#Reviews" data-toggle="tab">Reviews (2)</a></li>
                                        </ul>
                                        <div id="myTabContent" class="tab-content">
                                            <div class="tab-pane fade" id="Description">
                                                <p>Lorem ipsum dolor ut sit ame dolore  adipiscing elit, sed sit nonumy nibh sed euismod laoreet dolore magna aliquarm erat sit volutpat Nostrud duis molestie at dolore. Lorem ipsum dolor ut sit ame dolore  adipiscing elit, sed sit nonumy nibh sed euismod laoreet dolore magna aliquarm erat sit volutpat Nostrud duis molestie at dolore. Lorem ipsum dolor ut sit ame dolore  adipiscing elit, sed sit nonumy nibh sed euismod laoreet dolore magna aliquarm erat sit volutpat Nostrud duis molestie at dolore. </p>
                                            </div>
                                            <div class="tab-pane fade" id="Information">
                                                <table class="datasheet">
                                                    <tr>
                                                        <th colspan="2">Additional features</th>
                                                    </tr>
                                                    <tr>
                                                        <td class="datasheet-features-type">Value 1</td>
                                                        <td>21 cm</td>
                                                    </tr>
                                                    <tr>
                                                        <td class="datasheet-features-type">Value 2</td>
                                                        <td>700 gr.</td>
                                                    </tr>
                                                    <tr>
                                                        <td class="datasheet-features-type">Value 3</td>
                                                        <td>10 person</td>
                                                    </tr>
                                                    <tr>
                                                        <td class="datasheet-features-type">Value 4</td>
                                                        <td>14 cm</td>
                                                    </tr>
                                                    <tr>
                                                        <td class="datasheet-features-type">Value 5</td>
                                                        <td>plastic</td>
                                                    </tr>
                                                </table>
                                            </div>
                                            <div class="tab-pane fade in active" id="Reviews">
                                                <!--<p>There are no reviews for this product.</p>-->
                                                <div class="review-item clearfix">
                                                    <div class="review-item-submitted">
                                                        <strong>Bob</strong>
                                                        <em>30/12/2013 - 07:37</em>
                                                        <div class="rateit" data-rateit-value="5" data-rateit-ispreset="true" data-rateit-readonly="true"></div>
                                                    </div>                                              
                                                    <div class="review-item-content">
                                                        <p>Sed velit quam, auctor id semper a, hendrerit eget justo. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Duis vel arcu pulvinar dolor tempus feugiat id in orci. Phasellus sed erat leo. Donec luctus, justo eget ultricies tristique, enim mauris bibendum orci, a sodales lectus purus ut lorem.</p>
                                                    </div>
                                                </div>
                                                <div class="review-item clearfix">
                                                    <div class="review-item-submitted">
                                                        <strong>Mary</strong>
                                                        <em>13/12/2013 - 17:49</em>
                                                        <div class="rateit" data-rateit-value="2.5" data-rateit-ispreset="true" data-rateit-readonly="true"></div>
                                                    </div>                                              
                                                    <div class="review-item-content">
                                                        <p>Sed velit quam, auctor id semper a, hendrerit eget justo. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Duis vel arcu pulvinar dolor tempus feugiat id in orci. Phasellus sed erat leo. Donec luctus, justo eget ultricies tristique, enim mauris bibendum orci, a sodales lectus purus ut lorem.</p>
                                                    </div>
                                                </div>

                                                <!-- BEGIN FORM-->
                                                <form action="#" class="reviews-form" role="form">
                                                    <h2>Write a review</h2>
                                                    <div class="form-group">
                                                        <label for="name">Name <span class="require">*</span></label>
                                                        <input type="text" class="form-control" id="name">
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="email">Email</label>
                                                        <input type="text" class="form-control" id="email">
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="review">Review <span class="require">*</span></label>
                                                        <textarea class="form-control" rows="8" id="review"></textarea>
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="email">Rating</label>
                                                        <input type="range" value="4" step="0.25" id="backing5">
                                                        <div class="rateit" data-rateit-backingfld="#backing5" data-rateit-resetable="false"  data-rateit-ispreset="true" data-rateit-min="0" data-rateit-max="5">
                                                        </div>
                                                    </div>
                                                    <div class="padding-top-20">                  
                                                        <button type="submit" class="btn btn-primary">Send</button>
                                                    </div>
                                                </form>
                                                <!-- END FORM--> 
                                            </div>
                                        </div>
                                    </div>

                                    <c:if test="${produit.genre=='S'}">
                                        <div class="sticker sticker-sale"></div>
                                    </c:if>

                                </div>
                            </div>
                        </div>
                    </c:if>
                      </form>   
                         
                    <!-- END CONTENT -->
                </div>
                <!-- END SIDEBAR & CONTENT -->

                <!-- BEGIN SIMILAR PRODUCTS -->
                <div class="row margin-bottom-40">
                    <div class="col-md-12 col-sm-12">
                        <h2>Most popular products</h2>
                        <div class="owl-carousel owl-carousel4">
                            <div>
                                <div class="product-item">
                                    <div class="pi-img-wrapper">
                                        <img src="assets/pages/img/products/k1.jpg" class="img-responsive" alt="Berry Lace Dress">
                                        <div>
                                            <a href="assets/pages/img/products/k1.jpg" class="btn btn-default fancybox-button">Zoom</a>
                                            <a href="#product-pop-up" class="btn btn-default fancybox-fast-view">View</a>
                                        </div>
                                    </div>
                                    <h3><a href="shop-item.html">Berry Lace Dress</a></h3>
                                    <div class="pi-price">$29.00</div>
                                    <a href="javascript:;" class="btn btn-default add2cart">Add to cart</a>
                                    <div class="sticker sticker-new"></div>
                                </div>
                            </div>
                            <div>
                                <div class="product-item">
                                    <div class="pi-img-wrapper">
                                        <img src="assets/pages/img/products/k2.jpg" class="img-responsive" alt="Berry Lace Dress">
                                        <div>
                                            <a href="assets/pages/img/products/k2.jpg" class="btn btn-default fancybox-button">Zoom</a>
                                            <a href="#product-pop-up" class="btn btn-default fancybox-fast-view">View</a>
                                        </div>
                                    </div>
                                    <h3><a href="shop-item.html">Berry Lace Dress2</a></h3>
                                    <div class="pi-price">$29.00</div>
                                    <a href="javascript:;" class="btn btn-default add2cart">Add to cart</a>
                                </div>
                            </div>
                            <div>
                                <div class="product-item">
                                    <div class="pi-img-wrapper">
                                        <img src="assets/pages/img/products/k3.jpg" class="img-responsive" alt="Berry Lace Dress">
                                        <div>
                                            <a href="assets/pages/img/products/k3.jpg" class="btn btn-default fancybox-button">Zoom</a>
                                            <a href="#product-pop-up" class="btn btn-default fancybox-fast-view">View</a>
                                        </div>
                                    </div>
                                    <h3><a href="shop-item.html">Berry Lace Dress3</a></h3>
                                    <div class="pi-price">$29.00</div>
                                    <a href="javascript:;" class="btn btn-default add2cart">Add to cart</a>
                                </div>
                            </div>
                            <div>
                                <div class="product-item">
                                    <div class="pi-img-wrapper">
                                        <img src="assets/pages/img/products/k4.jpg" class="img-responsive" alt="Berry Lace Dress">
                                        <div>
                                            <a href="assets/pages/img/products/k4.jpg" class="btn btn-default fancybox-button">Zoom</a>
                                            <a href="#product-pop-up" class="btn btn-default fancybox-fast-view">View</a>
                                        </div>
                                    </div>
                                    <h3><a href="shop-item.html">Berry Lace Dress4</a></h3>
                                    <div class="pi-price">$29.00</div>
                                    <a href="javascript:;" class="btn btn-default add2cart">Add to cart</a>
                                    <div class="sticker sticker-sale"></div>
                                </div>
                            </div>
                            <div>
                                <div class="product-item">
                                    <div class="pi-img-wrapper">
                                        <img src="assets/pages/img/products/k1.jpg" class="img-responsive" alt="Berry Lace Dress">
                                        <div>
                                            <a href="assets/pages/img/products/k1.jpg" class="btn btn-default fancybox-button">Zoom</a>
                                            <a href="#product-pop-up" class="btn btn-default fancybox-fast-view">View</a>
                                        </div>
                                    </div>
                                    <h3><a href="shop-item.html">Berry Lace Dress5</a></h3>
                                    <div class="pi-price">$29.00</div>
                                    <a href="javascript:;" class="btn btn-default add2cart">Add to cart</a>
                                </div>
                            </div>
                            <div>
                                <div class="product-item">
                                    <div class="pi-img-wrapper">
                                        <img src="assets/pages/img/products/k2.jpg" class="img-responsive" alt="Berry Lace Dress">
                                        <div>
                                            <a href="assets/pages/img/products/k2.jpg" class="btn btn-default fancybox-button">Zoom</a>
                                            <a href="#product-pop-up" class="btn btn-default fancybox-fast-view">View</a>
                                        </div>
                                    </div>
                                    <h3><a href="shop-item.html">Berry Lace Dress6</a></h3>
                                    <div class="pi-price">$29.00</div>
                                    <a href="javascript:;" class="btn btn-default add2cart">Add to cart</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- END SIMILAR PRODUCTS -->
            </div>
        </div>
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

        <script src="assets/corporate/scripts/layout.js" type="text/javascript"></script>
        <script type="text/javascript">
                                                    jQuery(document).ready(function () {
                                                        Layout.init();
                                                        Layout.initOWL();
                                                        Layout.initTwitter();
                                                        Layout.initImageZoom();
                                                        Layout.initTouchspin();
                                                        Layout.initUniform();
                                                    });
        </script>
        <!-- END PAGE LEVEL JAVASCRIPTS -->

    </body>
</html>
