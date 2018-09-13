<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML>

<html>
<head>
    <title>我的关注</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <meta content="yes" name="apple-mobile-web-app-capable" />
    <meta content="black" name="apple-mobile-web-app-status-bar-style" />
    <meta content="telephone=no" name="format-detection" />
    <link rel="stylesheet" href="../static/css/base.css">
    <link rel="stylesheet" href="../static/css/style.css">
    <link rel="stylesheet" href="../static/css/css.css">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
  </head>
<body>
<div class="myct">
	<span class="back" onClick="javascript :history.back(-1);"></span>
  	<p>我的关注</p>
</div>
<div class="listBox">
    <div class="listDouble">
        <!--左边显示部分-->
        <div class="listCenter">
            <div class="listCenterMask">
            </div>
            <div class="list_top">
                <!--商品显示-->
                <div class="clear"></div>
                <div class="list_content">
                    <ul class="list_content_ul" id="thelist">
                    	<c:forEach items="${focusList}" var="focus">
	                        <li>
	                            <a href="javascript:">
	                                <div class="list_content_goods_pic">
	                                    <img src="${ASSET_URL }${focus.user.headImgUrl }" style="height:300px; ">
	                                </div>
	                                <p class="goods_title">${focus.user.nickName }</p>
	                            </a>
	                        </li>
                        </c:forEach>
                    </ul>
                    <div class="clear"></div>
                </div>
                <!--商品显示-->
            </div>
        </div>
        <!--左边显示部分-->
    </div>
</div>
<!--loading-->
<div class="loading">
</div>
<!--loading-->

<!--tophomecart-->
<div class="tophomecart">
	<p class="tophomecart_top"><a href="#top" target="_self"></a></p>
    <p class="tophomecart_gd"><a href="javascript:;" target="_self"></a></p>
</div>
<div class="container">
    <div class="container bottom_menu">
        <ul>
            <li>
	                <a href="index" target="_self">
	                    <i class="bottom_menu_bg1"></i>
	                    <p>首页</p>
	                </a>
            </li>
            <li>
                <a href="catagoryList" target="_self">
                    <i class="bottom_menu_bg2"></i>
                    <p>分类</p>
                </a>
            </li>
            <li>
                <a href="getGoodsCar" target="_self">
                    <i class="bottom_menu_bg3"></i>
                    <p>购物车</p>
                </a>
            </li>
            <li>
                <a href="../user/mycenter" target="_self">
                    <i class="bottom_menu_bg4"></i>
                    <p>我的</p>
                </a>
            </li>
        </ul>
    </div>
</div>
<script type="text/javascript" src="../static/js/jquery.min.js"></script>
<script>
    $(function(){
        var liheight = $('.list_content ul li').eq(0).height();$('.list_content ul li').css('height',liheight );
        $(".tophomecart_gd").click(function(){
            $(".bottom_menu").show();
            $(".bottom_menu ul").animate({bottom:"60px"},200)
        });
        $(".bottom_menuzz").click(function(){
            $(".bottom_menu").hide();
            $(".bottom_menu ul").animate({bottom:"0"},200)
        });
    })
</script>
</body>
</html>
