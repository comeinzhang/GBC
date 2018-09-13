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
    <title>分类</title>
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
<div class="listBox">
    <div class="listDouble">
        <!--左边显示部分-->
        <div class="listCenter">
            <div class="listCenterMask">
            </div>
            <!--头部搜索隐藏部分-->
            <div class="list_top">
                <div class=" searchou">
                    <div class="back" style="display:block" onClick="javascript :history.back(-1);"></div>
                    <div class="close_search"></div>
                    <div class="qxtop_2">
                        <input class="qxtop_3" type="search"  name="keyword" value="输入关键词搜索" id="keyword" onfocus="this.value='';" onblur="if(this.value==''){this.value='输入关键词搜索'}"/>
                    </div>
                    <div class="qxtop_searchbtn qxtop_searchbtnmax">搜索</div>
                    <div class="clear"></div>
                </div>
                <!--头部搜索隐藏部分-->
                <div class="list_body">
                    <ul class="list_nav store_goods_classify_nav">
                        <li class="list_nav_1" id="saleOrderli">
                            <span>销量</span>
                            <img src="../static/img/list_06.png" width="8"></li>
                        <li class="list_nav_2" id="priceOrderli">
                            <span>价格</span>
                            <img src="../static/img/list_04.png" width="8">
                        </li>
                        <li id="shelvesOrderli">
                            <span>人气</span>
                        </li>
                    </ul>
                    <div class="clear"></div>
            	</div>

                <!--商品显示-->
                <div class="clear"></div>
                <div class="list_content">
                    <ul class="list_content_ul" id="thelist">
                    	<c:forEach items="${typeGoodsList}" var="list">
	                        <li>
	                            <a href="getGoodsById?id=${list.id }">
	                                <div class="list_content_goods_pic" >
	                                    <img src="${ASSET_URL }${list.headImgUrl }" style="height: 150px; width:175px; ">
	                                </div>
	                                <p class="goods_title">
	                                	${list.name }
	                                </p>
	                                <p class="goods_price">¥${list.price }</p>
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
<!--top结束-->
<!-- <footer> -->
<!-- 	<p><a href="" target="_self">下载APP</a>  |  <a href="" target="_self">手机端</a>  |  <a href="" target="_self">PC端</a></p> -->
<!--     <p>Copyright © 2015 faner jewelry.com 版权所有</p> -->
<!-- </footer> -->
<script type="text/javascript" src="../static/js/jquery.min.js"></script>
<link rel="stylesheet" href="../static/css/jNotify.jquery.css">
<script type="text/javascript" src="../static/js/jNotify.jquery.js"></script>
<script type="text/javascript" src="../static/js/json2-min.js"></script>
<script type="text/javascript" src="../static/js/QryUrlStrParam.js"></script>
<script type="text/javascript" src="../static/js/QxPublic.js"></script>
<script type="text/javascript" src="../static/js/listscript.js"></script>
<script>
	var ASSET_URL = '${ASSET_URL}';
	var catagory_id='${catagory_id}';
	var pages='${page.currentPage}';
	var keywordstr='${keyword}';
	var urlFlag = '${urlFlag}';
	 var url = "";
	if(urlFlag=="keyWord"){
		url="${pageContext.request.contextPath}/goods/getGoodsByKeywordListPage";
	}else if(urlFlag=="cataLog"){
		url="${pageContext.request.contextPath}/goods/getGoodsByCatagoryListPage";
	}
	
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
