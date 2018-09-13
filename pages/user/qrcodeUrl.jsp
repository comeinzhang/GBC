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
    <!--Safari书签图标-->
    <link rel="apple-touch-icon-precomposed" href="../static/img/bookmark.png"/>
    <link rel="stylesheet" href="../static/css/base_yhlm.css">
    <link rel="stylesheet" href="../static/css/qr.css">
    <script type="text/javascript" src="../static/js/jquery.min.js"></script>
    <link rel="stylesheet" href="http://at.alicdn.com/t/font_muphn6qn9hdrt3xr.css">
    <script src="http://res.wx.qq.com/open/js/jweixin-1.2.0.js"></script>
    <script type="text/javascript">
    var url = location.href.split('#').toString();
    $.ajax({
	    type : "POST",  
	    url : "${pageContext.request.contextPath}/user/getWxConfig", 
	    dataType : "html",
	    async : false, 
	    data:"url="+url,  
	    success : function(dataStr) {
	        var data = $.parseJSON(dataStr);
	        wx.config({  
	            debug: false,  
	            appId: data.appid,  
	            timestamp: data.timestamp,  
	            nonceStr: data.nonceStr,  
	            signature: data.signature,          
	            jsApiList: [  
	                'onMenuShareTimeline', 'onMenuShareAppMessage', 'onMenuShareQQ', 'onMenuShareWeibo', 'onMenuShareQZone'  
	            ]  
	        });  
	    }, 
	    error: function(xhr, status, error) {  
	        alert(status);  
	        alert(xhr.responseText);  
	    },  
	});
    wx.ready(function(){
	    // 获取"分享到朋友圈"按钮点击状态及自定义分享内容接口  
	    wx.onMenuShareTimeline({
	    	title: '${webName}', // 分享标题  
	        desc: '${webName}', 
	        link: 'http://${DOMAIN_NAME}/user/qrcodeUrl?ticket='+'${ticket}',
	        imgUrl: '${ASSET_URL }${webLogo}'
	    });  
	      
	      
	    // 获取"分享给朋友"按钮点击状态及自定义分享内容接口  
	    wx.onMenuShareAppMessage({  
	    	title: '${webName}', // 分享标题  
	        desc: '${webName}', 
	        link: '${DOMAIN_NAME}/user/qrcodeUrl?ticket='+'${ticket}',
	        imgUrl: '${ASSET_URL }${webLogo}'
	    });  
	      
	      
	    //获取"分享到QQ"按钮点击状态及自定义分享内容接口  
	    wx.onMenuShareQQ({
	    	title: '${webName}', // 分享标题  
	        desc: '${webName}', 
	        link: 'http://${DOMAIN_NAME}/user/qrcodeUrl?ticket='+'${ticket}',
	        imgUrl: '${ASSET_URL }${webLogo}'
	    }); 
	      
	      
	    //获取"分享到腾讯微博"按钮点击状态及自定义分享内容接口  
	    wx.onMenuShareWeibo({
	    	title: '${webName}', // 分享标题  
	        desc: '${webName}', 
	        link: 'http://${DOMAIN_NAME}/user/qrcodeUrl?ticket='+'${ticket}',
	        imgUrl: '${ASSET_URL }${webLogo}'
	    });  
	      
	      
	    //获取"分享到QQ空间"按钮点击状态及自定义分享内容接口  
	    wx.onMenuShareQZone({
	    	title: '${webName}', // 分享标题  
	        desc: '${webName}', 
	        link: 'http://${DOMAIN_NAME}/user/qrcodeUrl?ticket='+'${ticket}',
	        imgUrl: '${ASSET_URL }${webLogo}'
	    });  
	      
	});
	</script>
    <title>推广会员</title>
  </head>
<body>
<div class="p-heat">
    <span class="back-btn" onclick="javascript :history.back(-1);"></span>
    <div class="title">分享</div>
</div>
<div class="qr-s-index">
    <div>
        <img src="https://mp.weixin.qq.com/cgi-bin/showqrcode?ticket=${ticket}" width="100%">
    </div>
    <div class="d1">
        <p>向朋友推荐人人惠享</p>
        <p>便可享受推荐会员在平台线上线下消费总额的5‰</p>
        <p>只需推荐一次,便可永久获益</p>
    </div>
<%--    <div class="d2">--%>
<%--        <p>--%>
<%--            <img src="../static/images/qr_04.png">--%>
<%--            <span>分享至微信好友</span>--%>
<%--        </p>--%>
<%--        <p>--%>
<%--            <img src="../static/images/qr_06.png">--%>
<%--            <span>分享至朋友圈</span>--%>
<%--        </p>--%>
<%--    </div>--%>
</div>
</body>
</html>