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
    <title>147体验申请表</title>
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
</head>
<body>
<div class="container login1 myct">
	<span class="back" onClick="javascript :history.back(-1);"></span>
  	<p>147体验申请表</p>
</div>
<div class="container">
	<form action="" method="post" id="shopForm" enctype="multipart/form-data">
	<input type="hidden" value="2" name="type"/>
	<div class="registered">
   	<p>姓　名 : <input type="text" name="name"   placeholder="请输入姓名"></p>
   	<p>年　龄 : <input type="text" name="age"   placeholder="请输入年龄"></p>
<%--    <p>身份证号: <input type="text" name="idcard"  placeholder="请输入身份证号"></p>--%>
    <p>推荐人: <input type="text"  name="refer"  placeholder="请输入推荐人姓名"></p>
    <p>推荐人手机: <input type="text"  name="referPhone"  placeholder="请输入推荐人手机号"></p>
    <p>收货地址: <input type="text"  name="addr" id="addr"  placeholder="请输入收货地址"></p>
    <p>联系电话: <input type="text" name="phone"   placeholder="请输入联系电话"></p>
    <p>一、感染的原因:（方框内直接打勾）
    <div style="padding: 0 5%;" class="gyyy">
    <div style="width: 50%;float: left; text-align: center;padding-top: 3%;"><span>家人内部</span><input type="checkbox" name="symptom" value="1"></div>
    <div style="width: 50%;float: left; text-align: center;padding-top: 3%;"><span>公共场所</span><input type="checkbox" name="symptom" value="2"></div>
    </div>
    </p>
    <p>二、脚气时长:（方框内直接打勾）
    <div style="padding: 0 5%;" class="jqsc">
    <div style="width: 33%;float: left; text-align: center;padding-top: 3%;"><span> 1年以内</span><input type="checkbox" name="symptom" value="3"></div>
    <div style="width: 33%;float: left; text-align: center;padding-top: 3%;"><span>1—3年</span><input type="checkbox" name="symptom" value="4"></div>
    <div style="width: 33%;float: left; text-align: center;padding-top: 3%;"><span>3年以上</span><input type="checkbox" name="symptom" value="5"></div>
    </div>
    </p>
    <p>三、曾用药种类:（方框内直接打勾）
    <div style="padding: 0 5%;" class="cyyzl">
    <div style="width: 33%;float: left; text-align: center;padding-top: 3%;"><span>3种以下</span><input type="checkbox" name="symptom" value="6"></div>
    <div style="width: 42%;float: left; text-align: center;padding-top: 3%;"><span>3—5种</span><input type="checkbox" name="symptom" value="7"></div>
    <div style="width: 25%;float: left; text-align: center;padding-top: 3%;"><span>5种以上</span><input type="checkbox" name="symptom" value="8"></div>
    </div>
    </p>
    <p>四、曾用药类型:（方框内直接打勾）
    <div style="padding: 0 5%;" class="cyylx">
    <div style="width: 33%;float: left; text-align: center;padding-top: 3%;"><span>膏状</span><input type="checkbox" name="symptom" value="a"></div>
    <div style="width: 42%;float: left; text-align: center;padding-top: 3%;"><span>液体状</span><input type="checkbox" name="symptom" value="b"></div>
    <div style="width: 25%;float: left; text-align: center;padding-top: 3%;"><span>粉状</span><input type="checkbox" name="symptom" value="9"></div>
    </div>
    </p>
    <p>五、目前脚气症状:（方框内直接打勾）
    <div style="padding: 0 5%;">
    <p>1、脱皮症状</p>
    <div style="width: 33%;float: left; text-align: center;padding-top: 3%;"><span>脚掌脱皮</span><input type="checkbox" name="symptom" value="c"></div>
    <div style="width: 33%;float: left; text-align: center;padding-top: 3%;"><span>脚外侧脱皮</span><input type="checkbox" name="symptom" value="d"></div>
    <div style="width: 33%;float: left; text-align: center;padding-top: 3%;"><span>脚内侧脱皮</span><input type="checkbox" name="symptom" value="e"></div>
    <div style="width: 5%;text-align: right;">&nbsp;</div>
    </div>
    <div style="padding: 0 5%;">
    <p style="border-top: 1px #f1f0f2 solid">2、水泡症状</p>
    <div style="width: 33%;float: left; text-align: center;padding-top: 3%;"><span>脚趾头水泡</span><input type="checkbox" name="symptom" value="f"></div>
    <div style="width: 33%;float: left; text-align: center;padding-top: 3%;"><span>脚掌水泡</span><input type="checkbox" name="symptom" value="g"></div>
    <div style="width: 33%;float: left; text-align: center;padding-top: 3%;"><span>脚外侧水泡</span><input type="checkbox" name="symptom" value="h"></div>
    <div style="width: 33%;float: left; text-align: center;padding-top: 3%;"><span>脚内侧水泡</span><input type="checkbox" name="symptom" value="i"></div>
    <div style="width: 33%;float: left; text-align: center;padding-top: 3%;"><span>脚后跟水泡</span><input type="checkbox" name="symptom" value="j"></div>
    <div style="width: 5%;text-align: right;">&nbsp;</div>
    </div>
    <div style="padding: 0 5%;">
    <p style="border-top: 1px #f1f0f2 solid">3、糜烂症状</p>
    <div style="width: 33%;float: left; text-align: center;padding-top: 3%;"><span>脚趾缝糜烂</span><input type="checkbox" name="symptom" value="k"></div>
    <div style="width: 33%;float: left; text-align: center;padding-top: 3%;"><span>脚趾糜烂</span><input type="checkbox" name="symptom" value="l"></div>
    <div style="width: 33%;float: left; text-align: center;padding-top: 3%;"><span>脚边缘糜烂</span><input type="checkbox" name="symptom" value="m"></div>
    <div style="width: 5%;text-align: right;">&nbsp;</div>
    </div>
    <div style="padding: 0 5%;">
    <p style="border-top: 1px #f1f0f2 solid">4、脚痒症状</p>
    <div style="width: 33%;float: left; text-align: center;padding-top: 3%;"><span>脚趾头痒</span><input type="checkbox" name="symptom" value="n"></div>
    <div style="width: 33%;float: left; text-align: center;padding-top: 3%;"><span>脚缝痒</span><input type="checkbox" name="symptom" value="o"></div>
    <div style="width: 33%;float: left; text-align: center;padding-top: 3%;"><span>脚外侧痒</span><input type="checkbox" name="symptom" value="p"></div>
    <div style="width: 33%;float: left; text-align: center;padding-top: 3%;"><span>脚背痒</span><input type="checkbox" name="symptom" value="q"></div>
    <div style="width: 5%;text-align: right;">&nbsp;</div>
    </div>
    <p style="border-top: 1px #f1f0f2 solid">备注: <textarea name="mark" placeholder="请输入备注" style='border: 0 none;color: #969696;padding-top: 5px;width:69%;height: 100px;line-height: 25px;'>${shop.shopDes }</textarea></p>
    </div>
    <p class="registered_zc" onclick="replySymptom();">申请</p>
    </form>
</div>

<script>
// 	var area1 = new LArea();
//     area1.init({
//         'trigger': '#addr', //触发选择控件的文本框，同时选择完毕后name属性输出到该位置
//         'valueTo': '#part-time-job', //选择完毕后id属性输出到该位置
//         'keys': {
//             id: 'id',
//             name: 'name'
//         }, //绑定数据源相关字段 id对应valueTo的value属性输出 name对应trigger的value属性输出
//         'type': 0, //数据源类型
//         'data': LAreaData //数据源
//     });
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
      
    });
    function replySymptom(){
    	var name = $('input[name="name"]').val().trim();
        	if (name == "" || name.length == 0) {
				alert("请输入姓名");
		  		return;
			}
        	var gyyy = false;
			$(".gyyy input[name='symptom']").each(function(){   
                if($(this).is(":checked"))    
                {    
                	gyyy = true;
                	return false;
                }    
            });
			if(!gyyy){
				alert("请选择感染原因！");
		  		return false;
			}
			
			var jqsc = false;
			$(".jqsc input[name='symptom']").each(function(){   
                if($(this).is(":checked"))    
                {    
                	jqsc = true;
                	return false;
                }    
            });
			if(!jqsc){
				alert("请选择脚气时长！");
		  		return false;
			}
			var cyyzl = false;
			$(".cyyzl input[name='symptom']").each(function(){   
                if($(this).is(":checked"))    
                {    
                	cyyzl = true;
                	return false;
                }    
            });
			if(!cyyzl){
				alert("请选择曾用药种类！");
		  		return false;
			}
			var cyylx = false;
			$(".cyylx input[name='symptom']").each(function(){   
                if($(this).is(":checked"))    
                {    
                	cyylx = true;
                	return false;
                }    
            });
			if(!cyylx){
				alert("请选择曾用药类型！");
		  		return false;
			}
			var formData = new FormData($( "#shopForm" )[0]);
			$.ajax({
			       cache: true,
			       type: "POST",
			       url:"replySymptom",
			       data:formData,
			       timeout:5000,
			       async: false,
			       processData: false,  // 告诉jQuery不要去处理发送的数据
			       contentType: false,
			       beforeSend:function(XMLHttpRequest){
			       },
			       success: function (data){
						alert("提交成功");
						$(".registered_zc").removeAttr("onclick");
						$(".registered_zc").css({'background-color':'gray'});
			       },
			       error: function () {
			         jNotify("服务器或者网络错误",{ShowOverlay : false});
			       }
			});
    }
</script>
</body>
</html>
