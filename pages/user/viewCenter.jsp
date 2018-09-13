<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <meta content="yes" name="apple-mobile-web-app-capable" />
    <meta content="black" name="apple-mobile-web-app-status-bar-style" />
    <meta content="telephone=no" name="format-detection" />
    <link rel="stylesheet" href="/TYHWX/static/css/comp_base.css">
    <link rel="stylesheet" href="/TYHWX/static/css/center.css">
    <link rel="stylesheet" href="/TYHWX/static/css/Tip.css">
	<script src="/TYHWX/static/js/jquery.min.js"></script>
    <script src="/TYHWX/static/js/Tip.js"></script>
    <script src="/TYHWX/static/js/comjs.js"></script>
    <script src="http://res.wx.qq.com/open/js/jweixin-1.0.0.js"></script>
    <title>${member.comy_name }</title>
    <script type="text/javascript">
    var url = location.href.split('#').toString();
    $.ajax({
	    type : "POST",  
	    url : "/TYHWX/user/getWxConfig", 
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
	        title: '${member.comy_name}', // 分享标题  
	        desc: '公司简介', 
	        link: 'http://m.kxiaozao.com/TYHWX/user/viewCenter?id='+'${member.id}'
	    });  
	      
	      
	    // 获取"分享给朋友"按钮点击状态及自定义分享内容接口  
	    wx.onMenuShareAppMessage({  
	        title: '${member.comy_name}', // 分享标题  
	        desc: '公司简介',
	        link: 'http://m.kxiaozao.com/TYHWX/user/viewCenter?id='+'${member.id}'  
	    });  
	      
	      
	    //获取"分享到QQ"按钮点击状态及自定义分享内容接口  
	    wx.onMenuShareQQ({  
	    	title: '${member.comy_name}', // 分享标题  
	    	desc: '公司简介',
	        link: 'http://m.kxiaozao.com/TYHWX/user/viewCenter?id='+'${member.id}' 
	    });  
	      
	      
	    //获取"分享到腾讯微博"按钮点击状态及自定义分享内容接口  
	    wx.onMenuShareWeibo({  
	    	title: '${member.comy_name}', // 分享标题  
	    	desc: '公司简介',
	        link: 'http://m.kxiaozao.com/TYHWX/user/viewCenter?id='+'${member.id}'
	    });  
	      
	      
	    //获取"分享到QQ空间"按钮点击状态及自定义分享内容接口  
	    wx.onMenuShareQZone({  
	    	title: '${member.comy_name}', // 分享标题  
	    	desc: '公司简介',
	        link: 'http://m.kxiaozao.com/TYHWX/user/viewCenter?id='+'${member.id}'
	    });  
	      
	});  
    
    
    
    
    	window.preViewImg = (function(){
			var imgsSrc = {};
			function reviewImage(dsrc, gid) {
			    if (typeof window.WeixinJSBridge != 'undefined') {
			        WeixinJSBridge.invoke('imagePreview', {
			            'current' : dsrc,
			            'urls' : imgsSrc[gid]
			        });
			    }else{
			    	alert("请在微信中查看", null, function(){});
			    }
			}
			function init(thi, evt){
				var dsrc = thi.getAttribute("data-src");
				var gid = thi.getAttribute("data-gid");
		
				if(dsrc && gid){
					imgsSrc[gid] = imgsSrc[gid]||[];
					imgsSrc[gid].push(dsrc);
					thi.addEventListener("click", function(){
						reviewImage(dsrc, gid);
					}, false);
				}
			}
			return init;
		})();
    </script>
<style type="text/css">
a{ -webkit-tap-highlight-color:rgba(255, 0, 0, 0); }
ul, li { list-style:none; margin:0; padding:0 }
.top_bar { position: fixed; z-index: 900; bottom: 0; left: 0; right: 0; margin-t: auto; font-family: Helvetica, Tahoma, Arial, Microsoft YaHei, sans-serif; }
.top_menu { display:-webkit-box; border-top: 1px solid #b3b3b3; display: block; width: 100%; background: rgba(255, 255, 255, 0.7); height: 45px; display: -webkit-box; display: box; margin:0; padding:0; -webkit-box-orient: horizontal; background: -webkit-gradient(linear, 0 0, 0 100%, from(#e7e4e7), to(#b9b9b9)); box-shadow: 0 1px 0 0 rgba(255, 255, 255, 0.9) inset; }
.top_bar .top_menu>li { -webkit-box-flex:1; background: -webkit-gradient(linear, 0 0, 0 100%, from(rgba(0, 0, 0, 0.1)), color-stop(50%, rgba(0, 0, 0, 0.2)), to(rgba(0, 0, 0, 0.2))), -webkit-gradient(linear, 0 0, 0 100%, from(rgba(255, 255, 255, 0.1)), color-stop(50%, rgba(255, 255, 255, 0.3)), to(rgba(255, 255, 255, 0.1))); -webkit-background-size: 1px 100%, 1px 100%; background-size: 1px 100%, 1px 100%; background-position: 1px center, 2px center; background-repeat: no-repeat; position:relative; text-align:center; width:33%; }
.top_bar .top_menu>li>a { line-height:45px; display:block; text-align:center; color:#4f4d4f; text-decoration:none; text-shadow: 0 1px rgba(255, 255, 255, 0.3); -webkit-box-flex:1; }
.top_menu>li:first-child { background:none; }
.top_bar .top_menu li a label { padding:0; font-size:14px; overflow:hidden; }
.top_bar .top_menu>li>a img { display: inline-block; height: 14px; width: 14px; margin-top:-2px; color: #fff; line-height: 40px; vertical-align:middle; }
.top_bar li:first-child a { display: block; }
.top_menu li:last-of-type a { background: none; }
.top_menu>li:last-of-type>a label { padding: 0 0 0 3px; }
.top_bar .top_menu>li>a:hover, .top_bar .top_menu>li>a:active { background-color:#CCCCCC; }
.mod-share{
    overflow: hidden;
    width: 96%;
    margin-left:2%;
    margin-top:40px;
    padding-bottom:40px;
    text-align: center;
}

.share-btn {
    background: #D6D6D6;
    border: 1px solid #CCCCCC;
    border-radius: 5px;
    height: 30px;
    line-height: 30px;
    text-align: center;
    color: #444444;
    width: 45%;
    display: inline-block;
}
.share-btn span{ height: 20px; line-height: 20px; display: inline-block;}
.ico-share {
    background: url(/TYHWX/static/images/ico-pyq.png) no-repeat 0 center;
    background-size:23px 20px;
    padding: 0 0 0 27px;
}
.ico-pyq{ background:url(/TYHWX/static/images/ico-share.png) no-repeat 0 center; background-size:21px 20px; padding:0 0 0 25px;}
.mod-pop{ position: fixed; width:100%; height: 100%; background: rgba(0,0,0,0.8); z-index: 9000; top:0; left: 0; display: none;}
.text-share{ background:url(/TYHWX/static/images/text.png) no-repeat right center; width:100%; height:155px; background-size:contain; top:0; display: block;}
</style>    
</head>
<body>
<div class="container mb60">
    <div class="pTop public-topB boxSD">
        <div class="text">${member.comy_name }</div>
    </div>
    <div class="center-base mt60">
        <form>
            <div class="education mt15 fff">
            	<div class="title border-bottom">公司简介：${member.comy_resume }</div>
				<div class="title border-bottom">单位地址：${member.comy_addr }</div>
				<div class="title border-bottom">联系电话：${member.phone_num }</div>
				<div class="title border-bottom">产品简介:</div>
				<div>
				<c:forEach var="product" items="${productList}">
				<img src= "${ASSET_URL }${product.img_url}" style="padding-bottom: 10px;" width="100%;" data-src= "${ASSET_URL }${product.img_url}" data-gid="g7"  onload="preViewImg(this, event);"/>
				</c:forEach>
				</div>
<!-- 				<div class="border-bottom" style="overflow-x:auto;position: relative;height:100px;padding:0px 10px;-webkit-box-sizing:border-box;white-space: nowrap;"> -->
<!-- 				<c:forEach var="product" items="${productList}"> -->
<!-- 				<img src= "${ASSET_URL }${product.img_url}" height="100%" style="max-width:25%;" data-src= "${ASSET_URL }${product.img_url}" data-gid="g7"  onload="preViewImg(this, event);"/> -->
<!-- 				</c:forEach> -->
<!-- 				</div> -->
            </div>
        </form>
    </div>
</div>
<div class="mod-pop" id="pop-share" onclick="hidePop('#pop-share')"><span class="text-share"></span></div>
</body>
</html>
