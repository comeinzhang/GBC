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
    <link rel="stylesheet" href="../static/css/xk.css">
    <script type="text/javascript" src="../static/js/jquery.min.js"></script>
	<link rel="stylesheet" href="../static/css/jNotify.jquery.css">
	<script type="text/javascript" src="../static/js/jNotify.jquery.js"></script>
	<script type="text/javascript" src="../static/js/yxMobileSlider.js"></script>
	<script type="text/javascript" src="../static/plug-in/slide/swipeSlide.min.js"></script>
    <link rel="stylesheet" href="../static/plug-in/slide/slide.css">
    <title>首页</title>
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
  </head>
<body>
<div class="p-heat">
    <span class="back-btn" onclick="javascript :history.back(-1);"></span>
    <div class="title">新客专享</div>
</div>
<div class="t-banner">
    <a href="../user/aboutHD" target="_self"><img src="../static/images/n_s_02.png" width="100%"></a>
</div>
<div class="index_slider">
    <div class="slide " id="slide">
        <ul>
            <li><a href="getGoodsById?id=536" target="_self"><img src="../static/images/xkzx1.png"></a></li>
            <li><a href="javascript:void(0)" target="_self"><img src="../static/images/xkzx.png"></a></li>
        </ul>
        <div class="dot">
        </div>
    </div>
</div>

<div class="l-list clearfix" style="margin-bottom:45px;">
    
</div>
        <script>
            $(function(){
            	$('.alert-hb .close-btn').click(function(){
		            $('.alert-hb').fadeOut();
		        });
		        var wl =0;
		        $('.p-warp p').each(function(){
		            wl=wl+$(this).width()+20;
		        });
		        $('.p-warp').css('width',wl+'px');
		
		        $('.get-input').focus(function(){
		            $(document).scrollTo('0');
		        });
		
		
		        //首页滚动
		        //小圆点
		        var obj=$('.dot');
		        for(var i=0; i<$('#slide li').length;i++){
		            obj.append('<span></span>');
		        }
		        //居中
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
                //分页加载
                var pages = 0;//初始页
                var list_count='';
                var isLastPage = false;
                var goodsGetIn=false;
                var flag="no";//排序
                var sign='${sign}';
                var totalPage=0;
                var ASSET_URL = '${ASSET_URL}';
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
                getGoods();
			    function getGoods(){
			        if(!isLastPage && !goodsGetIn){
			        	pages=parseInt(pages)+1;
			        	var data={pages:pages,flag:flag,sign:sign};
			            $.ajax({
			            	cache: true,
			                type: "POST",
			                url:"getGoodsByCatagoryListPage",
			                data:data,
			                timeout:5000,
			                async: false,
			                beforeSend:function(XMLHttpRequest){
			                	//努力加载
			                    $('.load').append(loaDingGif);
			                    goodsGetIn = true;
			                },
			                success: function (data){
			                    //请求成功时处理
			                    if(data.list.length != null && data.list.length != 'undefined'){
			                        list_count=data.page.totalResult;
			                        totalPage=data.page.totalPage;
			                        var lis = '';
			                        $(data.list).each(function(i,n){
			                            lis += "<div class='row'>"
				                            + "<a href='getGoodsById?id=" + n.id + "' target='_self'>"
				                            + "<div class='pic'>"
				                            + "<img src="+ASSET_URL+n.headImgUrl+">"
				                            + "</div>"
				                            + "<div class='name'>"+n.name+"</div>"
				                            + "<div class='text'>"
				                            + "<div class='price'>价格 &yen; <span>"+n.price+"</span></div>"
				                            + "</div>"
				                            + "</a>"
				                            + "</div>";
			                        });
			                        $(".l-list").append(lis);
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
        </script>
    <div class="bottom_menu border-top">
        <ul id="sliderLeftI">
            <li>
                <a href="index" target="_self">
                    <i class="bottom_menu_bg1"></i>
                    <p>首页</p>
                </a>
            </li>
            <li>
                <a href="toPmGoodsList">
                    <i class="bottom_menu_bg2"></i>
                    <p>拍卖</p>
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
</body>
</html>
