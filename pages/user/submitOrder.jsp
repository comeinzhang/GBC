<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page language="java" import="com.tyh.model.ProConfigMap" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String gatherFee = ProConfigMap.configMap.get("gatherFee");
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
    <title>报单</title>
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
</head>
<body>
<div class="container myct">
    <span class="back" onClick="javascript :history.back(-1);"></span>
    <p>报单</p>
</div>
<div class="container">
    <!--店铺头部开始-->
    <form action="" id="shopForm" enctype="multipart/form-data" method="post">
    <!--店铺头部结束-->
    <!--店铺详情开始-->
    <div class="store_info">
<!--         <div class="store_info_score border_top"> -->
<!--             <p>商品评分<span>4.5分</span></p> -->
<!--             <p>服务评分<span>4.5分</span></p> -->
<!--             <p>发货速度<span>4.5分</span></p> -->
<!--         </div> -->
        <div class="store_info_list">
        	<p>商家姓名<span><input style="width: 50%; height: 20px;" readonly="readonly" name="name" value="${user.realName }"/></span></p>
        	<p>买家账号<span><input style="width: 50%; height: 20px;" name="loginName"/></span></p>
            <p>买家姓名<span><input style="width: 50%; height: 20px;" readonly="readonly" name="buyerName"/></span></p>
            <p>购物金额<span><input style="width: 50%; height: 20px;" name="totalPrice" value="0"/></span></p>
            <p>商品货号<span><input style="width: 50%; height: 20px;" name="goodsId" /></span></p>
            <p>商品分类<span><input style="width: 50%; height: 20px;" readonly="readonly" name="catalogName"/></span></p>
            <p>商品名称<span><input style="width: 50%; height: 20px;" name="goodsName"/></span></p>
            <p>商品数量<span><input style="width: 50%; height: 20px;" id="stock" name="stock" value="1"/></span></p>
            <p>支付方式<span>
				<select name="payWay" id="payWay">
					<option value="1">现金支付</option>
					<option value="2">惠享分支付</option>
				</select>
			</span></p>
            <p>平台服务费<span><input style="width: 50%; height: 20px;" readonly="readonly" name="servicePrice" value="0"/></span></p>
<!--             <p>商家电话<span>${shop.user.phone }</span></p> -->
<!--             <p style="border: none;">开店时间<span>${shop.createTime}</span></p> -->
        </div>
    </div>
    <div class="withdraw_cash_btn">
            <a href="javascript:" onclick="save();" id="save" target="_self" >保存</a>
    </div>
    </form>
    <!--店铺详情结束-->
</div>
<script>
	function accMul(arg1,arg2)
	{
		var m=0,s1=arg1.toString(),s2=arg2.toString();
		try{m+=s1.split(".")[1].length}catch(e){}
		try{m+=s2.split(".")[1].length}catch(e){}
		return Number(s1.replace(".",""))*Number(s2.replace(".",""))/Math.pow(10,m);
	}
	function accAdd(arg1,arg2){
	    var r1,r2,m;  
	    try{r1=arg1.toString().split(".")[1].length}catch(e){r1=0}  
	    try{r2=arg2.toString().split(".")[1].length}catch(e){r2=0}  
	    m=Math.pow(10,Math.max(r1,r2))  
	    return (arg1*m+arg2*m)/m ;
	}
	 function checkRate(input) {
		　　var re = /^[1-9]+[0-9]*$/; //判断字符串是否为数字 //判断正整数 /^[1-9]+[0-9]*]*$/
		　　var nubmer = document.getElementById(input).value;
		　　if (!re.test(nubmer)) {
		　　　　alert("请输入数字");
		　　　　document.getElementById(input).value = "";
		　　　　return false;
		　　}else{
			 return true;
		　　}
	}
                    $(function(){
                        $("input[name='loginName']").change(function(){
                           var loginName = $("input[name='loginName']").val();
						   $.ajax({
						                cache: true,
						                type: "POST",
						                url:"getUserByLoginName",
						                data:{loginName:loginName},
						                async: false,
						                timeout:10000,
						                error: function(request) {
						                },
						                success: function(data) {
						                	if(data==null||data==""){
						                		jError('获取用户信息失败', {ShowOverlay: false});
						                		$("input[name='buyerName']").val("");
						                		$("input[name='loginName']").val("");
						                	}else{
						                		$("input[name='buyerName']").val(data.realName+"("+data.phone+")");
						                	}
						                }
						            });
                        
						});
						$("input[name='totalPrice']").change(function(){
							var payWay = $("#payWay").val();
							if(payWay==1){
							   var gatherFee = <%=gatherFee%>;
	                           var totalPrice = $("input[name='totalPrice']").val();
	                           if(totalPrice==null||totalPrice==""){
	                    			totalPrice=0;
	                    		}
	                           $("input[name='servicePrice']").val(accMul(gatherFee,totalPrice));
							}else{
								$("input[name='servicePrice']").val(0);
							}
						});
						$("#payWay").change(function(){
							var payWay = $(this).children('option:selected').val();
							if(payWay==1){
								var totalPrice = $("input[name='totalPrice']").val();
	                    		if(totalPrice!=null&&totalPrice!=""){
	                    			var gatherFee = <%=gatherFee%>;
	                    			$("input[name='servicePrice']").val(accMul(gatherFee,totalPrice));
	                    		}
							}else{
								$("input[name='servicePrice']").val(0);
							}
							
						});
						$("input[name='goodsId']").change(function(){
                           var goodsId = $("input[name='goodsId']").val();
						   $.ajax({
						                cache: true,
						                type: "POST",
						                url:"getGoodsById",
						                data:{goodsId:goodsId},
						                async: false,
						                timeout:10000,
						                error: function(request) {
						                },
						                success: function(data) {
						                	if(data==null||data==""){
						                		jError('获取商品信息失败', {ShowOverlay: false});
						                		$("input[name='goodsId']").val("");
						                		$("input[name='catalogName']").val("");
						                		$("input[name='goodsName']").val("");
						                	}else{
						                		$("input[name='catalogName']").val(data.catalogName);
						                		$("input[name='goodsName']").val(data.name);
						                	}
						                }
						            });
                        
						});
                    });
					function save(){
                		var loginName = $("input[name='loginName']").val();
                		if(loginName==null||loginName==""){
                			alert("买家账号不能为空");
                			return false;
                		}
                		var goodsName = $("input[name='goodsName']").val();
                		if(goodsName==null||goodsName==""){
                			alert("商品名称不能为空");
                			return false;
                		}
                		var totalPrice = $("input[name='totalPrice']").val();
                		if(totalPrice==null||totalPrice==""){
                			alert("购物金额不能为空");
                			return false;
                		}
                		if(accAdd(totalPrice,-0)<=0){
                        	alert("金额必须大于0！");
                        	return false;
                        }
                		var payWay = $("#payWay").val();
                		var servicePrice = $("input[name='servicePrice']").val();
						//if(payWay==1){
                    	//	var balance = ${user.balance};
                    	//	if(accAdd(servicePrice,-balance)>0){
                    	//		alert("账号余额不足支付服务费,请充值！");
                    	//		return false;
                    	//	}
						//}
                		var goodsId = $("input[name='goodsId']").val();
                		if(checkRate("stock")){
                			var stock = $("input[name='stock']").val();
                    		if(stock==null||stock==""||stock=="0"){
                    			stock=1;
                    		}
                		}else{
                			return false;
                		}
                		$("#save").removeAttr("onclick");
	                	$("#save").css({'background-color':'gray'});
                		var data = {loginName:loginName,goodsId:goodsId,totalPrice:totalPrice,servicePrice:servicePrice,stock:stock,goodsName:goodsName,payWay:payWay};
								 $.ajax({
					                cache: true,
					                type: "POST",
					                url:"submitOrder",
					                data:data,
					                async: false,
					                timeout:10000,
					                beforeSend:function(XMLHttpRequest){
					                	$("#save").removeAttr("onclick");
					                	$("#save").css({'background-color':'gray'});
					                	//努力加载
					                },
					                error: function(request) {
					                    //alert("Connection error");
					                },
					                complete:function(){
					                	$("#save").attr("onclick","save();");
					                	$("#save").css({'background-color':'#c40000'});
					                },
					                success: function(data) {
					                	data = parseInt(data)
					                	if(data==2){
					                		alert("账号余额不足支付服务费,请充值！");
					                	}else if(data==3){
					                		alert("金额必须大于0！");
					                	}else{
						                	alert("保存成功");
						                	location.href="mycenter";
					                	}
					                }
					            });
//                     	$("#shopForm").submit();
                    }
 </script>
</body>
</html>
