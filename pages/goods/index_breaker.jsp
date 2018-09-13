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
    <link rel="stylesheet" href="../static/css/base.css">
    <link rel="stylesheet" href="../static/css/style.css">
    <title>楷小灶</title>
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
  </head>
<body>
<div class="container">
    <div class="container searchou positontop">
        <div class="back"></div>
        <div class="qxlogo"></div>
        <div class="qxtop_2">
            <input class="qxtop_3" type="search"  name="keyword" value="输入关键词搜索" id="keyword" onfocus="this.value='';" onblur="if(this.value==''){this.value='输入关键词搜索'}"/>
        </div>
        <!--<div class="indexNearby">
            <a href="附近门店.html" target="_self"></a>
        </div>-->
        <div class="qxtop_searchbtn" style="display: block;" onclick="searchKeyAction();">搜索</div>
        <div class="clear"></div>
    </div>
</div>
<div class="container mt45">
    <div class="container">
        <div class="index-floor-rmd-title border_top mt10">
            <p><h2 style="float: left;">早餐推荐</h2></p><p style="padding-top: 8px;text-align: right;padding-right: 15px;">
<%--            <a href="toReleasePTGoods?flag=breaker" target="_self">+</a>--%>
			<a href="breakerGoodsList" target="_self">+</a>
            </p>
        </div>
        <div class="clear"></div>
        <div class="list_content">
            <ul class="list_content_ul">
	            <c:forEach items="${goodsList }" var="yougoods">
	                <li>
	                    <a href="getGoodsById?id=${yougoods.id }">
	                        <div class="list_content_goods_pic" style="height: 185px;">
	                            <img height="100%;" src="${ASSET_URL }${yougoods.headImgUrl}">
	                        </div>
	                        <p class="goods_title">${yougoods.name }</p>
	                        <p class="goods_price">¥ ${yougoods.price }</p>
	                    </a>
	                </li>
	            </c:forEach>    
            </ul>
            <div class="clear"></div>
        </div>
    </div>
    
<!--商品列表-->
    <div class="container">
        <div class="index-floor-rmd-title border_top mt10">
            <h2>预订早餐</h2>
        </div>
        <div class="clear"></div>
        <div class="list_content">
            <ul class="list_content_ul">
             <c:forEach items="${orderList }" var="order">
	            <c:forEach items="${order.detailList }" var="detail">
	                <li>
	                    <a href="../user/breakerOrderDetail?orderNum=${order.orderNum }">
	                        <div class="list_content_goods_pic" style="height: 185px;">
	                            <img height="100%;" src="${ASSET_URL }${detail.goods.headImgUrl}">
	                        </div>
	                        <p class="goods_title">${detail.goods.name }</p>
	                        <p class="goods_price">¥ ${detail.price }</p>
	                    </a>
	                </li>
	            </c:forEach>
	           </c:forEach>  
            </ul>
            <div class="clear"></div>
        </div>
        <!--商品显示-->
    </div>
  
<!--商品列表-->
    <div class="container">
        <div class="index-floor-rmd-title border_top mt10">
            <p><h2 style="float: left;">商家推荐</h2></p><p style="padding-top: 8px;text-align: right;padding-right: 15px;">
            <c:if test="${empty shop}">
            <a href="../user/toReplyBreakerShop" target="_self">+</a>
            </c:if>
            </p>
        </div>
        <div class="clear"></div>
        <div class="list_content">
            <ul class="list_content_ul">
	            <c:forEach items="${shopList }" var="shop">	
	                <li>
	                    <a href="javascript:">
	                        <div class="list_content_goods_pic" style="height: 185px;">
	                            <img height="100%;"  src="${ASSET_URL }${shop.logoUrl}">
	                        </div>
	                        <p class="goods_title">${shop.name }</p>
<!-- 	                        <p class="goods_price">¥ ${yougoods.price }</p> -->
	                    </a>
	                </li>
	            </c:forEach>    
            </ul>
            <div class="clear"></div>
        </div>
        <!--商品显示-->
    </div>
    <div class="container">
        <div class="index-floor-rmd-title border_top mt10">
        	<p><h2 style="float: left;">早餐配送人</h2></p><p style="padding-top: 8px;text-align: right;padding-right: 15px;"><a href="../user/toReplyPoster" target="_self">+</a></p>
        </div>
        <div class="clear"></div>
        <div class="list_content"  style="margin-bottom: 50px;">
            <ul class="list_content_ul">
	            <c:forEach items="${posterList }" var="post">	
	                <li>
	                    <a href="javascript:">
	                        <div class="list_content_goods_pic" style="height: 185px;">
	                            <img height="100%;" src="${AcSSET_URL }${post.headImgUrl}">
	                        </div>
	                        <p class="goods_title">${post.name }</p>
<!-- 	                        <p class="goods_price">¥ ${yougoods.price }</p> -->
	                    </a>
	                </li>
	            </c:forEach>    
            </ul>
            <div class="clear"></div>
        </div>
        <!--商品显示-->
    </div>
</div>
<!--top and bottom menu-->
<div class="tophomecart_top"><a href="#top" target="_self"></a></div>
<div class="container">
    <div class="container bottom_menu">
        <ul>
            <li>
                <a href="index?breaker" target="_self">
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
<script type="text/javascript" src="../static/js/jquery.min.js"></script>
<link rel="stylesheet" href="../static/css/jNotify.jquery.css">
<script type="text/javascript" src="../static/js/jNotify.jquery.js"></script>
<script type="text/javascript" src="../static/js/yxMobileSlider.js"></script>

<script>

    $(".slider").yxMobileSlider({width:750,height:250,during:3000,auto:1});
    function searchKeyAction(){
    	var keyword = $("#keyword").val().trim();
    	if(keyword=="" || keyword=="输入关键词搜索"){
             jError('请输入关键词', {ShowOverlay: false});
        }else{
        	location.href= "${pageContext.request.contextPath}/goods/getGoodsByKeyWListPage?keywordstr="+keyword;
        }
    }
</script>

<script>
    $(document).ready(function(){
        //点击搜索框弹出单个搜索页面
//         $(".qxtop_3").click(function(){
//             $(".qxlogo").hide();
//             $(".qxtop_screening").hide();
//             $(".back").show();
//             $(".search").show();
//         });
        //点击搜索框隐藏单个搜索页面
        $(".back").click(function(){
            $(".qxlogo").show();
            $(".qxtop_searchbtn").show();
            $(".back").hide();

            $(".search").slideUp();
        });
        //点击热门搜寻关键字增加到输入框
        $(".search_r a").click(function(){
            var a = $(this).html()
            $("#keyword").val(a)
        });
        //搜索历史选项卡
        $(".search_rl li").click(function(){
            $(".search_rl li").eq($(this).index()).addClass("search_cl").siblings().removeClass("search_cl");
            $(".search_show").hide().eq($(this).index()).show();
        });
        //删除单个历史记录
        $(".search_l span").click(function(){
            var pstr = $(".search_l span").index(this);
            $(".search_l p").eq(pstr).remove();
        });

        $(".tophomecart_gd").click(function(){
            $(".bottom_menu").show();
            $(".bottom_menu ul").animate({bottom:"60px"},200)
            touchoff()
        });
        $(".bottom_menuzz").click(function(){
            $(".bottom_menu").hide();
            $(".bottom_menu ul").animate({bottom:"0"},200)
            touchon()
        });

    })
</script>
</body>
</html>
