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
    <script type="text/javascript" src="../static/js/province_city.js"></script>
    <script type="text/javascript" src="../static/js/ajaxfileupload.js"></script>
	<script type="text/javascript" src="../static/plug-in/layer/layer.js"></script>
	<link rel="stylesheet" href="../static/plug-in/layer/skin/default/layer.css">
    <title>我的店铺</title>
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
</head>
<body>
<div class="container login1 myct">
	<span class="back" onClick="javascript :history.back(-1);"></span>
  	<p>申请开店</p>
</div>
<div class="container">
	<form action="" method="post" id="shopForm">
	<input type="hidden" name="idstr" value="${shop.id }">
	<input type="hidden" name="flag" value="${flag }">
	<input id="txtProCity" name="userAddr"  type="hidden" />  
	<div class="registered">
	<p>店铺名称 : <input type="text" name="name" placeholder="请输入店铺名称" value="${shop.name }"></p>
	<p>主营商品 : <input type="text" name="mainGoods" value="${shop.mainGoods }" placeholder="输入主营商品，产品用“，”隔开" ></p>
	<p>店铺简介 : <textarea name="shopDes" placeholder="请输入店铺简介" style='border: 0 none;color: #969696;padding-top: 5px;width:69%;height: 100px;line-height: 25px;'>${shop.shopDes }</textarea></p>
   	<p>姓　名 : <input type="text" name="realName"   placeholder="请输入姓名" value="${shop.realName }"></p>
    <p>身份证号: <input type="text"  name="card" value="${shop.card }"  placeholder="请输入身份证号"></p>
    <p>所在省: <select id="province" name="province"></select></p>
    <p>所在市: <select id="city" name="city"></select></p>
    <p>所在区: <select id="area" name="area"></select></p>
    <p>详细地址: <input type="text"  name="addrDetail" value="${shop.addrDetail}"  placeholder="请输入详细地址"></p>
    <p>银行卡号: <input type="text"  name="account" value="${shop.account }"  placeholder="请输入银行卡号"></p>
    <p>开户行: <input type="text"  name="bank" value="${shop.bank }"  placeholder="请输入开户行"></p>
    <p>持卡人: <input type="text"  name="bankName" value="${shop.bankName }"  placeholder="请输入持卡人"></p>
    <p>手　机 : <input type="text" name="phone"   placeholder="请输入手机号" ></p>
    <p>验证码 : <input type="text" class="registered_yzm"  name="checkCode"  placeholder="验证码"><input type="button" class="registered_gethpone" value="获取验证码" ></p>
    <p>推荐人手机 : <input type="text"  name="referPhone"  <c:if test="${flag eq 'refer'}">value="${user.phone }" readonly="readonly"</c:if>placeholder="请输入推荐人手机号"></p>
    <c:if test="${!empty shop}">
    	<p>审核结果: <input type="text"  name="bankName" value="${shop.checkResult }"  placeholder="审核信息"></p>
    </c:if>
    <div class="add-img clearFix">
                    <div class="upload_box">
                    <div class="img btn">
<!--                     	<div class="warp-img pic"><img class="img'+ i +'" src="'+urls[i]+'"att="" ><i class="iconfont icon-cha1"></i></div> -->
                        <div class="warp-img">
                            <div class="add-btn">
                                <i class="iconfont icon-jia"></i>
                                <p>身份证正面</p>
                            </div>
                            <input type="hidden" name="cardUrl1">
                            <input type="file" name="file" id="file1" multiple="multiple" class="upload_file">
                        </div>
                    </div>
                    <div class="img btn">
                    	
                        <div class="warp-img">
                            <div class="add-btn">
                                <i class="iconfont icon-jia"></i>
                                <p>身份证反面</p>
                            </div>
                            <input type="hidden" name="cardUrl2">
                            <input type="file" name="file" id="file2" multiple="multiple" class="upload_file">
                        </div>
                    </div>
                    <div class="img btn">
                        <div class="warp-img">
                            <div class="add-btn">
                                <i class="iconfont icon-jia"></i>
                                <p>营业执照</p>
                            </div>
                            <input type="hidden" name="chartUrl">
                            <input type="file" name="file" id="file3" multiple="multiple" class="upload_file">
                        </div>
                    </div>
                    <div class="img btn">
                        <div class="warp-img">
                            <div class="add-btn">
                                <i class="iconfont icon-jia"></i>
                                <p>实体店照</p>
                            </div>
                            <input type="hidden" name="chartUrl1">
                            <input type="file" name="file" id="file4" multiple="multiple" class="upload_file">
                        </div>
                    </div>
                    </div>
                    <script>
            $(function(){
            	 var urls = "";
                 var fileInfo =[];
            	 $(document).on('change','.upload_file',function ajaxFileUpload() {
            		 var index = layer.load(0, {shade: false});
            		 var a = $(this);
                 	 var id = a.attr("id");
                 	 var name = a.siblings('input').attr("name");
                 	 $(this).parents('.warp-img').css('display','none');
                     urls = (window.webkitURL ? webkitURL : window.URL).createObjectURL(this.files[0]);
                     var divs=$('<div class="warp-img pic"><img class="img" src="'+urls+'"att="" ><i class="iconfont icon-cha1"></i></div>').on('click',delIMG);
                     $(this).parents('.img').append(divs);
                     $.ajaxFileUpload(
                             {
                                 url: '../order/saveReplyShopImg',
                                 secureuri: false,
                                 fileElementId: id,
                                 dataType: 'json',
//         	                        data: { name: 'logan', id: 'id' },
                                 success: function (data, status) {
                                	 layer.close(index);
                                     if (typeof (data.error) == 'undefined') {
                                    	 $('input[name='+name+']').val(data.img_url);
                                     }
                                 },
                                 error: function (data, status, e) {
                                     alert(e);
                                 }
                             }
                    );
                    return false;
             	});
            	 $('.upload_box .pic').on('click',delIMG);
                 function delIMG(){
                     var a = $(this);
                     var index = a.index();
                     $(this).siblings().css('display','block');
                     $(this).siblings().find(".upload_file").val("");
                     a.remove();
//                      fileInfo.splice(index,index);//删除input对象合集相应key
                     //alert(fileInfo.length);
                 }
            });
</script>
</div>
       <p>
       申请即表示同意《<a href="aboutReplyShop" target="_self">入驻须知</a>》
       </p>         
    </div>
    
    <p class="registered_zc">申请</p>
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
        	var name = $('input[name="name"]').val().trim();
        	if (name == "" || name.length == 0) {
				alert("请输入店铺名称");
		  		return;
			}
        	var mainGoods = $('input[name="mainGoods"]').val().trim();
        	if (mainGoods == "" || mainGoods.length == 0) {
				alert("请输入主营商品");
		  		return;
			}
        	var shopDes = $('textarea[name="shopDes"]').val().trim();
        	if (shopDes == "" || shopDes.length == 0) {
				alert("请输入店铺简介");
		  		return;
			}
        	var userAddr = $('input[name="userAddr"]').val().trim();
        	if (userAddr == "" || userAddr.length == 0) {
				alert("请输入所在区域");
		  		return;
			}
        	var addrDetail = $('input[name="addrDetail"]').val().trim();
        	if (addrDetail == "" || addrDetail.length == 0) {
				alert("请输入详细地址");
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
			var checkCode = $('input[name="checkCode"]').val().trim();
			if (checkCode == "" || checkCode.length == 0) {
				alert("请输入验证码");
		  		return false;
			}
			var referPhone = $('input[name="referPhone"]').val().trim();
			//if (referPhone == "" || referPhone.length == 0) {
			//	alert("请输入推荐人手机号码");
		  	//	return false;
			//}
			if(referPhone==phone){
				alert("推荐人不能填写自己");
				return false;
			}
			var realName = $('input[name="realName"]').val().trim();
			if (realName == "" || realName.length == 0) {
				alert("请输入姓名");
		  		return false;
			}else{
				var regName =/^[\u4e00-\u9fa5]{2,4}$/;  
				if(!regName.test(realName)){ 
				    alert('姓名填写有误');  
				    return false;  
				}
			}
			var card = $('input[name="card"]').val().trim();
			if (card == "" || card.length == 0) {
				alert("请输入身份证号");
		  		return false;
			}else{
				if(card.length != 18){
				    alert('请输入有效身份证');
				    return false;  
				}
			}
			var account = $('input[name="account"]').val().trim();
			if (account == "" || account.length == 0) {
				alert("请输入银行卡号");
		  		return false;
			}else{
				var reg =/^\d{18,21}$/;
				if(!reg.test(account)){
				    alert('银行卡号请输入18-21位数字');  
				    return false;  
				}
			}
			var bank = $('input[name="bank"]').val().trim();
			if (bank == "" || bank.length == 0) {
				alert("请输入开户行");
		  		return false;
			}
			var bankName = $('input[name="bankName"]').val().trim();
			if (bankName == "" || bankName.length == 0) {
				alert("请输入持卡人");
		  		return false;
			}
			var file2 = $('input[name="cardUrl2"]').val().trim();
			var file1 = $('input[name="cardUrl1"]').val().trim();
			if (file2 == "" || file2.length == 0||file1 == "" || file1.length == 0) {
				alert("请上传身份证");
		  		return false;
			}
			var formData = new FormData($( "#shopForm" )[0]);
			$.ajax({
			       cache: true,
			       type: "POST",
			       url:"replyShop",
			       data:formData,
			       timeout:5000,
			       async: false,
			       processData: false,  // 告诉jQuery不要去处理发送的数据
			       contentType: false,
			       beforeSend:function(XMLHttpRequest){
			       },
			       success: function (data){
			       	  data = parseInt(data);
			       	  if(data==1){
						  alert("提交成功，我们会在一个工作日内审核您的请求！");
						  location.href="mycenter";
					  }else if(data==2){
					  	  alert("验证码错误！");
					  }else if(data==3){
					  	  alert("您已有店铺或正在审核中！请勿重复提交！");
					  	  location.href="mycenter";
					  }else if(data==4){
					  	  alert("未找到此推荐人，请核实后重新填写！");
					  }else if(data==5){
					  	  alert("该手机已经被使用，请重新填写！");
					  }else if(data==6){
					  	  alert("推荐人不能填写自己");
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
