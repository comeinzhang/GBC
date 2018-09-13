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
    <script type="text/javascript" src="../static/js/jquery.min.js"></script>
	<script src="http://res.wx.qq.com/open/js/jweixin-1.0.0.js"
	type="text/javascript" charset="utf-8"></script>
    <title>支付</title>
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
</head>
<body>
<div class="myct">
	<span class="back" onClick="javascript :history.back(-1);"></span>
  	<p>订单支付</p>
	<div class="index_menubtn"></div>
	<div class="index_menu">
		<div class="index_menu_top"></div>
		<ul>
			<li><a href="../goods/index?flag=yph" target="_self"><i class="index_menu_icon1"></i>首页</a></li>
            <li><a href="../goods/getGoodsCar" target="_self"><i class="index_menu_icon2"></i>购物车</a></li>
            <li><a href="../goods/getGoodsStore" target="_self"><i class="index_menu_icon3"></i>收藏夹</a></li>
            <li><a href="../user/mycenter" target="_self"><i class="index_menu_icon4"></i>个人中心</a></li>
		</ul>
	</div>
</div>
<div class="clear"></div>
<div class="container playokbox">
    <div id="payStatus" class="">
         
     </div>
   <div class="playokinfo" style="display: none;">
       <p class="playokbox_ok">支付成功</p>
       <p class="playokbox_q">实付款：<span>¥${totalPrice }</span></p>
       <p class="playokbox_d">收货地址：${addr.addr }</p>
       <ul>
           <li><a href="../user/orderList?flag=NOEMS">查看详情</a></li>
           <li><a href="../goods/index?flag=yph">返回首页</a></li>
       </ul>
   </div>
</div>
<script>
			$(document).ready(function(){
		        $(".index_menubtn").click(function(){
		            $(".index_menu").stop().fadeToggle('flow');
		        });
		    });
			var appId='${appId}';
			var timeStamp='${timeStamp}';
			var nonceStr='${nonceStr}';
			var packagestr='${packagestr}';
			var signType='${signType}';
			var paySign='${paySign}';
			var orderNum = '${orderNum}';
			var balance = '${balance}';
		function onBridgeReady(){
		    WeixinJSBridge.invoke(
		        'getBrandWCPayRequest', {
		            "appId":appId,     //公众号名称，由商户传入     
		            "timeStamp":timeStamp,         //时间戳，自1970年以来的秒数     
		            "nonceStr": nonceStr, //随机串     
		            "package":packagestr,     
		            "signType":signType,         //微信签名方式：     
		            "paySign": paySign //微信签名 
		        },
		        function(res){
		            if(res.err_msg == "get_brand_wcpay_request:ok" ) {
		            	$("#payStatus").addClass("play_state");
	                	$(".playokinfo").show();
		            }else{
		            	$("#payStatus").addClass("play_state_2");
		            	//if(balance>0){
						//	var data={balance:balance,orderIds:orderNum};
						//	$.ajax({
				        //        cache: true,
				        //        type: "POST",
				        //        url:"../goods/addUserBalance",
				        //        data:data,
				        //        timeout:5000,
				        //        async: false,
				        //        error: function(request) {
				        //         	alert("登录失败");
				        //        },
				        //        success: function(data) {
				        //        }
				        //    });
						//}
	                	alert("支付失败");
		            }
		        }
		    ); 
		 }
		 if (typeof WeixinJSBridge == "undefined"){
		    if( document.addEventListener ){
		        document.addEventListener('WeixinJSBridgeReady', onBridgeReady, false);
		    }else if (document.attachEvent){
		        document.attachEvent('WeixinJSBridgeReady', onBridgeReady); 
		        document.attachEvent('onWeixinJSBridgeReady', onBridgeReady);
		    }
		 }else{
		    onBridgeReady();
		 } 
</script>
</body>
</html>
