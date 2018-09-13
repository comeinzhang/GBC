$(function(){
//$('#area_code').click(function(){
//	var area="";
//	 $('div[id="area"]').each(function(i){
//		var sheng =$(this).find('input[name="sheng"]').val();
//		if(sheng=="")
//			return true;
//		var shi =$(this).find('input[name="shi"]').val();
//		var qu =$(this).find('input[name="qu"]').val();
//		area+=sheng+"省	"+shi+"市	"+qu+"县/区";
//	});
//	var data ={area:area};
//	var html="";
//	$.ajax({
//		type : "post",
//		async : false,  //同步请求
//		url : "/showtime/user/update_user_area",
//		data : data,
//		timeout:5000,
//		success:function(dates){
////			$(dates).each(function(i,n){
////				html+="<p>"+n+"</p>";
////			});
//			$(".area_code").html(area);
//		},
//		error: function() {
//           SimMessageAlert("修改失败");
//        }
//	});
//});
$('#btn_comy_resume').click(function(){
	var comy_resume = $('.comy_resume').val();
	var data = {value:comy_resume,flag:"comy_resume"};
	$.ajax({
		type : "post",
		async : false,  //同步请求
		url : "/TYHWX/user/updateMemberInfo",
		data : data,
		timeout:5000,
		success:function(dates){
		$("#comy_resume").html(comy_resume+"<i></i>");
		},
		error: function() {
           SimMessageAlert("修改失败");
        }
	});
	$(this).parents('.education').find('.text').show();
    $(this).parents('.education').find('.add-edit').show();
    $(this).parent().hide();
});
$('#btn_comy_name').click(function(){
	var comy_name = $('input[name="comy_name"]').val();
	var data = {value:comy_name,flag:"comy_name"};
	$.ajax({
		type : "post",
		async : false,  //同步请求
		url : "/TYHWX/user/updateMemberInfo",
		data : data,
		timeout:5000,
		success:function(dates){
		$("#comy_name").html(comy_name+"<i></i>");
		$("#top_comy_name").html(comy_name);
		},
		error: function() {
           SimMessageAlert("修改失败");
        }
	});
	$(this).parents('.education').find('.text').show();
    $(this).parents('.education').find('.add-edit').show();
    $(this).parent().hide();
});
$('#btn_comy_addr').click(function(){
	var comy_addr = $('input[name="comy_addr"]').val();
	var data = {value:comy_addr,flag:"comy_addr"};
	$.ajax({
		type : "post",
		async : false,  //同步请求
		url : "/TYHWX/user/updateMemberInfo",
		data : data,
		timeout:5000,
		success:function(dates){
		$("#comy_addr").html(comy_addr+"<i></i>");
		},
		error: function() {
           SimMessageAlert("修改失败");
        }
	});
	$(this).parents('.education').find('.text').show();
    $(this).parents('.education').find('.add-edit').show();
    $(this).parent().hide();
});
$('#btn_phone_num').click(function(){
	var phone_num = $('input[name="phone_num"]').val();
	var data = {value:phone_num,flag:"phone_num"};
	$.ajax({
		type : "post",
		async : false,  //同步请求
		url : "/TYHWX/user/updateMemberInfo",
		data : data,
		timeout:5000,
		success:function(dates){
		$("#phone_num").html(phone_num+"<i></i>");
		},
		error: function() {
           SimMessageAlert("修改失败");
        }
	});
	$(this).parents('.education').find('.text').show();
    $(this).parents('.education').find('.add-edit').show();
    $(this).parent().hide();
});
});
//修改手机
var flag;
var curCount;
var code;
var codeLength=6;
function sendcode_phone() {
	flag="phone";
  	var phone = $('input[name="phone_info"]').val();
  	var myphreg = /^(((13[0-9]{1})|(15[0-9]{1})|(18[0-9]{1}))+\d{8})$/;
	if (phone == "" || phone.length == 0) {
		SimMessageAlert("请输入手机号码");
  		return false;
	}else{
		 if(!myphreg.test(phone))
          {
			 SimMessageAlert('请输入有效的手机号码！');
               return false;
         }
	}
    curCount = 60;
            // 产生验证码  
            for ( var i = 0; i < codeLength; i++) {  
               code += parseInt(Math.random() * 9).toString();  
            }  
            var data = {flag:flag,code:code,loginName:phone};
            // 设置button效果，开始计时  
	        $("#sendphone").removeAttr("onclick");
	        $("#sendphone").html("请在" + curCount + "秒内输入验证码");
            InterValObj = window.setInterval(SetRemainTim, 1000); // 启动计时器，1秒执行一次  
            // 向后台发送处理数据  
            $.ajax({
            	type : "post",
    			async : false,  //同步请求
    			timeout:5000,
                url: "/showtimePH/user/sendcode/",
                data: data,  
                error: function (XMLHttpRequest, textStatus, errorThrown) {   
                	SimMessageAlert("验证码发送失败!");
                },
                success: function (data){
                	SimMessageAlert("验证码已发送，请查收！");
                }  
            });  
}
function openInfo(obj){
	 var flag=obj.value;
	 var openinfo;
	 if(flag=="是"){
		 openinfo=1;
		 flag="否";
	 }else if(flag=="否"){
		 openinfo=0;
		 flag="是";
	 }
	 $.ajax({
        cache: true,
        type: "POST",
        url:"/showtime/user/update_user_openInfo",
        data:{openinfo:openinfo},
        async: false,
        error: function(request) {
        	SimMessageAlert("出错了");
        },
        success: function(data) {
        	$("#"+obj.id).val(flag);
        }
    });
}
//修改邮箱
//function sendcode_email() {
//	flag="email";
//  	var email = $('input[name="email"]').val();
//  	var myemreg = /^([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$/;
//	if (email == "" || email.length == 0) {
//		SimMessageAlert("请输入新的邮箱");
//  		return false;
//	}else{
//		 if(!myemreg.test(email))
//          {
//			 SimMessageAlert('请输入有效的E_Mail！');
//               return false;
//         }
//	}
//    curCount = count;  
//            // 产生验证码  
//            for ( var i = 0; i < codeLength; i++) {  
//                code += parseInt(Math.random() * 9).toString();  
//            }  
//            var data = {flag:flag,code:code,loginName:email};
//            // 设置button效果，开始计时  
//	        $("#sendemail").removeAttr("onclick");
//	        $("#sendemail").html("请在" + curCount + "秒内输入验证码");
//            InterValObj = window.setInterval(SetRemainTim, 1000); // 启动计时器，1秒执行一次  
//            // 向后台发送处理数据  
//            $.ajax({  
//            	type : "post",
//    			async : false,  //同步请求
//    			timeout:1000,
//                url: "/showtime/user/sendcode/",
//                data: data,  
//                error: function (XMLHttpRequest, textStatus, errorThrown) {   
//                	SimMessageAlert("验证码发送失败!");
//                },
//                success: function (data){
//                	SimMessageAlert("验证码已发送，请查收！");
//                }  
//            });  
//}
function SetRemainTim() { 
    if (curCount == 0) {              
        window.clearInterval(InterValObj);// 停止计时器  
        if(flag=="phone"){
        	$("#sendphone").attr("onclick", "sendcode_phone()");
	        $("#sendphone").html("重新发送验证码");  
        }else{
        	$("#sendemail").attr("onclick", "sendcode_email()");
            $("#sendemail").html("重新发送验证码"); 
        }
        code = ""; // 清除验证码。如果不清除，过时间后，输入收到的验证码依然有效  
    }else {
        curCount--;
        if(flag=="phone"){
        	$("#sendphone").removeAttr("onclick");
        	$("#sendphone").html("请在" + curCount + "秒内输入验证码");
        }else{
        	$("#sendemail").removeAttr("onclick");
        	$("#sendemail").html("请在" + curCount + "秒内输入验证码");
        }
    }  
} 