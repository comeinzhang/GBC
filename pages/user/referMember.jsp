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
    <link rel="stylesheet" href="../static/css/LArea.min.css">
    <link rel="stylesheet" href="http://at.alicdn.com/t/font_7lcctgn2yw91wcdi.css">
    <script type="text/javascript" src="../static/js/jquery.min.js"></script>
    <script type="text/javascript" src="../static/js/json2-min.js"></script>
    <script type="text/javascript" src="../static/js/QryUrlStrParam.js"></script>
    <script type="text/javascript" src="../static/js/QxPublic.js"></script>
    <script type="text/javascript" src="../static/js/jquery.min.js"></script>
	<link rel="stylesheet" href="../static/css/jNotify.jquery.css">
	<script type="text/javascript" src="../static/js/jNotify.jquery.js"></script>
	<script type="text/javascript" src="../static/js/LAreaData1.js"></script>
    <script type="text/javascript" src="../static/js/LArea.min.js"></script>
    <script type="text/javascript" src="../static/js/province_city.js"></script>
    <title>推荐会员</title>
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
</head>
<body>
<div class="container login1 myct">
	<span class="back" onClick="javascript :history.back(-1);"></span>
  	<p>推荐会员</p>
</div>
<div class="container">
	<form action="" method="post" id="shopForm" enctype="multipart/form-data">
	<input id="txtProCity" name="addr"  type="hidden" />  
	<div class="registered">
    <p>姓　名 : <input type="text" name="realName"   placeholder="请输入姓名" value="${shop.realName }"></p>
    <p>密　码: <input type="password"  name="pwd" value="${shop.account }"  placeholder="请输入密码"></p>
    <p>手　机 : <input type="text" name="phone"   placeholder="请输入手机号"></p>
    <p>所在省: <select id="province" name="province"></select></p>
    <p>所在市: <select id="city" name="city"></select></p>
    <p>所在区: <select id="area" name="area"></select></p>
    </div>
    <p class="registered_zc">保存</p>
    </form>
</div>

<script>
	function IdentityCodeValid(code) { 
		var city={11:"北京",12:"天津",13:"河北",14:"山西",15:"内蒙古",21:"辽宁",22:"吉林",23:"黑龙江 ",31:"上海",32:"江苏",33:"浙江",34:"安徽",35:"福建",36:"江西",37:"山东",41:"河南",42:"湖北 ",43:"湖南",44:"广东",45:"广西",46:"海南",50:"重庆",51:"四川",52:"贵州",53:"云南",54:"西藏 ",61:"陕西",62:"甘肃",63:"青海",64:"宁夏",65:"新疆",71:"台湾",81:"香港",82:"澳门",91:"国外 "};
	var tip = "";
	var pass= true;
	
	 if(!code || !/^\d{6}(18|19|20)?\d{2}(0[1-9]|1[12])(0[1-9]|[12]\d|3[01])\d{3}(\d|X)$/i.test(code)){
//		  tip = "身份证号格式错误";
		pass = false;
	  }
	
	 else if(!city[code.substr(0,2)]){
//		  tip = "身份证号错误";
		pass = false;
	  }
	  else{
	  //18位身份证需要验证最后一位校验位
	if(code.length == 18){
	  code = code.split('');
	  //∑(ai×Wi)(mod 11)
	  //加权因子
	var factor = [ 7, 9, 10, 5, 8, 4, 2, 1, 6, 3, 7, 9, 10, 5, 8, 4, 2 ];
	  //校验位
	var parity = [ 1, 0, 'X', 9, 8, 7, 6, 5, 4, 3, 2 ];
	  var sum = 0;
	  var ai = 0;
	  var wi = 0;
	  for (var i = 0; i < 17; i++)
	  {
	  ai = code[i];
	  wi = factor[i];
	  sum += ai * wi;
	  }
	  var last = parity[sum % 11];
	  if(parity[sum % 11] != code[17]){
//		  tip = "身份证号错误";
	  pass =false;
	  }
	  }
	  }
//		  if(!pass) alert(tip);
	  return pass;
}
    $(function(){
//     	$("#aboutShop").change(function() {
// 			if ($("#aboutShop").is(':checked')) {
// 			    $(".registered_zc").css("background-color","#c40000");
// 			}else{
// 				$(".registered_zc").css("background-color","gray");
// 			}
// 		});
		 $("input[name='loginName']").change(function(){
                           var loginName = $("input[name='loginName']").val();
						   $.ajax({
						                cache: true,
						                type: "POST",
						                url:"getUserByLoginName",
						                data:{loginName:loginName},
						                async: false,
						                timeout:10000,
						                error: function(request) {
						                    layer.alert("Connection error");
						                },
						                success: function(data) {
						                	if(data!=null&&data!=""){
						                		jError('该账号已被注册', {ShowOverlay: false});
						                		$("input[name='loginName']").val("");
						                	}
						                }
						            });
                        
						});
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
			                    btn.val("重新获取验证码").removeAttr('disabled style');
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
        	var pwd = $('input[name="pwd"]').val().trim();
        	if (pwd == "" || pwd.length == 0) {
				alert("请输入密码");
		  		return;
			}
        	var addr = $('input[name="addr"]').val().trim();
        	if (addr == "" || addr.length == 0) {
				alert("请输入所在地区");
		  		return;
			}
        	var phone = $('input[name="phone"]').val().trim();
		  	var myphreg = /^(((13[0-9]{1})|(15[0-9]{1})|(17[0-9]{1})|(18[0-9]{1}))+\d{8})$/;
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
			var realName = $('input[name="realName"]').val().trim();
			if (realName == "" || realName.length == 0) {
				alert("请输入姓名");
		  		return false;
			}
			var formData = new FormData($( "#shopForm" )[0]);
			$.ajax({
			       cache: true,
			       type: "POST",
			       url:"referMember",
			       data:formData,
			       timeout:5000,
			       async: false,
			       processData: false,  // 告诉jQuery不要去处理发送的数据
			       contentType: false,
			       beforeSend:function(XMLHttpRequest){
			       },
			       success: function (data){
			       	  data = parseInt(data);
			       	  if(data==0){
						  jSuccess('推荐成功！', {ShowOverlay: location.href='mycenter'});
					  }else if(data==1){
					  	  jError('该手机号已被使用', {ShowOverlay: false});
					  }else if(data==2){
					  	  jError('该账号已被注册', {ShowOverlay: false});
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