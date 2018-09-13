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
    <script type="text/javascript" src="../static/js/jquery-1.8.3.min.js"></script>
    <script type="text/javascript" src="../static/js/jquery.cookie.js"></script>
	<link rel="stylesheet" href="../static/css/jNotify.jquery.css">
	<script type="text/javascript" src="../static/js/jNotify.jquery.js"></script>
	<script type="text/javascript" src="../static/plug-in/slide/swipeSlide.min.js"></script>
    <link rel="stylesheet" href="../static/plug-in/slide/slide.css">
    <title>首页</title>
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
  </head>
<body>
<div class="k-index" style="padding-top: 42px;">
    <div class="head head3">
        <div class="top-men"><i class="iconfont icon-gengduo2"></i>全部</div>
        <div class="s-l">
        	<c:forEach items="${allCatalogs }" var="catalog">
	             <a href="catagoryList?catalogId=${catalog.id }">
		            ${catalog.name }
		         </a>
        	</c:forEach>
        </div>
        <div class="search">
            <form>
                <input type="search" placeholder="搜索好东西" id="search" class="get-input">
                <div class="search-btn"></div>
            </form>
        </div>
    </div>
    <div class="g-list" style="display: none;">
	    <div class="t-list">
	    </div>
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
        	<c:if test="${!empty map.indexImgUrl0}">
    			<li><a href="${map.indexImgUrl0}" target="_self"><img src="${ASSET_URL }${map.indexImg0}"></a></li>
	    	</c:if>
	    	<c:if test="${!empty map.indexImgUrl1}">
	    		<li><a href="${map.indexImgUrl1}" target="_self"><img src="${ASSET_URL }${map.indexImg1}"></a></li>
	    	</c:if>
	    	<c:if test="${!empty map.indexImgUrl2}">
	    		<li><a href="${map.indexImgUrl2}" target="_self"><img src="${ASSET_URL }${map.indexImg2}"></a></li>
	    	</c:if>
	    	<c:if test="${!empty map.indexImgUrl3}">
	    		<li><a href="${map.indexImgUrl3}" target="_self"><img src="${ASSET_URL }${map.indexImg3}"></a></li>
	    	</c:if>
        </ul>
        <div class="dot">
        </div>
    </div>
    <div class="slide" id="slide3">
        <ul>
        	<c:if test="${fn:length(parentCatalogs)>0 }">
            <li>
                <div class="clearfix ad-nav">
                	<c:forEach items="${parentCatalogs }" var="catalog" begin="0" end="7">
			             <a href="catagoryList?catalogId=${catalog.id }" target="_self">
				            <img src="${ASSET_URL}${catalog.imgUrl}">
				            <p>${catalog.name }</p>
				         </a>
			        </c:forEach>
                </div>
            </li>
            </c:if>
            <c:if test="${fn:length(parentCatalogs)>8 }">
            <li>
                <div class="clearfix ad-nav">
                	<c:forEach items="${parentCatalogs }" var="catalog" begin="8" end="15">
			             <a href="catagoryList?catalogId=${catalog.id }" target="_self">
				            <img src="${ASSET_URL}${catalog.imgUrl}">
				            <p>${catalog.name }</p>
				         </a>
			        </c:forEach>
                </div>
            </li>
            </c:if>
            <c:if test="${fn:length(parentCatalogs)>16 }">
            <li>
                <div class="clearfix ad-nav">
                	<c:forEach items="${parentCatalogs }" var="catalog" begin="16" end="23">
			             <a href="catagoryList?catalogId=${catalog.id }" target="_self">
				            <img src="${ASSET_URL}${catalog.imgUrl}">
				            <p>${catalog.name }</p>
				         </a>
			        </c:forEach>
                </div>
            </li>
            </c:if>
            <c:if test="${fn:length(parentCatalogs)>24 }">
            <li>
                <div class="clearfix ad-nav">
                	<c:forEach items="${parentCatalogs }" var="catalog" begin="24" end="31">
			             <a href="catagoryList?catalogId=${catalog.id }" target="_self">
				            <img src="${ASSET_URL}${catalog.imgUrl}">
				            <p>${catalog.name }</p>
				         </a>
			        </c:forEach>
                </div>
            </li>
            </c:if>
            <c:if test="${fn:length(parentCatalogs)>32 }">
            <li>
                <div class="clearfix ad-nav">
                	<c:forEach items="${parentCatalogs }" var="catalog" begin="32" end="39">
			             <a href="catagoryList?catalogId=${catalog.id }" target="_self">
				            <img src="${ASSET_URL}${catalog.imgUrl}">
				            <p>${catalog.name }</p>
				         </a>
			        </c:forEach>
                </div>
            </li>
            </c:if>
        </ul>
        <div class="dot dot3">
        </div>
        <style>
            #slide3:after{ padding-top: 200px;/*图片的高除以图片的宽*/ background: #fff;}
            #slide3 .dot span{
                display: inline-block;
                width: 6px;
                height: 6px;
                margin-left: 5px;
                background: #e6e6e6;
                opacity: 0.5;
                border-radius: 3px;
                border: 0;
            }
            #slide3 .dot3 .cur{
                background: #6c6c6c;
                opacity: 1;
            }

        </style>

    </div>
    <div class="t-t2">
        <img src="../static/images/ip_03.jpg"> 限购产品
    </div>
    <div class="slide index_slider" id="slide2">
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
        	<c:if test="${!empty map.xktjImgUrl0}">
    			<li><a href="${map.xktjImgUrl0}" target="_self"><img src="${ASSET_URL }${map.xktjImg0}"></a></li>
	    	</c:if>
	    	<c:if test="${!empty map.xktjImgUrl1}">
	    		<li><a href="${map.xktjImgUrl1}" target="_self"><img src="${ASSET_URL }${map.xktjImg1}"></a></li>
	    	</c:if>
	    	<c:if test="${!empty map.xktjImgUrl2}">
	    		<li><a href="${map.xktjImgUrl2}" target="_self"><img src="${ASSET_URL }${map.xktjImg2}"></a></li>
	    	</c:if>
	    	<c:if test="${!empty map.xktjImgUrl3}">
	    		<li><a href="${map.xktjImgUrl3}" target="_self"><img src="${ASSET_URL }${map.xktjImg3}"></a></li>
	    	</c:if>
        </ul>
        <div class="dot dot2">
        </div>
    </div>
    <div class="t-t2">
        <img src="../static/images/ip_06.png"> 新客推荐
    </div>
    <div class="m-list">
    	<c:forEach items="${xkzx_goodsList }" var="goods">
        <a href="getGoodsById?id=${goods.id }" target="_self">
            <img src="${ASSET_URL }${goods.headImgUrl}">
            <p class="p2" style="white-space:nowrap; text-overflow:ellipsis; overflow:hidden;">${goods.name }</p>
            <c:forEach items="${goods.goodsExts }" var="ext" end="2">
            <p class="p1" style="white-space:nowrap; text-overflow:ellipsis; overflow:hidden;">${ext.proKey }：${ext.proValue }</p>
            </c:forEach>
            <p class="p1" style="white-space:nowrap; text-overflow:ellipsis; overflow:hidden;">商家：${goods.shop.name }</p>
            <p class="p3">购买</p>
        </a>
        </c:forEach>
    </div>
    </div>
</div>
<c:if test="${!empty map.indexImage and map.isAlert ne 'close'}">
<div class="c-alert" style="display: none;">
    <div class="mask"></div>
    <div class="ct">
        <div class="c-btn"><i class="iconfont icon-cha"></i></div>
        <div class="tx" style="margin: 0;">
            <div class="img"><img src="${ASSET_URL }${map.indexImage}"></div>
        </div>
        <div class="b">
            <span>确定</span>
            <p><label>此次公告下次不再显示 <input type="checkbox" id="alertImage" ></label></p>
        </div>
        <script>
            $(function() {
				var imgurl = '${map.indexImage}';
                $('.c-alert .c-btn, .c-alert .b span').click(function () {
                    $('.c-alert').fadeOut();
                });
                var disabled = $.cookie(imgurl);
    	        if(disabled!="NO"){
    	            $('.c-alert').fadeIn();
    	          //  $.cookie(imgurl, "NO", {expires:7});
    	        }else{
    	        	$.cookie(imgurl, "NO", {expires:7});
    	        }
    	        $("#alertImage").change(function() {
    				if ($("#alertImage").is(':checked')) {
    					$.cookie(imgurl, "NO", {expires:7});
    				}else{
    					$.cookie(imgurl, null);
    				}
    			});
            });
        </script>
    </div>
</div>
</c:if>
    <script>
            $(function(){
            	//var user = '${sessionScope.user}';
            	//var userId = $.cookie("userId");
    		    //if(user==null||user==""||user==undefined){
    	        //    var userId = $.cookie("userId");
    			//	if(userId!=null&&userId!=""&&userId!=undefined){
    			//                		$.ajax({
    			//			                cache: true,
    			//			                type: "POST",
    			//			                url:"../user/cookieLogin",
    			//			                data:{userId:userId},
    			//			                timeout:5000,
    			//			                async: false,
    			//			                error: function(request) {
    			//			                },
    			//			                success: function(data) {
    			//			                }
    			//			            });
    			//		$.cookie("userId", userId, { expires: 7 });	            
    			//	}	
    			//}
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
                 $('#slide2').swipeSlide({
                 continuousScroll:true,
                 speed : 3000,
                 transitionType : 'cubic-bezier(0.22, 0.69, 0.72, 0.88)',
                 callback : function(i){
                 $('.dot2').children().eq(i).addClass('cur').siblings().removeClass('cur');
                 }
                 });
                 $('#slide3').swipeSlide({
                     continuousScroll:true,
                     speed : 3000,
                     autoSwipe : false,
                     transitionType : 'cubic-bezier(0.22, 0.69, 0.72, 0.88)',
                     callback : function(i){
                        $('.dot3').children().eq(i).addClass('cur').siblings().removeClass('cur');
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
                function resetpt(){
			        pages=0;
			        list_count='';
			        kw="";
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
			    
				$("#search").focus(function(){
				    $(document).scrollTo('0');
				});
				$("#search").on("input on", function()
				 {	
					resetpt();
					kw = $("#search").val();
					if(kw==""||kw==null){
						$(".indexInfo").show();
				    	$(".g-list").hide();
					    $(".t-list").html("");
					    resetpt();
					}else{
						$(".indexInfo").hide();
				    	$(".g-list").show();
					    $(".t-list").html("");
	                    $(".g-list .t-list").css({ "margin-top": "0px"});
	                    $(".g-list .t-list").css({ "margin-bottom": "50px"});
						if(kw!=""){
							search(kw);
						}
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
			                        totalPage=data.page.totalPage;
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
    <div class="bottom_menu border-top">
        <ul id="sliderLeftI">
            <li class="active">
                <a href="index" target="_self">
                    <i class="bottom_menu_bg1"></i>
                    <p>首页</p>
                </a>
            </li>
            <li>
                <a href="${pageContext.request.contextPath}/shop/shopLm" target="_self">
                    <i class="bottom_menu_bg2"></i>
                    <p>商家</p>
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
                    <p>个人中心</p>
                </a>
            </li>
        </ul>
    </div>
</body>
</html>