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
    <!--Safari书签图标-->
    <link rel="apple-touch-icon-precomposed" href="../static/img/bookmark.png"/>
    <script type="text/javascript" src="../static/iconfonts/icon_url.js"></script>
    <link rel="stylesheet" href="../static/css/ycys.css">
    <script type="text/javascript" src="../static/js/jquery.min.js"></script>
	<link rel="stylesheet" href="../static/css/jNotify.jquery.css">
	<script type="text/javascript" src="../static/js/jNotify.jquery.js"></script>
    <link rel="stylesheet" href="../static/css/base_yph1.css">
    <link rel="stylesheet" href="../static/css/style_yph.css">
    <title>众筹</title>
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
<div class="confirm-order-index">
    <div class="p-heat">
        <span class="back-btn" onClick="goBack();"></span>
        <p class="title">确认订单</p>
    </div>
    <div class="add-map">
        <a href="javascript:" target="_self">
            <p>${addr.name } ${addr.phone }</p>
            <p><i class="iconfont icon-dizhi"></i> ${addr.addr }</p>
            <i class="iconfont icon-gengduo1"></i>
        </a>
    </div>
    <div class="good-info-block">
        <div class="good-box">
            <div class="pic">
                <img src="${ASSET_URL }${detailList[0].goods.headImgUrl}" alt="">
            </div>
            <div class="text">
                <div class="name ellipsis">${detailList[0].goods.name }</div>
<!--                 <div class="msg-gg"> -->
<!--                     <p class="">${order_detail.goods.name }</p> -->
<!--                 </div> -->
                <div class="msg-pn">
                    <p class="price">¥ <span class="price">${detailList[0].price }</span></p>
                    <p class="num"><span class="stock">${detailList[0].stock }</span> 件</p>
                </div>
            </div>
        </div>
      <div class="p-lf">
            <p class="p1">定金 &yen;${detailList[0].goods.cashPrice }/1</p>
            <p class="p2">尾款 &yen;${detailList[0].goods.priceBefore }/1</p>
        </div>
        <div class="p-lf2">
            <p class="p1">支付配送</p>
            <div class="p2">
                <p>在线支付</p>
                <p>快递配送</p>
            </div>
        </div>
        <div class="p-lf">
            <p class="p1">尾款通知手机号</p>
            <p class="p2">${addr.phone }</p>
        </div>
        <div class="p-lf">
            <p class="p1">同意支付定金(预售商品订金不退)</p>
            <div class="p2">
                <div class="onoffswitch">
                    <input type="checkbox" name="onoffswitch" class="onoffswitch-checkbox" id="myonoffswitch" checked="checked">
                    <label class="onoffswitch-label" for="myonoffswitch"></label>
                </div>
            </div>
        </div>
        <div class="p-lf">
            <input type="text" name="comments" value="${order.comments }" placeholder="备注: 选填 对商家的留言" class="p-lf-ip">
        </div>
    </div>
    <div class="bottom-btn-c">
        <div class="p1">实付款 <span class="s1">&yen;</span> <span class="s2"></span></div>
        <div class="p2">提交订单</div>
    </div>
</div>
<script type="text/javascript">
function accMul(arg1,arg2)
	{
		var m=0,s1=arg1.toString(),s2=arg2.toString();
		try{m+=s1.split(".")[1].length}catch(e){}
		try{m+=s2.split(".")[1].length}catch(e){}
		return Number(s1.replace(".",""))*Number(s2.replace(".",""))/Math.pow(10,m)
	}
	function accAdd(arg1,arg2){  
	    var r1,r2,m;  
	    try{r1=arg1.toString().split(".")[1].length}catch(e){r1=0}  
	    try{r2=arg2.toString().split(".")[1].length}catch(e){r2=0}  
	    m=Math.pow(10,Math.max(r1,r2))  
	    return (arg1*m+arg2*m)/m  
	}
$(document).ready(function(){
	var order_num = '${orderNum}';
	var order_id = '${order_id}';
	var totalStock=0;
	var totalPrice=0;
	var price = '${detailList[0].price}';
	$(".add-map").click(function(){
			window.location.href="../goods/userAddrList?orderNum="+order_num;
	});
	$(".stock").each(function (){
		var stock = $(this).text();
		totalStock+=Number(stock);
		var val1 =  accMul(stock,price);
		totalPrice=accAdd(val1,totalPrice);
	});
	$(".s2").html(""+totalPrice);
	$(".bottom-btn-c .p2").click(function(){
			var addr = '${addr}';
			if(addr==null||addr==""||addr==undefined){
				alert("请填写收货地址");
				return false;
			}
			var comments = $("input[name=comments]").val();
			window.location.href="../goods/submitOrder?orderNum="+order_num+"&comments="+comments;
	});
});
</script>
</body>
</html>
