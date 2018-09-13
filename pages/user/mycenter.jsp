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
    <link rel="stylesheet" href="../static/iconfonts/icon_url.js">
    <link rel="stylesheet" href="../static/css/base_yph1.css">
    <link rel="stylesheet" href="../static/css/me.css">
    <script type="text/javascript" src="../static/js/jquery.min.js"></script>
    <script type="text/javascript" src="../static/iconfonts/icon_url.js"></script>
    <title>个人中心</title>
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
</head>
<body>
<!--我的个人中心-->
<div class="me-index" style="margin-top: 0px;">
<%--<div class="p-heat" id="indexTop">--%>
<%--        <span class="back-btn" onclick="javascript :history.back(-1);"></span>--%>
<%--        <p class="title">我的</p>--%>
<%--</div>--%>
<div class="head-me">
        <div class="info">
            <div class="img">
            <c:choose> 
				<c:when test="${fn:contains(user.headImgUrl,'http')}">    
					  <img src="${user.headImgUrl}" style="width: 100%;height: 100%;"/>
				</c:when>
				<c:otherwise>    
					   <img src="${ASSET_URL }${user.headImgUrl}" style="width: 100%;height: 100%;"/>
				</c:otherwise> 
			</c:choose>
            </div>
            <div class="text">
                <p class="p1">${user.nickName} 欢迎你</p>
                <p class="p2">${user.userRoleName} <img src="../static/images/dj_03.png"></p>
                <p class="p3">积分: ${user.jifenYes}</p>
                <p class="p3">余额: ${user.balance}</p>
            </div>
        </div>
        <div class="go-set">
        <c:if test="${user.userRoleId eq '19'}">
        <a href="toSubmitOrder" target="_self">报单中心</a>
        <a href="shopLineOrder" target="_self">我的报单</a>
        </c:if>
        <c:if test="${user.userRoleId eq '17'}">
        <a href="toReferMember" target="_self">推荐会员</a>
        <a href="myReferMember" target="_self">我的会员</a>
        </c:if>
        <c:if test="${user.userRoleId eq '16'}">
        <a href="toReferShop" target="_self">推广商家</a>
        <a href="myReferShop" target="_self">我的商家</a>
        </c:if>
        <a href="jbzl" target="_self">基本资料<i class="iconfont icon-gengduo1 icon-por"></i></a>
        </div>
</div>
<div class="top-icon-url">
<%--        <div class="p-row">--%>
<%--            <a href="myOrderList" target="_self"><img src="../static/images/wd_03.png" class="im">所有订单</a>--%>
<%--            <i class="iconfont icon-gengduo1 icon-por"></i>--%>
<%--        </div>--%>
        <div class="go-od-url clearfix">
            <a href="orderList?flag=NO" target="_self">
                <img src="../static/images/wd_07.png">
                <p>待付款</p>
                <c:if test="${count1!=null && count1!=0}">
	    		<span>${count1==0?"":count1}</span>
    			</c:if>
            </a>
            <a href="orderList?flag=NOEMS" target="_self">
                <img src="../static/images/wd_09.png">
                <p>待发货</p>
                <c:if test="${count2!=null && count2!=0}">
	    		<span>${count2==0?"":count2}</span>
    			</c:if>
            </a>
            <a href="orderList?flag=EMSING" target="_self">
                <img src="../static/images/wd_11.png">
                <p>待收货</p>
                <c:if test="${count3!=null && count3!=0}">
	    		<span>${count3==0?"":count3}</span>
    			</c:if>
            </a>
            <a href="orderList?flag=SUCCESS" target="_self">
                <img src="../static/images/wd_13.png">
                <p>已收货</p>
                <c:if test="${count4!=null && count4!=0}">
	    		<span>${count4==0?"":count4}</span>
    			</c:if>
            </a>
            <a href="../order/returnGoodsList" target="_self">
                <img src="../static/images/wd_15.png">
                <p>退货/售后</p>
                <c:if test="${count5!=null && count5!=0}">
	    		<span>${count5==0?"":count5}</span>
    			</c:if>
            </a>
        </div>
    </div>
    <div class="menus">
    	<div class="p-row">
            <a href="myOrderList" target="_self"><img src="../static/images/wd_03.png" class="im">所有订单</a>
            <i class="iconfont icon-gengduo1 icon-por"></i>
        </div>
        <div class="p-row">
            <a href="../goods/getGoodsStore" target="_self"><img src="../static/images/wd_22.png" class="im">我的收藏</a>
            <i class="iconfont icon-gengduo1 icon-por"></i>
        </div>
        <div class="p-row">
            <a href="../goods/getGoodsCar" target="_self"><img src="../static/images/wd_26.png" class="im">我的购物车</a>
            <i class="iconfont icon-gengduo1 icon-por"></i>
        </div>
        <div class="p-row">
            <a href="toEditAddr" target="_self"><img src="../static/images/wd_30.png" class="im">地址管理</a>
            <i class="iconfont icon-gengduo1 icon-por"></i>
        </div>
        <c:if test="${sessionScope.webIn eq 'yphApp' }">
        <div class="p-row">
            <a href="../goods/getMyBids" target="_self"><img src="../static/images/wd_34.png" class="im">我的拍品</a>
            <i class="iconfont icon-gengduo1 icon-por"></i>
        </div>
        <div class="p-row">
            <a href="../goods/getMyFocus" target="_self"><img src="../static/images/wd_38.png" class="im">关注商家</a>
            <i class="iconfont icon-gengduo1 icon-por"></i>
        </div>
        </c:if>
        <c:if test="${sessionScope.webIn ne 'yph'}">
        	<c:if test="${!empty shop }">
		        <div class="p-row">
		            <a href="toMyShop" target="_self"><img src="../static/images/wd_41.png" class="im">我的店铺</a>
		            <i class="iconfont icon-gengduo1 icon-por"></i>
		        </div>
		     </c:if>
		     <c:if test="${sessionScope.webIn ne 'kxz'}">
		     <c:if test="${empty shop and user.userRoleId eq '18'}">
		        <div class="p-row">
		            <a href="toReplyShop" target="_self"><img src="../static/images/wd_41.png" class="im">商家入驻</a>
		            <i class="iconfont icon-gengduo1 icon-por"></i>
		        </div>
		     </c:if>
		     </c:if>
		      <c:if test="${sessionScope.webIn eq 'kxz'}">
		     <c:if test="${empty shop }">
		        <div class="p-row">
		            <a href="toReplyShop" target="_self"><img src="../static/images/wd_41.png" class="im">商家入驻</a>
		            <i class="iconfont icon-gengduo1 icon-por"></i>
		        </div>
		     </c:if>
		     </c:if>
		     <c:if test="${!empty poster }">
		        <div class="p-row">
		            <a href="breakerOrderList" target="_self"><img src="../static/images/wd_41.png" class="im">早餐订单</a>
		            <i class="iconfont icon-gengduo1 icon-por"></i>
		        </div>
		     </c:if>
        </c:if>
        <c:if test="${sessionScope.webIn eq 'kxz'}">
        <div class="p-row">
            <a href="shopMoney" target="_self"><img src="../static/images/wd_46.png" class="im">我的佣金</a>
            <i class="iconfont icon-gengduo1 icon-por"></i>
        </div>
        </c:if>
        <c:if test="${sessionScope.webIn ne 'kxz'}">
        	<c:if test="${user.userRoleId eq '17' or user.userRoleId eq '18'}">
		        <div class="p-row">
		            <a href="myRedPacket" target="_self"><img src="../static/images/wd_46.png" class="im">我的惠享</a>
		            <i class="iconfont icon-gengduo1 icon-por"></i>
		        </div>
	        </c:if>
	        <div class="p-row">
	            <a href="myBonus" target="_self"><img src="../static/images/wd_49.png" class="im">我的业绩</a>
	            <i class="iconfont icon-gengduo1 icon-por"></i>
	        </div>
		     <c:if test="${user.userRoleId eq '17'}">
			     <div class="p-row">
		            <a href="toReferMember" target="_self"><img src="../static/images/wd_30.png" class="im">推荐会员</a>
		            <i class="iconfont icon-gengduo1 icon-por"></i>
	        	 </div>
	        	 <div class="p-row">
		            <a href="myReferMember" target="_self"><img src="../static/images/wd_30.png" class="im">我的会员</a>
		            <i class="iconfont icon-gengduo1 icon-por"></i>
	        	 </div>
        	</c:if>
        </c:if>
        <div class="p-row">
            <a href="toRechargeMoney" target="_self"><img src="../static/images/wd_49.png" class="im">充值/提现</a>
            <i class="iconfont icon-gengduo1 icon-por"></i>
        </div>
        <div class="p-row">
            <a href="shopJifen" target="_self"><img src="../static/images/wd_49.png" class="im">我的积分</a>
            <i class="iconfont icon-gengduo1 icon-por"></i>
        </div>
        <div class="p-row">
            <a href="../goods/myVoucherListByStatus" target="_self"><img src="../static/images/wd_49.png" class="im">我的代金券</a>
            <i class="iconfont icon-gengduo1 icon-por"></i>
        </div>
        <c:if test="${sessionScope.webIn eq 'kxz'}">
        	<div class="p-row">
            <a href="toMyBreaker" target="_self"><img src="../static/images/wd_49.png" class="im">我的早餐</a>
            <i class="iconfont icon-gengduo1 icon-por"></i>
        	</div>
        	<div class="p-row">
            <a href="toHomeAddr" target="_self"><img src="../static/images/wd_49.png" class="im">我家地址</a>
            <i class="iconfont icon-gengduo1 icon-por"></i>
        	</div>
        </c:if>
    </div>
<!-- <div class="container mydd"> -->
<!--     <ul class="mydd_2"> -->
<!--         <li><a href="aboutMe" target="_self" class="mydd_2_6" style="margin-top:0px;">关于我们<span class="mydd_1_span">关于我们</span></a></li> -->
<!--         <li><a href="tel:4000167117" target="_self" class="mydd_2_6" style="margin-top:0px;">联系客服<span class="mydd_1_span">联系客服</span></a></li> -->
<!--     </ul> -->
<!-- </div> -->
</div>
<div class="bottom_menu border-top">
        <ul id="sliderLeftI">
            <li>
	                <a href="../goods/index" target="_self">
	                    <i class="bottom_menu_bg1"></i>
	                    <p>首页</p>
	                </a>
            </li>
            <c:if test="${sessionScope.webIn eq 'yphApp' or sessionScope.webIn eq 'yph'}">
            <li>
                <a href="../goods/toPmGoodsList">
                    <i class="bottom_menu_bg2"></i>
                    <p>拍卖</p>
                </a>
            </li>
            </c:if>
            <c:if test="${sessionScope.webIn ne 'yphApp' and sessionScope.webIn ne 'yph' and sessionScope.webIn ne 'yhlm'}">
            <li>
                <a href="../goods/catagoryList">
                    <i class="bottom_menu_bg2"></i>
                    <p>分类</p>
                </a>
            </li>
            </c:if>
            <c:if test="${sessionScope.webIn eq 'yhlm'}">
            <li>
                <a href="${pageContext.request.contextPath}/shop/shopLm">
                    <i class="bottom_menu_bg2"></i>
                    <p>商家</p>
                </a>
            </li>
            </c:if>
            <li>
                <a href="../goods/getGoodsCar" target="_self">
                    <i class="bottom_menu_bg3"></i>
                    <p>购物车</p>
                </a>
            </li>
            <li>
                <a href="mycenter" target="_self" id="goMyCenter" style="color: #c40000;">
                    <i class="bottom_menu_bg4"></i>
                    <p>个人中心</p>
                </a>
            </li>
        </ul>
    </div>
</body>
</html>
