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
    <link rel="stylesheet" href="../static/css/slide.css">
    <link rel="stylesheet" href="../static/css/jNotify.jquery.css">
    <script type="text/javascript" src="../static/js/jquery.min.js"></script>
	<script type="text/javascript" src="../static/js/goods_xq.js"></script>
	<script type="text/javascript" src="../static/js/jNotify.jquery.js"></script>
	<script type="text/javascript" src="../static/js/QryUrlStrParam.js"></script>
    <title>商品详细</title>
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
  </head>
<body>
<div class="container myct">
	<span class="back" onClick="javascript :history.back(-1);"></span>
  	<p>评价</p>
</div>
<div class="clear"></div>
<div class="container">
	<ul class="evaluation_top">
    	<li class="default_pl">全部评论<p>12</p></li>
        <li>好评<p>12</p></li>
        <li>中评<p>12</p></li>
        <li>差评<p>12</p></li>
        <li>有图<p>12</p></li>
        <div class="clear"></div>
    </ul>
    <div class="evaluation_body">
    	<ul>
        	<li class="evaluation_list">
            	<div class="evaluation_title border_bottom">
                    <div class="head_portrait">
                    	<img src="img/142257.png" width="30" height="30">
                    </div>
                    <p>大龙****猫</p>
                    <span>2015-07-20 10:21:36</span>
                </div>
              	<div class="evaluation_content">
                	<p>c非常满意，包装很漂亮，款式简单时尚，快递也很速度，介绍给朋
友了啦，下次还来。
</p>
					<div class="evaluation_picture ">
                    </div>
                    <div class="clear"></div>
                </div>
                <div class="sfandtime">
                	<p>规格:1f70平安  型号:10g</p>
                    <p>购买日期:2015-07-18 18:14:28</p>
                </div>
            </li>
            <li class="evaluation_list">
            	<div class="evaluation_title border_bottom">
                    <div class="head_portrait">
                    	<img src="img/142257.png" width="30" height="30">
                    </div>
                    <p>大龙****猫</p>
                    <span>2015-07-20 10:21:36</span>
                </div>
              	<div class="evaluation_content">
                	<p>c非常满意，包装很漂亮，款式简单时尚，快递也很速度，介绍给朋
友了啦，下次还来。
</p>
					<div class="evaluation_picture">
                       <ul>
                           <li><img src="img/15464646.jpg" ></li>
                           <li><img src="img/20150724161432.png"></li>
                           <li><img src="img/gp=0.jpg" ></li>
                           <li><img src="img/gp=0.jpg" ></li>
                       </ul>
                    </div>
                    <div class="clear"></div>
                </div>
                <div class="sfandtime">
                	<p>规格:1f70平安  型号:10g</p>
                    <p>购买日期:2015-07-18 18:14:28</p>
                </div>
            </li>
        </ul>

    </div>
</div>

<style>
    .img-show{ position: fixed; top: 0; width: 100%; height: 100%;}
</style>
<div class="img-show">
    <div style="position: fixed; top: 0; height: 100%; width: 100%; background: #000; opacity: 0.5; z-index: 3" class="evaluationMask"></div>
    <div class="slide" id="slide" style=" z-index: 5;">
        <ul>
            <li><img src="img/15464646.jpg" ></li>
            <li><img src="img/20150724161432.png"></li>
            <li><img src="img/gp=0.jpg" ></li>
            <li><img src="img/gp=0.jpg" ></li>
        </ul>
    </div>
    <div class="dot">
        <span class="cur"></span>
    </div>
</div>
<script type="text/javascript" src="js/zepto.min.js"></script>
<script type="text/javascript" src="js/swipeSlide.min.js"></script>
<script>
    $(function(){
        var obj=$('.dot');
        for(var i=0; i<$('#slide li').length-1;i++){
            obj.append('<span></span>');
        }
        //居中
        var w = obj.width();
        obj.css({'left':'50%','margin-left':'-'+ w/2 +'px'});

        $('#slide').swipeSlide({
            autoSwipe : false,
            continuousScroll:true,
            speed : 3000,
            transitionType : 'cubic-bezier(0.22, 0.69, 0.72, 0.88)',
            callback : function(i){
                obj.children().eq(i).addClass('cur').siblings().removeClass('cur');
            }
        });

        $('.evaluation_picture').click(function(){
            $(".img-show").show();
        });

        $('.evaluationMask').click(function(){
            $(".img-show").hide();
            //$(".slide").find('ul').remove();
        });
    });


    //首页滚动
    //小圆点
    setSlide();
    function setSlide(){

    }
</script>

<script>





    $(document).ready(function(){
        $(".evaluation_top li").click(function(){
            $(".evaluation_top li").eq($(this).index()).addClass("default_pl").siblings().removeClass("default_pl");
        });
    })
</script>
</body>
</html>
