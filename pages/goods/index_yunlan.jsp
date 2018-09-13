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
    <link rel="stylesheet" href="../static/css/style_yph.css">
    <link rel="stylesheet" href="http://at.alicdn.com/t/font_pst0nw8mmx9lik9.css">
    <script type="text/javascript" src="../static/js/jquery.min.js"></script>
	<link rel="stylesheet" href="../static/css/jNotify.jquery.css">
	<script type="text/javascript" src="../static/js/jNotify.jquery.js"></script>
	<script type="text/javascript" src="../static/js/yxMobileSlider.js"></script>
    <title>首页</title>
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
  </head>
<body>
<div class="container">
    <div class="k-index" id="top">
        <div class="head" >
            <div class="top-box">
                <div class="me-btn">
                    <a href="" target="_self"><i class="iconfont "></i></a>
                </div>
                <div class="search">
                    <input type="text" id="search" placeholder="搜索好东西">
                    <div class="search-btn"></div>
                </div>
            </div>
            <div class="slider-tab">
                <div class="p-warp">
                    <p id="yphIndex" class="active">推荐</p>
                    <c:forEach items="${catalogList }" var="catalog">
                    <p id="${catalog.id }">${catalog.name }</p>
                   </c:forEach>
                </div>
            </div>
        </div>
        <div class="g-list" >
            <div class="t-list">
                <div class="a-banner">
                    <a href="signList?sign=1" target="_self"><img src="../static/images/000_03_yunlan.png"></a>
                </div>
                <c:forEach items="${new_goodsList }" var="goods">
                <div class="row">
                    <a href="getGoodsById?id=${goods.id }" target="_self">
                        <div class="pic">
                            <img src="${ASSET_URL }${goods.headImgUrl}">
                        </div>
                        <div class="text">
                            <div class="name">${goods.name}</div>
                            <div class="num">${goods.sellCount}已抢</div>
                            <div class="price">会员价 &yen; <span>${goods.price}</span></div>
                        </div>
                    </a>
                </div>
                </c:forEach>
                
                <div class="a-banner">
                    <a href="signList?sign=2" target="_self"><img src="../static/images/000_04_yunlan.png"></a>
                </div>
                <c:forEach items="${sell_goodsList }" var="goods">
                <div class="row">
                    <a href="getGoodsById?id=${goods.id }" target="_self">
                        <div class="pic">
                            <img src="${ASSET_URL }${goods.headImgUrl}">
                        </div>
                        <div class="text">
                            <div class="name">${goods.name}</div>
                            <div class="num">${goods.sellCount}已抢</div>
                            <div class="price">会员价 &yen; <span>${goods.price}</span></div>
                        </div>
                    </a>
                </div>
                </c:forEach>
                
                <div class="a-banner">
                    <a href="signList?sign=3" target="_self"><img src="../static/images/000_05_yunlan.png"></a>
                </div>
                <c:forEach items="${you_goodsList }" var="goods">
                <div class="row">
                    <a href="getGoodsById?id=${goods.id }" target="_self">
                        <div class="pic">
                            <img src="${ASSET_URL }${goods.headImgUrl}">
                        </div>
                        <div class="text">
                            <div class="name">${goods.name}</div>
                            <div class="num">${goods.sellCount}已抢</div>
                            <div class="price">会员价 &yen; <span>${goods.price}</span></div>
                        </div>
                    </a>
                </div>
                </c:forEach>
                <div class="a-banner">
                    <a href="signList?sign=4" target="_self"><img src="../static/images/000_06_yunlan.png"></a>
                </div>
                <c:forEach items="${top_goodsList }" var="goods">
                <div class="row">
                    <a href="getGoodsById?id=${goods.id }" target="_self">
                        <div class="pic">
                            <img src="${ASSET_URL }${goods.headImgUrl}">
                        </div>
                        <div class="text">
                            <div class="name">${goods.name}</div>
                            <div class="num">${goods.sellCount}已抢</div>
                            <div class="price">会员价 &yen; <span>${goods.price}</span></div>
                        </div>
                    </a>
                </div>
                </c:forEach>
            </div>
            <div class="p-list" style="display: none;">
               
           </div>
           
        </div>
		<div class="tophomecart">
                <p class="tophomecart_top"><a href="#top" target="_self"></a></p>
        </div>	
        <script>
        	var wl =0;
               $('.p-warp p').each(function(){
                   wl=wl+$(this).width()+40;
                });
                $('.p-warp').css('width',wl+'px')
            $(function(){
				 $('.p-warp p').click(function () {
                        $(this).addClass('active').siblings().removeClass('active');
                        resetpt();
                        var id = $(this).attr("id");
                        if(id=="yphIndex"){
                        	flag = "yphIndex";
                        	$(".p-list").hide();
                        	$(".t-list").show();
                        }else{
                        	flag = "no";
                        	$(".t-list").hide();
                        	$(".p-list").show();
                        	$(".p-list").html("");
                        	catagory_id=id;
                        	getGoods();
                        }
                    });
                //分页加载
                var pages = 0;//初始页
                var list_count='';
                var isLastPage = false;
                var goodsGetIn=false;
                var flag="yphIndex";
                var catagory_id = 0;
                var ASSET_URL = '${ASSET_URL}';
                var kw="";
                function resetpt(){
			        pages=0;
			        list_count='';
			        flag=""
			        goodsGetIn=false;
			        isLastPage = false;
			    }
                var loaDingGif = '<div class="spinner">'
                        +'<div class="bounce1"></div>'
                        +'<div class="bounce2"></div>'
                        +'<div class="bounce3"></div>'
                        +'</div>';
                window.onscroll = function(){
                    if(($(window).scrollTop()+50) >= ($(document).height() - $(window).height())){
                        if(list_count > 0 && pages+1 > list_count / 10){
                            isLastPage = true;
                        }else{
                        	if(flag!="yphIndex"){
                        		getGoods();
                        	}else if(flag=="search"){
                        		if(kw!=""){
                        			search(kw);
                        		}
                        	}
                        }
                    }
                };
			    function getGoods(){
			        if(!isLastPage && !goodsGetIn){
			        	pages=parseInt(pages)+1;
			        	var data={pages:pages,catagory_id:catagory_id,flag:flag}
			            $.ajax({
			            	cache: true,
			                type: "POST",
			                url:"getGoodsByCatagoryListPage",
			                data:data,
			                timeout:5000,
			                async: false,
			                beforeSend:function(XMLHttpRequest){
			                	//努力加载
			                    $('.g-list').append(loaDingGif);
			                    goodsGetIn = true;
			                },
			                success: function (data){
			                    //请求成功时处理
			                    if(data.list.length != null && data.list.length != 'undefined'){
			                        list_count=data.page.totalResult;
			                        var lis = '';
			                        $(data.list).each(function(i,n){
			                            lis += "<div class='row'>"
				                            + "<a href='getGoodsById?id=" + n.id + "' target='_self'>"
				                            + "<div class='name'><p>"+n.name+"</p><div class='num'>已抢<span>"+n.sellCount+"</span></div></div>"
				                            + "<div class='pic'>"
				                            + "<img src="+ASSET_URL+n.headImgUrl+">"
				                            + "</div>"
				                            + "<div class='text'>"
				                            + "<div class='price'>当前价 &yen; <span>"+n.price+"</span></div>"
				                            + "<div class='go-btn'>我也要买</div>"
				                            + "</div>"
				                            + "</a>"
				                            + "</div>";
			                        });
			                        $(".p-list").append(lis);
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
			    $("#search").focus(function(){
				    $(".t-list").html("");
                    $(".p-list").html("");
                    $(".slider-tab").remove();
                    $(".g-list .t-list").css({ "margin-top": "40px"}); 
                    resetpt();
                    flag="search";
				 });
				$(".search-btn").click(function(){
					kw = $("#search").val();
					if(kw!=""){
						search(kw);
					}
				});
				function search(keyWord){
			        if(!isLastPage && !goodsGetIn){
			        	pages=parseInt(pages)+1;
			        	var data={pages:pages,keywordstr:keyWord,flag:"no"};
			            $.ajax({
			            	cache: true,
			                type: "POST",
			                url:"getGoodsByKeywordListPage",
			                data:data,
			                timeout:5000,
			                async: false,
			                beforeSend:function(XMLHttpRequest){
			                	//努力加载
			                    $('.g-list').append(loaDingGif);
			                    goodsGetIn = true;
			                },
			                success: function (data){
			                    //请求成功时处理
			                    if(data.list.length != null && data.list.length != 'undefined'){
			                        list_count=data.page.totalResult;
			                        var lis = '';
			                        $(data.list).each(function(i,n){
			                            lis += "<div class='row'>"
				                            + "<a href='getGoodsById?id="+n.id+"' target='_self'>"
				                            + "<div class='pic'>"
				                            + "<img src="+ASSET_URL+n.headImgUrl+">"
				                            + "</div>"
				                            + "<div class='text'>"
				                            + "<div class='name'>"+n.name+"</div>"
				                            + "<div class='num'>"+n.sellCount+"已抢</div>"
				                            + "<div class='price'>会员价 &yen; <span>"+n.price+"</span></div>"
				                            + "</div>"
				                            + "</a>"
				                            + "</div>";
			                        });
			                        $(".t-list").append(lis);
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
    </div>
    <div class="bottom_menu border-top">
        <ul id="sliderLeftI">
            <li>
	                <a href="index" target="_self" style="color: red;">
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
</div>
</body>
</html>
