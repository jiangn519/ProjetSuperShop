<%-- 
    Document   : footer
    Created on : 2019-4-13, 19:41:39
    Author     : Nan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


    <!-- BEGIN STEPS -->
  <c:if test="${!(empty locale)}">
        <c:set var="loc" value="${locale}"/>
    </c:if>
    <fmt:setLocale value="${not empty sessionScope.locale ? sessionScope.locale : pageContext.request.locale}" />
     <fmt:bundle basename="ressources_i18n.Messages">
        <div class="steps-block steps-block-red">
      <div class="container">
        <div class="row">
          <div class="col-md-4 steps-block-col">
            <i class="fa fa-truck"></i>
            <div>
              <h2><fmt:message key="Freeshipping"/></h2>
              <em><fmt:message key="Expressdeliverywithing3days"/></em>
            </div>
            <span>&nbsp;</span>
          </div>
          <div class="col-md-4 steps-block-col">
            <i class="fa fa-gift"></i>
            <div>
              <h2><fmt:message key="ProductDetail"/></h2>
              <em>3<fmt:message key="Giftsdailyforluckycustomers"/></em>
            </div>
            <span>&nbsp;</span>
          </div>
          <div class="col-md-4 steps-block-col">
            <i class="fa fa-phone"></i>
            <div>
              <h2>477 505 8877</h2>
              <em>24/7 <fmt:message key="customercareavailable"/></em>
            </div>
          </div>
        </div>
      </div>
    </div>
    <!-- END STEPS -->

    <!-- BEGIN PRE-FOOTER -->
    <div class="pre-footer">
      <div class="container">
        <div class="row">
          <!-- BEGIN BOTTOM ABOUT BLOCK -->
          <div class="col-md-3 col-sm-6 pre-footer-col">
            <h2><fmt:message key="Aboutus"/></h2>
            <p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam sit nonummy nibh euismod tincidunt ut laoreet dolore magna aliquarm erat sit volutpat. Nostrud exerci tation ullamcorper suscipit lobortis nisl aliquip  commodo consequat. </p>
            <p>Duis autem vel eum iriure dolor vulputate velit esse molestie at dolore.</p>
          </div>
          <!-- END BOTTOM ABOUT BLOCK -->
          <!-- BEGIN BOTTOM INFO BLOCK -->
          <div class="col-md-3 col-sm-6 pre-footer-col">
            <h2><fmt:message key="Information"/></h2>
            <ul class="list-unstyled">
              <li><i class="fa fa-angle-right"></i> <a href="javascript:;"><fmt:message key="DeliveryInformation"/></a></li>
              <li><i class="fa fa-angle-right"></i> <a href="javascript:;"><fmt:message key="CustomerService"/></a></li>
              <li><i class="fa fa-angle-right"></i> <a href="javascript:;"><fmt:message key="OrderTracking"/></a></li>
              <li><i class="fa fa-angle-right"></i> <a href="javascript:;"><fmt:message key="Shipping"/> &amp; <fmt:message key="Retunrs"/></a></li>
              <li><i class="fa fa-angle-right"></i> <a href="contacts.html"><fmt:message key="ContactUs"/></a></li>
              <li><i class="fa fa-angle-right"></i> <a href="javascript:;"><fmt:message key="Careers"/></a></li>
              <li><i class="fa fa-angle-right"></i> <a href="javascript:;"><fmt:message key="PaymentMethods"/></a></li>
            </ul>
          </div>
          <!-- END INFO BLOCK -->

          <!-- BEGIN TWITTER BLOCK --> 
          <div class="col-md-3 col-sm-6 pre-footer-col">
            <h2 class="margin-bottom-0"><fmt:message key="LatestTweets"/></h2>
                  
          </div>
          <!-- END TWITTER BLOCK -->

          <!-- BEGIN BOTTOM CONTACTS -->
          <div class="col-md-3 col-sm-6 pre-footer-col">
            <h2><fmt:message key="OurContacts"/></h2>
            <address class="margin-bottom-40">
              35, Lorem Lis Street, Park Ave<br>
              California, US<br>
              <fmt:message key="Phone"/>: 300 323 3456<br>
              <fmt:message key="Fax"/>: 300 323 1456<br>
              <fmt:message key="Email"/>: <a href="mailto:info@metronic.com"><fmt:message key="info@metronic.com"/></a><br>
              <fmt:message key="Skype"/>: <a href="skype:metronic"><fmt:message key="metronic"/></a>
            </address>
          </div>
          <!-- END BOTTOM CONTACTS -->
        </div>
        <hr>
        <div class="row">
          <!-- BEGIN SOCIAL ICONS -->
          <div class="col-md-6 col-sm-6">
            <ul class="social-icons">
              <li><a class="rss" data-original-title="rss" href="javascript:;"></a></li>
              <li><a class="facebook" data-original-title="facebook" href="javascript:;"></a></li>
              <li><a class="twitter" data-original-title="twitter" href="javascript:;"></a></li>
              <li><a class="googleplus" data-original-title="googleplus" href="javascript:;"></a></li>
              <li><a class="linkedin" data-original-title="linkedin" href="javascript:;"></a></li>
              <li><a class="youtube" data-original-title="youtube" href="javascript:;"></a></li>
              <li><a class="vimeo" data-original-title="vimeo" href="javascript:;"></a></li>
              <li><a class="skype" data-original-title="skype" href="javascript:;"></a></li>
            </ul>
          </div>
          <!-- END SOCIAL ICONS -->
          <!-- BEGIN NEWLETTER -->
          <div class="col-md-6 col-sm-6">
            <div class="pre-footer-subscribe-box pull-right">
              <h2><fmt:message key="Newsletter"/></h2>
              <form action="#">
                <div class="input-group">
                  <input type="text" placeholder="youremail@mail.com" class="form-control">
                  <span class="input-group-btn">
                    <button class="btn btn-primary" type="submit"><fmt:message key="Subscribe"/></button>
                  </span>
                </div>
              </form>
            </div> 
          </div>
          <!-- END NEWLETTER -->
        </div>
      </div>
    </div>
</fmt:bundle>
    <!-- END PRE-FOOTER -->