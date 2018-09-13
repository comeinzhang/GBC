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
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" />
    <meta name="apple-mobile-web-app-capable" content="yes" />
    <meta name="apple-mobile-web-app-status-bar-style" content="black" />
    <meta name="format-detection" content="telephone=no,email=no" />
    <meta name="HandheldFriendly" content="true"/>
    <!--Safari书签图标-->
    <link rel="apple-touch-icon-precomposed" href="../static/img/bookmark.png"/>
    <link rel="stylesheet" href="http://at.alicdn.com/t/font_muphn6qn9hdrt3xr.css">
    <link rel="stylesheet" href="../static/css/base_yhlm.css">
    <link rel="stylesheet" href="../static/css/style_yhlm.css">
    <link rel="stylesheet" href="../static/css/details_yph.css">
    <script type="text/javascript" src="../static/js/jquery.min.js"></script>
    <script type="text/javascript" src="../static/js/jquery.cookie.js"></script>
	<link rel="stylesheet" href="../static/css/jNotify.jquery.css">
	<script type="text/javascript" src="../static/js/jNotify.jquery.js"></script>
	<script type="text/javascript" src="../static/plug-in/slide/swipeSlide.min.js"></script>
    <link rel="stylesheet" href="../static/plug-in/slide/slide.css">
    <title>${shop.name }</title>
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
  </head>
<body>
<div class="k-index" style="padding-top: 42px;">
    <div class="head head3">
        <div class="top-men"><i class="iconfont icon-gengduo2"></i><span class="kwd">全部</span></div>
        <div class="s-l">
        	<c:forEach items="${allCatalogs }" var="catalog">
	             <a href="javaScript:" id="${catalog.id }" class="searchCata">
		            ${catalog.name }
		         </a>
        	</c:forEach>
        </div>
        <div class="search" <c:if test="${flag eq 'app'}"> style="margin-right: 50px;"</c:if>>
            <form>
                <input type="search" placeholder="搜索好东西" id="search" class="get-input">
                <div class="search-btn"></div>
            </form>
        </div>
        <c:if test="${flag eq 'app'}">
        <div class="top-men1 index_menubtn1" id="topMenu1" ></div>
        </c:if>
    </div>
    <div class="indexInfo">
    <div class="slide index_slider" id="slide">
        <style>
            .index_slider:after{ padding-top: 55.6%;/*图片的高除以图片的宽*/}
            .slide .dot span{
                display: inline-block;
                width: 20px;
                height: 3px;
                margin-left: 5px;
                background: #FFFFFF;
                opacity: 0.5;
                border-radius: inherit;
                border: 0;
            }
            .slide .dot .cur{
                background: #FFFFFF;
                opacity: 1;
            }
        </style>
        <ul>
<%--        	<c:forEach items="${goodsList}" var="goods">--%>
<%--    			<li><a href="../goods/getGoodsById?id=${goods.id}" target="_self"><img src="${ASSET_URL}${goods.headImgUrl}"></a></li>--%>
<%--    		</c:forEach>--%>
    		<c:forEach items="${imgList}" var="img">
    			<li><a href="javaScript:" target="_self"><img src="${ASSET_URL}${img.imgUrl}"></a></li>
    		</c:forEach>
        </ul>
        <div class="dot">
        </div>
    </div>
    <div class="m-list">
    </div>
    </div>
</div>
    <script>
    		var shopId = '${shop.id}';
            $(function(){
            	$('#topMenu1').click(function(){
        			var url = window.location.href;
        			url = url.replace("&flag=app", "");
        			var title='${shop.name}';
        			var summarize='${shop.shopDes}';
        			var img='${ASSET_URL }'+'${shop.logoUrl }';
                    location.href="http://www.fenxiang.com?===="+url+"===="+title+"===="+summarize+"===="+img;
                });
            	$('.top-men').click(function () {
                    $(this).siblings('.s-l').slideToggle();
                });
                $(document).keypress(function(e) {
                    // 回车键事件
                    if(e.which == 13) {
                        //jQuery(".confirmButton").click();
                        alert('回车键')
                    }
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
                var ASSET_URL = '${ASSET_URL}';
                var kw="";
                var totalPage=0;
                var catalogId="";
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
                        	search(kw);
                        }
                    }
                };
				$("#search").on("input on", function()
				 {	
						resetpt();
						kw = $("#search").val();
						$(".m-list").html("");
						search(kw);
				 });
				$(".searchCata").click(function(){
					$(".s-l").slideToggle();
					$(".m-list").html("");
					resetpt();
					var kwd = $(this).text();
					$(".kwd").text(kwd);
					catalogId=$(this).attr("id");
					search(kw);
				});
				search(kw);
				function search(keyWord){
			        if(!isLastPage && !goodsGetIn){
			        	pages=parseInt(pages)+1;
			        	var data={pages:pages,keywordstr:keyWord,flag:"no",shopId:shopId,catalogId:catalogId};
			            $.ajax({
			            	cache: true,
			                type: "POST",
			                url:"../goods/getGoodsByKeywordListPage",
			                data:data,
			                timeout:5000,
			                async: false,
			                beforeSend:function(XMLHttpRequest){
			                	//努力加载
			                    $('.m-list').append(loaDingGif);
			                    goodsGetIn = true;
			                },
			                success: function (data){
			                    //请求成功时处理
			                    if(data.list.length != null && data.list.length != 'undefined'){
			                        list_count=data.page.totalResult;
			                        totalPage=data.page.totalPage;
			                        var lis = '';
			                        $(data.list).each(function(i,n){
			                            lis += "<a href='../goods/getGoodsById?id="+n.id+"&shopId="+shopId+"' target='_self'>"
				                            + "<img src="+ASSET_URL+n.headImgUrl+">"
				                            + "<p class='p2' style='white-space:nowrap; text-overflow:ellipsis; overflow:hidden;'>"+n.name+"</p>";
				                            $(n.goodsExts).each(function(i,m){
				                            	lis += "<p class='p1' style='white-space:nowrap; text-overflow:ellipsis; overflow:hidden;'>"+m.proKey+"："+m.proValue+"</p>";
				                            	if(i==3)
				                            	return false;
				                            });
				                            lis += "</a>";
			                        });
			                        $(".m-list").append(lis);
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
            <li class="active" style="width: 33.3%;">
                <a href="javaScript:location.reload();" target="_self">
                    <i class="bottom_menu_bg1"></i>
                    <p>首页</p>
                </a>
            </li>
            <li style="width: 33.3%;">
                <a href="../goods/getGoodsCar?shopId=${shop.id }" target="_self">
                    <i class="bottom_menu_bg3"></i>
                    <p>购物车</p>
                </a>
            </li>
            <li style="width: 33.3%;">
                <a href="../user/mycenter?shopId=${shop.id }" target="_self" id="goMyCenter">
                    <i class="bottom_menu_bg4"></i>
                    <p>个人中心</p>
                </a>
            </li>
        </ul>
    </div>
</body>
</html>