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
    <script type="text/javascript" src="../static/js/json2-min.js"></script>
    <script type="text/javascript" src="../static/js/QryUrlStrParam.js"></script>
    <script type="text/javascript" src="../static/js/QxPublic.js"></script>
    <script type="text/javascript" src="../static/js/jquery.min.js"></script>
	<link rel="stylesheet" href="../static/css/jNotify.jquery.css">
	<script type="text/javascript" src="../static/js/jNotify.jquery.js"></script>
    <title>收货地址</title>
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
</head>
<body>
<div class="container login1 myct">
<%--	<span class="back" onClick="goBack();"></span>--%>
	<span class="back" onClick="javascript :history.back(-1);"></span>
  	<p>我的收货地址</p>
    <div class="index_menubtn"></div>
    <div class="index_menu">
        <div class="index_menu_top"></div>
        <ul>
            <li>
	                <a href="../goods/index" target="_self">
	                    <i class="index_menu_icon1"></i>
	                    首页
	                </a>
			</li>
            <li><a href="../goods/getGoodsCar" target="_self"><i class="index_menu_icon2"></i>购物车</a></li>
            <li><a href="../goods/getGoodsStore" target="_self"><i class="index_menu_icon3"></i>收藏夹</a></li>
            <li><a href="mycenter" target="_self"><i class="index_menu_icon4"></i>个人中心</a></li>
        </ul>
    </div>
</div>
<div class="container">
	<div class="address">
    	<ul>
    		<c:forEach items="${addrList}" var="addr">
	        	<li class="add_call_pay" id="${addr.id}">
	            	<div class="address_slandl">
	                	<p <c:if test="${addr.flag eq 1}">class="address_slandl_p"</c:if> >设置为默认地址</p>
	                    <span>删除</span>
	                </div>
	                <div class="add_call_pay_bg" onclick="updateAddr(${addr.id})">
		                <p class="add_call_pay_name">收件人：${addr.name }</p>
		                <div class="clear"></div>
		                <p class="add_call_pay_phne">电　话：${addr.phone }</p>
		                <div class="clear"></div>
		                <p class="add_call_pay_add">地　址：${addr.addr }</p>
	                </div>
	                <div class=" clear"></div>
	            </li>
            </c:forEach>
        </ul>
        <div class=" clear"></div>
        <p class="registered_zc address_gl"><a href="toCreateAddr?orderIds=${orderIds}">+ 新增收货地址</a></p>
    </div>
</div>

<script>
	var orderNum = '${orderNum}';
	function updateAddr(id){
		location.href="toUpdateAddr?id="+id+"&orderIds="+orderIds;
	}
	function goBack(){
		if(orderNum==""||orderNum==null){
			window.location.href="mycenter";
		}else {
			window.location.href="../goods/userAddrList?orderIds="+orderIds;
		}
	}
    $(function(){
    	 $(".index_menubtn").click(function(){
            $(".index_menu").stop().fadeToggle('flow');
        });
    	$(".address_slandl p").click(function(){
            $(".address_slandl p").removeClass("address_slandl_p");
            $(this).addClass("address_slandl_p");
            var id = $(this).parents("li").attr("id");
			$.ajax({
			       cache: true,
			       type: "POST",
			       url:"editAddr",
			       data:{id:id,param:'flag'},
			       timeout:5000,
			       async: false,
			       beforeSend:function(XMLHttpRequest){
			       },
			       success: function (data){
			       	  
			       },
			       error: function () {
			         jNotify("服务器或者网络错误",{ShowOverlay : false});
			       }
			});
        });
        $(".address_slandl span").click(function(){
            var id = $(this).parents("li").attr("id");
            var flag = false;
			$.ajax({
			       cache: true,
			       type: "POST",
			       url:"editAddr",
			       data:{id:id,param:'del'},
			       timeout:5000,
			       async: false,
			       beforeSend:function(XMLHttpRequest){
			       },
			       success: function (data){
			       	  flag = true;
			       },
			       error: function () {
			         jNotify("服务器或者网络错误",{ShowOverlay : false});
			       }
			});
			if(flag){
				$(this).parents("li").remove();
			}
        });
    });
</script>
</body>
</html>
