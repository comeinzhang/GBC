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
    <script type="text/javascript" src="../static/js/pingpp.js"></script>
    <title>支付</title>
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script type="text/javascript">
		var order_num = '${order.orderNum}';
		var totalPrice = '${order.totalPrice}';
		
			var appId='${appId}';
			var timeStamp='${timeStamp}';
			var nonceStr='${nonceStr}';
			var packagestr='${packagestr}';
			var signType='${signType}';
			var paySign='${paySign}';
			var orderNum='${orderNum}';
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
		            	var data={orderNum:orderNum};
		            	layer.alert('お支払い済みです。', {
	                		  closeBtn: 0
	                		}, function(){
	                		if(flag=="travel"){
	                			window.location.href="http://www.annjyuu.com/mobile/travelOrder/travelOrderList";
	                		}else if(flag=="hotel"){
	                			window.location.href="http://www.annjyuu.com/mobile/hotelOrder/toOrderList";
	                		}
	                	});
		            }else{
		            	layer.alert('オンライン支払時で決済失敗です。', {
	                		closeBtn: 0
	                	}, function(){
	                		if(flag=="travel"){
	                			window.location.href="http://www.annjyuu.com/mobile/travelOrder/travelOrderList";
	                		}else if(flag=="hotel"){
	                			window.location.href="http://www.annjyuu.com/mobile/hotelOrder/toOrderList";
	                		}
	                	});
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
		var state = "1CUT"+order_num;
		function pay(){
			var user = '${sessionScope.user}';
	     	if(user==null||user==""){
				window.location.href="https://open.weixin.qq.com/connect/oauth2/authorize?appid=wxf54168799d0ad4fd&redirect_uri=http://www.annjyuu.com/pay/getWxOpenId&response_type=code&scope=snsapi_userinfo&state="+state+"#wechat_redirect";
	     	}else{
			var data={state:state};
			$.ajax({
				type : "post",
				async : false,  //同步请求
				url : "pay",
				timeout:5000,
				data:data,
				success:function(dates){
					 appId=dates.appId;
					 timeStamp=dates.timeStamp;
					 nonceStr=dates.nonceStr;
					 packagestr=dates.packagestr;
					 signType=dates.signType;
					 paySign=dates.paySign;
					 orderNum=dates.orderNum;
				},
				error: function() {
		        }
			});
		  }
		}
		
	</script>
</head>
<body>
<div class="myct">
	<span class="back" onClick="javascript :history.back(-1);"></span>
  	<p>特优惠收银台</p>
</div>
<div class="container">
	<div class="goods_yg">* <span class="goods_yg_sl">${order.totalStock }</span>件商品　　　<span class="goods_yg_zg">${order.totalPrice}</span>元</div>
	<ul class="goods_pay">
<!--     	<li class="goods_pay_default"><img src="img/zhifu_11.png" width="50">支付宝支付</li> -->
        <li class="goods_pay_default"><img src="../static/img/zhifu_15.png" width="50">微信支付</li>
<!--         <li><img src="img/zhifu_19.png" width="50">财付通支付</li> -->
<!--         <li><img src="img/zhifu_03.png" width="50">银行卡支付</li> -->
<!--         <li><img src="img/zhifu_03.png" width="50">POS机支付</li> -->
    </ul>

    <div class="clear"></div>
    <div  class="pay_submit">
    	<p onclick="pay()">支付</p>
        <span>*请您及时付款，以便订单尽快处理！</span>
    </div>
</div>
<script>
	$(document).ready(function(){
		$(".goods_pay li").click(function(){
			$(this).addClass("goods_pay_default").siblings().removeClass("goods_pay_default");
		});

	});
</script>
</body>
</html>
