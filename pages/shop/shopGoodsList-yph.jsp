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
    <link rel="stylesheet" href="http://at.alicdn.com/t/font_450229_6gu7pw6zbbcpu8fr.css">
    <link rel="stylesheet" href="../static/css/base-yph.css">
    <link rel="stylesheet" href="../static/css/pay.css">
    <script type="text/javascript" src="../static/js/jquery.min.js"></script>
    <script type="text/javascript" src="../static/js/jquery.cookie.js"></script>
	<link rel="stylesheet" href="../static/css/jNotify.jquery.css">
	<script type="text/javascript" src="../static/js/jNotify.jquery.js"></script>
	<script type="text/javascript" src="../static/plug-in/slide/swipeSlide.min.js"></script>
    <link rel="stylesheet" href="../static/plug-in/slide/slide.css">
    <link rel="stylesheet" href="../static/plug-in/layer/skin/default/layer.css">
    <script type="text/javascript" src="../static/plug-in/layer/layer.js"></script>
    <script type="text/javascript" src="../static/js/public.js"></script>
    <title>${shop.name }</title>
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
  </head>
<body>
<div class="page-warp">
    <div class="head-bar" style="background: url(../static/images/wd_01.jpg) no-repeat; background-size: cover;">
        <div class="t-bar">
            <div class="btn-l" onclick="javascript :history.back(-1);">
                <i class="iconfont icon-xiangzuo f21"></i>
            </div>
            <div class="search-box">
                <form action="">
                    <input type="search" id="search" placeholder="输入关键字搜索">
                </form>
                <div class="sc-btn"><i class="iconfont icon-sousuo-sousuo"></i></div>
            </div>
<%--            <div class="btn-fl catalogList">--%>
<%--            	<i class="iconfont icon-leimupinleifenleileibie2 f21 f-f"></i>--%>
<%--            </div>--%>
            <div class="btn-fl" onclick="javascript :location.href='shopCatalog?shopId=${shop.id}';">
            	<i class="iconfont icon-leimupinleifenleileibie2 f21 f-f"></i>
            </div>
            <div class="ddr" id="topMenu1">
            	<i class="iconfont icon-sangedian f-f"></i>
            </div>
            <div class="head-mr-menu">
                <div class="sj"><img src="../static/images/sj.png"></div>
                <div class="mask"></div>
                <div class="a-li">
                	<c:forEach items="${allCatalogs }" var="catalog">
			             <a href="../goods/catagoryList?catalogId=${catalog.id }" id="${catalog.id }" class="searchCata">
				            ${catalog.name }
				         </a>
		        	</c:forEach>
                </div>
            </div>
        </div>
        <div class="st-h">
            <img src="${ASSET_URL }${shop.logoUrl}" class="i1">
            <p class="p1">${shop.name }</p>
            <p class="p2">一级店铺</p>
<%--            <div class="gz-btn">关注</div>--%>
        </div>
        <div class="top-link">
            <p class="p1"><a href="javaScript:">店铺首页</a></p>
            <p class="p2 active"><a href="javaScript:">全部商品</a></p>
            <p class="p3"><a href="javaScript:">新品上架</a></p>
        </div>
    </div>
    <div class="dp-index">
        
<%--        <div class="ppt">--%>
<%--            <img src="../static/images/tt_03.png"> 十月上新 <img src="../static/images/tt_03.png">--%>
<%--        </div>--%>
        <div class="goods-link">
            
        </div>
    </div>

</div>
<div class="pb-go-top none">
    <i class="iconfont icon-uptop f21"></i>
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
            	 //分页加载
                var pages = 0;//初始页
                var list_count='';
                var isLastPage = false;
                var goodsGetIn=false;
                var ASSET_URL = '${ASSET_URL}';
                var kw="";
                var flag="sell";
                var totalPage=0;
                var catalogId='${catalogId}';
                function resetpt(){
			        pages=0;
			        list_count='';
			        goodsGetIn=false;
			        isLastPage = false;
			        totalPage=0;
			        flag="sell";
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
						$(".goods-link").html("");
						search(kw);
				 });
				$('.top-link p').click(function(){
                    $(this).addClass('active').siblings().removeClass('active');
                    var index = $(this).index();
                    resetpt();
                    if(index==2){
                    	flag="no";
                    	totalPage = 2;
                    }
                    $(".goods-link").html("");
                    search(kw);
                });
				search(kw);
				function search(keyWord){
			        if(!isLastPage && !goodsGetIn){
			        	pages=parseInt(pages)+1;
			        	var data={pages:pages,keywordstr:keyWord,flag:flag,shopId:shopId,catalogId:catalogId};
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
			                        if(flag=="sell")
			                        totalPage=data.page.totalPage;
			                        var lis = '';
			                        $(data.list).each(function(i,n){
			                        	lis += "<div class='a'>"
			                             	+"<a href='../goods/getGoodsById?id="+n.id+"&shopId="+shopId+"' target='_self'>"
				                            + "<div class='img'><img src="+ASSET_URL+n.headImgUrl+"></div>"
				                            + "<div class='name' style='white-space:nowrap; text-overflow:ellipsis; overflow:hidden;'>"+n.name+"</div>"
				                            + "<p class='p2'>销量"+n.sellCount+"</p>"
				                            + "<p class='p1'>¥"+n.price+"</p>"
				                            +"</a>"
				                            +"<div class='sc-btn' onclick=javaScript:location.href='../goods/getGoodsById?id="+n.id+"&shopId="+shopId+"'><span>收藏</span></div>"
				                            +"</div>";
			                        });
			                        $(".goods-link").append(lis);
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
<script>
    $(document).ready(function () {
        $(document).on('tap','.goods-link .sc-btn',function () {
            $(this).html('<span>已收藏</span>');
            layer.msg('已收藏');
        })
    });
</script>
</body>
</html>