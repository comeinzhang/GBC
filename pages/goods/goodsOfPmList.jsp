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
    <script src="${pageContext.request.contextPath}/static/iconfonts/icon_url.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery.min.js"></script>
    <script type="text/javascript" src="../static/js/jNotify.jquery.js"></script>
    <!--主要样式-->
    <link rel="stylesheet" href="http://at.alicdn.com/t/font_pst0nw8mmx9lik9.css">
    <link rel="stylesheet" href="../static/css/jNotify.jquery.css">
    <link rel="stylesheet" href="../static/css/base.css">
    <link rel="stylesheet" href="../static/css/style.css">
    <link rel="stylesheet" href="../static/css/base_yph1.css">
    <link rel="stylesheet" href="../static/css/style_yph.css">
     <link rel="stylesheet" href="../static/plug-in/photoswipe/default-skin.css">
    <link rel="stylesheet" href="../static/plug-in/photoswipe/photoswipe.css">
	<link rel="stylesheet" href="../static/iconfonts/iconfont.css">
	<link rel="stylesheet" href="../static/iconfonts/icon_url.js">
    <script type="text/javascript" src="../static/plug-in/photoswipe/photoswipe.min.js"></script>
    <script type="text/javascript" src="../static/plug-in/photoswipe/photoswipe-ui-default.min.js"></script>
    <title>拍卖列表</title>
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
  </head>
<body>
<script>

</script>
<div class="container">
    <div class="k-index">
        <div class="head" style="padding-top: 0px;">
        	<div class="container myct">
            <span class="back" onClick="javascript :history.back(-1);"></span>
            <p>拍卖商品</p>
    		</div>
            <div class="sort">
                <div class="sort-left">
                    <a href="javascript:" id="all" target="_self" class="active">综合</a>
                    <a href="javascript:" id="laster" target="_self">上新</a>
                    <a href="javascript:" id="ending" target="_self">即将截拍</a>
                </div>
            </div>
        </div>
        <div class="g-list">
            <div class="l-list clearfix" style="margin-top: 75px;">
            </div>
        </div>

        <script>
            $(function(){

                var wl =0;
               $('.p-warp p').each(function(){
                    wl=wl+$(this).width()+20;
                });
                $('.p-warp').css('width',wl+'px');
					
				$('.sort-left a').click(function () {
                        $(this).addClass('active').siblings().removeClass('active');
                        resetpt();
                        flag = $(this).attr("id");
                        $(".l-list").html("");
                        getGoods();
                  });
                  
                //分页加载
                var pages = 0;//初始页
                var list_count='';
                var isLastPage = false;
                var goodsGetIn=false;
                var flag="all";
                var catagory_id = 0;
                var totalPage=0;
                var ASSET_URL = '${ASSET_URL}';
                function resetpt(){
			        pages=0;
			        list_count='';
			        flag="";
			        totalPage=0;
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
                        if(list_count > 0 && pages+1 > totalPage){
                            isLastPage = true;
                        }else{
                        	if(flag!="yphIndex"){
                        		getGoods();
                        	}
                        }
                    }
                };
                 getGoods();
			    function getGoods(){
			        if(!isLastPage && !goodsGetIn){
			        	pages=parseInt(pages)+1;
			        	var data={pages:pages,flag:flag}
			            $.ajax({
			            	cache: true,
			                type: "POST",
			                url:"pmGoodsListPage",
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
				                            + "<div class='num'><i class='iconfont icon-hot'></i>"+n.clickCount+"</div>"
				                            + "<div class='price'>当前价 &yen; <span>"+n.bidMaxPrice+"</span></div>"
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
                <a href="index?flag=app" target="_self">
                    <i class="bottom_menu_bg1"></i>
                    <p>首页</p>
                </a>
            </li>
            <li>
                <a href="toPmGoodsList" style="color: #c40000;">
                    <i class="bottom_menu_bg2"></i>
                    <p>拍卖</p>
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
