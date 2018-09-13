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
<script>
    ///rem单位兼容代码↓↓↓↓↓↓↓↓↓↓
    (function (doc, win) {
        var docEl = doc.documentElement,
                resizeEvt = 'orientationchange' in window ? 'orientationchange' : 'resize',
                recalc = function () {
                    var clientWidth = docEl.clientWidth;
                    var clientHeight = window.innerHeight;
                    if (!clientWidth) return;
                    //alert(clientHeight)
                    if(clientWidth>750){
                        docEl.style.fontSize =  '75px';
                    }else{
                        docEl.style.fontSize = 75 * (clientWidth / 750) + 'px';
                    }
                };

        if (!doc.addEventListener) return;
        win.addEventListener(resizeEvt, recalc, false);
        doc.addEventListener('DOMContentLoaded', recalc, false);
    })(document, window);
    ///rem单位兼容代码↑↑↑↑↑↑↑↑↑
</script>
<div class="container">
    <div class="k-index" id="top">
        <div class="head" >
            <div class="top-box">
                <div class="me-btn">
                    <a href="" target="_self"><i class="iconfont "></i></a>
                </div>
                <div class="search">
                    <input type="text" id="search" placeholder="搜索好东西">
                    <div class="search-btn" style="display: block;"></div>
                </div>
            </div>
            <div class="slider-tab">
                <div class="p-warp" style="width:${(fn:length(catalogList)+1)*25}%">
                    <p id="yphIndex" class="active">推荐</p>
                    <c:forEach items="${catalogList }" var="catalog">
                    <p id="${catalog.id }">${catalog.name }</p>
                   </c:forEach>
                </div>
            </div>
        </div>
        <div class="g-list" style="display: none;">
            <div class="p-list">
           </div>
           <div class="t-list">
           </div>
        </div>
    </div>
    <div class="n-index" style="margin-bottom: 50px;">
    	<div class="slide index_slider" id="slide">
                <style>
                .index_slider:after{ padding-top: 52%;}
                </style>
                <ul>
                	<li style="height: 290"><a href="../user/toReplyShop" target="_self"><img src="../static/images/replyShop.png"></a></li>
                    <li style="height: 290"><a href="../pages/crowd/dxal.jsp" target="_self"><img src="../static/images/9.jpg" ></a></li>
                    <li style="height: 290"><a href="getindexCatalog?catalogId=53" target="_self"><img src="../static/images/t1.jpg" ></a></li>
<!--                     <li style="height: 290"><a href="getindexCatalog?catalogId=52" target="_self"><img src="../static/images/t2.jpg"></a></li> -->
                </ul>
                <div class="dot">
                </div>
        </div>
<!--         <div class="block-1"> -->
<!--             <a href="getGoodsById?id=133" target="_self"><img src="../static/images/9.png"></a> -->
<!--         </div> -->
        <div class="block-2 clearfix">
            <div class="left">
                <a href="toPmGoodsList" target="_self"><img src="../static/images/13.jpg"></a>
            </div>
            <div class="right">
                <a href="toPreSellIndex" target="_self"><img src="../static/images/14.jpg"></a>
                <a href="signList?sign=5" target="_self" class="img1"><img src="../static/images/11.jpg"></a>
                <a href="toDzIndex" target="_self" class="img1"><img src="../static/images/12.jpg"></a>
            </div>
        </div>
<!--         <div class="block-3 clearfix"> -->
<!--             <div class="left"> -->
<!--                 <a href="catagoryList" target="_self"><img src="../static/images/417_13.png"></a> -->
<!--             </div> -->
<!--             <div class="right"> -->
<!--                 <a href="catagoryList" target="_self"><img src="../static/images/417_13.png"></a> -->
<!--             </div> -->
<!--         </div> -->
        <div class="block-4">
            <div class="row">
                <a href="getGoodsById?id=139" target="_self">
                    <img src="../static/images/b1.jpg">
<!--                     <div class="text"> -->
<!--                         <p class="name">这一次,国际大减价,统统不要钱...</p> -->
<!--                         <p class="p2"> -->
<!--                             <span class="sp1">红色小字</span> -->
<!--                             [啦啦啦] [嗯嗯嗯] 买一还送一,统统不要钱 -->
<!--                         </p> -->
<!--                     </div> -->

                </a>
            </div>
            <div class="row">
                <a href="getGoodsById?id=136" target="_self">
                    <img src="../static/images/b2.jpg">
<!--                     <div class="text"> -->
<!--                         <p class="name">这一次,国际大减价,统统不要钱...</p> -->
<!--                         <p class="p2"> -->
<!--                             <span class="sp1">红色小字</span> -->
<!--                             [啦啦啦] [嗯嗯嗯] 买一还送一,统统不要钱 -->
<!--                         </p> -->
<!--                     </div> -->

                </a>
            </div>
            <div class="row">
                <a href="getGoodsById?id=141" target="_self">
                    <img src="../static/images/b3.jpg">
<!--                     <div class="text"> -->
<!--                         <p class="name">这一次,国际大减价,统统不要钱...</p> -->
<!--                         <p class="p2"> -->
<!--                             <span class="sp1">红色小字</span> -->
<!--                             [啦啦啦] [嗯嗯嗯] 买一还送一,统统不要钱 -->
<!--                         </p> -->
<!--                     </div> -->

                </a>
            </div>
            <div class="row">
                <a href="getGoodsById?id=144" target="_self">
                    <img src="../static/images/b4.jpg">
<!--                     <div class="text"> -->
<!--                         <p class="name">这一次,国际大减价,统统不要钱...</p> -->
<!--                         <p class="p2"> -->
<!--                             <span class="sp1">红色小字</span> -->
<!--                             [啦啦啦] [嗯嗯嗯] 买一还送一,统统不要钱 -->
<!--                         </p> -->
<!--                     </div> -->

                </a>
            </div>
            <div class="row">
                <a href="getGoodsById?id=140" target="_self">
                    <img src="../static/images/b6.jpg">
<!--                     <div class="text"> -->
<!--                         <p class="name">这一次,国际大减价,统统不要钱...</p> -->
<!--                         <p class="p2"> -->
<!--                             <span class="sp1">红色小字</span> -->
<!--                             [啦啦啦] [嗯嗯嗯] 买一还送一,统统不要钱 -->
<!--                         </p> -->
<!--                     </div> -->

                </a>
            </div>
        </div>
    </div>
    <script>
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
            $(function(){
            	 //分页加载
                var pages = 0;//初始页
                var list_count='';
                var isLastPage = false;
                var goodsGetIn=false;
                var flag="yphIndex";
                var catagory_id = '${catalogId}';
                var ASSET_URL = '${ASSET_URL}';
                var kw="";
                var totalPage=0;
                function resetpt(){
			        pages=0;
			        list_count='';
			        flag="";
			        kw="";
			        goodsGetIn=false;
			        isLastPage = false;
			        totalPage=0;
			    }
				 $('.p-warp p').click(function () {
                        $(this).addClass('active').siblings().removeClass('active');
                        resetpt();
                        var id = $(this).attr("id");
                        if(id=="yphIndex"){
                        	flag = "yphIndex";
                        	$(".g-list").hide();
                        	$(".n-index").show();
                        }else{
                        	flag = "no";
                        	$(".n-index").hide();
                        	$(".g-list").show();
                        	$(".p-list").html("");
                        	$(".t-list").html("");+
                        	$(".g-list .t-list").css({ "margin-top": "0px"});
                        	$(".k-index").css({ "margin-bottom": "40px"});
                        	catagory_id=id;
                        	getGoods();
                        }
                    });
                if(catagory_id!=null&&catagory_id!=""){
			     	$(".p-warp #"+catagory_id).trigger("click");
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
                        	if(flag!="yphIndex"&&flag!="search"){
                        		getGoods();
                        	}else if(flag=="search"){
                        		search(kw);
                        	}
                        }
                    }
                };
			    function getGoods(){
			    	var backUrl = "${pageContext.request.contextPath}/goods/index?catalogId="+catagory_id;
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
			                        totalPage=data.page.totalPage;
			                        var lis = '';
			                        $(data.list).each(function(i,n){
			                            lis += "<div class='row'>"
				                            + "<a href='getGoodsById?id=" + n.id + "&backUrl="+backUrl+"' target='_self'>"
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
// 			    $("#search").focus(function(){
// 			    	$(".n-index").hide();
// 			    	$(".g-list").show();
// 				    $(".t-list").html("");
//                     $(".p-list").html("");
//                     $(".slider-tab").remove();
//                     $(".g-list .p-list").css({ "margin-top": "0px"});
//                     $(".g-list .t-list").css({ "margin-top": "40px"});
//                     resetpt();
//                     flag="search";
// 				 });
// 				$(".search-btn").click(function(){
// 					kw = $("#search").val();
// 					if(kw!=""){
// 						search(kw);
// 					}
// 				});
				$("#search").focus(function(){
				    $(document).scrollTo('0');
				});
				$("#search").on("input on", function()
				 {
				 	$(".n-index").hide();
			    	$(".g-list").show();
				    $(".t-list").html("");
                    $(".p-list").html("");
                    $(".slider-tab").remove();
                    $(".g-list .p-list").css({ "margin-top": "0px"});
                    $(".g-list .t-list").css({ "margin-top": "40px"});
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
<div class="tophomecart">
        <p class="tophomecart_top"><a href="#top" target="_self"></a></p>
</div>
</body>
</html>