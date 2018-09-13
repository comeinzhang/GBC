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
	<script id="qd28521510419ad8a067db7e6eee3b2f9ab129f78313" src="https://wp.qiye.qq.com/qidian/2852151041/9ad8a067db7e6eee3b2f9ab129f78313" charset="utf-8" async defer></script>
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
        <div class="mak"></div>
        <div class="t-bar">
            <div class="btn-al">
                <a href="#"><i class="iconfont icon-leimupinleifenleileibie2 f21"></i></a>
            </div>
            <div class="search-box search-box2">
                <input type="text" id="search" placeholder="输入关键字搜索">
                <div class="sc-btn"><i class="iconfont icon-sousuo-sousuo"></i></div>
            </div>
            <div class="btn-al btn-al2">
                <a href="#"><i class="iconfont icon-xinxi f21"></i></a>
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
            <link rel="stylesheet" href="../static/plug-in/slider/slide.css"><!--滚动插件-->
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
        <div class="ad-nav ad-navv">
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
            <div class="link">
                <a href="javaScript:"><img src="../static/images/sdad_02.png"></a>
            </div>
        </div>
        <!--新客推荐-->
        <div class="rm-block">
            <div class="link2 clearFix">
                <div class="a a1"><a href="javaScript:"><img src="../static/images/215_21.png"></a></div>
                <div class="a a2"><a href="../shop/bldShopIndex"><img src="../static/images/215_23.png"></a></div>
            </div>
        </div>
        <div class="rm-block">
            <div class="link">
                <a href="javaScript:"><img src="../static/images/215_27.png"></a>
            </div>
        </div>
        <!--猜你喜欢-->
        <div class="ppt">
            <img src="../static/images/tt_02.png"> 特惠专区 <img src="../static/images/tt_02.png">
        </div>
        <div class="t-list">
        	<c:forEach items="${xkzx_goodsList }" var="goods">
        		<div class="row">
	                <a href="getGoodsById?id=${goods.id }" target="_self">
	                    <div class="pic">
	                        <img src="${ASSET_URL }${goods.headImgUrl}">
	                        <img src="../static/images/215_34.png" class="iw">
	                    </div>
	                    <div class="text">
	                        <div class="name">${goods.name }</div>
	                        <div class="num">${goods.sellCount}已抢</div>
<%--	                        <div class="price2">¥198</div>--%>
	                        <div class="price">${goods.price}</div>
	                    </div>
	                </a>
	                <div class="addCart">
	                    <img src="../static/images/215_38.png">
	                </div>
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
                        	if(kw!=null&&kw!="")
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
					    $(".g-list .t-list").html("");
					    resetpt();
					}else{
						$(".sy-index").hide();
				    	$(".g-list").show();
					    $(".g-list .t-list").html("");
	                    $(".g-list .t-list").css({ "margin-top": "50px"});
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
			                        $(".g-list .t-list").append(lis);
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
<!--滚动插件-->
<script type="text/javascript" src="../static/plug-in/slider/swipeSlide.min.js"></script>
<script>
    $(function(){
        $('#slide').swipeSlide({
            continuousScroll:true,
            speed : 3000,
            autoSwipe : true,
            transitionType : 'cubic-bezier(0.22, 0.69, 0.72, 0.88)',
            callback : function(i){
                $('.dot').children().eq(i).addClass('cur').siblings().removeClass('cur');
            }
        });

        $('.head-bar .btn-al').on('tap',function () {
            $(this).siblings('.head-mr-menu').fadeToggle();
        });
        $('.head-bar .mask').on('tap',function () {
            $('.head-mr-menu').fadeOut();
        });
    });

</script>
</body>
</html>
