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
  </head>
<body>
<div class="p-heat">
    <span class="back-btn" onclick="javascript :history.back(-1);"></span>
    <p class="title">订单详情</p>
</div>
<div class="confirm-order-index confirm-order-index2">
    <div class="p-lf">
        <p class="p1">订单号 ${orderNum}</p>
        <p class="p2">
       	 <c:if test="${detail.status eq 8}">待付定金</c:if>
       	 <c:if test="${detail.status eq 0}">待付尾款</c:if>
        </p>
    </div>

    <div class="pingGo">
        <div class="jd-bar">
            <div class="tx clearfix">
                <p class="p3" <c:if test="${detail.status eq 8}">class="p3"</c:if>>付定金</p>
                <p class="p4" <c:if test="${detail.status eq 0}">class="p3"</c:if>>付尾款</p>
                <p class="p5">发货</p>
            </div>
            <div class="jdp">
                <!--进度条-->
                <div class="ttt" <c:if test="${detail.status eq 0}">style="width:50%;"</c:if><c:if test="${detail.status eq 8}">style="width:10%;"</c:if> ></div>
            </div>
            <p class="p6">${detail.goods.endTime}</p>
        </div>
    </div>
    <div class="add-map">
        <a href="javascript:" target="_self">
            <p>${addr.name } ${addr.phone }</p>
            <p><i class="iconfont icon-dizhi"></i> ${addr.addr }</p>
        </a>
    </div>
    <div class="good-info-block">
        <div class="good-box">
            <div class="pic">
                <img src="${ASSET_URL }${detail.goods.headImgUrl}" alt="">
            </div>
            <div class="text">
                <div class="name ellipsis">${detail.goods.name }</div>
<!--                 <div class="msg-gg"> -->
<!--                     <p class="">${order_detail.goods.name }</p> -->
<!--                 </div> -->
                <div class="msg-pn">
                    <p class="price">¥ <span class="price">${detail.price }</span></p>
                    <p class="num"><span class="stock">${detail.stock }</span> 件</p>
                </div>
            </div>
        </div>
        <div class="p-lf">
            <p class="p1">定金 &yen;${detail.goods.cashPrice }/1</p>
            <p class="p2">尾款 &yen;${detail.goods.priceBefore }/1</p>
        </div>
        <div class="p-lf">
            <p class="p1">支付方式</p>
            <p class="p2">在线支付</p>
        </div>
        <div class="p-lf">
            <p class="p1">配送信息</p>
            <p class="p2"></p>
        </div>
        <div class="p-lf p-lf3">
            <p class="p1">商品总额</p>
            <p class="p2"><span class="s1">&yen;</span><span class="s1 s2"></span></p>
        </div>
        <div class="p-lf p-lf4">
            <p class="p1"><i class="iconfont icon-gou"></i>定金 &yen;${detail.goods.cashPrice }</p>
            <p class="p2"><c:if test="${detail.status eq 0}">已付款</c:if><c:if test="${detail.status eq 8}">待付款</c:if></p>
        </div>
        <div class="p-lf p-lf5">
            <p class="p1"><i class="iconfont icon-times"></i>尾款 &yen;${detail.goods.priceBefore }</p>
            <p class="p2"><c:if test="${detail.status eq 8}">未生成</c:if><c:if test="${detail.status eq 0}">待付款</c:if></p>
        </div>
        <div class="p-lf2 p-lf6">
            <p class="p1"></p>
            <div class="p2">
                <p class="p3">实付款<span class="s1">&yen; </span> <span class="s2"></span></p>
                <p>下单时间 ${order.createTime }</p>
            </div>
        </div>
    </div>
    <div class="bottom-btn-c">
        <div class="p3"><a href="tel:4000167117"><i class="iconfont icon-kefu"></i> 联系客服</a></div>
        <div class="p2">
		<c:if test="${detail.status eq 8}">支付定金</c:if>
       	<c:if test="${detail.status eq 0}">支付尾款</c:if>
		</div>
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
	var price = '${detail.price }';
	var endIs = '${endIs}';
	$(".stock").each(function (){
		var stock = $(this).text();
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
			var totalPrice1 = accMul(totalPrice,100);
			var state = totalPrice1+"CUT"+order_id;
			alert("系统升级暂停交易");
			//楷小灶
// 			window.location.href="https://open.weixin.qq.com/connect/oauth2/authorize?appid=wxfa39e69071d8b6cd&redirect_uri=http://m.kxiaozao.com/order/getWxOpenId&response_type=code&scope=snsapi_userinfo&state="+state+"#wechat_redirect";
			//益拍行
// 			window.location.href="https://open.weixin.qq.com/connect/oauth2/authorize?appid=wx466018876ebe70f0&redirect_uri=http://yph.pjsmwp.com/order/getWxOpenId&response_type=code&scope=snsapi_userinfo&state="+state+"#wechat_redirect";
	});
});
</script>
</body>
</html>
