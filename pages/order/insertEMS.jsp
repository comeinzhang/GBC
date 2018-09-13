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
    <title>退款/售后详情</title>
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script type="text/javascript">
		var id = '${id}';
		function saveEMS(){
			var EMS = $("#EMS").val();
			var emscode = $("#emscode").val();
			var data = {id:id,EMS:EMS,emscode:emscode};
			$.ajax({
				type : "post",
				async : false,  //同步请求
				url : "saveEMS",
				timeout:5000,
				data:data,
				success:function(dates){
					jSuccess('保存成功');
				},
				error: function() {
					jError('保存失败', {ShowOverlay: false});
		        }
			});
		}
	</script>
</head>
<body>
<!--我的个人中心-->
<div class="container myct">
    <label class="back" onClick="javascript :history.back(-1);"></label>
    <p>退款/售后详情</p>
</div>
<div class="container mt10">
    <div class="refund-box15">
        <div class="refund-box16"><p>物流公司:
            <select id="EMS">
                <option value="shunfeng">顺丰速运</option>
	                <option value="shentong">申通快递</option>
	                <option value="yuantong">圆通快递</option>
	                <option value="zhongtong">中通快递</option>
	                <option value="yunda">韵达快递</option>
	                <option value="zhaijisong">宅急送快递</option>
	                <option value="tiantian">天天快递</option>
	                <option value="ems">EMS快递</option>
	                <option value="huitongkuaidi">百世汇通</option>
	                <option value="youshuwuliu">优速</option>
	                <option value="quanfengkuaidi">全峰</option>
	                <option value="debangwuliu">德邦</option>
	                <option value="guotongkuaidi">国通</option>
	                <option value="jdll">京东冷链</option>
	                <option value="kuaijiesudi">快捷</option>
            </select>
            </p>
        </div>
        <div class="refund-box16"><p>物流单号:<input type=text id="emscode" placeholder="输入物流单号"><p></div>
    </div>
</div>

<div class="container refund-box6 border_top">
    <div class="refund-box13"><a href="javascript:" onclick="saveEMS()" target="_self">确定</a></div>
</div>
</body>
</html>
