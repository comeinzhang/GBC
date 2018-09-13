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
    <link rel="stylesheet" href="http://at.alicdn.com/t/font_pst0nw8mmx9lik9.css">
    <link rel="stylesheet" href="../static/css/base_yph1.css">
    <link rel="stylesheet" href="../static/css/style_yph.css">
    <script type="text/javascript" src="../static/js/jquery.min.js"></script>
    <script type="text/javascript" src="../static/js/jquery.cookie.js"></script>
	<link rel="stylesheet" href="../static/css/jNotify.jquery.css">
	<script type="text/javascript" src="../static/js/jNotify.jquery.js"></script>
	<script type="text/javascript" src="../static/js/yxMobileSlider.js"></script>
	<script type="text/javascript" src="../static/plug-in/slide/swipeSlide.min.js"></script>
    <link rel="stylesheet" href="../static/plug-in/slide/slide.css">
    <link rel="stylesheet" href="../static/css/mz.css">
    <title>首页</title>
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
  </head>
<body>
<div class="head">
    <div class="top-box">
        <div class="search">
            <input type="text" id="search" placeholder="搜索好东西" class="get-input">
            <div class="search-btn"></div>
        </div>
    </div>
    <div class="slider-tab">
        <div class="p-warp" style="width: 358px;">
            <p class="active"><a href="" target="_self">推荐</a></p>
            <c:forEach items="${mzCatalogList }" var="catalog">
                    <p><a href="mzGoodsList?mzCatalogId=${catalog.id }" target="_self">${catalog.name }</a></p>
            </c:forEach>
            <p><a href="catagoryList?catalogId=${yczf.id }" target="_self">${yczf.name }</a></p>
            <p><a href="catagoryList?catalogId=${qqyx.id }" target="_self">${qqyx.name }</a></p>
        </div>
    </div>
</div>
<div class="g-list" style="display: none;">
    <div class="t-list">
    </div>
</div>
<div class="slide index_slider" id="slide">
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
<div class="mz-index">
	<div class="new-user">
        <div class="lv-title">
            <span class="s1"><img src="../static/images/mz_03.png"></span><span class="s2">新客推荐</span>
        </div>
        <div class="new-user-goods">
        	<a href="${map.xktjImgUrl}" target="_self">
<!--                     <img src="../static/images/mz_01.jpg" style="width: 100%;"> -->
						<img src="${ASSET_URL }${map.xktjImg}" style="width: 100%;">
            </a>
        </div>
    </div>
    <div class="mz-nav clearfix">
    	<c:forEach items="${xzCatalogList }" var="catalog">
             <a href="xzGoodsList?xzCatalogId=${catalog.id }" target="_self">
	            <img src="${ASSET_URL}${catalog.imgUrl}">
	            <p>${catalog.name }</p>
	         </a>
        </c:forEach>
        <a href="catagoryList?catalogId=${yczf.id }" target="_self">
            <img src="${ASSET_URL}${yczf.imgUrl }">
            <p>${yczf.name }</p>
        </a>
        <a href="catagoryList?catalogId=${qqyx.id }" target="_self">
            <img src="${ASSET_URL}${qqyx.imgUrl }">
            <p>${qqyx.name }</p>
        </a>
    </div>
    <div class="new-user">
    	<div class="lv-title">
            <span class="s1"><img src="../static/images/mz_22.png"></span><span class="s2">优品推荐</span>
        </div>
        <div class="new-user-goods2">
        	<c:if test="${!empty map.indexGoodsImgUrl0}">
    			<a href="${map.indexGoodsImgUrl0}" target="_self" style="border-bottom:1px #d7d7d7 solid">
                	<img src="${ASSET_URL}${map.indexGoodsImg0}">
            	</a>
    		</c:if>
    		<c:if test="${!empty map.indexGoodsImgUrl1}">
    			<a href="${map.indexGoodsImgUrl1}" target="_self" style="border-bottom:1px #d7d7d7 solid">
                	<img src="${ASSET_URL}${map.indexGoodsImg1}">
            	</a>
    		</c:if>
    		<c:if test="${!empty map.indexGoodsImgUrl2}">
    			<a href="${map.indexGoodsImgUrl2}" target="_self" style="border-bottom:1px #d7d7d7 solid">
                	<img src="${ASSET_URL}${map.indexGoodsImg2}">
            	</a>
    		</c:if>
    		<c:if test="${!empty map.indexGoodsImgUrl3}">
    			<a href="${map.indexGoodsImgUrl3}" target="_self" style="border-bottom:1px #d7d7d7 solid">
                	<img src="${ASSET_URL}${map.indexGoodsImg3}">
            	</a>
    		</c:if>
    		<c:if test="${!empty map.indexGoodsImgUrl4}">
    			<a href="${map.indexGoodsImgUrl4}" target="_self" style="border-bottom:1px #d7d7d7 solid">
                	<img src="${ASSET_URL}${map.indexGoodsImg4}">
            	</a>
    		</c:if>
    		<c:if test="${!empty map.indexGoodsImgUrl5}">
    			<a href="${map.indexGoodsImgUrl5}" target="_self" style="border-bottom:1px #d7d7d7 solid">
                	<img src="${ASSET_URL}${map.indexGoodsImg5}">
            	</a>
    		</c:if>
    		<c:if test="${!empty map.indexGoodsImgUrl6}">
    			<a href="${map.indexGoodsImgUrl6}" target="_self" style="border-bottom:1px #d7d7d7 solid">
                	<img src="${ASSET_URL}${map.indexGoodsImg6}">
            	</a>
    		</c:if>
    		<c:if test="${!empty map.indexGoodsImgUrl7}">
    			<a href="${map.indexGoodsImgUrl7}" target="_self" style="border-bottom:1px #d7d7d7 solid">
                	<img src="${ASSET_URL}${map.indexGoodsImg7}">
            	</a>
    		</c:if>
        </div>
    </div>
</div>
<div class="alert-hb" style="display: none;">
    <div class="mask"></div>
    <div class="hb-box">
        <a href="../user/toRegister" target="_self">
            <img src="${ASSET_URL }${voucher.headImgUrl}" width="100%">
        </a>
        <div class="close-btn"><img src="../static/images/yh_05.png"></div>
    </div>
</div>
    <script>
    		
            $(function(){
            if('${voucher}'!=null&&'${voucher}'!=""){
            	var disabled = $.cookie("disabled1");
	            if(disabled!="NO"){
	            	$('.alert-hb').fadeIn();
	            	$.cookie("disabled1", "NO", { expires: 7 });
	            }
            }
            var user = '${sessionScope.user}';
		    if(user==null||user==""||user==undefined){
	            var userId = $.cookie("userId");
				if(userId!=null&&userId!=""&&userId!=undefined){
			                		$.ajax({
						                cache: true,
						                type: "POST",
						                url:"../user/cookieLogin",
						                data:{userId:userId},
						                timeout:5000,
						                async: false,
						                error: function(request) {
						                },
						                success: function(data) {
						                }
						            });
					$.cookie("userId", userId, { expires: 7 });	            
				}	
			}	            
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
				 	$(".n-index").hide();
				 	$(".index_slider").hide();
				 	$(".mz-index").hide();
			    	$(".g-list").show();
				    $(".t-list").html("");
                    $(".slider-tab").remove();
                    $(".g-list .t-list").css({ "margin-top": "40px"});
                    $(".g-list .t-list").css({ "margin-bottom": "50px"});
                    resetpt();
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
            <li>
                <a href="index" target="_self" style="color: #c40000;">
                    <i class="bottom_menu_bg1"></i>
                    <p>首页</p>
                </a>
            </li>
		            <li>
		                <a href="catagoryList" target="_self">
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
<div class="tophomecart">
        <p class="tophomecart_top"><a href="#top" target="_self"></a></p>
</div>
</body>
</html>