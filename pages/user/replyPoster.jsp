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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/webuploader.css">
    <script type="text/javascript" src="../static/js/jquery.min.js"></script>
    <script type="text/javascript" src="../static/js/json2-min.js"></script>
    <script type="text/javascript" src="../static/js/QryUrlStrParam.js"></script>
    <script type="text/javascript" src="../static/js/QxPublic.js"></script>
    <script type="text/javascript" src="../static/js/jquery.min.js"></script>
	<link rel="stylesheet" href="../static/css/jNotify.jquery.css">
	<script type="text/javascript" src="../static/js/jNotify.jquery.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/webuploader.nolog.js"></script>  
    <title>我的店铺</title>
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script type="text/javascript">
jQuery(function() {
    var $ = jQuery,
        $list = $('.upload_box'),
        // 优化retina, 在retina下这个值是2
        ratio = window.devicePixelRatio || 1,

        // 缩略图大小
        thumbnailWidth = 100 * ratio,
        thumbnailHeight = 100 * ratio,
        // Web Uploader实例
        uploader;
		var i = 0;//上传成功个数
    // 初始化Web Uploader
    uploader = WebUploader.create({
        // 自动上传。
        auto: true,
        fileNumLimit: 9,
        // swf文件路径
        swf: '../static/js/Uploader.swf',
        // 文件接收服务端。
        server: '../order/saveReplyImg',
        // 选择文件的按钮。可选。
        // 内部根据当前运行是创建，可能是input元素，也可能是flash.
        pick: '#filePicker',
        // 只允许选择文件，可选。
        accept: {
            title: 'Images',
            extensions: 'gif,jpg,jpeg,bmp,png',
            mimeTypes: '/*'
        }
    });

    // 当有文件添加进来的时候
    uploader.on( 'fileQueued', function( file ) {
        // 创建缩略图;
        $list.html('');
    	var $li = $('<div class="img" id="' + file.id + '"><div class="warp-img pic"><img class="img'+ i +'"></div></div>'),
            $img = $li.find('img');
        $list.append( $li );
        
        uploader.makeThumb( file, function( error, src ) {
            if ( error ) {
                $img.replaceWith('<span>不能预览</span>');
                return;
            }

            $img.attr( 'src', src );
        }, thumbnailWidth, thumbnailHeight );

    });

//     文件上传过程中创建进度条实时显示。
    uploader.on( 'uploadProgress', function( file, percentage ) {
        var $li = $( '#'+file.id ),
            $percent = $li.find('.progress span');
//         避免重复创建
        if ( !$percent.length ) {
            $percent = $('<p class="progress"><span></span></p>')
                    .appendTo( $li )
                    .find('span');
        }
        $percent.css( 'width', percentage * 100 + '%' );
    });

    // 文件上传成功，给item添加成功class, 用样式标记上传成功。
    uploader.on( 'uploadSuccess', function( file,response ) {
//         $( '#'+file.id ).addClass('upload-state-done');
//         var $input = $(
//                 '<input name="chartUrl" id="' + file.id + '" value="'+response._raw+'" type="hidden"/>'
//                 );
//         $list.append( $input );
        $("input[name=headImgUrl]").val(response._raw);
//         alert(response._raw);
    });

    // 文件上传失败，现实上传出错。
    uploader.on( 'uploadError', function( file ) {
        var $li = $( '#'+file.id ),
            $error = $li.find('div.error');

        // 避免重复创建
        if ( !$error.length ) {
            $error = $('<div class="error"></div>').appendTo( $li );
        }

        $error.text('上传失败');
    });

    // 完成上传完了，成功或者失败，先删除进度条。
    uploader.on( 'uploadComplete', function( file ) {
        $( '#'+file.id ).find('.progress').remove();
    });
//     uploader.on('error', function(handler) {
// 		if(handler=="Q_EXCEED_NUM_LIMIT"){
// 			alert("超出最大张数9张");
// 		}
// 		if(handler=="F_DUPLICATE"){
// 			alert("文件重复");
// 		}
// 	});
});
</script>
</head>
<body>
<div class="container login1 myct">
	<span class="back" onClick="javascript :history.back(-1);"></span>
  	<p>申请早餐配送</p>
</div>
<div class="container">
	<form action="" method="post" id="posterForm">
	<div class="registered">
   		<p><span class="x-block">*</span>手　机 : <input type="text" name="phone"   placeholder="请输入手机号" ></p>
        <p><span class="x-block">*</span>验证码 : <input type="text" class="registered_yzm" id="checkCode" name="checkCode"  placeholder="验证码"><input type="button" class="registered_gethpone" value="获取手机验证码" ></p>
        <p><span class="x-block">*</span>姓	名 : <input type="text" name="name"   placeholder="请输入姓名" ></p>
        <p><span class="x-block">*</span>年	龄 : <input type="text" name="age"   placeholder="请输入年龄" ></p>
        <p><span class="x-block">*</span>推荐人电话 : <input type="text" name="referPhone"   placeholder="请输入推荐人电话" ></p>
        <p><span class="x-block">*</span>价格/次 （元）: <input type="text" name="priceoft" onKeypress="return (/[\d.]/.test(String.fromCharCode(event.keyCode)))"  placeholder="请输入年龄" ></p>
        <p><span class="x-block">*</span>详细地址 : <span>${garden.country }${garden.province }${garden.city }${garden.area }${garden.town }</span><input type="text" name="addr" style="padding-left: 75px;"  placeholder="请输入所在小区的详细地址" ></p>
        <p><span class="x-block">*</span>身份证号 : <input type="text" name="card"   placeholder="请输入身份证号码" ></p>
        <div class="upload-goods-block">
        		<input name="headImgUrl" type="hidden"/>
                <span class="x-block">*</span> 头像 : 
                <div class="upload-goods-block-minimg">
                	<div class="upload_box">
                    </div>
                    <div class="clear"></div>
                </div>
                <p id="filePicker" style="height: 100px;">上传头像</p>
                <div class="clear"></div>
            </div>
    </div>
    </form>
    <p class="registered_zc">申请</p>
</div>

<script>
    $(function(){
        $('.registered_gethpone').click(function(){
            var btn = $(this);
            var count = 60;
            var phone = $('input[name="phone"]').val().trim();
		  	var myphreg = /^(((13[0-9]{1})|(15[0-9]{1})|(18[0-9]{1}))+\d{8})$/;
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
			                    btn.css({"color":"#fff","border":"1px #999 solid","background":"#999"})
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
		  	var myphreg = /^(((13[0-9]{1})|(15[0-9]{1})|(18[0-9]{1}))+\d{8})$/;
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
			var formData = new FormData($( "#posterForm" )[0]);
			$.ajax({
			       cache: true,
			       type: "POST",
			       url:"replyPoster",
			       data:formData,
				   async: false,
				   timeout:10000,
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
					  	  alert("您已是送餐人员或正在审核中！请勿重复提交！");
					  	  location.href="mycenter";
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
