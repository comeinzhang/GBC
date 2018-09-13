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
    <link rel="stylesheet" href="http://at.alicdn.com/t/font_450229_6gu7pw6zbbcpu8fr.css">
    <link rel="stylesheet" href="../static/css/base-yph.css">
    <link rel="stylesheet" href="../static/css/index-yph.css">
    <script type="text/javascript" src="../static/js/jquery.min.js"></script>
	<link rel="stylesheet" href="../static/css/jNotify.jquery.css">
	<script type="text/javascript" src="../static/js/jquery.cookie.js"></script>
	<script type="text/javascript" src="../static/js/jNotify.jquery.js"></script>
	<script type="text/javascript" src="../static/js/yxMobileSlider.js"></script>
	<script type="text/javascript" src="../static/js/public.js"></script>
	
	<link rel="stylesheet" href="../static/plug-in/slider/slide.css">
	<link rel="stylesheet" href="../static/css/style_yhlm.css">
    <title>首页</title>
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
  </head>
<body>
<body ontouchstart >
<div class="page-warp">
    <div class="head-bar">
        <div class="t-bar">
            <div class="btn-al">
            	<i class="iconfont icon-duanxin f21"></i>
            </div>
            <div class="search-box search-box2">
                    <input type="text" id="search" placeholder="输入关键字搜索">
                <div class="sc-btn"><i class="iconfont icon-sousuo-sousuo"></i></div>
            </div>
            <div class="btn-al btn-al2 catalogList">
                <i class="iconfont icon-leimupinleifenleileibie2 f21"></i>
            </div>
            <div class="head-mr-menu">
                <div class="sj"></div>
                <div class="mask"></div>
                <div class="a-li">
                	<c:forEach items="${allCatalogs }" var="catalog">
			             <a href="catagoryList?catalogId=${catalog.id }">
				            ${catalog.name }
				         </a>
		        	</c:forEach>
                </div>
            </div>
        </div>
    </div>
    <div class="g-list" style="display: none;">
	    <div class="t-list">
	    </div>
	</div>
    <div class="sy-index">
        <div class="index-slide">
            <!--滚动插件-->
            <div class="slide" id="slide">
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
                	<span></span>
                	<span></span>
                	<span></span>
                	<span></span>
                </div>
            </div>
        </div>
        <!--导航-->
        <div class="ad-nav">
        	<c:forEach items="${parentCatalogs }" var="catalog" begin="0" end="7">
        		<c:if test="${catalog.name ne '入驻'}">
        			<a href="catagoryList?catalogId=${catalog.id }" target="_self">
				     <img src="${ASSET_URL}${catalog.imgUrl}">
				     <p>${catalog.name }</p>
				</a>
        		</c:if>
			    <c:if test="${catalog.name eq '入驻'}">
        			<a href="http://www.syyph.com/user/toReplyShop" target="_self">
				     <img src="${ASSET_URL}${catalog.imgUrl}">
				     <p>${catalog.name }</p>
				</a>
        		</c:if>
			</c:forEach>
        </div>

        <!--热门活动-->
        <div class="rm-block">
            <div class="t">
                <img src="../static/images/sy_32.png" class="i1">
                <a href="../shop/moreShop" class="a1">MORE >></a>
            </div>
            <div class="link">
                <a href=""><img src="../static/images/sy_28.png"></a>
            </div>
        </div>
        <!--新客推荐-->
        <div class="rm-block">
            <div class="t">
                <img src="../static/images/sy_26.png" class="i1">
                <a href="../shop/moreShop" class="a1">MORE >></a>
            </div>
            <div class="link2 clearFix">
                <div class="a a1"><a href=""><img src="../static/images/sy_34.png"></a></div>
                <div class="a a2"><a href=""><img src="../static/images/sy_36.png"></a></div>
            </div>
        </div>

        <!--猜你喜欢-->
        <div class="ppt">
            <img src="../static/images/tt_02.png"> 猜你喜欢 <img src="../static/images/tt_02.png">
        </div>
        <div class="goods-link">
	        <c:forEach items="${xkzx_goodsList }" var="goods">
	            <div class="a">
	                <a href="getGoodsById?id=${goods.id }">
	                    <div class="img"><img src="${ASSET_URL }${goods.headImgUrl}"></div>
	                    <div class="name">${goods.name }</div>
	                    <p class="p2">销量${goods.sellCount}</p>
	                    <p class="p1">¥ ${goods.price}</p>
	                </a>
	                <div class="sc-btn" onclick="javaScript:location.href='getGoodsById?id=${goods.id }'"><span>购买</span></div>
	            </div>
            </c:forEach>
        </div>

    </div>
</div>
<div class="bottom_menu">
    <ul>
        <li class="active">
            <a href="index" target="_self">
                <i class="bottom_menu_bg1"></i>
                <p>首页</p>
            </a>
        </li>
        <li class="">
            <a href="${pageContext.request.contextPath}/shop/shopLm">
                <i class="bottom_menu_bg2"></i>
                <p>商家</p>
            </a>
        </li>
        <li class="">
            <a href="getGoodsCar" target="_self">
                <i class="bottom_menu_bg3"></i>
                <p>购物车</p>
            </a>
        </li>
        <li class="">
            <a href="../user/mycenter" target="_self">
                <i class="bottom_menu_bg4"></i>
                <p>我的</p>
            </a>
        </li>
    </ul>
</div>
<!--滚动插件-->
<script type="text/javascript" src="../static/plug-in/slider/swipeSlide.min.js"></script>
<script>
    $(function(){
    	var user = '${sessionScope.user}';
    	var userId = $.cookie("userId");
	    if(user==null||user==""||user==undefined){
            var userId = $.cookie("userId");
            var flag = true;
			if(userId!=null&&userId!=""&&userId!=undefined){
		                		$.ajax({
					                cache: true,
					                type: "POST",
					                url:"../user/cookieLogin",
					                data:{userId:userId},
					                timeout:5000,
					                async: false,
					                error: function(request) {
					                	flag=false;
					                },
					                success: function(data) {
					                	if(data=="fail"){
					                		flag=false;
					                	}
					                }
					            });
		        if(flag){
		        	$.cookie("userId", userId, { expires: 7 });	
		        }else{
		        	$.cookie("userId", null);
		        }        		
				            
			}	
		}
        $('#slide').swipeSlide({
            continuousScroll:true,
            speed : 3000,
            autoSwipe : true,
            transitionType : 'cubic-bezier(0.22, 0.69, 0.72, 0.88)',
            callback : function(i){
                $('.dot').children().eq(i).addClass('cur').siblings().removeClass('cur');
            }
        });
        //var obj=$('.dot');
       // for(var i=0; i<$('#slide li').length;i++){
        //    obj.append('<span></span>');
       // }
    });
</script>
<script>
            $(function(){
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
						$(".sy-index").show();
				    	$(".g-list").hide();
					    $(".t-list").html("");
					    resetpt();
					}else{
						$(".sy-index").hide();
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
</body>
</html>
