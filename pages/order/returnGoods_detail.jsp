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
    <script type="text/javascript" src="../static/js/jquery.min.js"></script>
    <title>退款/售后详情</title>
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script type="text/javascript">
		function insertEMS(id){
			window.location.href="insertEMS?id="+id;
		}
		var returnId = '${returns.id}';
		function updateReturn(flag){
			window.location.href="../user/updateReturn?returnId="+returnId+"&flag="+flag;
		}
		function reply(type,returnsId,orderNum){
			window.location.href="returnGoods?returnsId="+returnsId+"&type="+type+"&orderNum="+orderNum;
		}
	</script>
</head>
<body>
<div class="container myct">
    <label class="back" onClick="javascript :history.back(-1);"></label>
    <p>退款/售后详情</p>
</div>
<div class="container mt10">
    <ul class="refund-info">
        <li><label>类型 : </label><span><c:if test="${returns.type eq 0}">退货</c:if><c:if test="${returns.type eq 1}">换货</c:if> </span></li>
        <li><label>订单号 : </label><span> ${returns.orderNum }</span></li>
        <li><label>退货编号 : </label><span> ${returns.orderNum }</span></li>
        <li><label>申请时间 : </label><span> ${returns.createTime }</span></li>
        <c:if test="${returns.type eq 0}">
        <li><label>退款金额 : </label><span> ${returns.rePrice }元</span></li>
        </c:if>
        <li><label>退/换货原因:</label><span> ${returns.applyDesc }</span></li>
        <li><label>审核状态 : </label><span> 
        				<c:choose>
                    		<c:when test="${returns.status eq 0}">
                    			申请中
                    		</c:when>
                    		<c:when test="${returns.status eq 1}">
                    			审核通过
                    		</c:when>
                    		<c:when test="${returns.status eq 2}">
                    			已成功
                    		</c:when>
                    		<c:when test="${returns.status eq 3}">
                    			申请失败
                    		</c:when>
                    		<c:when test="${returns.status eq 4}">
                    			已发货
                    		</c:when>
                    		<c:when test="${returns.status eq 5}">
                    			商家已发货
                    		</c:when>
                    	</c:choose>
        </span></li>
        <c:if test="${returns.status eq 3}">
        	<li><label>审核结果:</label><span> ${returns.checkResult }</span></li>
        </c:if>
    </ul>
</div>
 <div class="container refund-box6 border_top">
     <div class="refund-box13"><a href="checkPro?id=${returns.id}" target="_self">查看进度</a></div>
     <c:if test="${returns.status eq 1}">
     <div class="refund-box14" onclick="insertEMS('${returns.id}')">发货</div>
     </c:if>
     <c:if test="${returns.status eq 2 and returns.type eq 0}">
     <div class="refund-box14">已退款</div>
     </c:if>
     <c:if test="${returns.status eq 5 and returns.type eq 1}">
     <div class="refund-box14" onclick="updateReturn('ch')">已换货</div>
     </c:if>
     <c:if test="${returns.status eq 5 and returns.type eq 1}">
     <div class="refund-box14" onclick="updateReturn('ch')">已换货</div>
     </c:if>
     <c:if test="${returns.status eq 3}">
     <div class="refund-box14" onclick="reply('${type}','${returns.id }','${returns.orderNum}')">重新申请</div>
     </c:if>
 </div>
</body>
</html>
