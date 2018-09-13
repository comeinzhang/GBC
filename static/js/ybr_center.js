function nickname_edit(){
	var nickname = $('input[name="nickname"]').val();
	var data = {nickname:nickname};
	$.ajax({
		type : "post",
		async : false,  //同步请求
		url : "update_user_nickname",
		data : data,
		timeout:5000,
		success:function(dates){
		//$("#nickname").html(nickname);
		},
		error: function() {
           SimMessageAlert("修改失败");
        }
	});
	$(this).parents('.education').find('.text').show();
    $(this).parents('.education').find('.add-edit').show();
    $(this).parent().hide();
}
function sex_edit(){
	var sex = $('#sex').val();
	var id = '${user.id}';
	var data = {sex:sex,id:id};
	$.ajax({
		type : "post",
		async : false,  //同步请求
		url : "update_user_sex",
		data : data,
		timeout:5000,
		success:function(dates){
		//$("#sex").html(sex_val);
		},
		error: function() {
           SimMessageAlert("修改失败");
        }
	});
}
function area_code_edit(){
	var area= $('input[name="part-time-job"]').val();;
	var data ={area:area};
	alert(area);
	var html="";
	$.ajax({
		type : "post",
		async : false,  //同步请求
		url : "/showtimePH/user/update_user_area",
		data : data,
		timeout:5000,
		success:function(dates){
		},
		error: function() {
           SimMessageAlert("修改失败");
        }
	});
}
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
$('#btn_education').click(function(){
	var education="";
		var school =$(this).parent().find('input[name="school"]').val();
		if(school=="")
			return true;
		var major =$(this).parent().find('input[name="major"]').val();
		var time1 =$(this).parent().find('input[name="time1"]').val();
		var time2 =$(this).parent().find('input[name="time2"]').val();
		education+=school+"	"+time1+"至"+time2+"	"+major+",";
	var data ={education:education};
	var html="";
	$.ajax({
		type : "post",
		async : false,  //同步请求
		url : "/showtimePH/user/update_user_education",
		data : data,
		timeout:5000,
		success:function(dates){
			if(dates!=null&&dates!=""){
			$(dates).each(function(i,n){
				html+=""+n+"<i></i>";
			});
			}
			$("#edu").html(html);
		},
		error: function() {
           SimMessageAlert("修改失败");
        }
	});
	$(this).parents('.education').find('.text').show();
    $(this).parents('.education').find('.add-edit').show();
    $(this).parent().hide();
});
$('#btn_job').click(function(){
	var job="";
		var company =$(this).parent().find('input[name="company"]').val();
		if(company=="")
			return true;
		var position =$(this).parent().find('input[name="position"]').val();
		var time1 =$(this).parent().find('input[name="time1"]').val();
		var time2 =$(this).parent().find('input[name="time2"]').val();
		job+=company+"	"+time1+"至"+time2+"	"+position+",";
	var data ={job:job};
	var html="";
	$.ajax({
		type : "post",
		async : false,  //同步请求
		url : "/showtimePH/user/update_user_job",
		data : data,
		timeout:5000,
		success:function(dates){
			if(dates!=null&&dates!=""){
			$(dates).each(function(i,n){
				html+=""+n+"<i></i>";
			});
			}
			$("#job").html(html);
		},
		error: function() {
           SimMessageAlert("修改失败");
        }
	});
	$(this).parents('.education').find('.text').show();
    $(this).parents('.education').find('.add-edit').show();
    $(this).parent().hide();
});
$('#btn_train').click(function(){
	var train="";
		var trainer =$$(this).parent().find('input[name="trainer"]').val();
		if(trainer=="")
			return true;
		var professional =$$(this).parent().find('input[name="professional"]').val();
		var time1 =$$(this).parent().find('input[name="time1"]').val();
		var time2 =$$(this).parent().find('input[name="time2"]').val();
		train+=trainer+"	"+time1+"至"+time2+"	"+professional+",";
	var data ={train:train};
	var html="";
	$.ajax({
		type : "post",
		async : false,  //同步请求
		url : "/showtimePH/user/update_user_train",
		data : data,
		timeout:5000,
		success:function(dates){
			if(dates!=null&&dates!=""){
			$(dates).each(function(i,n){
				html+=""+n+"<i></i>";
			});
			}
			$("#train").html(html);
		},
		error: function() {
           SimMessageAlert("修改失败");
        }
	});
	$(this).parents('.education').find('.text').show();
    $(this).parents('.education').find('.add-edit').show();
    $(this).parent().hide();
});
$('#btn_credential').click(function(){
	var credential="";
		var credentialer =$(this).parent().find('input[name="credentialer"]').val();
		if(credentialer=="")
			return true;
		credential+=credentialer+",";
	var data ={credential:credential};
	var html="";
	$.ajax({
		type : "post",
		async : false,  //同步请求
		url : "/showtimePH/user/update_user_credential",
		data : data,
		timeout:5000,
		success:function(dates){
			if(dates!=null&&dates!=""){
			$(dates).each(function(i,n){
				html+=""+n+"<i></i>";
			});
			}
			$("#credential").html(html);
		},
		error: function() {
           SimMessageAlert("修改失败");
        }
	});
	$(this).parents('.education').find('.text').show();
    $(this).parents('.education').find('.add-edit').show();
    $(this).parent().hide();
});
$('#btn_signature').click(function(){
	var signature = $('.signature').val();
	if(signature.length>100){
		alert("签名最多输入100个字符")
		return false;
	}
	var data = {signature:signature};
	$.ajax({
		type : "post",
		async : false,  //同步请求
		url : "update_user_signature",
		data : data,
		timeout:5000,
		success:function(dates){
		$("#signature").html(signature+"<i></i>");
		},
		error: function() {
        }
	});
	location.reload();
});
$('#btn_resume').click(function(){
	var resume = $('.resume').val();
	var data = {resume:resume};
	$.ajax({
		type : "post",
		async : false,  //同步请求
		url : "/showtimePH/user/update_user_resume",
		data : data,
		timeout:5000,
		success:function(dates){
		$("#resume").html(resume+"<i></i>");
		},
		error: function() {
           SimMessageAlert("修改失败");
        }
	});
	$(this).parents('.education').find('.text').show();
    $(this).parents('.education').find('.add-edit').show();
    $(this).parent().hide();
});
$('#btn_wechat_num').click(function(){
	var wechat_num = $('input[name="wechat_num"]').val();
	var data = {wechat_num:wechat_num};
	$.ajax({
		type : "post",
		async : false,  //同步请求
		url : "/showtimePH/user/update_user_wechat_num",
		data : data,
		timeout:5000,
		success:function(dates){
		$("#wechat_num").html(wechat_num+"<i></i>");
		},
		error: function() {
           SimMessageAlert("修改失败");
        }
	});
	$(this).parents('.education').find('.text').show();
    $(this).parents('.education').find('.add-edit').show();
    $(this).parent().hide();
});
$('#btn_email').click(function(){
	var email = $('input[name="email_info"]').val();
	var myemreg = /^([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$/;
	 if(!myemreg.test(email))
      {
		 SimMessageAlert('请输入有效的E_Mail！');
           return false;
     }
	var data = {email:email};
	$.ajax({
		type : "post",
		async : false,  //同步请求
		url : "/showtimePH/user/update_user_email",
		data : data,
		timeout:5000,
		success:function(dates){
		$("#email").html(email+"<i></i>");
		},
		error: function() {
           SimMessageAlert("修改失败");
        }
	});
	$(this).parents('.education').find('.text').show();
    $(this).parents('.education').find('.add-edit').show();
    $(this).parent().hide();
});
$('#btn_receive_addr').click(function(){
	var receive_addr = $('input[name="receive_addr"]').val();
	var data = {receive_addr:receive_addr};
	$.ajax({
		type : "post",
		async : false,  //同步请求
		url : "/showtimePH/user/update_user_receive_addr",
		data : data,
		timeout:5000,
		success:function(dates){
		$("#receive_addr").html(receive_addr+"<i></i>");
		},
		error: function() {
           SimMessageAlert("修改失败");
        }
	});
	$(this).parents('.education').find('.text').show();
    $(this).parents('.education').find('.add-edit').show();
    $(this).parent().hide();
});
$('#btn_phone').click(function(){
	var phone = $('input[name="phone_info"]').val();
	var code = $('input[name="phone_code"]').val();
	var data = {phone:phone,code:code};
	$.ajax({
		type : "post",
		async : false,  //同步请求
		url : "/showtimePH/user/update_user_phone",
		data : data,
		timeout:5000,
		success:function(dates){
			code = "";
			dates = parseInt(dates, 10);
			if(dates == 1){  
				SimMessageAlert("验证码错误");
             }else
			$("#phone").html(phone+"<i></i>");
		},
		error: function() {
           SimMessageAlert("修改失败");
        }
	});
	$(this).parents('.education').find('.text').show();
    $(this).parents('.education').find('.add-edit').show();
    $(this).parent().hide();
});
$('.btn_friend1').click(function(){
	var user = '${sessionScope.user}';
	if(user==null||user==""){
		 $(".public-login").css("display","block");
		 return false;
	}
	var id = $(this).attr("id");
	var msg = $(".friendApply"+id).val();
	var data={friend_id:id,msg:msg};
	$.ajax({
		type : "post",
		async : false,  //同步请求
		url : "/showtime/user/agree",
		data : data,
		timeout:5000,
		success:function(dates){
			$('#friend'+id).remove();
		},
		error: function() {
           SimMessageAlert("处理失败");
        }
	});
	$(this).parents('.education').find('.text').show();
    $(this).parents('.education').find('.add-edit').show();
    $(this).parent().hide();
});
$('.btn_friend2').click(function(){
	var user = '${sessionScope.user}';
	if(user==null||user==""){
		 $(".public-login").css("display","block");
		 return false;
	}
	var id = $(this).attr("id");
	var msg = $(".friendApply"+id).val();
	var data={friend_id:id,msg:msg};
	$.ajax({
		type : "post",
		async : false,  //同步请求
		url : "/showtime/user/noagree",
		data : data,
		timeout:5000,
		success:function(dates){
			$('#friend'+id).remove();
		},
		error: function() {
           SimMessageAlert("处理失败");
        }
	});
	$(this).parents('.education').find('.text').show();
    $(this).parents('.education').find('.add-edit').show();
    $(this).parent().hide();
});
});
function edu_del(id){
	var education = $("p[id="+id+"]").text()+",";
	var data ={education:education,flag:"del"};
	var html="";
	$.ajax({
		type : "post",
		async : false,  //同步请求
		url : "/showtime/user/update_user_education",
		data : data,
		timeout:5000,
		success:function(dates){
			if(dates!=null&&dates!=""){
			$(dates).each(function(i,n){
				html+="<p id='education"+(i+1)+"'>"+n+"<span class='delete-btn' id='education"+(i+1)+"' onclick='edu_del(this.id)' title='删除'></span></p>";
			});
			}
			$(".education").html(html);
		},
		error: function() {
           SimMessageAlert("修改失败");
        }
	});
}
function msg_del(id){
	var data ={id:id};
	$.ajax({
		type : "post",
		async : false,  //同步请求
		url : "/showtime/user/delete_user_assess",
		data : data,
		timeout:5000,
		success:function(dates){
			$('#msg'+id).remove();
		},
		error: function() {
           SimMessageAlert("修改失败");
        }
	});
}
function job_del(id){
	var job = $("p[id="+id+"]").text()+",";
	var data ={job:job,flag:"del"};
	var html="";
	$.ajax({
		type : "post",
		async : false,  //同步请求
		url : "/showtime/user/update_user_job",
		data : data,
		timeout:5000,
		success:function(dates){
			if(dates!=null&&dates!=""){
			$(dates).each(function(i,n){
				html+="<p id='job"+(i+1)+"'>"+n+"<span class='delete-btn' id='job"+(i+1)+"' onclick='job_del(this.id)' title='删除'></span></p>";
			});
			}
			$(".job").html(html);
		},
		error: function() {
           SimMessageAlert("修改失败");
        }
	});
}
function train_del(id){
	var train = $("p[id="+id+"]").text()+",";
	var data ={train:train,flag:"del"};
	var html="";
	$.ajax({
		type : "post",
		async : false,  //同步请求
		url : "/showtime/user/update_user_train",
		data : data,
		timeout:5000,
		success:function(dates){
			if(dates!=null&&dates!=""){
			$(dates).each(function(i,n){
				html+="<p id='train"+(i+1)+"'>"+n+"<span class='delete-btn' id='train"+(i+1)+"' onclick='train_del(this.id)' title='删除'></span></p>";
			});
			}
			$(".train").html(html);
		},
		error: function() {
           SimMessageAlert("修改失败");
        }
	});
}
function credential_del(id){
	var credential = $("p[id="+id+"]").text()+",";
	var data ={credential:credential,flag:"del"};
	var html="";
	$.ajax({
		type : "post",
		async : false,  //同步请求
		url : "/showtime/user/update_user_credential",
		data : data,
		timeout:5000,
		success:function(dates){
			if(dates!=null&&dates!=""){
			$(dates).each(function(i,n){
				html+="<p id='credential"+(i+1)+"'>"+n+"<span class='delete-btn' id='credential"+(i+1)+"' onclick='credential_del(this.id)' title='删除'></span></p>";
			});
			}
			$(".credential").html(html);
		},
		error: function() {
           SimMessageAlert("修改失败");
        }
	});
}
function assess_del(id){
	var data ={id:id};
	var html="";
	$.ajax({
		type : "post",
		async : false,  //同步请求
		url : "/showtime/user/delete_user_assess",
		data : data,
		timeout:5000,
		success:function(dates){
			if(dates!=null&&dates!=""){
			$(dates).each(function(i,n){
				if(n.flag!=1){
				html+="<p id='"+n.id+"'>"+n.assess+"<span class='delete-btn' id='"+n.id+"' onclick='assess_del(this.id)' title='删除'></span></p>";
				}
				});
			}
			$("#assess").html(html);
		},
		error: function() {
           SimMessageAlert("修改失败");
        }
	});
}
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