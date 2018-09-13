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
    <link rel="stylesheet" href="../static/css/css.css">
    <link rel="stylesheet" href="../static/css/jNotify.jquery.css">
    <script type="text/javascript" src="../static/js/jquery.min.js"></script>
    <script type="text/javascript" src="../static/js/jNotify.jquery.js"></script>
    <title>我的订单</title>
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
</head>
<body>
<div class="container myct">
	<span class="back" onClick="javascript :history.back(-1);"></span>
  	<p>本店订单</p>
</div>
<script>
    $(document).ready(function(){
        $(".shop_wd_top li").click(function(){
            $(".shop_wd_top li").eq($(this).index()).addClass("shop_wd_content_sl").siblings().removeClass("shop_wd_content_sl");
            $(".shop_wd_content").hide().eq($(this).index()).show();
        });
    });
</script>
<div class="container"> 
	<ul class="shop_wd_top">
        <li class="shop_wd_content_sl">未发货<span>${fn:length(orderList1)}</span></li>
        <li>待收货<span>${fn:length(orderList2)}</span></li>
        <li>退换货<span>${fn:length(orderList4)}</span></li>
        <li>已完成</li>
    </ul>
    <div class="clear"></div>
</div>
<div class="container">
   <!--未发货开始-->
    <div class="shop_wd_content" style="display: block;">
        <ul>
            <c:forEach items="${orderList1 }" var="order">
		            <li>
		                <span class="shop_wd_list_jg"><a href="toPostGoods?orderNum=${order.orderNum}">确认发货</a></span>
		                <c:forEach items="${order.detailList }" var="detail">
			                   <div class="shop_wd_list_img">
			                       <img src="${ASSET_URL }${detail.goods.headImgUrl}">
			                   </div>
			                   <p class="shop_wd_list_p">${detail.goods.name}</p>
			                   <span class="shop_wd_list_span"></span>
			                   <p class="shop_wd_list_span2">￥${detail.price} &nbsp;&nbsp;<span>x ${detail.stock }</span></p>
			                   <div class="clear"></div>
		                </c:forEach>
		                <div class="clear"></div>
		                <div class="border_top shop_wd_bk01">
		                   	 共${order.totalStock }件商品   共计:&yen;${order.totalPrice }
		                </div>
		            </li>
            </c:forEach>
        </ul>
    </div>
    <!--未发货结束-->
    <!--待收货开始-->
    <div class="shop_wd_content" style="display: none;">
        <ul>
           <c:forEach items="${orderList2 }" var="order">
		            <li>
		                <span class="shop_wd_list_jg"><a href="javascript:" onclick="trackPro(${order.orderNum})">查看物流</a></span>
		                <c:forEach items="${order.detailList }" var="detail">
			                <a href="javascript:">
			                    <div class="shop_wd_list_img">
			                        <img src="${ASSET_URL }${detail.goods.headImgUrl}">
			                    </div>
			                    <p class="shop_wd_list_p">${detail.goods.name}</p>
			                    <span class="shop_wd_list_span"></span>
			                    <p class="shop_wd_list_span2">￥${detail.price} &nbsp;&nbsp;<span>x ${detail.stock }</span></p>
			                    <div class="clear"></div>
			                </a>
		                </c:forEach>
		                <div class="clear"></div>
		                <div class="border_top shop_wd_bk01">
		                   	  共${order.totalStock }件商品   共计:&yen;${order.totalPrice }
		                </div>
		            </li>
            </c:forEach>
        </ul>
    </div>
    <!--待收货结束-->
    <!--退换货开始-->
    <div class="shop_wd_content" style="display: none;">
        <ul>
            <c:forEach items="${orderList4 }" var="order">
		            <li>
		                <span class="shop_wd_list_jg"><a href="toReturnGoods?orderNum=${order.orderNum }">售前退/换货</a></span>
		                <c:forEach items="${order.detailList }" var="detail">
		                <a href="toReturnGoods?detailId=${detail.id }">
		                    <div class="shop_wd_list_img">
		                        <img src="${ASSET_URL }${detail.goods.headImgUrl}">
		                    </div>
		                    <p class="shop_wd_list_p">${detail.goods.name}</p>
		                    <span class="shop_wd_list_span"></span>
		                    <p class="shop_wd_list_span2">￥${detail.price} &nbsp;&nbsp;<span>x ${detail.stock }</span></p>
		                    <div class="clear"></div>
		                </a>
		                </c:forEach>
		            </li>
            </c:forEach>
        </ul>
    </div>
    <!--退换货结束-->
    <!--已完成开始-->
    <div class="shop_wd_content" style="display: none;">
        <ul>
        	<c:forEach items="${orderList3 }" var="order">
		            <li>
		                <span class="shop_wd_list_jg"></span>
		                <c:forEach items="${order.detailList }" var="detail">
			                <a href="javascript:">
			                    <div class="shop_wd_list_img">
			                        <img src="${ASSET_URL }${detail.goods.headImgUrl}">
			                    </div>
			                    <p class="shop_wd_list_p">${detail.goods.name}</p>
			                    <span class="shop_wd_list_span"></span>
			                    <p class="shop_wd_list_span2">￥${detail.price} &nbsp;&nbsp;<span>x ${detail.stock }</span></p>
			                    <div class="clear"></div>
			                </a>
		                </c:forEach>
		            </li>
            </c:forEach>
        </ul>
    </div>
    <!--已完成结束-->
</div>
<script>
    function orderDetail(orderNum){
    	window.location.href="../order/orderDetail?orderNum="+orderNum;
    }
    function trackPro(orderNum){
    	var url = window.location.href;
            $.ajax({
	            	cache: true,
	                type: "POST",
	                url:"../order/checkTrackPro",
	                data:{orderNum:orderNum},
	                timeout:5000,
	                async: false,
	                error: function(request) {
	//                 	SimMessageAlert("登录失败");
	                },
	                success: function(data) {
	                	if(data==null||data==""){
	                		alert("未获取物流信息");
	                	}else{
	                		var emsCode = data.emsCode;
		                	var emsType = data.emsType;
		                	window.location.href="https://m.kuaidi100.com/index_all.html?type="+emsType+"&postid="+emsCode+"&callbackurl="+url;
	                	}
	                }
	            });
    }
</script>
</body>
</html>
