﻿<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
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
    <link rel="stylesheet" href="../static/css/base_yph1.css">
    <link rel="stylesheet" href="../static/css/login.css">
    <link rel="stylesheet" href="../static/iconfonts/icon_url.js">
    <script type="text/javascript" src="../static/js/jquery.min.js"></script>
    <script type="text/javascript" src="../static/js/json2-min.js"></script>
    <script type="text/javascript" src="../static/js/QryUrlStrParam.js"></script>
    <script type="text/javascript" src="../static/js/QxPublic.js"></script>
    <script type="text/javascript" src="../static/js/jquery.min.js"></script>
	<link rel="stylesheet" href="../static/css/jNotify.jquery.css">
	<script type="text/javascript" src="../static/js/jNotify.jquery.js"></script>
    <title>注册</title>
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
</head>
<body>
<div class="p-heat">
    <span></span>
    <p class="title">注册账户</p>
</div>
    <div class="login-index">
        <div class="ip-list">
            <div class="row">
                <span class="s1">+86</span>
                <p class="p1"><input type="text" name="phone" placeholder="11位数手机号码"></p>
                <span id="getMessage"  class="getIng s2">获取验证码</span>
            </div>
            <div class="row">
                <p class="p2"><input type="text" name="checkCode" placeholder="短信验证码"></p>
            </div>
            <div class="row">
                <p class="p2"><input type="password" name="pwd" placeholder="请输入新密码, 至少6位"></p>
            </div>
            <div class="row">
                <p class="p2"><input type="text" name="nickName" placeholder="请输入昵称"></p>
            </div>
            <div class="row-ghxy active">
                <i class="iconfont icon-xuanzekuang1"></i> 登录人人惠享，表示同意人人惠享<a href="../user/aboutRRHX" target="_self">《用户协议》</a>
            </div>
            <div class="login-btn zc">
                <p class="button registered_zc">注册</p>
            </div>
            <div class="login-btn andr" style="display: none;">
                <p class="button" onclick="javascript:window.location.href='${andr.versionUrl}';">下载APP(安卓版)</p>
            </div>
            <div class="login-btn ios" style="display: none;">
                <p class="button" onclick="javascript:window.location.href='${ios.versionUrl}';">下载APP(IOS版)</p>
            </div>
        </div>
    </div>
<script>
    $(function(){
    	var userId = '${userId}';
//     	$('.row-ghxy').click(function(){
//             if($(this).hasClass('active')){
//                 $(this).removeClass('active').find('i').attr('class','iconfont icon-xuanzekuang');
//             }else{
//                 $(this).addClass('active').find('i').attr('class','iconfont icon-xuanzekuang1');
//             }
//         });
        $('.getIng').click(function(){
            var btn = $(this);
            var count = 60;
            var phone = $('input[name="phone"]').val().trim();
		  	var myphreg = /^(((13[0-9]{1})|(17[0-9]{1})|(15[0-9]{1})|(18[0-9]{1}))+\d{8})$/;
			if (phone == "" || phone.length == 0) {
				alert("请输入手机号码");
		  		return false;
			}else{
				 if(!myphreg.test(phone))
		          {
					 alert('请输入有效的手机号码！');
		               return false;
		         }
			}
			if(btn.hasClass('getIng')){
				var resend = setInterval(function(){
	                count--;
	                if (count > 0){
		                    btn.css({
	                            'color':'#999',
	                            'border':'1px #999 solid'
	                        });
	                        btn.html(count+'重新获取验证码').removeClass('getIng');
	                }else {
	                    clearInterval(resend);
                        btn.css({
                            'color':'#c40000',
                            'border':'1px #c40000 solid'
                        });
                        btn.html('重新获取验证码').addClass('getIng');
	                }
	            }, 1000);
	            $.ajax({
				       cache: true,
				       type: "POST",
				       url:"sendCheckCode",
				       data:{phoneNum:phone},
				       timeout:5000,
				       async: true,
				       beforeSend:function(XMLHttpRequest){
				       },
				       success: function (data){
						  
				       },
				       error: function () {
				         jNotify("服务器或者网络错误",{ShowOverlay : false});
				       }
				});
            }  
        });
        $(".registered_zc").on("click",function(){
        	var newPwd = $('input[name="pwd"]').val().trim();
        	if (newPwd == "" || newPwd.length == 0) {
				alert("请输入密码");
		  		return false;
			}
        	var phone = $('input[name="phone"]').val().trim();
		  	var myphreg = /^(((13[0-9]{1})|(17[0-9]{1})|(15[0-9]{1})|(18[0-9]{1}))+\d{8})$/;
			if (phone == "" || phone.length == 0) {
				alert("请输入手机号码");
		  		return false;
			}else{
				 if(!myphreg.test(phone))
		          {
					 alert('请输入有效的手机号码！');
		               return false;
		         }
			}
			var checkCode = $('input[name="checkCode"]').val().trim();
			if (checkCode == "" || checkCode.length == 0) {
				alert("请输入验证码");
		  		return false;
			}
			var nickName = $('input[name="nickName"]').val().trim();
			if (nickName == "" || nickName.length == 0) {
				alert("请输入昵称");
		  		return false;
			}
			$.ajax({
			       cache: true,
			       type: "POST",
			       url:"regist",
			       data:{phoneNum:phone,checkCode:checkCode,password:newPwd,nickName:nickName,userId:userId},
			       timeout:5000,
			       async: false,
			       beforeSend:function(XMLHttpRequest){
			       },
			       success: function (data){
			       	  if(data.state=="200"){
						 // jSuccess('已取消订单',{ShowOverlay:window.location.href='../user/mycenter'});
						  $(".zc").css('display','none');
						  $(".andr").css('display','block');
						  $(".ios").css('display','block');
						  jSuccess('注册成功，请下载App');
					  }else{
					  	  alert(data.msg);
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
