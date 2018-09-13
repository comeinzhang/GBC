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
        $("input[name=chartUrl]").val(response._raw);
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
  	<p>申请开店</p>
</div>
<div class="container">
	<div class="registered">
   		<p><span class="x-block">*</span>手　机 : <input type="text" name="phone"   placeholder="请输入手机号" ></p>
        <p><span class="x-block">*</span>验证码 : <input type="text" class="registered_yzm"  name="checkCode"  placeholder="验证码"><input type="button" class="registered_gethpone" value="获取手机验证码" ></p>
        <p>推荐人手机 : <input type="text" name="referPhone"  placeholder="请输入推荐人手机号"></p>
<%--        <div class="upload-goods-block">--%>
<%--        		<input name="chartUrl" type="hidden"/>--%>
<%--                <span class="x-block">*</span> 营业执照 : --%>
<%--                <div class="upload-goods-block-minimg1">--%>
<%--                	<div class="upload_box">--%>
<%--                    </div>--%>
<%--                    <div class="clear"></div>--%>
<%--                </div>--%>
<%--                <p id="filePicker" style="height: 100px;">上传营业执照</p>--%>
<%--                <div class="clear"></div>--%>
<%--            </div>--%>
    </div>
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
			var referPhone = $('input[name="referPhone"]').val().trim();
			if (referPhone == "" || referPhone.length == 0) {
				alert("请输入推荐人手机号码");
		  		return false;
			}
			var chartUrl = $('input[name="chartUrl"]').val().trim();
			$.ajax({
			       cache: true,
			       type: "POST",
			       url:"replyBreakerShop",
			       data:{phone:phone,checkCode:checkCode,chartUrl:chartUrl,referPhone:referPhone},
			       timeout:5000,
			       async: false,
			       beforeSend:function(XMLHttpRequest){
			       },
			       success: function (data){
			       	  data = parseInt(data);
			       	  if(data==1){
						  alert("提交成功，我们会在一个工作日内审核您的请求！");
						  location.href="mycenter";
					  }else if(data==2){
					  	  alert("验证码错误！");
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
