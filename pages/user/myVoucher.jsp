<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML >

<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <meta content="yes" name="apple-mobile-web-app-capable" />
    <meta content="black" name="apple-mobile-web-app-status-bar-style" />
    <meta content="telephone=no" name="format-detection" />
    <link rel="stylesheet" href="../static/css/base.css">
    <link rel="stylesheet" href="../static/css/style.css">
    <script type="text/javascript" src="../static/js/jquery.min.js"></script>
    <script type="text/javascript" src="../static/js/json2-min.js"></script>
    <script type="text/javascript" src="../static/js/QryUrlStrParam.js"></script>
    <script type="text/javascript" src="../static/js/QxPublic.js"></script>
    <script type="text/javascript" src="../static/js/jquery.min.js"></script>
	<link rel="stylesheet" href="../static/css/jNotify.jquery.css">
	<script type="text/javascript" src="../static/js/jNotify.jquery.js"></script>
    <title>我的代金券</title>
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
</head>
<body>
<div class="myct">
	<span class="back" onClick="javascript:history.back(-1);"></span>
  	<p>优惠券</p>
<!--     <div class="index_menubtn"></div> -->
<!--     <div class="index_menu"> -->
<!--         <div class="index_menu_top"></div> -->
<!--         <ul> -->
<!--             <li><a href="" target="_self"><i class="index_menu_icon1"></i>首页</a></li> -->
<!--             <li><a href="" target="_self"><i class="index_menu_icon2"></i>购物车</a></li> -->
<!--             <li><a href="" target="_self"><i class="index_menu_icon3"></i>收藏夹</a></li> -->
<!--             <li><a href="" target="_self"><i class="index_menu_icon4"></i>我的范儿</a></li> -->
<!--         </ul> -->
<!--     </div> -->
</div>

<div class="container">
	<ul class="coupons_head border_bottom">
    	<li class="coupons_head_bd coupons_head_default">全部</li>
        <li class="coupons_head_bd">未使用</li>
        <li class="coupons_head_bd">已使用</li>
        <li>已过期</li>
        <div class="clear"></div>
    </ul>

    <div class="coupons_list">
    	<c:forEach items="${vouchers0 }" var="v">
	        <div class="coupons_content">
	            <div class="coupons_content_1" 
	            <c:if test="${v.status eq 1}">style="background:url(../static/img/coupons/Coupons.png) no-repeat; background-size:cover;"</c:if>
	            <c:if test="${v.status eq 2}">style="background:url(../static/img/coupons/Couponsgray.png) no-repeat; background-size:cover;"</c:if>
	            <c:if test="${v.status eq 3}">style="background:url(../static/img/coupons/Couponsgray.png) no-repeat; background-size:cover;"</c:if>
	            >
									<div class="coupons_content_2">
											<p>￥<span>${v.voucher.selledMoney }</span></p>
									</div>
									<div class="coupons_content_3">
<!-- 											<p>仅限天猫店使用</p> -->
											<p>满${v.voucher.targetMoney }可用</p>
									</div>
	            </div>
	            <div class="clear"></div>
	            <p>
	            	过期时间:${v.voucher.overTime }
	            	<span>
	            		<c:if test="${v.status eq 1}">未使用</c:if>
		            	<c:if test="${v.status eq 2}">已使用</c:if>
		            	<c:if test="${v.status eq 3}">已过期</c:if>
	            	</span>
	            </p>
	        </div>
        </c:forEach>
    </div>
	<div class="coupons_list" style="display: none;">
    	<c:forEach items="${vouchers1 }" var="v">
	        <div class="coupons_content">
	            <div class="coupons_content_1" style="background:url(../static/img/coupons/Coupons.png) no-repeat; background-size:cover;" >
									<div class="coupons_content_2">
											<p>￥<span>${v.voucher.selledMoney }</span></p>
									</div>
									<div class="coupons_content_3">
<!-- 											<p>仅限天猫店使用</p> -->
											<p>满${v.voucher.targetMoney }可用</p>
									</div>
	            </div>
	            <div class="clear"></div>
	            <p>
	            	过期时间:${v.voucher.overTime }
	            	<span>
	            		未使用
	            	</span>
	            </p>
	        </div>
        </c:forEach>
    </div><div class="coupons_list" style="display: none;">
    	<c:forEach items="${vouchers2 }" var="v">
	        <div class="coupons_content">
	            <div class="coupons_content_1" style="background:url(../static/img/coupons/Couponsgray.png) no-repeat; background-size:cover;" >
									<div class="coupons_content_2">
											<p>￥<span>${v.voucher.selledMoney }</span></p>
									</div>
									<div class="coupons_content_3">
<!-- 											<p>仅限天猫店使用</p> -->
											<p>满${v.voucher.targetMoney }可用</p>
									</div>
	            </div>
	            <div class="clear"></div>
	            <p>
	            	过期时间:${v.voucher.overTime }
	            	<span>
		            	已使用
	            	</span>
	            </p>
	        </div>
        </c:forEach>
    </div><div class="coupons_list" style="display: none;">
    	<c:forEach items="${vouchers3 }" var="v">
	        <div class="coupons_content">
	            <div class="coupons_content_1" style="background:url(../static/img/coupons/Couponsgray.png) no-repeat; background-size:cover;" >
									<div class="coupons_content_2">
											<p>￥<span>${v.voucher.selledMoney }</span></p>
									</div>
									<div class="coupons_content_3">
<!-- 											<p>仅限天猫店使用</p> -->
											<p>满${v.voucher.targetMoney }可用</p>
									</div>
	            </div>
	            <div class="clear"></div>
	            <p>
	            	过期时间:2015-07-16~${v.voucher.overTime }
	            	<span>
		            	已过期
	            	</span>
	            </p>
	        </div>
        </c:forEach>
    </div>
</div>
<script>
    $(document).ready(function(){
        $(".index_menubtn").click(function(){
            $(".index_menu").stop().fadeToggle('flow');
        })
        $(".coupons_head li").click(function(){
            $(this).addClass("coupons_head_default").siblings().removeClass("coupons_head_default")
            $(".coupons_list").hide().eq($(this).index()).show();
        })
    });
</script>
</body>
</html>
