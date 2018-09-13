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
    <script type="text/javascript" src="../static/js/jquery.min.js"></script>
	<link rel="stylesheet" href="../static/css/jNotify.jquery.css">
	<script type="text/javascript" src="../static/js/jNotify.jquery.js"></script>
    <title>我的店铺</title>
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
</head>
<body>
<div class="container myct">
    <span class="back" onClick="javascript :history.back(-1);"></span>
    <p>订单详情</p>
</div>
<div class="container mtb60">
	<c:forEach items="${detailList }" var="detail">
	    <div class="order-details-top pd10">
	        <div class="shop_wd_list_img">
	            <img src="${ASSET_URL}${detail.goods.headImgUrl}">
	        </div>
	        <p class="shop_wd_list_p">${detail.goods.name }</p>
	<!--         <span class="shop_wd_list_span">规格：千足金 8g</span> -->
	        <p class="shop_wd_list_span2">￥${detail.price } &nbsp;&nbsp;<span>x ${detail.stock }</span></p>
	    </div>
    </c:forEach>
    <div class="order-details-content mt10">
        <div class="order-details-content1 pd10">
            <p>订单状态 : 待发货</p>
            <span>订单编号 :${order.orderNum } </span>
            <span>下单时间 : ${order.createTime }</span>
<!--             <span>成交店铺 : 爱仕达</span> -->
        </div>
        <div class="order-details-content2 pd10 border_top">
            <p>收件人 : ${addr.name }&nbsp;&nbsp;&nbsp;&nbsp;电话 : ${addr.phone }</p>
            <div>收货地址 : ${addr.addr }</div>
        </div>
        <form action="postGoods" id="postForm">
        <div class="order-details-content3">
        	<input type="hidden" value="${order.orderNum }" name="orderNum"/>
            <p class="border_top">
               	 物流公司
               <select id="EMS_TYPE" name="emsType">
	                <option value="shunfeng">顺丰速运</option>
	                <option value="shentong">申通快递</option>
	                <option value="yuantong">圆通快递</option>
	                <option value="zhongtong">中通快递</option>
	                <option value="yunda">韵达快递</option>
	                <option value="zhaijisong">宅急送快递</option>
	                <option value="tiantian">天天快递</option>
	                <option value="ems">EMS快递</option>
	                <option value="huitongkuaidi">百世汇通</option>
	                <option value="youshuwuliu">优速</option>
	                <option value="quanfengkuaidi">全峰</option>
	                <option value="debangwuliu">德邦</option>
	                <option value="guotongkuaidi">国通</option>
	                <option value="jdll">京东冷链</option>
	                <option value="kuaijiesudi">快捷</option>
            	</select>
            </p>
            <p class="border_top">
                	快递单号
                <input type="number" name="emsCode"  placeholder="输入快递单号" >
            </p>
        </div>
        </form>
        <div class="order-details-content4 border_top pd10">
            <div>实付款<span>${order.totalPrice}</span></div>
        </div>
    </div>
    <div class="container order-details-bottom border_top">
        <p><a href="javascript:" onclick="subForm();">确认发货</a></p>
    </div>
<script>
    function subForm(){
    	var EMS_CODE = $("input[name=emsCode]").val();
    	if(EMS_CODE==""){
    		alert("请输入快递单号");
    		return false;
    	}
    	$("#postForm").submit();
    }
</script>    
</body>
</html>
