<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page language="java" import="com.tyh.common.CommonParam" %>
<%@ page language="java" import="com.tyh.model.ProConfigMap" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String lastPage = (String)request.getSession().getAttribute("lastPage");
if(lastPage==null||"".equals(lastPage)){
	lastPage = "http://"+ProConfigMap.configMap.get("DOMAIN_NAME")+"/user/mycenter?";
}
lastPage = lastPage.replace("$", "&");
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
    <link rel="stylesheet" href="../static/css/base-yph.css">
    <link rel="stylesheet" href="../static/css/login-yph.css">
    <link rel="stylesheet" href="../static/iconfonts/icon_url.js">
    <script type="text/javascript" src="../static/js/jquery.min.js"></script>
    <script type="text/javascript" src="../static/js/jquery.cookie.js"></script>
    <script type="text/javascript" src="../static/js/json2-min.js"></script>
    <script type="text/javascript" src="../static/js/QryUrlStrParam.js"></script>
    <script type="text/javascript" src="../static/js/QxPublic.js"></script>
	<link rel="stylesheet" href="../static/css/jNotify.jquery.css">
	<script type="text/javascript" src="../static/js/jNotify.jquery.js"></script>
	<link rel="stylesheet" href="http://at.alicdn.com/t/font_450229_7k0kvgzblzjs8aor.css">
    <title>登陆</title>
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
</head>
<body ontouchstart>
<div class="page-warp">
    <div class="head-bar">
        <div class="t-bar">
            <div class="btn-l">
            	<a href="javaScript:" onClick="javascript :history.back(-1);"><i class="iconfont icon-xiangzuo f21"></i></a>
            </div>
        </div>
    </div>
    <div class="login-index">
        <div class="top-tab">
            <div class="active d1">
                <p class="p1">登陆</p>
                <p class="p2"><img src="../static/images/dl_03.png"></p>
            </div>
            <div class=" d1">
                <p class="p1">注册</p>
                <p class="p2"><img src="../static/images/dl_03.png"></p>
            </div>
        </div>
        <div class="info-box">
            <div class="group-input">
                <div class="item">
                    <input type="text" class="clearIP" name="phone" placeholder="手机号">
                </div>
                <div class="item">
                    <input type="password" class="clearIP" name="password" placeholder="8 ~ 16位密码">
                    <div class="d1"><a href="toUpdatePwd">忘记密码?</a></div>
                </div>
            </div>
            <div class="mg15">
                <div class="button mgt30 login">登陆</div>
            </div>
        </div>
        <div class="info-box none">
            <div class="group-input">
                <div class="item">
                    <input type="text" class="clearIP" name="phone1" placeholder="手机号">
                </div>
                <div class="item">
                    <input type="text" class="clearIP" name="checkCode" placeholder="验证码">
                    <div class="get-yam" id="getMessage">获取验证码</div>
                </div>
                <div class="item">
                    <input type="text" class="clearIP" name="nickName" placeholder="昵称">
                </div>
                <div class="item">
                    <input type="password" class="clearIP" name="pwd" placeholder="8 ~ 16位密码">
                </div>
                <div class="item">
                    <input type="password" class="clearIP" name="pwd2" placeholder="确认密码">
                </div>
            </div>
            <div class="mg15">
                <div class="button mgt30 register">注册</div>
            </div>
        </div>
        <div class="dsfdl">
            <p class="p1">第三方登陆</p>
            <a href="weixinLogin?lastPage=<%=lastPage %>" target="_self"><img src="../static/images/dl_16.png"></a>
        </div>
    </div>
</div>
<script>
	var flag='${flag}';
    $(function(){
		$('.top-tab .d1').click(function(){
            $(this).addClass('active').siblings().removeClass('active');
            $('.info-box').hide().eq($(this).index()).show();
        });
		
		$(".login").on("click",function(){
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
        $('#getMessage').click(function(){
        	var btn = $(this);
            var count = 60;
            var phone = $('input[name="phone1"]').val().trim();
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
			if(!btn.hasClass('getIng')){
				var resend = setInterval(function(){
	                count--;
	                if (count > 0){
		                    btn.css({
	                            'color':'#999',
	                            'border':'1px #999 solid'
	                        });
	                        btn.html(count+'重新获取验证码').addClass('getIng');
	                }else {
	                    clearInterval(resend);
                        btn.css({
                            'color':'#c40000',
                            'border':'1px #c40000 solid'
                        });
                        btn.html('重新获取验证码').removeClass('getIng');
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
        $(".register").on("click",function(){
        	var newPwd = $('input[name="pwd"]').val().trim();
        	if (newPwd == "" || newPwd.length == 0) {
				alert("请输入密码");
		  		return false;
			}
        	var newPwd2 = $('input[name="pwd2"]').val().trim();
        	if (newPwd2 == "" || newPwd2.length == 0) {
				alert("请确认密码");
		  		return false;
			}
        	if(newPwd!=newPwd2){
        		alert("两次输入密码不相同");
		  		return false;
        	}
        	var phone = $('input[name="phone1"]').val().trim();
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
			$.ajax({
			       cache: true,
			       type: "POST",
			       url:"register",
			       data:{phone:phone,checkCode:checkCode,pwd:newPwd,nickName:nickName},
			       timeout:5000,
			       async: false,
			       beforeSend:function(XMLHttpRequest){
			       },
			       success: function (data){
			       	  data = parseInt(data);
			       	  if(data==1){
						  alert("注册成功");
						  location.href="toLogin?flag=register";
					  }else if(data==2){
					  	  alert("验证码错误！");
					  }else if(data==3){
					  	  alert("该手机已经被注册！");
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
