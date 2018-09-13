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
	<link rel="stylesheet" href="../static/css/jNotify.jquery.css">
	<script type="text/javascript" src="../static/js/jNotify.jquery.js"></script>
	<script type="text/javascript" src="../static/js/jquery.cityselect.js"></script>
    <title>申请提现</title>
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
</head>
<body>
<div class="container myct">
	<span class="back" onClick="javascript :history.back(-1);"></span>
  	<p>添加账号</p>
</div>

<div class="container add_card_num">
	<form action="editBank" id="bankForm">
		<input name="sid" value="${bank.id }" type="hidden" />
		<input name="type" value="${type }" type="hidden" />
	    <p>银行卡 :</p>
	    <span><input type="text" value="${bank.cardCode }" name="cardCode"  placeholder="请输入银行卡卡号" ></p></span>
	    <p>持卡人 :</p>
	    <span><input type="text" value="${bank.bankNam }" name="bankNam" placeholder="请输入银行卡持卡人" ></p></span>
	    <p>开户行 :</p>
	    <select name="bank">
	        <option value="中国银行">中国银行</option>
	        <option value="中国工商银行">中国工商银行</option>
	        <option value="中国建设银行">中国建设银行</option>
	        <option value="中国邮政银行">中国邮政银行</option>
	        <option value="中国农业银行">中国农业银行</option>
	        <option value="中国华夏银行">中国华夏银行</option>
	        <option value="浦发银行">浦发银行</option>
	    </select>
	    <p>银行支行 :</p>
	    <span><input type="text" value="${bank.branch }" name="branch" placeholder="请输入银行支行" ></p></span>
	    <p>省份 :</p>
	    <select class="prov" id="s_city" name="prov">
	    </select>
	    <p>城市 :</p>
	    <select class="city" disabled="disabled" id="s_city" name="city">
	    </select>
    </form>
</div>
<div class="container outLogin">
    <p class="registered_zc">保存</p>
</div>
<script type="text/javascript">
	$(function(){
		$("#bankForm").citySelect({
			nodata:"none",
			required:false,
			prov:"${bank.prov}",
			city:"${bank.city}"
		}); 
	});
	</script>
<script>
	$(".registered_zc").click(function(){
		var cardCode = $("input[name=cardCode]").val();
		var bankNam = $("input[name=bankNam]").val();
		var branch = $("input[name=branch]").val();
		if(cardCode==""){
			alert("请输入银行卡卡号");
			return false;
		}
		if(bankNam==""){
			alert("请输入银行卡开户名");
			return false;
		}
		if(branch==""){
			alert("请输入银行支行");
			return false;
		}
		$("#bankForm").submit();
	});
</script>
</body>
</html>
