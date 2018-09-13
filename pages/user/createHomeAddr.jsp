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
    <link rel="stylesheet" href="../static/css/jNotify.jquery.css">
    <link rel="stylesheet" href="../static/css/LArea.min.css">
    <script type="text/javascript" src="../static/js/jquery.min.js"></script>
	<script type="text/javascript" src="../static/js/goods_xq.js"></script>
	<script type="text/javascript" src="../static/js/jNotify.jquery.js"></script>
	<script type="text/javascript" src="../static/js/QryUrlStrParam.js"></script>
	<script type="text/javascript" src="../static/js/LAreaData1.js"></script>
    <script type="text/javascript" src="../static/js/LArea.min.js"></script>
    <title>我家小区</title>
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script type="text/javascript">
		function saveAddr(){
			var s_city = $("#s_city").val();
			if(s_city==null||s_city==""||s_city.length<=0){
				jNotify("所在地区不能为空！",{ShowOverlay : false});
				return;
			}
			var addrdetail = $("input[name='town']").val();
			if(addrdetail==null||addrdetail==""||addrdetail.length<=0){
				jNotify("详细地址不能为空！",{ShowOverlay : false});
				return;
			}else if(addrdetail.length>100){
				jNotify("详细地址长度不能超过100个字！",{ShowOverlay : false});
				return;
			}
			$("#addrForm").submit();
		}
	</script>
</head>
<body>
<div class="container myct">
	<span class="back" onClick="javascript :history.back(-1);"></span>
  	<p>我家小区</p>
</div>
<div class="container">
	<div class="registered">
		<form action="saveHomeAddr" name="addrForm" id="addrForm" method="post">
        <p>所在地区 : <input type="text" readonly="readonly" name="area" id="s_city"></p>   		
        <p>详细地址 : <input type="text" name="town" id="addrdetail"></p>
   		</form>
    </div>
    <div class="address_szmr">
    	<p class="registered_zc address_gl" onclick="saveAddr();">保存</p>
    </div>
</div>
<script>
  //城市联动
    var area1 = new LArea();
    area1.init({
        'trigger': '#s_city', //触发选择控件的文本框，同时选择完毕后name属性输出到该位置
        //'valueTo': '#part-time-job', //选择完毕后id属性输出到该位置
        'keys': {
            id: 'id',
            name: 'name'
        }, //绑定数据源相关字段 id对应valueTo的value属性输出 name对应trigger的value属性输出
        'type': 0, //数据源类型
        'data': LAreaData //数据源
    });
</script>
</body>
</html>
