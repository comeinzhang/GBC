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
    <link rel="stylesheet" href="../static/css/base.css">
    <link rel="stylesheet" href="../static/css/style.css">
    <link rel="stylesheet" href="../static/css/css.css">
    <script type="text/javascript" src="../static/js/json2-min.js"></script>
    <script type="text/javascript" src="../static/js/QryUrlStrParam.js"></script>
    <script type="text/javascript" src="../static/js/QxPublic.js"></script>
    <script type="text/javascript" src="../static/js/jquery-1.8.3.min.js"></script>
	<link rel="stylesheet" href="../static/css/jNotify.jquery.css">
	<script type="text/javascript" src="../static/js/jNotify.jquery.js"></script>
    <title>早餐订单</title>
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
</head>
<body>
<div class="container">
    <!--搜索框开始-->
    <div class="myct">
    <span class="back" onClick="javascript :history.back(-1);"></span>
    <p>早餐订单</p>
	</div>
    <div class="goods_manage">
        <div class="goods_manage_head border_bottom">
            <a href="javascript:;" target="_self" class="store_head_2ablockb search_cl">
                	待接单
            </a>
			<a href="javascript:;" target="_self" class="store_head_2ablockb">待付款</a>
			<a href="javascript:;" target="_self" class="store_head_2ablockb">待送餐</a>
            <a href="javascript:;" target="_self">已完成</a>
        </div>
        <div class="goods_manage_content mt10" style="display: block;">
            <ul>
            	<c:forEach items="${orderList1 }" var="order">
		                <li>
		                	<c:forEach items="${order.detailList }" var="detail">
			                    <div class="promotion-goods-img"onclick="orderDetail('${order.orderNum}')" ><img src="${ASSET_URL }${detail.goods.headImgUrl}"></div>
			                    <div class="goods_info">
			                        <p class="goods_name" onclick="orderDetail('${order.orderNum}')">${detail.goods.name}</p>
			                        <p class="goods_price">送餐时间：${order.postTime }</p>
			                    </div>
			                    <div class="clear"></div>
		                    </c:forEach>
		                    <div class="bottom-btn mt10 border_top">
		                    	<div class="bottom-btn-1 accept" id="${order.orderNum }">接单</div>
		                    </div>
		                    <div class="clear"></div>
		                </li>
                </c:forEach>
            </ul>
             <div class="clear"></div>
        </div>
        <div class="goods_manage_content mt10">
            <ul>
            	<c:forEach items="${orderList2 }" var="order">
	            	<c:forEach items="${order.detailList }" var="detail">
		                <li onclick="orderDetail('${order.orderNum}')">
		                    <div class="promotion-goods-img"><img src="${ASSET_URL }.${detail.goods.headImgUrl}"></div>
		                    <div class="goods_info">
		                        <p class="goods_name">${detail.goods.name}</p>
		                        <p class="goods_price">送餐时间：${order.postTime }</p>
		                    </div>
		                    <div class="clear"></div>
		                </li>
	                </c:forEach>
                </c:forEach>
            </ul>
            <div class="clear"></div>
        </div>
        <div class="goods_manage_content mt10">
            <ul>
               <c:forEach items="${orderList3 }" var="order">
	            	<c:forEach items="${order.detailList }" var="detail">
		                <li onclick="orderDetail('${order.orderNum}')">
		                    <div class="promotion-goods-img"><img src="${ASSET_URL }.${detail.goods.headImgUrl}"></div>
		                    <div class="goods_info">
		                        <p class="goods_name">${detail.goods.name}</p>
		                        <p class="goods_price">送餐时间：${order.postTime }</p>
		                    </div>
		                    <div class="clear"></div>
		                </li>
	                </c:forEach>
                </c:forEach>
            </ul>
            <div class="clear"></div>
        </div>
        <div class="goods_manage_content mt10">
            <ul>
                <c:forEach items="${orderList4 }" var="order">
	            	<c:forEach items="${order.detailList }" var="detail">
		                <li onclick="orderDetail('${order.orderNum}')">
		                    <div class="promotion-goods-img"><img src="${ASSET_URL }.${detail.goods.headImgUrl}"></div>
		                    <div class="goods_info">
		                        <p class="goods_name">${detail.goods.name}</p>
		                        <p class="goods_price">送餐时间：${order.postTime }</p>
		                    </div>
		                    <div class="clear"></div>
		                </li>
	                </c:forEach>
                </c:forEach>
            </ul>
            <div class="clear"></div>
        </div>
    </div>
</div>
<script type="text/javascript">
function orderDetail(orderNum){
    	window.location.href="breakerOrderDetail?orderNum="+orderNum;
    }
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
			        	$(this).parents("li").remove();
			        }    
			    });
	$(document).ready(function(){
		$(".goods_manage_head a").click(function(){
            $(".goods_manage_head a").eq($(this).index()).addClass("search_cl").siblings().removeClass("search_cl");
            $(".goods_manage_content").hide().eq($(this).index()).show();
         });
	});
</script>			    
</body>
</html>
