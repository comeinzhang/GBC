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
    <link rel="stylesheet" href="../static/css/jNotify.jquery.css">
    <script type="text/javascript" src="../static/js/jquery.min.js"></script>
	<script type="text/javascript" src="../static/js/jNotify.jquery.js"></script>
	
    <title>订单支付</title>
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script>
		function is_weixn(){  
		    var ua = navigator.userAgent.toLowerCase();  
		    if(ua.match(/MicroMessenger/i)=="micromessenger") {  
		        return true;  
		    } else {  
		        return false;  
		    }  
		}
		if(is_weixn()){
			window.onload=function(){
			  if (location.href.indexOf("&xyz=")<0)
			 {
			 location.href=location.href+"&xyz="+Math.random();
			 }
			}
		}
		function goBack(){
			location.href='${pageContext.request.contextPath}/user/orderList?flag=NO';
		}
	</script>
  </head>
<body>
<div class="myct">
	<span class="back" onClick="javascript :history.back(-1);"></span>
  	<p>使用代金券</p>
</div>
<div class="container">
	<div class="vouchers_top">
<%--		<ul>--%>
<%--			<li class="store_head_2ablockb">可使用代金券</li>--%>
<%--			<li>不可使用代金券</li>--%>
<%--		</ul>--%>
		<div class="clear"></div>
	</div>
	<div class="vouchers_content mt10">
		<c:forEach items="${myvouchers }" var="v">
		<div class="vouchers_content_list" id="${v.id }" >
			<div class="vouchers_select">
				<span></span>
			</div>
			<div class="vouchers_info">
				<p class="vouchers_info_1"><span>金额</span>${v.remainNum}</p>
<%-- 				<p class="vouchers_info_2">使用店铺：范儿珠宝店</p>--%>
				<p class="vouchers_info_2">有效期至：${v.overtime }</p>
			</div>
			<div class="clear"></div>
		</div>
		</c:forEach>
	</div>
	<div class="vouchers_content mt10" style="display: none;">
<!-- 		<div class="vouchers_content_list"> -->
<!-- 			<div class="vouchers_info"> -->
<!-- 				<p class="vouchers_info_1"><span>代金卷</span>满1000减50</p> -->
<!-- 				<p class="vouchers_info_2">使用店铺：范儿珠宝店</p> -->
<!-- 				<p class="vouchers_info_2">有效期至：2015-10-01</p> -->
<!-- 			</div> -->
<!-- 			<div class="clear"></div> -->
<!-- 		</div> -->
	</div>
	<p class="registered_zc">确定</p>
</div>
<script>
	$(document).ready(function(){
		//选项卡
		$(".vouchers_top li").click(function(){
			$(".vouchers_top li").eq($(this).index()).addClass("search_cl").siblings().removeClass("search_cl");
			$(".vouchers_content").hide().eq($(this).index()).show();
		});
		//选择代金券
		var voucherId="";
		$('.vouchers_content_list').click(function(){
			$(this).find(".vouchers_select span").addClass("vouchers_select_1");
			var id = $(this).attr("id");
			if(voucherId==null||voucherId==""){
				voucherId = id;
			}else{
				voucherId = voucherId+"-"+id;
			}
		});
		$('.registered_zc').click(function(){
			window.location.href="clickUserVoucher?voucherIds="+voucherId+"&orderIds=${orderIds}";
		});
	});
</script>
</body>
</html>
