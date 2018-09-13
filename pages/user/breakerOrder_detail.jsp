<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String lastPage = request.getHeader("referer");
%>
<!DOCTYPE HTML >

<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <meta content="yes" name="apple-mobile-web-app-capable" />
    <meta content="black" name="apple-mobile-web-app-status-bar-style" />
    <meta content="telephone=no" name="format-detection" />
    <link rel="stylesheet" href="../static/css/base.css">
    <link rel="stylesheet" href="../static/css/style.css">
    <link rel="stylesheet" href="../static/css/jNotify.jquery.css">
    <script type="text/javascript" src="../static/js/jquery.min.js"></script>
    <script type="text/javascript" src="../static/js/jNotify.jquery.js"></script>
    <title>我的订单</title>
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
</head>
<body>
<div class="myct">
	<span class="back" onClick="javascript :history.back(-1);"></span>
  	<p>订单详情</p>
	<div class="index_menubtn"></div>
	<div class="index_menu">
		<div class="index_menu_top"></div>
		<ul>
			<li><a href="../goods/index" target="_self"><i class="index_menu_icon1"></i>首页</a></li>
            <li><a href="../goods/getGoodsCar" target="_self"><i class="index_menu_icon2"></i>购物车</a></li>
            <li><a href="../goods/getGoodsStore" target="_self"><i class="index_menu_icon3"></i>收藏夹</a></li>
            <li><a href="../user/mycenter" target="_self"><i class="index_menu_icon4"></i>个人中心</a></li>
		</ul>
	</div>

</div>
<div class="clear"></div>
<div class="container">
	<div class="order_details_t border_bottom">
    	<p>商品订单号：${order.orderNum }</p>
        <span>
        <c:choose>
        	<c:when test="${order.status eq 0}">
        		订单状态：待付款
        	</c:when>
        	<c:when test="${order.status eq 1}">
        		订单状态：待送餐
        	</c:when>
        	<c:when test="${order.status eq 7}">
        		订单状态：待接单
        	</c:when>
        	<c:when test="${order.status eq 3}">
        		订单状态：已完成
        	</c:when>
        </c:choose>
        </span>
    </div>
	<div class="add_call_pay">    	
    	<div class="add_call_pay_bg">
    		<p class="add_call_pay_name">收件人：${addr.name }</p>
        	<p class="add_call_pay_phne">电　话：${addr.phone }</p>
        	<div class="clear"></div>
        	<p class="add_call_pay_add">地　址：${addr.addr }</p>
        </div>
    </div>
	<div class="content_goods_list">
	<c:forEach items="${order.detailList }" var="detail">
		<div class="xzspgg_sp xzspgg_sp_2 getComment9_1">
			<img src="${ASSET_URL }${detail.goods.headImgUrl }"height="80" >
			<h1>${detail.goods.name }</h1>
<!-- 			<p class="xzspgg_sp_hh">货号: 01F70056377</p> -->
			<p class="xzspgg_sp_hh">
			</p>
			<p class="xzspgg_sp_jg">
			送餐时间:<span>　×${order.postTime }</span>
			</p>
			<div class="clear"></div>
		</div>
	   </c:forEach>
	</div>
    <div class="goods_tj">
    	<p>商品总价<span>¥${order.totalPrice }</span></p>
		<div class="container submit_yf border_top buy_submit">
			<c:choose>
	        	<c:when test="${order.status eq 7}">
	        		<div class="submit_btn accept" id="${order.orderNum }">接单</div>
	        	</c:when>
	        </c:choose>
		</div>
	</div>	
		<script>
			$(document).ready(function(){
				$(".index_menubtn").click(function(){
					$(".index_menu").stop().fadeToggle('flow');
				})
			});
		$(".accept").live("click",function(){
			    	var orderNum = $(this).attr("id");
			    	var flag = false;
			    	$.ajax({
			            	cache: true,
			                type: "POST",
			                url:"acceptBreakerOrder",
			                data:{orderNum:orderNum},
			                timeout:5000,
			                async: false,
			                beforeSend:function(XMLHttpRequest){
			                	//努力加载
// 			                    $(".loading").show();
			                },
			                success: function (data){
			                	flag=true;
			                	jSuccess('已接单');
			                },
			                error: function () {
			                   jNotify("服务器或者网络错误",{ShowOverlay : false});
			                }
			            });
			        if(flag){
			        	location.href="mycenter";
			        }    
			    });
		</script>
</div>		
</body>
</html>
