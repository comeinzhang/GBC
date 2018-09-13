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
    <title>退款/换货</title>
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
</head>
<body>
<div class="container myct">
    <span class="back" onClick="javascript :history.back(-1);"></span>
    <p>退款/换货</p>
</div>
<div class="container mt10 mtb60">
   <ul class="refund-box mt10">
   	<c:forEach items="${returnList }" var="re">
       <li>
           <a href="getReturnGoodsById?id=${re.id }" target="_self">
               <div class="refund-box1 border_bottom">退款</div>
               <div class="refund-box2 border_bottom">
                    <div class="refund-box3">
                        <div class="refund-box4">
                            <img src="${ASSET_URL }${re.detail.goods.headImgUrl }">
                        </div>
                    </div>
                    <h1>${re.detail.goods.name }</h1>
                    <p>退款金额:&yen;${re.rePrice }</p>
                    <span>
                    	<c:choose>
                    		<c:when test="${re.status eq 0}">
                    			状态:申请中
                    		</c:when>
                    		<c:when test="${re.status eq 1}">
                    			状态:审核通过
                    		</c:when>
                    		<c:when test="${re.status eq 2}">
                    			状态:已成功
                    		</c:when>
                    		<c:when test="${re.status eq 3}">
                    			状态:申请失败
                    		</c:when>
                    		<c:when test="${re.status eq 4}">
                    			状态:买家已发货
                    		</c:when>
                    		<c:when test="${re.status eq 5}">
                    			状态:商家已退款
                    		</c:when>
                    	</c:choose>
                    </span>
                   <div class="clear"></div>
               </div>
               <div class="refund-box5">申请时间:${re.createTime}</div>
           </a>
       </li>
       </c:forEach>
       <c:forEach items="${changeList }" var="ch">
       <li>
           <a href="getReturnGoodsById?id=${ch.id }" target="_self">
               <div class="refund-box1 border_bottom">换货</div>
               <div class="refund-box2 border_bottom">
                    <div class="refund-box3">
                        <div class="refund-box4">
                            <img src="${ASSET_URL }${ch.detail.goods.headImgUrl }">
                        </div>
                    </div>
                    <h1>${ch.detail.goods.name }</h1>
                    <span>
                    	<c:choose>
                    		<c:when test="${ch.status eq 0}">
                    			状态:申请中
                    		</c:when>
                    		<c:when test="${ch.status eq 1}">
                    			状态:审核通过
                    		</c:when>
                    		<c:when test="${ch.status eq 2}">
                    			状态:已成功
                    		</c:when>
                    		<c:when test="${ch.status eq 3}">
                    			状态:申请失败
                    		</c:when>
                    		<c:when test="${ch.status eq 4}">
                    			状态:买家已发货
                    		</c:when>
                    		<c:when test="${ch.status eq 5}">
                    			状态:商家已发货
                    		</c:when>
                    	</c:choose>
                    </span>
                   <div class="clear"></div>
               </div>
               <div class="refund-box5">申请时间:${ch.createTime}</div>
           </a>
       </li>
       </c:forEach>

   </ul>
</div>
</body>
</html>
