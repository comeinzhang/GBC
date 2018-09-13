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
<div class="container">
	<c:forEach items="${details }" var="detail">
	    <div class="order-details-top pd10">
	        <div class="shop_wd_list_img">
	            <img src="${ASSET_URL }${detail.goods.headImgUrl }">
	        </div>
	        <p class="shop_wd_list_p">${detail.goods.name }</p>
	<!--         <span class="shop_wd_list_span">规格：千足金 8g</span> -->
	        <p class="shop_wd_list_span2">￥${detail.price } &nbsp;&nbsp;<span>x ${detail.stock }</span></p>
	    </div>
    </c:forEach>
    <div class="order-details-content mt10">
        <h1 class="order-details-content6">
        	<c:if test="${return1.type eq 0}">退货</c:if>
        	<c:if test="${return1.type eq 1}">换货</c:if>
        </h1>
        <div class="order-details-content5 border_top pd10">
            <h2>主要信息</h2>
            <c:if test="${return1.type eq 0}">
            <p>退款金额 : <span class="odc1">${return1.rePrice}</span></p>
            </c:if>
            <p>买家账号 : <span>${return1.detail.goods.publisherName }</span></p>
            <p>申请时间 : <span>${return1.createTime }</span></p>
            <p>退款原因 : <span>${return1.applyDesc }</span></p>
<!--             <p>平台确认 : <span>￥1111</span></p> -->
        </div>
    </div>
    <c:if test="${return1.status eq 1 or return1.status eq 2}">
    <div class="order-details-content mt10 mtb60">
    	<h2>买家物流信息</h2>
        <div class="order-details-content5 pd10">
            <p>快递公司 : <span>${return1.buyerEms }</span></p>
            <p>快递单号 : <span>${return1.buyerEmsCode }</span></p>
        </div>
    </div>
    </c:if>
    <c:if test="${return1.status eq 1 and return1.type eq 1}">
    <div class="order-details-content mt10 mtb60">
    	<h2>卖家物流信息</h2>
        <div class="order-details-content5 pd10">
            <p>快递公司 : <span><select id="EMS_TYPE" name="emsType">
	                <option value="shunfeng" <c:if test="${return1.sellerEms eq 'shunfeng'}">selected="selected"</c:if>>顺丰速运</option>
	                <option value="shentong" <c:if test="${return1.sellerEms eq 'shentong'}">selected="selected"</c:if>>申通快递</option>
	                <option value="yuantong" <c:if test="${return1.sellerEms eq 'yuantong'}">selected="selected"</c:if>>圆通快递</option>
	                <option value="zhongtong" <c:if test="${return1.sellerEms eq 'zhongtong'}">selected="selected"</c:if>>中通快递</option>
	                <option value="yunda" <c:if test="${return1.sellerEms eq 'yunda'}">selected="selected"</c:if>>韵达快递</option>
	                <option value="zajisong" <c:if test="${return1.sellerEms eq 'zajisong'}">selected="selected"</c:if>>宅急送快递</option>
	                <option value="tiantian" <c:if test="${return1.sellerEms eq 'tiantian'}">selected="selected"</c:if>>天天快递</option>
	                <option value="ems" <c:if test="${return1.sellerEms eq 'ems'}">selected="selected"</c:if>>EMS快递</option>
	                <option value="emsguoji" <c:if test="${return1.sellerEms eq 'emsguoji'}">selected="selected"</c:if>>EMS国际</option>
            	</select></span></p>
            <p>快递单号 : <span><input type="number" name="emsCode" value="${return1.sellerEmsCode }" placeholder="输入快递单号" ></span></p>
        </div>
    </div>
    </c:if>
    <c:if test="${return1.status eq 1 and return1.type eq 0}">
    <div class="order-details-content mt10 mtb60">
    	<h2>退款信息</h2>
        <div class="order-details-content5 pd10">
            <p>退款金额 : <span><input type="number" name="rePrice" value="${return1.detail.price*return1.detail.stock }"></span></p>
        </div>
    </div>
    </c:if>
    <div class="container order-details-bottom border_top">
    <c:if test="${return1.status eq 0}">
    	<p><a href="updateReturn?flag=agree&returnId=${return1.id }" target="_self">同意</a></p>
    	<p><a href="updateReturn?flag=no&returnId=${return1.id }" target="_self">拒绝</a></p>
    </c:if>
    <c:if test="${return1.status eq 4 and return1.type eq 1}">
    	<p><a href="javascript:" onclick="subForm();" target="_self">确认发货</a></p>
    </c:if>
    <c:if test="${return1.status eq 4 and return1.type eq 0}">
    	<p><a href="updateReturn?flag=re&returnId=${return1.id }" target="_self">确认退款</a></p>
    </c:if>
    </div>
</div>
<script>
	var returnId = '${return1.id}';
    function subForm(){
    	var EMS_CODE = $("input[name=emsCode]").val();
    	if(EMS_CODE==""){
    		alert("请输入快递单号");
    		return false;
    	}
    	var emsType = $('#EMS_TYPE option:selected') .val();
    	location.href="saveEms?returnId="+returnId+"&emsCode="+EMS_CODE+"&emsType="+emsType;
    }
</script>    
</body>
</html>
