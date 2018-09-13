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
    <link rel="stylesheet" href="../static/css/base-yph.css">
    <script type="text/javascript" src="../static/js/jquery.min.js"></script>
    <link rel="stylesheet" href="http://at.alicdn.com/t/font_450229_7k0kvgzblzjs8aor.css">
    <!--主要样式-->
    <script type="text/javascript" src="../static/js/jNotify.jquery.js"></script>
    <link rel="stylesheet" href="../static/css/jNotify.jquery.css">
    <script type="text/javascript" src="../static/plug-in/slider/swipeSlide.min.js"></script>
    <link rel="stylesheet" href="../static/plug-in/slider/slide.css">
    <link rel="stylesheet" href="../static/css/index-yph.css">
    <link rel="stylesheet" href="../static/plug-in/layer/skin/default/layer.css">
    <script type="text/javascript" src="../static/plug-in/layer/layer.js"></script>
    <script type="text/javascript" src="../static/js/public.js"></script>
    <title>附近商家</title>
</head>
<body ontouchstart>
<div class="page-warp">
    <div class="head-bar">
        <div class="t-bar">
        	<div class="btn-l " onclick="javascript :history.back(-1);">
            	<i class="iconfont icon-xiangzuo f21"></i>
            </div>
            <div class="search-box" style="margin-left: 40px;">
                <form action="">
                    <input type="search" id="shopName" placeholder="输入关键字搜索">
                </form>
                <div class="sc-btn" id="searchByName"><i class="iconfont icon-sousuo-sousuo"></i></div>
            </div>
            <div class="btn-al btn-al2">
                <a href=""><i class="iconfont icon-dianputianchong f21"></i></a>
            </div>
        </div>
    </div>
    <div class="fax-index">
        <div class="index-slide">
        </div>
        <!--新店开张-->
        <div class="xd-b">
            <div class="g-list">
                
            </div>
        </div>
    </div>
    <div class="bottom_menu">
        <ul>
            <li class="">
                <a href="${pageContext.request.contextPath}/goods/index" target="_self">
                    <i class="bottom_menu_bg1"></i>
                    <p>首页</p>
                </a>
            </li>
            <li class="active">
                <a href="${pageContext.request.contextPath}/shop/shopLm">
                    <i class="bottom_menu_bg2"></i>
                    <p>发现</p>
                </a>
            </li>
            <li class="">
                <a href="${pageContext.request.contextPath}/goods/getGoodsCar" target="_self">
                    <i class="bottom_menu_bg3"></i>
                    <p>购物车</p>
                </a>
            </li>
            <li class="">
                <a href="${pageContext.request.contextPath}/user/mycenter" target="_self">
                    <i class="bottom_menu_bg4"></i>
                    <p>我的</p>
                </a>
            </li>
        </ul>
    </div>
</div>
<script>
    $(function(){
    	//首页滚动
        //小圆点
    	var obj=$('.dot');
        for(var i=0; i<$('#slide li').length;i++){
            obj.append('<span></span>');
        }
        var w = obj.width();
        obj.css({'left':'50%','margin-left':'-'+ w/2 +'px'});
        $('#slide').swipeSlide({
            continuousScroll:true,
            speed : 3000,
            transitionType : 'cubic-bezier(0.22, 0.69, 0.72, 0.88)',
            callback : function(i){
                obj.children().eq(i).addClass('cur').siblings().removeClass('cur');
            }
        });
         
				var pages = 0;//初始页
                var list_count='';
                var isLastPage = false;
                var goodsGetIn=false;
                var ASSET_URL = '${ASSET_URL}';
                var totalPage=0;
                var name="";
                var addr="";
                function resetpt(){
			        pages=0;
			        list_count='';
			        goodsGetIn=false;
			        isLastPage = false;
			        totalPage=0;
			    }
                var loaDingGif = '<div class="spinner">'
                        +'<div class="bounce1"></div>'
                        +'<div class="bounce2"></div>'
                        +'<div class="bounce3"></div>'
                        +'</div>';
                window.onscroll = function(){
                    if(($(window).scrollTop()+50) >= ($(document).height() - $(window).height())){
                        if(list_count > 0 && pages+1 > totalPage){
                            isLastPage = true;
                        }else{
                        	getGoods();
                        }
                    }
                };
                $("#searchByArea").click(function(){
                	var province = $(".province").find("option:selected").text();
                	var city = $(".city").find("option:selected").text();
                	var district = $(".district").find("option:selected").text();
                	if(province=="选择省"){
                		province = "";
                		addr = province;
                	}
                	if(city=="全部"){
                		addr = province;
                	}else{
                		addr = province+","+city;
                	}
                	if(district!="全部"){
                		addr = province+","+city+","+district;
                	}
                	name = "";
                	$(".g-list").html("");
                	resetpt();
                	getGoods();
                });
                $("#searchByName").click(function(){
                	name = $('#shopName').val();
                	addr="";
                	$(".g-list").html("");
                	resetpt();
                	getGoods();
                });
                getGoods();
			    function getGoods(){
			        if(!isLastPage && !goodsGetIn){
			        	pages=parseInt(pages)+1;
			        	//var data={pages:pages,name:name,addr:addr,shopType:3};
			        	var data={pages:pages,name:name,addr:addr};
			            $.ajax({
			            	cache: true,
			                type: "POST",
			                url:"shopList",
			                data:data,
			                timeout:5000,
			                async: false,
			                beforeSend:function(XMLHttpRequest){
			                	//努力加载
			                	$('.fjsj-index').append(loaDingGif);//加载中动画
			                    goodsGetIn = true;
			                },
			                success: function (data){
			                    //请求成功时处理
			                    if(data.list.length != null && data.list.length != 'undefined'){
			                        list_count=data.page.totalResult;
			                        totalPage=data.page.totalPage;
			                        var lis = '';
			                        $(data.list).each(function(i,n){
			                        	var goods = n.mainGoods.split("，");
			                            lis += "<div class='goods-box'>"
			                            	+ "<div class='content'>"
				                            + "<div class='pic'><img onclick='shopDetail("+n.id+")' src="+ASSET_URL+n.logoUrl+"></div>"
				                            + "<div class='text'>"
				                            + "<div class='name ellipsis' onclick='shopDetail("+n.id+")'>"+n.name+"</div>"
				                            + "<div class='xx'><i class='iconfont icon-xing'></i><i class='iconfont icon-xing'></i><i class='iconfont icon-xing'></i>"
				                            + "<i class='iconfont icon-xing'></i><i class='iconfont icon-xing'></i>星</div>"
				                            + "<div class='xx ellipsis'>主营："+n.mainGoods+"</div>"
				                            + "</div>"
				                            + "</div>"
				                            + "</div>";
			                        });
			                        $(".g-list").append(lis);
			                    }
			                },
			                complete:function(){
			                	$('.spinner').remove();//加载完成
			                    goodsGetIn=false;
			                },
			                error: function () {
			                    jNotify("服务器或者网络错误",{ShowOverlay : false});
			                }
			            });
			        }
			    }
			   
    });
    function shopDetail(id){
    	location.href="shopDetail?id="+id;
    }
</script>
</body>
</html>