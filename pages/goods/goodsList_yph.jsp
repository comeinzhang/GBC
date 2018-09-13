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
    <link rel="stylesheet" href="../static/css/base_yph1.css">
    <link rel="stylesheet" href="../static/css/style_yph.css">
    <script type="text/javascript" src="../static/js/jquery.min.js"></script>
	<link rel="stylesheet" href="../static/css/jNotify.jquery.css">
	<script type="text/javascript" src="../static/js/jNotify.jquery.js"></script>
	<script type="text/javascript" src="../static/js/yxMobileSlider.js"></script>
    <title>
    <c:if test="${sign eq '1'}">
    	新品推荐
    </c:if>
    <c:if test="${sign eq '2'}">
    	超值优惠
    </c:if>
    <c:if test="${sign eq '3'}">
    	为你推荐
    </c:if>
    <c:if test="${sign eq '4'}">
    	本店特色
    </c:if>
    </title>
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
  </head>
<body>
<div class="container">
    <div class="k-index">
        <div class="g-list" style="margin-top: 0px;margin-bottom: 10px;">
			<div class="t-list" style="margin-top: 0px;">
				<div class="a-banner" style="margin-bottom: 0px;">
                    <a href="signList?sign=1" target="_self">
	                    <c:if test="${sign eq '1'}">
	                     <img src="../static/images/000_03.png">
	                     </c:if>
	                     <c:if test="${sign eq '2'}">
	                     <img src="../static/images/000_04.png">
	                     </c:if>
	                     <c:if test="${sign eq '3'}">
	                     <img src="../static/images/000_05.png">
	                     </c:if>
	                     <c:if test="${sign eq '4'}">
	                     <img src="../static/images/000_06.png">
	                     </c:if>
                    </a>
                </div>
             </div>
             <div class="p-list goodsList" style="margin-top: 0px;">
               
             </div>
        </div>
        <script>
            $(function(){
                //分页加载
                var pages = 0;//初始页
                var list_count='';
                var isLastPage = false;
                var goodsGetIn=false;
                var flag="no";//排序
                var sign='${sign}';
                var catagory_id = "";
                var totalPage=0;
                var ASSET_URL = '${ASSET_URL}';
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
                getGoods();
			    function getGoods(){
			        if(!isLastPage && !goodsGetIn){
			        	pages=parseInt(pages)+1;
			        	var data={pages:pages,catagory_id:catagory_id,flag:flag,sign:sign}
			            $.ajax({
			            	cache: true,
			                type: "POST",
			                url:"getGoodsByCatagoryListPage",
			                data:data,
			                timeout:5000,
			                async: false,
			                beforeSend:function(XMLHttpRequest){
			                	//努力加载
			                    $('.load').append(loaDingGif);
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
				                            + "<a href='getGoodsById?id=" + n.id + "' target='_self'>"
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
			                        $(".goodsList").append(lis);
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
                <a href="index?flag=yph" target="_self">
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
</body>
</html>
