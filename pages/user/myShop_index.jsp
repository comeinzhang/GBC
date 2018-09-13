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
    <link rel="stylesheet" href="../static/css/css.css">
    <script type="text/javascript" src="../static/js/jquery.min.js"></script>
    <title>我的店铺</title>
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<style type="text/css">
		.container .myshopmenulist li i{ min-width: 20px; height: 15px; background: #fe6345; color: #FFFFFF; border-radius: 8px;}
	</style>
</head>
<body>
<div class="container myct">
    <span class="back" onclick="javascript :history.back(-1);"></span>
    <p>我的店铺</p>
</div>
<div class="container mt10">
    <ul class="myshopmenulist">
        <li><a class="myshopmenulist_1" href="shop_detail?id=${shop.id }" target="_self">我的店铺<span>查看我的店铺</span></a></li>
<!--         <li><a class="myshopmenulist_2" href="toMyGoods" target="_self">商品管理<span>查看商品详情</span></a></li> -->
        <li><a class="myshopmenulist_2" href="toMyPTGoods" target="_self">商品管理<span>查看商品详情</span></a></li>
        <%--<li><a class="myshopmenulist_3" href="shopMoney" target="_self">店铺佣金<span>查看店铺佣金</span></a></li>--%>
        <li><a class="myshopmenulist_4" href="shopOrderList" target="_self">本店订单<span><c:if test="${!empty shopOrderNum and shopOrderNum>0}"><i>${shopOrderNum}</i></c:if>  查看本店订单详情</span></a></li>
        <li><a class="myshopmenulist_4" href="shopLineOrder" target="_self">本店报单<span>查看本店报单记录</span></a></li>
<%--        <li><a class="myshopmenulist_5" href="myReferShop" target="_self">我的分享<span>查看我的推荐店铺</span></a></li>--%>
        <li><a class="myshopmenulist_5" href="../goods/toReleasePTGoods" target="_self">发布商品<span>发布您的商品</span></a></li>
<%--        <li><a class="myshopmenulist_5" href="../goods/toReleasePTGoods?flag=breaker" target="_self">发布早餐<span>发布您的早餐</span></a></li>--%>
<!--         <li><a href="index.php?m=QxWeb&amp;a=ExpandQrCode&amp;c=Drp" target="_self" class="mydd_2_10">推广二维码<span class="mydd_1_span">查看推广二维码</span></a></li> -->
<%--        <li><a class="myshopmenulist_6" href="../goods/toReleaseGoods" target="_self">发布拍卖<span>上传拍卖商品</span></a></li>--%>
<%--        <li><a href="toMyGoods" target="_self" class="myshopmenulist_2">拍卖品管理<span class="mydd_1_span">查看拍卖商品</span></a></li>--%>
    </ul>
</div>
</body>
</html>
