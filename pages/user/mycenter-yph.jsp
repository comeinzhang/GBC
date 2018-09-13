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
    <link rel="stylesheet" href="../static/css/base-yph.css">
    <link rel="stylesheet" href="../static/css/me-yph.css">
    <script type="text/javascript" src="../static/js/jquery.min.js"></script>
    <script type="text/javascript" src="../static/iconfonts/icon_url.js"></script>
    <link rel="stylesheet" href="http://at.alicdn.com/t/font_450229_7k0kvgzblzjs8aor.css">
    <title>个人中心</title>
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<style type="text/css">
		.me-index .menus .p-row span{line-height:15px; background: #fe6345; color: #FFFFFF; border-radius: 8px;width: 55px;margin-top: 15px;text-align: center;}
	</style>
</head>
<body>
<div class="me-index">
<!--    <div class="p-heat" id="indexTop">
        <span class="back-btn" onclick="javascript :history.back(-1);"></span>
        <p class="title">我的</p>
    </div>-->
    <div class="head-me">
        <div class="title">
            <p class="p1">个人中心</p>
<%--            <a href="javaScript:" class="set-btn"><i class="iconfont icon-shezhi"></i></a>--%>
        </div>
        <div class="info">
            <div class="img" onclick="javascript:location.href='jbzl';">
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
                <p class="p1">${user.nickName}欢迎你</p>
                <p class="p2">${user.phone}</p>
            </div>
            <i class="iconfont icon-more" onclick="javascript:location.href='jbzl';"></i>
        </div>
        <div class="info2">
            <div class="dd">
                <p class="p1">${user.balance}</p>
                <p class="p2">余额</p>
            </div>
            <div class="dd">
                <div class="d4">
                    <p class="p1"><i class="iconfont icon-huangguan"></i></p>
                    <p class="p2">${user.userRoleName}</p>
                </div>
            </div>
            <div class="dd">
                <p class="p1">${user.jifenYes}</p>
                <p class="p2">积分</p>
            </div>
        </div>
        <div class="bg">
            <img src="../static/images/30_02.png" width="100%">
        </div>

    </div>
    <div class="top-icon-url">
        <div class="p-row3">
            <a href="myOrderList">
            我的订单
            <span>更多订单</span>
            </a>
        </div>
        <div class="go-od-url clearfix">
            <a href="orderList?flag=NO" target="_self">
                <img src="../static/images/30_12.png">
                <p>待付款</p>
                <c:if test="${count1!=null && count1!=0}">
	    		<span>${count1==0?"":count1}</span>
    			</c:if>
            </a>
            <a href="orderList?flag=NOEMS" target="_self">
                <img src="../static/images/30_05.png">
                <p>待发货</p>
                <c:if test="${count2!=null && count2!=0}">
	    		<span>${count2==0?"":count2}</span>
    			</c:if>
            </a>
            <a href="orderList?flag=EMSING" target="_self">
                <img src="../static/images/30_07.png">
                <p>待收货</p>
                <c:if test="${count3!=null && count3!=0}">
	    		<span>${count3==0?"":count3}</span>
    			</c:if>
            </a>
            <a href="orderList?flag=SUCCESS" target="_self">
                <img src="../static/images/30_09.png">
                <p>待评价</p>
                <c:if test="${count4!=null && count4!=0}">
	    		<span>${count4==0?"":count4}</span>
    			</c:if>
            </a>
            <a href="orderList?flag=RECH" target="_self">
                <img src="../static/images/30_15.png">
                <p>退货/售后</p>
                <c:if test="${count5!=null && count5!=0}">
	    		<span>${count5==0?"":count5}</span>
    			</c:if>
            </a>
        </div>
    </div>
    <div class="menus">
        <div class="p-row">
            <a href="../goods/getGoodsStore" target="_self"><img src="../static/images/30_23.png" class="im">我的收藏</a>
            <i class="iconfont icon-more"></i>
        </div>
        <c:if test="${empty shop}">
	        <div class="p-row">
	            <a href="toReplyShop" target="_self"><img src="../static/images/30_26.png" class="im">商家入驻</a>
	            <i class="iconfont icon-more"></i>
	        </div>
        </c:if>
        <c:if test="${!empty shop}">
	        <div class="p-row">
	            <a href="toMyShop" target="_self"><img src="../static/images/30_26.png" class="im">我的店铺
	            <c:if test="${!empty shopOrderNum and shopOrderNum>0}"><span style="position: absolute;right: 40px;">新账单</span></c:if>
	            </a>
	            <i class="iconfont icon-more"></i>
	        </div>
	        <div class="p-row">
	            <a href="toSubmitOrder" target="_self"><img src="../static/images/30_38.png" class="im">报单中心</a>
	            <i class="iconfont icon-more"></i>
        	</div>
        </c:if>
        <div class="p-row">
            <a href="toEditAddr" target="_self"><img src="../static/images/30_28.png" class="im">地址管理</a>
            <i class="iconfont icon-more"></i>
        </div>
        <div class="p-row">
            <a href="toRechargeMoney" target="_self"><img src="../static/images/30_32.png" class="im">充值中心</a>
            <i class="iconfont icon-more"></i>
        </div>
<%--        <div class="p-row">--%>
<%--            <a href="myRedPacket" target="_self"><img src="../static/images/30_34.png" class="im">我的惠享</a>--%>
<%--            <i class="iconfont icon-more"></i>--%>
<%--        </div>--%>
		<c:if test="${fn:contains(user.userRoleId, 'a') or fn:contains(user.userRoleId, 'b') or fn:contains(user.userRoleId, 'c')}">
	        <div class="p-row">
	            <a href="myBonus?type=coms" target="_self"><img src="../static/images/30_36.png" class="im">我的业绩
	            <c:if test="${coms>0}"><span style="position: absolute;right: 40px;">新收益</span></c:if>
	            </a>
	            <i class="iconfont icon-more"></i>
	        </div>
        </c:if>
        <c:if test="${fn:contains(user.userRoleId, 'g')}">
	        <div class="p-row">
	            <a href="myBonus?type=payment" target="_self"><img src="../static/images/30_36.png" class="im">我的收益
	            <c:if test="${payments>0}"><span style="position: absolute;right: 40px;">新收益</span></c:if>
	            </a>
	            <i class="iconfont icon-more"></i>
	        </div>
        </c:if>
        <c:if test="${fn:contains(user.userRoleId, 'f')}">
	        <div class="p-row">
	            <a href="myBonus?type=refer" target="_self"><img src="../static/images/30_36.png" class="im">我的佣金
	            <c:if test="${refers>0}"><span style="position: absolute;right: 40px;">新收益</span></c:if>
	            </a>
	            <i class="iconfont icon-more"></i>
	        </div>
        </c:if>
    </div>
</div>
<div class="bottom_menu border-top">
    <ul id="sliderLeftI">
        <li>
            <a href="../goods/index" target="_self">
                <i class="bottom_menu_bg1"></i>
                <p>首页</p>
            </a>
        </li>
        <li>
            <a href="${pageContext.request.contextPath}/shop/shopLm">
                <i class="bottom_menu_bg2"></i>
                <p>商城</p>
            </a>
        </li>
        <li>
            <a href="../goods/getGoodsCar" target="_self">
                <i class="bottom_menu_bg3"></i>
                <p>购物车</p>
            </a>
        </li>
        <li class="active">
            <a href="mycenter" target="_self" id="goMyCenter">
                <i class="bottom_menu_bg4"></i>
                <p>我的</p>
            </a>
        </li>
    </ul>
</div>
</body>
</html>
