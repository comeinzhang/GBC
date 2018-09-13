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
    <script type="text/javascript" src="../static/js/jquery.min.js"></script>
	<link rel="stylesheet" href="../static/css/jNotify.jquery.css">
	<script type="text/javascript" src="../static/js/jNotify.jquery.js"></script>
    <title>绑定手机</title>
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
</head>
<body>
<div class="container login1 myct">
	<span class="back" onClick="javascript :history.back(-1);"></span>
  	<p>绑定账号</p>
</div>

<!--登陆页面-->
<div class="container">
    <div class="login1_form">
    	<input type="text" class="login1_form_input1" name="phone" value="${user.phone }" placeholder="账号" >
        <input type="password" class="login1_form_input2" name="password" autocomplete="off"  placeholder="请输入密码">
        <div class="clear"></div>
        <p class="form_p">立即绑定</p>
	</div>
</div>

<script>
	var flag = '${flag}';
    $(function(){
        $(".form_p").on("click",function(){
        	var phone = $('input[name="phone"]').val().trim();
			if (phone == "" || phone.length == 0) {
				alert("请输入账号");
		  		return false;
			}
			var checkCode = $('input[name="password"]').val().trim();
			if (checkCode == "" || checkCode.length == 0) {
				alert("请输入密码");
		  		return false;
			}
			$.ajax({
			       cache: true,
			       type: "POST",
			       url:"bindAccount",
			       data:{phone:phone,pwd:checkCode,flag:flag},
			       timeout:5000,
			       async: false,
			       beforeSend:function(XMLHttpRequest){
			       },
			       success: function (data){
			       	  var state = data.state;
			       	  if(state=="200"){
						  alert("绑定成功");
						  location.href=data.url;
					  }else if(state=="500"){
					  	  alert("账号或密码错误！");
					  }
			       },
			       error: function () {
			         jNotify("服务器或者网络错误",{ShowOverlay : false});
			       }
			});
        });
    });
</script>
</body>
</html>
