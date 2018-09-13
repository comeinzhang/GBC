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
    <!--Safari书签图标-->
    <link rel="apple-touch-icon-precomposed" href="../static/img/bookmark.png"/>
    <link rel="stylesheet" href="../static/css/base_yph1.css">
    <script type="text/javascript" src="../static/js/jquery.min.js"></script>
    <title>首页</title>
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<style>
        body{ position: fixed; left: 0; top: 0; width: 100%; height: 100%;}
        .logo{ margin-top: 40px; margin-bottom: 20px; text-align: center;}
        .logo .p1{ margin-top: 15px; }
        .jj-text{ width: auto; text-indent: 2em; line-height: 20px; margin: 15px 30px;}
        .bt-text{ position: absolute; left: 0; bottom:10px; width: 100%; line-height: 20px; text-align: center;}
    </style>
  </head>
<body>
<div class="public-top">
    <div class="back-btn" onClick="javascript :history.back(-1);"></div>
    <div class="msg" id="kk">关于</div>
</div>
<div class="logo">
    <img src="../static/images/logo.png" width="30%">
    <p class="p1">讯南科技  V1.0</p>
</div>
<div class="jj-text">
    <p>
    	讯南科技致力于为消费者提供愉悦的在线购物体验，坚持“正品行货”的理念，对假货零容忍；采取六大品控措施，保障正品，大量品牌直供，从源头杜绝假货。以富有竞争力的价格，提供具有丰富品类及卓越品质的商品和服务，以快速可靠的方式送达消费者，并且提供灵活多样的支付方式。
    </p>
</div>

<div class="bt-text">
    <p>Copyright 2016 Rights Reserved 广州讯南网络科技公司 版权所有</p>
    <p> 粤ICP备12012574号</p>
</div>
</body>
</html>