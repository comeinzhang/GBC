<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page language="java" import="com.tyh.common.CommonParam" %>
<%@ page language="java" import="com.tyh.model.ProConfigMap" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String logo = ProConfigMap.configMap.get("RESOURECE_URL")+ProConfigMap.configMap.get("webLogo");
%>
<!DOCTYPE HTML >

<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <meta content="yes" name="apple-mobile-web-app-capable" />
    <meta content="black" name="apple-mobile-web-app-status-bar-style" />
    <meta content="telephone=no" name="format-detection" />
    <link rel="stylesheet" href="../static/css/base_yph1.css">
    <link rel="stylesheet" href="../static/css/login.css">
    <link rel="stylesheet" href="../static/iconfonts/icon_url.js">
    <script type="text/javascript" src="../static/js/jquery.min.js"></script>
    <script type="text/javascript" src="../static/js/jquery.cookie.js"></script>
    <script type="text/javascript" src="../static/js/json2-min.js"></script>
    <script type="text/javascript" src="../static/js/QryUrlStrParam.js"></script>
    <script type="text/javascript" src="../static/js/QxPublic.js"></script>
    <script type="text/javascript" src="../static/js/jquery.min.js"></script>
	<link rel="stylesheet" href="../static/css/jNotify.jquery.css">
	<script type="text/javascript" src="../static/js/jNotify.jquery.js"></script>
    <title>登陆</title>
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
</head>
<body ontouchstart>
<div class="p-heat">
    <span class="back-btn" onclick="javascript :history.back(-1);"></span>
    <p class="title">输入二级密码</p>
</div>
    <div class="login-index">
        <div class="user-pic"><img src="<%=logo%>"></div>
        <div class="ip-list">
<%--            <div class="row">--%>
<%--                <p class="p2"><input type="text" name="phone" placeholder="手机号"></p>--%>
<%--            </div>--%>
            <div class="row">
                <p class="p2"><input type="password" name="password" placeholder="输入二级密码"></p>
            </div>

            <div class="login-btn">
                <p class="button form_p">登陆</p>
                <p class="p2">
<%--                    <a href="toRegister" target="_self">快速注册</a>--%>
                    <a href="toUpdatePwd2" target="_self" class="a2">忘记密码?</a>
                </p>
            </div>
        </div>
<%--        <div class="dsfdl">--%>
<%--            <p class="p1">第三方登陆</p>--%>
<%--            <a href="weixinLogin?lastPage=<%=lastPage %>" target="_self"><img src="../static/images/wclogin_03.png"></a>--%>
<%--        </div>--%>
    </div>
<script>
	var url='${url}';
	var type='${type}';
    $(function(){
        $(".form_p").on("click",function(){
			var checkCode = $('input[name="password"]').val().trim();
			if (checkCode == "" || checkCode.length == 0) {
				alert("请输入密码");
		  		return false;
			}
			$.ajax({
			       cache: true,
			       type: "POST",
			       url:"login2",
			       data:{pwd2:checkCode},
			       timeout:5000,
			       async: false,
			       beforeSend:function(XMLHttpRequest){
			       },
			       success: function (data){
			       	  var state = data.state
			       	  if(state=="200"){
						  location.href=url+"?type="+type;
					  }else if(state=="500"){
					  	  alert("密码错误！");
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
