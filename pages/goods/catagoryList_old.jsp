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
    <title>分类</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <meta content="yes" name="apple-mobile-web-app-capable" />
    <meta content="black" name="apple-mobile-web-app-status-bar-style" />
    <meta content="telephone=no" name="format-detection" />
    <link rel="stylesheet" href="../static/css/base.css">
    <link rel="stylesheet" href="../static/css/style.css">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<style type="text/css">
	
	.bottom_menu{ min-width: 320px; max-width: 750px; width: 100%; overflow: hidden; font-size: 13px; position:fixed; bottom:0px; animation-fill-mode: forwards !important;
    border-top: 1px #d7d7d7 solid;}
	.bottom_menu ul{ width: 100%;height:45px; background:#f9f9f9; z-index:6; float: left;}
	.bottom_menu ul li{ width:25%; float:left; text-align:center;}
	.bottom_menu ul li a{ color: #323232;}
	.bottom_menu ul li i{ display:block; width:25px; height:25px; margin:0 auto;}
	.bottom_menu ul li p{  font-size: 11px;color: }
	.bottom_menu .bottom_menu_bg1{ background:url(../static/images/bottomico_yph.png) 0 0 no-repeat; background-size: 25px;}
	.bottom_menu .bottom_menu_bg2{ background:url(../static/images/bottomico_yph.png) 0  -25px no-repeat; background-size: 25px;}
	.bottom_menu .bottom_menu_bg3{ background:url(../static/images/bottomico_yph.png) 0  -50px no-repeat; background-size: 25px;}
	.bottom_menu .bottom_menu_bg4{ background:url(../static/images/bottomico_yph.png) 0  -75px no-repeat; background-size: 25px;}

	</style>
  </head>
<body>
<!--头部搜索隐藏部分-->
<div class="container myct">
            <span class="back" onClick="javascript :history.back(-1);"></span>
            <p>商品分类</p>
</div>            
<div class="container search">
	<ul class="search_rl">
    	<li class="liborder search_cl">热门搜索</li>
        <li>搜索历史</li>
    </ul>    
    <div class="clear"></div>
	<div class="search_r search_show" style="display:block;">
		<p><a href="list.html" target="_self">加油吧新郎女主同款</a></p>
    	<p><a href="list.html" target="_self">24K金男手链</a></p>
    	<p><a href="list.html" target="_self">10克拉结婚钻戒</a></p>
    	<p><a href="list.html" target="_self">心形吊坠</a></p>    
	</div>
    <div class="search_l search_show">
		<p><span></span><a href="" target="_self">加油吧新郎女主同款</a></p>
    	<p><span></span><a href="" target="_self">24K金男手链</a></p>
    	<p><span></span><a href="" target="_self">10克拉结婚钻戒</a></p>
    	<p><span></span><a href="" target="_self">心形吊坠</a></p>    
	</div>
    <div class="clear"></div>
</div>
<!--头部搜索隐藏部分-->
<div class=" container classify_content">
    <div class="classify">
        <ul>
        	<c:forEach var="parent" items="${catagoryAllParent}" varStatus="p">
            	<li <c:if test="${p.count eq 1}">class="classify_li"</c:if> id="${parent.id }" onclick="getCatagoryList(this.id)">${parent.name}</li>
            </c:forEach>
        </ul>
    </div>
    <div class="classify_view" style="display:block;">
<!--         <a class="classify_view_img" href="javascript:"><img src="../static/img/jintiao.jpg" /></a> -->
        <ul id="catagoryList">
        </ul>
    </div>
	<div class="clear"></div>
</div>
<div class="bottom_menu border-top">
        <ul id="sliderLeftI">
            <li>
	                <a href="index" target="_self">
	                    <i class="bottom_menu_bg1"></i>
	                    <p>首页</p>
	                </a>
            </li>
            <li>
                <a href="catagoryList">
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
                <a href="../user/mycenter" target="_self" id="goMyCenter">
                    <i class="bottom_menu_bg4"></i>
                    <p>我的</p>
                </a>
            </li>
        </ul>
    </div>
<script type="text/javascript" src="../static/js/jquery.min.js"></script>
<script>
	var ASSET_URL='${ASSET_URL}';
	$(document).ready(function(){
		//修复classify高的问题
		var wh=$(window).height();
		$(".classify").css("height",wh-45+"px");
		$(".classify_view").css("height",wh-45+"px");

		$(".classify ul li").click(function(){
			var str = $(this).index();
			$(".classify ul li").eq(str).addClass("classify_li").siblings().removeClass('classify_li');
			
// 			$(".classify_view").hide().eq($(this).index()).show();
			//$(".classify ul").animate({top:'-'+str*41+'px'});
			//$(".classify ul").css({transform:'translate(0px,-'+str*41+'px)'});
		});
		//点击搜索框弹出单个搜索页面ZZ
// 		$(".qxtop_3").click(function(){
// 			$(".qxtop_screening").hide();
// 			$(".back").hide();
// 			$(".close_search").show();
// 			$(".qxtop_searchbtn").show();
// 			$(".search").show();
// 		});
		//点击搜索框隐藏单个搜索页面
		$(".close_search").click(function(){
			$(".qxlogo").show();
			$(".qxtop_searchbtn").show();
			$(".back").show();
			$(".close_search").hide();
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
	})
	$(function(){
		getCatagoryList($(".classify_li").attr("id"));	//默认显示
	});
	function getCatagoryList(parent_id){
			var data={parent_id:parent_id};
			$.ajax({
                cache: true,
                type: "POST",
                url:"catagoryListPage",
                data:data,
                timeout:5000,
                async: false,
                error: function(request) {
//                 	SimMessageAlert("登录失败");
                },
                success: function(data) {
                	var html="";
                	if(data!=null&&data!=""){
	                	$(data).each(function(i,n){
							html+="<li>"
						              +"<a href='getGoodsByCatagoryIdListPage?catagory_id="+n.id+"'><img src="+n.imgUrl+" /></a>"
	            					  +"<p>"+n.name+"</p>"
						           +"</li>";
						});
						$("#catagoryList").html(html);
					}else{
						$("#catagoryList").html(html);
					}
                }
            });
	}
</script>

</body>
</html>
