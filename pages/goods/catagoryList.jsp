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
    <script src="${pageContext.request.contextPath}/static/iconfonts/icon_url.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery.min.js"></script>
    <script type="text/javascript" src="../static/js/jNotify.jquery.js"></script>
    <!--主要样式-->
    <link rel="stylesheet" href="http://at.alicdn.com/t/font_pst0nw8mmx9lik9.css">
    <link rel="stylesheet" href="../static/css/jNotify.jquery.css">
    <link rel="stylesheet" href="../static/css/base_yph1.css">
    <link rel="stylesheet" href="../static/css/style_yph.css">
     <link rel="stylesheet" href="../static/plug-in/photoswipe/default-skin.css">
    <link rel="stylesheet" href="../static/plug-in/photoswipe/photoswipe.css">
	<link rel="stylesheet" href="../static/iconfonts/iconfont.css">
	<link rel="stylesheet" href="../static/iconfonts/icon_url.js">
    <script type="text/javascript" src="../static/plug-in/photoswipe/photoswipe.min.js"></script>
    <script type="text/javascript" src="../static/plug-in/photoswipe/photoswipe-ui-default.min.js"></script>
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
  </head>
<body>
<div class="container">
    <div class="k-index classify-index">
        <div class="head">
            <div class="top-box">
                <div class="me-btn">
                    <a href="javascript:" target="_self" onclick="javascript:history.back(-1);"><i class="iconfont icon-iconxiangzuo"></i></a>
                </div>
                <div class="search">
                    <input type="text" id="search" placeholder="搜索好东西">
                    <div class="search-btn"></div>
                </div>
            </div>
            <div class="tab-icon">
                <div class="tab-icon-inner clearfix">
                	<c:forEach items="${catagoryAllSon }" var="catalog" varStatus="status">
	                    <a href="javascript:" target="_self" id="${catalog.id}" <c:if test="${status.index eq 0}">class="active"</c:if>>
	                        <span><img src="${ASSET_URL }${catalog.imgUrl}" style="height: 40px;width: 40px;"></span>
	                        <p>${catalog.name }</p>
	                    </a>
                    </c:forEach>
                </div>
            </div>
        </div>
        <div class="g-list" >
            <div class="t-title" style="text-align: center;"><img src="../static/images/001.png" width="74%"></div>
            <div class="l-list clearfix">
            </div>
        </div>
        <script>
            $(function(){
            	var wl =0;
                $('.tab-icon-inner a').each(function(){
                    wl=wl+$(this).width();
                });
                $('.tab-icon-inner').css('width',wl+'px');
                
                
            	$('.tab-icon a').click(function () {
                        $(this).addClass('active').siblings().removeClass('active');
                        resetpt();
                        catagory_id = $(this).attr("id");
                        $(".l-list").html("");
                        getGoods();
                  });
                  
                //分页加载
                var pages = 0;//初始页
                var list_count='';
                var isLastPage = false;
                var goodsGetIn=false;
                var flag="time";
                var kw="";
                var catagory_id = '${catalogId}';
                var ASSET_URL = '${ASSET_URL}';
                var totalPage=0;
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
                        	if(flag!=="search"){
                        		getGoods();
                        	}else{
                        		search(kw);
                        	}
                        }
                    }
                };
                if(catagory_id!=null&&catagory_id!=""){
			     	$(".tab-icon #"+catagory_id).trigger("click");
			    }else {
					$(".tab-icon .active").trigger("click");
				}
//                 getGoods();
			    function getGoods(){
			        if(!isLastPage && !goodsGetIn){
			        	//var backUrl = "${pageContext.request.contextPath}/goods/catagoryList?catalogId="+catagory_id;
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
				                            + "<div class='price'>当前价 &yen; <span>"+n.price+"</span></div>"
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
// 			    $("#search").focus(function(){
// 				    $(".t-list").html("");
//                     $(".l-list").html("");
//                     $(".tab-icon").remove();
//                     $(".t-title").remove();
//                     $(".g-list").css({ "margin-top": "40px"});
//                     resetpt();
//                     flag="search";
// 				 });
// 				$(".search-btn").click(function(){
// 					kw = $("#search").val();
// 					if(kw!=""){
// 						search(kw);
// 					}
// 				});
				$("#search").on("input on", function()
				 {
				 	$(".t-list").html("");
                    $(".l-list").html("");
                    $(".tab-icon").remove();
                    $(".t-title").remove();
                    $(".g-list").css({ "margin-top": "40px"});
                    resetpt();
                    flag="search";
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
			                    	totalPage=data.page.totalPage;
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
				                            + "<div class='price'>会员价 &yen; <span>"+n.price+"</span></div>"
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

    </div>
    <div class="bottom_menu border-top">
        <ul id="sliderLeftI">
            <li>
	                <a href="index" target="_self" <c:if test="${sessionScope.webIn eq 'yphApp' or sessionScope.webIn eq 'yph'}"> style="color: red;"</c:if>>
	                    <i class="bottom_menu_bg1"></i>
	                    <p>首页</p>
	                </a>
            </li>
<%--            <c:if test="${sessionScope.webIn eq 'yphApp' or sessionScope.webIn eq 'yph'}">--%>
<%--            <li>--%>
<%--                <a href="toPmGoodsList">--%>
<%--                    <i class="bottom_menu_bg2"></i>--%>
<%--                    <p>拍卖</p>--%>
<%--                </a>--%>
<%--            </li>--%>
<%--            </c:if>--%>
            <c:if test="${sessionScope.webIn eq 'kxz'}">
            <li>
                <a href="catagoryList" style="color: red;">
                    <i class="bottom_menu_bg2"></i>
                    <p>分类</p>
                </a>
            </li>
            </c:if>
            <c:if test="${sessionScope.webIn ne 'kxz'}">
            <li>
                <a href="${pageContext.request.contextPath}/shop/shopLm">
                    <i class="bottom_menu_bg5"></i>
                    <p>商家</p>
                </a>
            </li>
            </c:if>
            <li>
                <a href="getGoodsCar" target="_self">
                    <i class="bottom_menu_bg3"></i>
                    <p>购物车</p>
                </a>
            </li>
            <li>
                <a href="../user/mycenter" target="_self" id="goMyCenter">
                    <i class="bottom_menu_bg4"></i>
                    <p>个人中心</p>
                </a>
            </li>
        </ul>
    </div>
</div>
</body>
</html>
