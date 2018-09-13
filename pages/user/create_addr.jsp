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
    <title>新增地址</title>
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script type="text/javascript">
		function saveAddr(){
			var name = $("input[name='name']").val().trim();
			if(name==null||name==""||name.length<=0){
				jNotify("姓名不能为空！",{ShowOverlay : false});
				return;
			}else if(name.length>10){
				jNotify("长度不能超过10个字！",{ShowOverlay : false});
				return;
			}
			
			var phone = $("input[name='phone']").val().trim();
			var myphreg = /^\+?[1-9][0-9]*$/;
			if(phone==null||phone==""|| phone.length<11 || !myphreg.test(phone) ){
				jNotify("请输入有效手机号！",{ShowOverlay : false});
				return;
			}

			var s_city = $("#s_city").val().trim();
			if(s_city==null||s_city==""||s_city.length<=0){
				jNotify("所在地区不能为空！",{ShowOverlay : false});
				return;
			}
			
			var addrdetail = $("input[name='addrdetail']").val().trim();
			if(addrdetail==null||addrdetail==""||addrdetail.length<=0){
				jNotify("详细地址不能为空！",{ShowOverlay : false});
				return;
			}else if(addrdetail.length>100){
				jNotify("详细地址长度不能超过100个字！",{ShowOverlay : false});
				return;
			}

			
			var addrdetail=$("#addrdetail").val().trim();
			var addr=s_city+" "+addrdetail;
			$("input[name='addr']").val(addr);
			
			var flag = $("input[name='flag']").val();
			
			$("#addrForm").submit();
		}
	</script>
</head>
<body>
<div class="container myct">
	<span class="back" onClick="javascript :history.back(-1);"></span>
  	<p>我的收货地址</p>
</div>
<div class="container">
	<div class="registered">
		<form action="saveAddr" name="addrForm" id="addrForm" method="post">
   		<p>姓　　名 : <input type="text" name="name" value="${addr.name }" placeholder="请输你的名字" maxlength="10"></p>
    	<p>手　　机 : <input type="text" name="phone" value="${addr.phone }" placeholder="如13882113500" maxlength="11"></p>
        <p>所在地区 : <input type="text" readonly="readonly" name="s_city" id="s_city" value="${fn:split(addr.addr,' ')[0]}"></p>   		
        <p>详细地址 : <input type="text" name="addrdetail" id="addrdetail" value="${fn:split(addr.addr,' ')[1]}"></p>
        <input type="hidden" name="addr"/>
        <input type="hidden" name="flag" value="${addr.flag }"/>
        <input type="hidden" name="del" value="0"/>
        <input type="hidden" name="id" value="${addr.id }"/>
        <input type="hidden" name="orderIds" id="orderIds" value="${orderIds}"/>
   		</form>
    </div>

    <div class="address_szmr">
    	<c:if test="${empty addr}">
    	<span class="address_szmr1">设置为默认地址</span>	
    	</c:if>
    	<p class="registered_zc address_gl" onclick="saveAddr();">保存</p>
    </div>
</div>
<script>
	$(document).ready(function(){
		$(".address_szmr span").click(function(){
			var ca = $(this).attr("class");
			if( ca == "address_szmr1"){
				$(this).addClass("address_szmr2").removeClass("address_szmr1")
				$("input[name='flag']").val(1);
			}if( ca == "address_szmr2"){
				$(this).addClass("address_szmr1").removeClass("address_szmr2")
				$("input[name='flag']").val(0);
			}
		});
	});
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
