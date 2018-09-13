<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page language="java" import="com.tyh.model.ProConfigMap" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String lastPage = (String)request.getSession().getAttribute("lastPage");
if(lastPage==null||"".equals(lastPage)){
	lastPage = "http://"+ProConfigMap.configMap.get("DOMAIN_NAME")+"/user/mycenter?";
}
String logo = ProConfigMap.configMap.get("RESOURECE_URL")+ProConfigMap.configMap.get("webLogo");

System.out.println("lastPageLogin::::::::::::::::::::"+lastPage);
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
    <p class="title">登陆</p>
</div>
    <div class="login-index">
        <div class="user-pic"><img src="<%=logo%>"></div>
        <div class="ip-list">
            <div class="row">
                <p class="p2"><input type="text" name="phone" placeholder="账号"></p>
            </div>
            <div class="row">
                <p class="p2"><input type="password" name="password" placeholder="密码"></p>
            </div>

            <div class="login-btn">
                <p class="button form_p">登陆</p>
                <p class="p2">
                    <a href="toRegister" target="_self">快速注册</a>
                    <a href="toUpdatePwd" target="_self" class="a2">忘记密码?</a>
                </p>
            </div>
        </div>
        <div class="dsfdl">
            <p class="p1">第三方登陆</p>
            <a href="weixinLogin?lastPage=<%=lastPage %>" target="_self"><img src="../static/images/wclogin_03.png"></a>
        </div>
    </div>
<script>
	var flag='${flag}';
    $(function(){
        $(".form_p").on("click",function(){
        	var phone = $('input[name="phone"]').val().trim();
		  	//var myphreg = /^(((13[0-9]{1})|(17[0-9]{1})|(15[0-9]{1})|(18[0-9]{1}))+\d{8})$/;
			if (phone == "" || phone.length == 0) {
				alert("请输入账号");
		  		return false;
			}
			var checkCode = $('input[name="password"]').val().trim();
			if (checkCode == "" || checkCode.length == 0) {
				alert("请输入密码");
		  		return false;
			}
			var flag = false;
			var userId = "";
			$.ajax({
			       cache: true,
			       type: "POST",
			       url:"login",
			       data:{account:phone,pwd:checkCode},
			       timeout:5000,
			       async: false,
			       beforeSend:function(XMLHttpRequest){
			       },
			       success: function (data){
			       	  var state = data.state
			       	  if(state=="200"){
// 						  location.href=data.url;
						  userId = data.user.id;
						  flag=true;
					  }else if(state=="500"){
					  	  alert("账号或密码错误！");
					  }
			       },
			       error: function () {
			       	    var user = '${sessionScope.user}';
			            if(user!=null&&user!=""&&user!=undefined){
			                location.href='<%=lastPage%>';
			            }
// 			         jNotify("服务器或者网络错误",{ShowOverlay : false});
			       }
			});
			if(flag){
				$.cookie("userId", null);
				$.cookie("userId", userId, { expires: 7 });	
				location.href='<%=lastPage%>';
			}
        });
    });
</script>
</body>
</html>
