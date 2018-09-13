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
    <script type="text/javascript" src="../static/js/jquery.cookie.js"></script>
    <!--主要样式-->
    <link rel="stylesheet" href="http://at.alicdn.com/t/font_pst0nw8mmx9lik9.css">
    <link rel="stylesheet" href="../static/css/jNotify.jquery.css">
    <link rel="stylesheet" href="../static/css/base_yph1.css">
    <link rel="stylesheet" href="../static/css/mz.css">
     <link rel="stylesheet" href="../static/plug-in/photoswipe/default-skin.css">
    <link rel="stylesheet" href="../static/plug-in/photoswipe/photoswipe.css">
	<link rel="stylesheet" href="../static/iconfonts/iconfont.css">
    <script type="text/javascript" src="../static/plug-in/photoswipe/photoswipe.min.js"></script>
    <script type="text/javascript" src="../static/plug-in/photoswipe/photoswipe-ui-default.min.js"></script>
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
  </head>
<body>
<div class="p-heat">
    <span class="back-btn" onclick="javascript:location.href='index';"></span>
    <div class="title">${xzCatalog.name }</div>
</div>
<div class="mgz-index">
    <div class="clearfix mz-nav2">
    	<c:forEach items="${mzCatalogList }" var="catalog">
             <a href="javaScript:" target="_self" id="${catalog.id}" >
	            <img src="${ASSET_URL}${catalog.imgUrl}">
	            <p>${catalog.name }</p>
	         </a>
        </c:forEach>
    </div>
    <div class="g-list">
        <div class="mgz-title">最新上市</div>
        <div class="l-list clearfix">
        
        </div>
    </div>
</div>
<script>
            $(function(){
            	var wl =0;
                $('.tab-icon-inner a').each(function(){
                    wl=wl+$(this).width();
                });
                $('.tab-icon-inner').css('width',wl+'px');
                
            	$('.mz-nav2 a').click(function () {
                        $(this).addClass('active').siblings().removeClass('active');
                        resetpt();
                        mzCatalogId = $(this).attr("id");
                        $(".l-list").html("");
                        getGoods();
                  });
                  
                //分页加载
                var pages = 0;//初始页
                var list_count='';
                var isLastPage = false;
                var goodsGetIn=false;
                var flag="time";
                var catagory_id = "";
                var ASSET_URL = '${ASSET_URL}';
                var mzCatalogId='${mzCatalogId}';
                var xzCatalogId='${xzCatalogId}';
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
                        	getGoods();
                        }
                    }
                };
                if(mzCatalogId!=null&&mzCatalogId!=""){
			     	$(".mz-nav2 #"+mzCatalogId).trigger("click");
			    }
			    if(mzCatalogId==null||mzCatalogId==""){
			    	mzCatalogId='${mzCatalogList[0].id}';
			     	$(".mz-nav2 #"+mzCatalogId).trigger("click");
			    }
//                 getGoods();
			    function getGoods(){
			        if(!isLastPage && !goodsGetIn){
			        	catagory_id=mzCatalogId+"%"+xzCatalogId;
			        	var backUrl = "${pageContext.request.contextPath}/goods/xzGoodsList?mzCatalogId="+mzCatalogId+"&xzCatalogId="+xzCatalogId;
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
            });
             $(function () {
				var str = window.location.href;
				str = str.substring(str.lastIndexOf("/") + 1);
				if ($.cookie(str)) {
				$("html,body").animate({ scrollTop: $.cookie(str) }, 1000);
				}
				else {
				}
			});
			$(window).scroll(function () {
				var str = window.location.href;
				str = str.substring(str.lastIndexOf("/") + 1);
				var top = $(document).scrollTop();
				$.cookie(str, top, { path: '/' });
				return $.cookie(str);
			});
        </script>
</body>
</html>
