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
    <link rel="stylesheet" href="../static/css/base_yhlm.css">
    <script type="text/javascript" src="../static/js/jquery.min.js"></script>
    <link rel="stylesheet" href="http://at.alicdn.com/t/font_muphn6qn9hdrt3xr.css">
    <!--主要样式-->
    <script type="text/javascript" src="../static/js/jNotify.jquery.js"></script>
    <link rel="stylesheet" href="../static/css/jNotify.jquery.css">
    <script type="text/javascript" src="../static/plug-in/slide/swipeSlide.min.js"></script>
    <link rel="stylesheet" href="../static/plug-in/slide/slide.css">
    <link rel="stylesheet" href="../static/css/fj.css">
    <!--城市三联动-->
    <script type="text/javascript" src="../static/plug-in/cityPicker/js/citydata.js"></script>
    <script type="text/javascript" src="../static/plug-in/cityPicker/js/cityPicker-1.1.2.js"></script>
    <link rel="stylesheet" href="../static/plug-in/cityPicker/css/city-picker.css">
    <title>附近商家</title>
</head>
<body>
<div class="p-heat">
    <span class="back-btn" onclick="javascript :history.back(-1);"></span>
    <div class="title">附近商家</div>
</div>
<div class="fjsj-index" style="margin-bottom: 46px;">
    <div class="index_slider">
        <div class="slide " id="slide">
            <ul>
                <li><a href="javascript:void(0)" target="_self"><img src="../static/images/shopIndex_01.jpg"></a></li>
                <li><a href="javascript:void(0)" target="_self"><img src="../static/images/shopIndex_02.jpg"></a></li>
            </ul>
            <div class="dot">
            </div>
        </div>
    </div>
    <div class="top-tab2 clearfix">
        <div class="tab-link-box">
        	<div class="t-t active">区域搜索</div><div class="t-t">关键字搜索</div>
        </div>
        <div class="content-t" >
            <div class="city-picker-select clearfix"></div>
            <div class="button" id="searchByArea">确定</div>
        </div>
        <div class="content-t " style="display: none;">
            <div class="search-box">
                <input type="text" id="shopName" placeholder="输入关键字搜索" class="sc">
            </div>
            <div class="button" id="searchByName">确定</div>
        </div>
    </div>
    <ul class="sj-list">
        
    </ul>
</div>
<div class="bottom_menu border-top">
        <ul id="sliderLeftI">
            <li>
                <a href="${pageContext.request.contextPath}/goods/index" target="_self" >
                    <i class="bottom_menu_bg1"></i>
                    <p>首页</p>
                </a>
            </li>
            <li class="active">
                <a href="${pageContext.request.contextPath}/shop/shopLm" target="_self">
                    <i class="bottom_menu_bg2"></i>
                    <p>商家</p>
                </a>
            </li>
            <li>
                <a href="${pageContext.request.contextPath}/goods/getGoodsCar" target="_self">
                    <i class="bottom_menu_bg3"></i>
                    <p>购物车</p>
                </a>
            </li>
            <li>
                <a href="${pageContext.request.contextPath}/user/mycenter" target="_self" id="goMyCenter">
                    <i class="bottom_menu_bg4"></i>
                    <p>个人中心</p>
                </a>
            </li>
        </ul>
</div>
<script>
    $(function(){
    	var select = $('.city-picker-select').cityPicker({
            dataJson: cityData,
            renderMode: false,
            autoSelected: false
        });

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
        $('.tab-link-box .t-t').click(function () {
            $(this).addClass('active').siblings().removeClass('active');
            $('.content-t').hide().eq($(this).index()).show();
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
                	$(".sj-list").html("");
                	resetpt();
                	getGoods();
                });
                $("#searchByName").click(function(){
                	name = $('#shopName').val();
                	addr="";
                	$(".sj-list").html("");
                	resetpt();
                	getGoods();
                });
                getGoods();
			    function getGoods(){
			        if(!isLastPage && !goodsGetIn){
			        	pages=parseInt(pages)+1;
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
			                            lis += "<li>"
				                            + "<img onclick='shopDetail("+n.id+")' src="+ASSET_URL+n.logoUrl+">"
				                            + "<div class='text'>"
				                            + "<p class='p1' onclick='shopDetail("+n.id+")'>"+n.name+"</p>"
				                            + "<p class='p2' style='white-space:nowrap; text-overflow:ellipsis; overflow:hidden;'>";
				                            for(var i=0;i<goods.length;i++){
				                            	lis += "<span>"+goods[i]+"</span>";		
				                        	}
				                        lis +="</p>"
				                            + "<p class='p3'><i class='iconfont icon-dizhi1'></i>"+n.userAddr.replace(/,/g," ")+"<span class='s1'><a href='shopGPS?id="+n.id+"' target='_self' class='clearfix'>查看路线 >></a></span></p>"
				                            + "</div>"
				                            + "</li>";
			                        });
			                        $(".sj-list").append(lis);
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