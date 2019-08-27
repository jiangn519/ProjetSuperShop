<%-- 
    Document   : header
    Created on : 2019-4-13, 19:41:20
    Author     : 1985700
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<html>
    <c:if test="${!(empty locale)}">
        <c:set var="loc" value="${locale}"/>
    </c:if>
    <fmt:setLocale value="${not empty sessionScope.locale ? sessionScope.locale : pageContext.request.locale}" />
    <fmt:bundle basename="ressources_i18n.Messages">
        <head>
            <!-- Head END -->  
            <script type="text/javascript" src="scripts/language.js"></script>
        </head>

        <body>

            <!-- BEGIN TOP BAR -->
            <div class="pre-header">
                <div class="container">
                    <div class="row">
                        <!-- BEGIN TOP BAR LEFT PART -->
                        <div class="col-md-6 col-sm-6 additional-shop-info">
                            <ul class="list-unstyled list-inline">
                                <li><i class="fa fa-phone"></i><span>+1 456 6717</span></li>

                                <!-- BEGIN LANGS -->
                                <li class="langs-block">

                                    <form action="IndexServelet" method="post">
                                        <select name="lang" id="selectLang" onchange="changeLang()">
                                            <option value= ""><fmt:message key="${locale}"/></option>
                                            <option value="en"><fmt:message key="english"/></option>
                                            <option value="fr"><fmt:message key="french"/></option>

                                        </select>
                                    </form>
                                </li>
                                <!-- END LANGS -->

                            </ul>
                        </div>
                        <!-- END TOP BAR LEFT PART -->
                        <!-- BEGIN TOP BAR MENU -->
                        <div class="col-md-6 col-sm-6 additional-nav">
                            <ul class="list-unstyled list-inline pull-right">
                                <c:if test="${sessionScope.user!=null}">
                                    <li>Welcome, ${sessionScope.user} </li>
                                    </c:if>
                                <li><a href="MyAccount"><fmt:message key="MyAccount"/></a></li>
                                <li><a href="${(sessionScope.user!=null) ? "Logout" : "login.jsp" }">${(sessionScope.user!=null) ? "Logout" : "Login" }</a></li>
                                <c:if test="${sessionScope.user==null}"><li><a href="register.jsp">register</a></li></c:if>
                                </ul>
                            </div>
                            <!-- END TOP BAR MENU -->
                        </div>
                    </div>        
                </div>
                <!-- END TOP BAR -->

                <!-- BEGIN HEADER -->
                <div class="header">
                    <div class="container">
                        <a class="site-logo" href="index.jsp"><img src="assets/corporate/img/logos/logo-shop-red.png" alt="Metronic Shop UI"></a>

                        <a href="javascript:void(0);" class="mobi-toggler"><i class="fa fa-bars"></i></a>

                        <!-- BEGIN CART -->
                    
                        <div class="top-cart-block">
                            <div class="top-cart-info">

                                <a href="javascript:void(0);" class="top-cart-info-count" ><span id="headerNombre">${sessionScope.nombre}</span> <fmt:message key="Items"/></a>
                                <a href="javascript:void(0);" class="top-cart-info-value" >$<span id="headerTotal"><fmt:formatNumber type="number" maxFractionDigits="2" pattern="##,###.00" value="${sessionScope.total}" /></span> </a>

                            </div>
                            <i class="fa fa-shopping-cart"></i>

                            <div class="top-cart-content-wrapper">
                                <div class="top-cart-content" id="headerCart">
                                    <ul class="scroller" style="height: 250px;">
                                        <c:forEach var ="anOrder" items="${sessionScope.shoppingcart}" varStatus="id">
                                            <li>
                                                <a href="DetailleServelet?no=${anOrder.noprd}"><img src="images/${anOrder.photo}/1.jpg" alt="${anOrder.nameprd}" width="37" height="34"></a>
                                                <span class="cart-content-count">x ${anOrder.quantityCart}</span>
                                                <strong><a href="DetailleServelet?no=${anOrder.noprd}">${anOrder.nameprd}: ${anOrder.size}</a></strong>
                                                <em>$${anOrder.pricesale*anOrder.quantityCart}</em>

                                            </li>
                                        </c:forEach>
                                    </ul>
                                    <div class="text-right">
                                        <a href="ShoppingCartServlet" class="btn btn-default"><fmt:message key="ViewCart"/></a>
                                        <a href="CheckoutServlet" class="btn btn-primary"><fmt:message key="Checkout"/></a>
                                    </div>
                                </div>
                            </div>            
                        </div>
                   
                    <!--END CART -->

                    <!-- BEGIN NAVIGATION -->
                    <div class="header-navigation">
                        <ul>
                            <li ><a href="ListServelet"><fmt:message key="Allproducts"/></a></li>

                            <li><a href="ListServelet?catgenre=W" target="_blank"><fmt:message key="Women"/></a></li>
                            <li><a href="ListServelet?catgenre=M" target="_blank"><fmt:message key="Men"/></a></li>
                            <li><a href="ListServelet?catgenre=G" target="_blank"><fmt:message key="Girls"/></a></li> 
                            <li><a href="ListServelet?catgenre=B" target="_blank"><fmt:message key="Boys"/></a></li> 
                            <li><a href="#" target="_blank"><fmt:message key="Admintheme"/></a></li>

                            <!-- BEGIN TOP SEARCH -->
                            <li class="menu-search">
                                <span class="sep"></span>
                                <i class="fa fa-search search-btn"></i>
                                <div class="search-box">
                                    <form action="#">
                                        <div class="input-group">
                                            <input type="text" placeholder="Search" class="form-control">
                                            <span class="input-group-btn">
                                                <button class="btn btn-primary" type="submit"><fmt:message key="Search"/></button>
                                            </span>
                                        </div>
                                    </form>
                                </div> 
                            </li>
                            <!-- END TOP SEARCH -->
                        </ul>
                    </div>
                    <!-- END NAVIGATION -->
                </div>
            </div>
            <!-- Header END -->                                     
        </fmt:bundle>
    </body>

</html>


