<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String lastPage = request.getHeader("referer");
%>
<!DOCTYPE HTML >

<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <meta content="yes" name="apple-mobile-web-app-capable" />
    <meta content="black" name="apple-mobile-web-app-status-bar-style" />
    <meta content="telephone=no" name="format-detection" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/base.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/slide.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/jNotify.jquery.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/webuploader.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/goods_xq.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jNotify.jquery.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/QryUrlStrParam.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/webuploader.nolog.js"></script>  
    <title>商品详细</title>
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script type="text/javascript">
jQuery(function() {
    var $ = jQuery,
        $list = $('#fileList'),
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

        // swf文件路径
        swf: '../static/js/Uploader.swf',

        // 文件接收服务端。
        server: 'saveReplyImg',

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
    	if(i>2){
    		alert("最多只能传3张图片");
    		return false;
    	}
        var $li = $(
                '<div id="' + file.id + '" class="file-item thumbnail">' +
                    '<img>' +
                    '<div class="info">' + file.name + '</div>' +
                '</div>'
                ),
            $img = $li.find('img');

        $list.append( $li );

        // 创建缩略图
        uploader.makeThumb( file, function( error, src ) {
            if ( error ) {
                $img.replaceWith('<span>不能预览</span>');
                return;
            }

            $img.attr( 'src', src );
        }, thumbnailWidth, thumbnailHeight );
    });

    // 文件上传过程中创建进度条实时显示。
    uploader.on( 'uploadProgress', function( file, percentage ) {
        var $li = $( '#'+file.id ),
            $percent = $li.find('.progress span');

        // 避免重复创建
        if ( !$percent.length ) {
            $percent = $('<p class="progress"><span></span></p>')
                    .appendTo( $li )
                    .find('span');
        }

        $percent.css( 'width', percentage * 100 + '%' );
    });

    // 文件上传成功，给item添加成功class, 用样式标记上传成功。
    uploader.on( 'uploadSuccess', function( file,response ) {
    	i++;
        $( '#'+file.id ).addClass('upload-state-done');
        var $input = $(
                '<input name="imgUrl'+i+'" id="goodsId" value="'+response._raw+'" type="hidden"/>'
                );
        $list.append( $input );
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
});
function sumbit(){
	$.ajax({
		cache: true,
        type: "POST",
        url:"saveReply",
        data:$('#replyForm').serialize(),
        async: false,
        error: function(request) {
            jError('评论失败', {ShowOverlay: false});
        },
        success: function(data) {
        	jSuccess('评论成功',{ShowOverlay:window.location.href='<%=lastPage%>'});
        }
	});
	
}
	</script>
</head>
<body>
<div class="myct">
	<span class="back" onClick="javascript :history.back(-1);"></span>
  	<p>商品评价</p>
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
            <li><a href="../user/mycenter" target="_self"><i class="index_menu_icon4"></i>个人中心</a></li>
		</ul>
	</div>
</div>
<div class="clear"></div>
<div class="container">
    <div class="xzspgg_sp">
	       	  	<img src="${ASSET_URL }${goods.headImgUrl}" width="66">
	            <h1>${goods.name }</h1>    
            <p class="xzspgg_sp_hh">
            	<c:if test="${!empty spec }">
	                	${spec.specName }:${spec.specValue }　
	             </c:if>
            </p>  
            <div class="clear"></div>
        </div>
    <div class="clear"></div>
    <form action="" method="post" id="replyForm">
    <div class="comments">
    	<ul>
        	<li class="comments_1 comments_1_1"><span></span>好评</li>
            <li class="comments_2"><span></span>中评</li>
            <li class="comments_3"><span></span>差评</li>
        </ul>
        <input name="goodsId" id="goodsId" value="${goods.id }" type="hidden"/>
        <input name="detailId" id="detailId" value="${detail.id }" type="hidden"/>
        <input name="star" id="star" type="hidden" value="good"/>
        <div class="clear"></div>
        <div class="comments_4">
       		<textarea name="reply" onfocus="this.value='';" onblur="if(this.value==''){this.value='亲，爱要大声说出来，对其他顾客有很大帮助喔~~'}">亲，爱要大声说出来，对其他顾客有很大帮助喔~~
            </textarea>
        </div>
        <div id="uploader-demo" style="width:93%;margin: 0 auto; margin-bottom:30px;">
    		<div id="fileList" class="uploader-list" >
    		</div>
        	<div id="filePicker">选择图片</div>
    	</div>
     	<div class="clear"></div> 
             	<!--<p class="registered_zc">评论</p>-->
    </div>
    
    </form>
	<script>
		$(document).ready(function(){
		
			$(".index_menubtn").click(function(){
				$(".index_menu").stop().fadeToggle('flow');
			});
			$(".comments ul li").click(function(){
				var eqstr = parseInt($(".comments ul li").index(this))
				if(eqstr=="0"){
					$(this).addClass("comments_1_1").siblings().removeClass("comments_2_2").removeClass("comments_3_3");
					$("#star").val("good");
				}
				if(eqstr=="1"){
					$(this).addClass("comments_2_2").siblings().removeClass("comments_1_1").removeClass("comments_3_3");
					$("#star").val("normal");
				}
				if(eqstr=="2"){
					$(this).addClass("comments_3_3").siblings().removeClass("comments_2_2").removeClass("comments_1_1");
					$("#star").val("bad");
				}
			})
		});
	</script>
</div>
 
<div class="container submit_yf border_top buy_submit">
	<div class="submit_btn" onclick="sumbit()">发表评论</div>
</div>

</body>
</html>
