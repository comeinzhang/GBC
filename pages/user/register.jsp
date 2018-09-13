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
    <span class="back-btn" onclick="javascript :history.back(-1);"></span>
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
                <p class="p2"><input type="text" name="referCode" value="${referCode}" placeholder="推荐码" readonly="readonly"></p>
            </div>
            <div class="row">
                <p class="p2"><input type="text" name="nickName" placeholder="请输入昵称"></p>
            </div>
            <div class="row">
                <p class="p2"><input type="password" name="pwd" placeholder="请输入登录密码"></p>
            </div>
            <div class="row">
                <p class="p2"><input type="password" name="pwd2" placeholder="请输入交易密码"></p>
            </div>
            <div class="row-ghxy active">
                <i class="iconfont icon-xuanzekuang1"></i>注册即同意<a href="aboutRRHX" target="_self">《平台协议》</a>
            </div>
            <div class="login-btn">
                <p class="button registered_zc">注册</p>
            </div>
        </div>
    </div>
<script>
    $(function(){
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
				       url:"postCode",
				       data:{phone:phone},
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
				alert("请输入登录密码");
		  		return false;
			}
        	
        	var newPwd2 = $('input[name="pwd2"]').val().trim();
        	if (newPwd2 == "" || newPwd2.length == 0) {
				alert("请输入交易密码");
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
			
			var referCode = $('input[name="referCode"]').val().trim();
			if (referCode == "" || referCode.length == 0) {
				alert("请输入推荐码");
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
			       url:"register",
			       data:{phone:phone,checkCode:checkCode,pwd:newPwd,pwd2:newPwd2,nickName:nickName,referCode:referCode},
			       timeout:5000,
			       async: false,
			       beforeSend:function(XMLHttpRequest){
			       },
			       success: function (data){
			       	  data = parseInt(data);
			       	  if(data==1){
						  alert("注册成功");
						  location.href="https://fir.im/gslcbeta";
					  }else if(data==2){
					  	  alert("验证码错误！");
					  }else if(data==3){
					  	  alert("该手机已经被注册！");
					  }else if(data==4){
					  	  alert("推荐码不能为空");
					  }else if(data==5){
					  	  alert("推荐码错误");
					  }else if(data==6){
					  	  alert("注册失败");
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
