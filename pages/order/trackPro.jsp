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
    <link rel="stylesheet" href="../static/css/jNotify.jquery.css">
    <script type="text/javascript" src="../static/js/jquery.min.js"></script>
    <script type="text/javascript" src="../static/js/jNotify.jquery.js"></script>
    <title>物流详情</title>
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
</head>
<body>
<div class="myct">
	<span class="back" onClick="javascript :history.back(-1);"></span>
  	<p>订单物流</p>
    <div class="index_menubtn"></div>
    <div class="index_menu">
        <div class="index_menu_top"></div>
        <ul>
            <li>
	                <a href="../goods/index" target="_self">
	                    <i class="index_menu_icon1"></i>
	                    	首页
	                </a>
			</li>
            <li><a href="../goods/getGoodsCar" target="_self"><i class="index_menu_icon2"></i>购物车</a></li>
            <li><a href="../goods/getGoodsStore" target="_self"><i class="index_menu_icon3"></i>收藏夹</a></li>
            <li><a href="../user/mycenter" target="_self"><i class="index_menu_icon4"></i>个人中心</a></li>
        </ul>
    </div>
    <script>
        $(document).ready(function(){
            $(".index_menubtn").click(function(){
                $(".index_menu").stop().fadeToggle('flow');
            })
        });
    </script>
</div>
<div class="container return_goods">
    <div class="return_goods_top">
        <p style="text-align: center;">物流进度</p>
    </div>
    <div class="return_goods_add mt10 mtb60">
        <div class="return_goods_title border_bottom">订单号：${detail.orderNum}</div>
        <div class="return_item_details">
            <p>物流信息</p>
            <span>快递公司:${emsType.name}</span>
            <span>运单号码:${track.emsCode}</span>
            <span>物流信息:</span>
            <p>关联商品</p>
            <span>商品名称:${detail.goods.name}</span>
            <span>商品单号:${detail.orderNum}</span>
        </div>
    </div>
</div>
</body>
</html>
