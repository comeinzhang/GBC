<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML >

<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" />
    <meta name="apple-mobile-web-app-capable" content="yes" />
    <meta name="apple-mobile-web-app-status-bar-style" content="black" />
    <meta name="format-detection" content="telephone=no,email=no" />
    <meta name="HandheldFriendly" content="true"/>
    <!--公共资源-->
    <link rel="stylesheet" href="../static/css/base_yph1.css">
    <script type="text/javascript" src="../static/js/jquery.min.js"></script>
    <link rel="stylesheet" href="http://at.alicdn.com/t/font_pst0nw8mmx9lik9.css">

    <!--样式-->
    <link rel="stylesheet" href="../static/css/ycys_yhlm.css">

    <!--插件-->
    <link rel="stylesheet" href="../static/plug-in/slide/slide.css">
    <script type="text/javascript" src="../static/plug-in/slide/swipeSlide.min.js"></script>

    <title>店铺信息</title>
</head>
<body>

<div class="goods-info">
    <div class="p-heat" id="indexTop">
        <span class="back-btn" onclick="javascript :history.back(-1);"></span>
        <p class="title">店铺信息</p>
    </div>
    <div class="banner">
        <div class="slide" id="slide">
            <ul>
            	<c:forEach items="${imgList }" var="img">
                <li><img src="${ASSET_URL }${img.imgUrl}" width="100%"></li>
                </c:forEach>
            </ul>
            <div class="dot">
                <span class="cur"></span>
            </div>
        </div>
        <!--<div class="text-yd-info">
            <p class="p1">定金<span class="s1">&yen;</span><span class="s2">30</span><span class="s3">60件已定</span></p>

            <div class="time">
                <p class="p3">结束时间</p>
                <p class="p4">6月1日</p>
            </div>
        </div>-->
    </div>
    <!--评论+店铺-->
    <div class="commentsAndShops" style="margin-top: 0;">
        <div class="shops border-top">
            <%--<div class="pic">
            	<img src="https://img.alicdn.com/ef/59/TB19CeBGXXXXXbkaXXXSutbFXXX.jpg" width="100%">
           	</div>
            --%><div class="shops-info">
                <p class="name">${shop.name}</p>
                <p class="satisfaction">评级 <span>★ ★ ★ ★ ★ </span></p>
            </div>
        </div>
    </div>
    <!--<div class="goods-msg">
        <p class="name">商家名字</p>
    </div>-->
    <div class="sj-071">
        <div class="sj-info">
            <div class="d1">经营项目</div>
            <div class="p1">
                <p>${shop.mainGoods} </p>
                <p>联系人 ${shop.realName}${shop.phone}</p>
                <p>${shop.userAddr}</p>
            </div>
        </div>
    </div>

<%--    <div class="bottom">--%>
<%--        <div class="play-btn clearfix" style=" margin-left: 0;">--%>
<%--            <p class="goPlay" style="width: 100%;">前往该店铺主页</p>--%>
<%--        </div>--%>
<%--    </div>--%>
</div>
<script>
    $(function(){
        //选择规格
        $('.select-list p').click(function(){
            $(this).addClass('active').siblings().removeClass('active');
        });



        //规格弹出
        $('.goPlay, .f-btn .button').click(function(){
            $('.specifications-add').show();
        });
        $('.close-add').click(function(){
            $('.specifications-add').hide();
        });




        $('#topMenu').click(function(){
            $('.public-top-menus').toggle();
        });

        ///图文切换
        $('.tab-title p').click(function(){
            $(this).addClass('active').siblings().removeClass('active');
            $('.tab-content').hide().eq($(this).index()).show()
        });

        //首页滚动
        //首页滚动
        //小圆点
        var obj=$('.dot');
        for(var i=0; i<$('#slide li').length-1;i++){
            obj.append('<span></span>');
        }
        //居中
        var w = obj.width();
        obj.css({'left':'50%','margin-left':'-'+ w/2 +'px'});

        $('#slide').swipeSlide({
            autoSwipe : true,
            continuousScroll:true,
            speed : 3000/*,
             transitionType : 'cubic-bezier(0.22, 0.69, 0.72, 0.88)',
             callback : function(i){
             obj.children().eq(i).addClass('cur').siblings().removeClass('cur');
             }*/
        });


    });

</script>
</body>
</html>