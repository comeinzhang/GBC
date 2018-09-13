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
    <link rel="stylesheet" href="../static/css/jNotify.jquery.css">
	<script type="text/javascript" src="../static/js/jNotify.jquery.js"></script>
    <title>基本资料</title>
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
</head>
<body>
<div class="myct">
	<span class="back" onClick="javascript :history.back(-1);"></span>
  	<p>修改资料</p>
	<div class="index_menubtn"></div>
	<div class="index_menu">
		<div class="index_menu_top"></div>
		<ul>
			<li>
	                <a href="../goods/index" target="_self">
	                    <i class="index_menu_icon1"></i>
	                   首页
	                </a>
			</li>
            <li><a href="../goods/getGoodsCar" target="_self"><i class="index_menu_icon2"></i>购物车</a></li>
            <li><a href="../goods/getGoodsStore" target="_self"><i class="index_menu_icon3"></i>收藏夹</a></li>
            <li><a href="mycenter" target="_self"><i class="index_menu_icon4"></i>个人中心</a></li>
		</ul>
	</div>
</div>
<div class="container">
  <form action="" id="userForm" enctype="multipart/form-data" method="post">
	<ul class="modifying_data">
    	<li class="modifying_face"><a href="" target="_self">修改头像
    	<span>
    	<c:choose> 
				<c:when test="${fn:contains(user.headImgUrl,'http')}">    
					  <img src="${user.headImgUrl}" class="headImgUrl" width="60">
				</c:when>
				<c:otherwise>    
					   <img src="${ASSET_URL }${user.headImgUrl}" class="headImgUrl" width="60"/>
				</c:otherwise> 
		</c:choose>
    	<input type="file" id="head_img_url" class="upload_file" name="headImgUrlFile"  style="display: inline-block; width: 100%;height: 80px; position: absolute;right: 0px; top: 47px; opacity: 0;"/>
    	</span>
    	</a></li>
    	<li class="member">会员等级<span>${user.userRoleName}</span></li>
<!--         <li class="member"><a href="" target="_self">会员等级<span class="blue">如何升级?</span><span>普通会员</span></a></li> -->
<!--         <li class="member"><a href="" target="_self">现有积分<span class="blue">积分记录</span><span>1000</span></a></li> -->
        <li class="modifying_name mt10"><a href="toUpdateNickName" target="_self">昵称<span>${user.nickName }</span></a></li>
        <li class="sex"><a href="javascript:;" target="_self">性别<span><c:if test="${user.sex eq 0}">男</c:if><c:if test="${user.sex eq 1}">女</c:if><c:if test="${user.sex eq 2}">保密</c:if>   </span></a></li>
        <li class="mt10"><a href="toBindPhone" target="_self">绑定手机<span>${user.phone}</span></a></li>        
        <li><a href="toEditAddr" target="_self">地址管理<span></span></a></li>
        <li><a href="toUpdatePwd" target="_self">修改密码<span></span></a></li>
        <li><a href="toUpdatePwd2" target="_self">修改二级密码<span></span></a></li>
    </ul>
        <div class="sex_zz"></div>    
        <div class="sex_select">
        	<p class="border_bottom">选择性别</p>        	       	
        	<p class="border_bottom" id="0">男</p>
            <p class="border_bottom" id="1">女</p>
            <p class="border_bottom" id="2">保密</p>
            <p class="mt5" style="border-radius: 6px; overflow: hidden;">取消</p>
        </div> 
    <div class="outLogin">
   	  <p class="registered_zc">退出登录</p>
    </div>
  </form>
</div>
<script>
$(function(){
	$('.upload_file').on('change',selectPIC);
	function selectPIC(){
	    var $this = $(this);
	    // 获取上传文件信息集合
	    var fileInfo = this.files[0];
	
	    // 判断是否为图片格式
	    var obj_fifle=document.getElementById("head_img_url");
		var reg_pic=/(.gif|.jpg|.jpeg|.bmp|.png)$/;
	    if(!reg_pic.test(obj_fifle.value.toLowerCase())){
	        alert('请上传图片！');
	        return;
	    }else{
	    	var fsize = $('#head_img_url')[0].files[0].size; //get file size 
	    	if(fsize>1048576*10){
	    		jNotify("图片大小不能超过10M！",{ShowOverlay : false});
	    		return;
	    	}
	    	
				var formData = new FormData($( "#userForm" )[0]);
				 $.ajax({
	                cache: true,
	                type: "POST",
	                url:"saveUserImg",
	                data:formData,
	                async: false,
	                processData: false,  // 告诉jQuery不要去处理发送的数据
					contentType: false,
	                error: function(request) {
	                   jNotify("服务器或者网络错误",{ShowOverlay : false});
	                },
	                success: function(data) {
	                	$('.headImgUrl').attr('src',data.headImgUrl);
	                	jSuccess('修改成功');
	                }
	            });
	      }      
	}
});
</script>
<script>
	$(document).ready(function(){
		$(".index_menubtn").click(function(){
            $(".index_menu").stop().fadeToggle('flow');
        });
                        function writeObj(obj){ 
                        	 var description = ""; 
                        	 for(var i in obj){ 
                        	 var property=obj[i]; 
                        	 description+=i+" = "+property+"\n"; 
                        	 } 
                        	 alert(description); 
                        	} 
                        
                        
		function is_weixn(){  
		    var ua = navigator.userAgent.toLowerCase();  
		    if(ua.match(/MicroMessenger/i)=="micromessenger") {  
		        return true;  
		    } else {  
		        return false;  
		    }  
		}
		var dom=$(".sex_zz, .sex_select");
		function sexSelect(){
			dom.hide();
			touchon();
		}
		$(".sex").click(function(){
			dom.show();
			touchoff();
		});
		$(".sex_zz").click(sexSelect)
		$(".sex_select p").click(function(){
			var str=$(this).html();
			if(str != "选择性别" && str != "取消"){
				var id = $(this).attr("id");
				$(".sex span").html(str);
				$.ajax({
			       cache: true,
			       type: "POST",
			       url:"updateSex",
			       data:{sex:id},
			       timeout:5000,
			       async: false,
			       beforeSend:function(XMLHttpRequest){
			       },
			       success: function (data){
					  jSuccess('已修改');
			       },
			       error: function () {
			         jNotify("服务器或者网络错误",{ShowOverlay : false});
			       }
				});
			}			
			sexSelect();
		});
		$(".registered_zc").click(function(){
			if(is_weixn()){
				location.href="../user/toLogout"
			}else{
				location.href="../user/toLogout"
			}
			
		});

	})


</script>
</body>
</html>
