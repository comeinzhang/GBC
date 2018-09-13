<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page language="java" import="com.tyh.model.ProConfigMap" %>
<%
String codeUrl = ProConfigMap.configMap.get("codeUrl");
String APPID = ProConfigMap.configMap.get("APPID");
String DOMAIN_NAME = ProConfigMap.configMap.get("DOMAIN_NAME");
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String PRO_NAME = ProConfigMap.configMap.get("PRO_NAME");
request.setAttribute("PRO_NAME", PRO_NAME);
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
    <link rel="stylesheet" href="../static/css/jNotify.jquery.css">
    <script type="text/javascript" src="../static/js/jquery.min.js"></script>
	<script type="text/javascript" src="../static/js/jNotify.jquery.js"></script>
	<script type="text/javascript" src="../static/js/jNotify.jquery.js"></script>
	<script type="text/javascript" src="../static/js/layer/layer.js"></script>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/plugs/layer/skin/default/layer.css">
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
		function goBack(){
			location.href='${pageContext.request.contextPath}/user/orderList?flag=NO';
		}
	</script>
  </head>
<body>
<div class="container login1 myct">
	<span class="back" onClick="goBack();"></span>
  	<p>确认订单</p>
	<div class="index_menubtn"></div>
	<div class="index_menu">
		<div class="index_menu_top"></div>
		<ul>
			<li>
	                <a href="index" target="_self">
	                    <i class="index_menu_icon1"></i>
	                    首页
	                </a>
			</li>
            <li><a href="getGoodsCar" target="_self"><i class="index_menu_icon2"></i>购物车</a></li>
            <li><a href="getGoodsStore" target="_self"><i class="index_menu_icon3"></i>收藏夹</a></li>
            <li><a href="../user/mycenter" target="_self"><i class="index_menu_icon4"></i>个人中心</a></li>
		</ul>
	</div>
</div>
<div class="clear"></div>
<div class="container">
	<div class="add_call_pay">
		<c:if test="${!empty addr }">
			<div class="add_call_pay_bg" id="${addr.id }">
	    		<p class="add_call_pay_name">收件人：${addr.name }</p>
	    		<div class="clear"></div>
	        	<p class="add_call_pay_phne">电　话：${addr.phone }</p>
	        	<div class="clear"></div>
	        	<p class="add_call_pay_add">地　址：${addr.addr }</p>
	        </div>
        </c:if>
        <c:if test="${empty addr}">
	    	<div>
	        	<p class="add_call_pay_jadd"><a href="../goods/toCreateAddr?orderIds=${orderIds}">+ 添加收货地址</a></p>
	        </div>
        </c:if>
    </div>
	<div class="content_goods_list">
		<c:forEach items="${detailList }" var="order_detail">
			<div class="xzspgg_sp xzspgg_sp_2">
				<p class="xzspgg_sp_jg">¥ <span class="price">　${order_detail.price }</span><br>×<span class="stock">　${order_detail.stock }</span></p>
				<img src="${ASSET_URL }${order_detail.goods.headImgUrl}" onclick="getGoodsById(${order_detail.goods.id})">
				<h1 onclick="getGoodsById(${order_detail.goods.id})">${order_detail.goods.name }</h1>
 				<p class="xzspgg_sp_hh">邮费:¥<span id="postPrice">${order_detail.goods.postPrice}</span></p>
				<div class="clear"></div>
			</div>
		</c:forEach>
	</div>
    <div class="goods_tj">
    	<c:if test="${PRO_NAME eq 'YHLM'}">
	    	<p class="add_call_pay_bg"><a href="../goods/voucherList?orderIds=${orderIds}" style="display: block;" id="userVoucher" target="_self">使用优惠券
	<!--     	<span class="goods_tj_yhq">有2张优惠券</span> -->
	    	<span class="goods_tj_span">使用</span></a></p>
    	</c:if>
    		<c:forEach items="${userVoucherList }" var="voucher">
    			<p>代金券<span id="selledMoney">${voucher.price}元</span></p>
    		</c:forEach> 
    	<c:if test="${PRO_NAME ne 'KXZ' or (detailList[0].goods.comsType eq 1 and PRO_NAME eq 'KXZ')}">
    		<p><input name="Fruit" id="vBalance" type="checkbox" value="${user.balance}" />
    		使用余额
    		<span id="balance">${user.balance}元</span></p>
    	</c:if>
    	<c:if test="${PRO_NAME eq 'YHLM'}">
    		<p><input name="Fruit" id="vRecharge" type="checkbox" value="${user.rechargeNum==null?0:user.rechargeNum}" />使用惠享分<span id="balance">${user.rechargeNum==null?0:user.rechargeNum}元</span></p>
    	</c:if>
    		<p>商品金额<span id="priceDetail"></span></p>
<!--         <p style="border: none;">运费<span>0</span></p> -->
    </div>
    <div class="return_goods_add mt10 mtb60">
        <div class="return_goods_title border_bottom">备注 </div>
        <div class="comments_4 return_goods_describe">
            <textarea id="comments" name="comments" onfocus="this.value='';" onblur="if(this.value==''){this.value='跨境商品必须填写身份证信息，姓名身份证号码'}">跨境商品必须填写身份证信息，姓名身份证号码
            </textarea>
        </div>
    </div>
	<div class="container goods_settle border_top">
        <div class="goods_settle_hz">
           <p>合计：¥ <span class="totalPrice"></span></p>
        </div>
	        <div class="goods_settle_js2">
	        	确认支付
	        </div>
	        <div class="goods_settle_js2">
	        	等待接单
	        </div>
    </div>
</div>
<script>
	var pro_name = '${PRO_NAME}';
	function getGoodsById(id){
		location.href="../goods/getGoodsById?id="+id;
	}
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
		var orderIds = '${orderIds}';
		var status = '${detailList[0].status}'
		var totalStock=0;
		var totalPrice='${totalPrice}';
		var appId='${appId}';
		var timeStamp='${timeStamp}';
		var nonceStr='${nonceStr}';
		var packagestr='${packagestr}';
		var signType='${signType}';
		var paySign='${paySign}';
		var orderNum='${orderNum}';
		var payTotalPrice = '${totalPrice}';
		$(".totalPrice").html(""+totalPrice);
		$("#priceDetail").html("&nbsp;&nbsp;&nbsp;&nbsp;¥"+totalPrice);
		
		var orderTotalPrice='${totalPrice}';
		var voucherId= '${voucherIds}';
		$("#vMoney").change(function() {
			var vPrice = $("#vMoney").val();
			var isno = accAdd(orderTotalPrice,-vPrice);
			if(isno>0){
				var vMoney=0;
				var vav=totalPrice;
				if ($("#vBalance").is(':checked')) {
				    var vBalance = $("#vBalance").val();
				    if(Number(vBalance)>=Number(vav)){
						vav = 0;
					}else{
						vav=accAdd(vav,-vBalance);
					}
				    
				}
				if ($("#vRecharge").is(':checked')) {
					var vBalance = $("#vRecharge").val();
				    if(Number(vBalance)>=Number(vav)){
						vav = 0;
					}else{
						vav=accAdd(vav,-vBalance);
					}
				}
				//if ($("#vMoney").is(':checked')) {
				//    vMoney = $(this).val();
				//    if(Number(vMoney)>=Number(vav)){
				//		vav = 0;
				//	}else{
				//		vav=accAdd(vav,-vMoney);
				//	}
				//    voucherId = $("#voucher").val();
				//}else{
				//	voucherId="";
				//}
				$(".totalPrice").html(""+vav);
				$("#priceDetail").html("&nbsp;&nbsp;&nbsp;&nbsp;¥"+vav);
			}else{
				document.getElementById("vMoney").checked = false;
				alert("该代金券不允许被使用");
			}
		});
		$("#vBalance").change(function() {
			if(pro_name=="YHLM"){
				document.getElementById("vRecharge").checked = false;
			}
			var vBalance=0;
			var  vav=totalPrice;
			//if ($("#vMoney").is(':checked')) {
			//	var vPrice = $("#vMoney").val();
			//	vav = accAdd(vav,-vPrice);
			//}
			if ($("#vBalance").is(':checked')) {
			    vBalance = $(this).val();
			    if(Number(vBalance)>=Number(vav)){
					vav = 0;
				}else{
					vav=accAdd(vav,-vBalance);
				}
			}
			$(".totalPrice").html(""+vav);
			$("#priceDetail").html("&nbsp;&nbsp;&nbsp;&nbsp;¥"+vav);
		});
		$("#vRecharge").change(function() {
			if(pro_name=="YHLM"){
				document.getElementById("vBalance").checked = false;
			}
			var vBalance=0;
			var vav=totalPrice;
			//if ($("#vMoney").is(':checked')) {
			//	var vPrice = $("#vMoney").val();
			//	vav = accAdd(vav,-vPrice);
			//}
			if ($("#vRecharge").is(':checked')) {
			    vBalance = $(this).val();
			    if(Number(vBalance)>=Number(vav)){
					vav = 0;
				}else{
					vav=accAdd(vav,-vBalance);
				}
			}
			$(".totalPrice").html(""+vav);
			$("#priceDetail").html("&nbsp;&nbsp;&nbsp;&nbsp;¥"+vav);
		});
		//付款
		$(".goods_settle_js2").click(function(){
			//$(".goods_settle_js2").css('display','none');
			var addr = '${addr}';
			if(addr==null||addr==""||addr==undefined){
				alert("请填写收货地址");
				//$(".goods_settle_js2").css('display','block');
				return false;
			}
			if(status=='6'){
				alert("等待接单！");
				window.location.href="../user/mycenter";
			}else{
					var comm = $('#comments').val().trim();
					if((comm!="跨境商品必须填写身份证信息，姓名身份证号码"&&comm!=""&&comm!=null)){
						var data={comments:comm,orderIds:orderIds};
						$.ajax({
			                cache: true,
			                type: "POST",
			                url:"addComments",
			                data:data,
			                timeout:5000,
			                async: false,
			                error: function(request) {
			//                 	SimMessageAlert("登录失败");
			                },
			                success: function(data) {
			                }
			            });
					}
						var payWay = 1;
						totalPrice = $(".totalPrice").text();
						if ($("#vRecharge").is(':checked')) {
						    payWay = 4;
						    if(totalPrice>0){
						    	alert("惠享分不足");
						    	//$(".goods_settle_js2").css('display','block');
						    	return false;
						    }
						}
						if ($("#vBalance").is(':checked')) {
							payWay = 3;
							if(totalPrice>0){
								alert("余额不足");
								//$(".goods_settle_js2").css('display','block');
								return false;
						    }
						}
						if(payWay!=1&&totalPrice==0&&pro_name!="KXZ"){
							var checkPwd2 = false;
							layer.prompt({title: '请输入二级密码', formType: 1}, function(pwd2, index){
					  			$.ajax({
					                cache: true,
					                type: "POST",
					                url:"../user/login2",
					                data:{pwd2:pwd2},
					                async: true,
					                error: function(request) {
					                    alert("Connection error");
					                },
					                success: function(data) {
					                	  var state = data.state;
								       	  if(state=="200"){
								       		var payWay = 1;
											if ($("#vRecharge").is(':checked')) {
											    payWay = 4;
											}
											if ($("#vBalance").is(':checked')) {
												payWay = 3;
											}
								       		layer.close(index);  
								       		var data={orderIds:orderIds,payWay:payWay,voucherId:voucherId,payTotalPrice:payTotalPrice};
											$.ajax({
								                cache: true,
								                type: "POST",
								                url:"updateBalance",
								                data:data,
								                timeout:5000,
								                async: false,
								                error: function(request) {
								//                 	SimMessageAlert("登录失败");
								                },
								                success: function(data) {
								                	if(data=="fail"){
								                		alert("余额或惠享分不足");
								                		//$(".goods_settle_js2").css('display','block');
								                	}else if(data=="200"){
								                		alert("该订单已经支付");
								                	}else if(data=="300"){
								                		alert("该代金券已经被使用或已过期");
								                	}else{
								                		window.location.href="../user/mycenter";
								                	}
								                }
								            });
										  }else if(state=="500"){
										  	  alert("二级密码错误！");
										  }
					                }
					            }); 
							});
						}else{
							payTotalPrice = '${totalPrice}';
							var realPrice = accMul(totalPrice,100);
							var state = realPrice+"CUT"+orderIds+"CUT"+voucherId;
		 					window.location.href='https://open.weixin.qq.com/connect/oauth2/authorize?appid='+'<%=APPID%>'+'&redirect_uri=http://'+'<%=DOMAIN_NAME%>'+'/order/getWxOpenId&response_type=code&scope=snsapi_userinfo&state='+state+'#wechat_redirect';
				 	   }	
				}
				
		});
		
		$(".index_menubtn").click(function(){
			$(".index_menu").stop().fadeToggle('flow');
		});
		$(".add_call_pay .add_call_pay_bg").click(function(){
			window.location.href="../goods/userAddrList?orderIds="+orderIds;
		});
	});
</script>
</body>
</html>
