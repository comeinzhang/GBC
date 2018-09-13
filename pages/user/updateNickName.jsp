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
    <title>修改昵称</title>
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
</head>
<body>
<div class="container login1 myct">
	<span class="back" onClick="javascript :history.back(-1);"></span>
  	<p>修改昵称</p>
</div>
<div class="container">
	<div class="registered">
   		<p>昵　称 : <input type="text" name="nickName"   placeholder="请输入新的昵称" ></p>
    </div>
    <p class="registered_zc">修改</p>
</div>

<script>
    $(function(){
        $(".registered_zc").on("click",function(){
			var checkCode = $('input[name="nickName"]').val().trim();
			if (checkCode == "" || checkCode.length == 0) {
				alert("请输入新的昵称");
		  		return false;
			}
			location.href="updateNickName?nickName="+checkCode;
        });
    });
</script>
</body>
</html>
