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
  	<p>绑定手机号</p>
</div>
<div class="container">
	<div class="registered">
   		<p>手　机 : <input type="text" name="phone"   placeholder="请输入手机号" ></p>
        <p>验证码 : <input type="text" class="registered_yzm"  name="checkCode"  placeholder="验证码"><input type="button" class="registered_gethpone" value="获取手机验证码" ></p>
    </div>
    <p class="registered_zc">立刻绑定</p>
</div>

<script>
    $(function(){
        $('.registered_gethpone').click(function(){
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
            $.ajax({
			       cache: true,
			       type: "POST",
			       url:"postCode",
			       data:{phone:phone},
			       timeout:5000,
			       async: false,
			       beforeSend:function(XMLHttpRequest){
			       },
			       success: function (data){
					  var resend = setInterval(function(){
			                count--;
			                if (count > 0){
			                    btn.val(count+"秒后可重新获取");
			                    btn.css({"color":"#fff","border":"1px #999 solid","background":"#999","width":"130px"})
			                }else {
			                    clearInterval(resend);
			                    btn.val("重新获取手机验证码").removeAttr('disabled style');
			                }
			            }, 1000);
			            btn.attr('disabled',true).css('cursor','not-allowed');
			       },
			       error: function () {
			         jNotify("服务器或者网络错误",{ShowOverlay : false});
			       }
			});
            
        });
        $(".registered_zc").on("click",function(){
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
			$.ajax({
			       cache: true,
			       type: "POST",
			       url:"bindPhone",
			       data:{phone:phone,checkCode:checkCode},
			       timeout:5000,
			       async: false,
			       beforeSend:function(XMLHttpRequest){
			       },
			       success: function (data){
			       	  data = parseInt(data);
			       	  if(data==1){
						  alert("绑定成功");
						  location.href="jbzl";
					  }else if(data==2){
					  	  alert("验证码错误！");
					  }else if(data==3){
					  	  alert("该手机号已经被绑定或已注册");
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
