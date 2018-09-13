<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page language="java" import="com.tyh.model.ProConfigMap" %>
<%
String codeUrl = ProConfigMap.configMap.get("codeUrl");
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
    <link rel="stylesheet" href="../static/css/base_yph1.css">
    <link rel="stylesheet" href="../static/css/style_yph.css">
    <link rel="stylesheet" href="../static/css/ycys.css">
    <script type="text/javascript" src="../static/iconfonts/icon_url.js"></script>
    <script type="text/javascript" src="../static/js/jquery.min.js"></script>
	<link rel="stylesheet" href="../static/css/jNotify.jquery.css">
	<script type="text/javascript" src="../static/js/jNotify.jquery.js"></script>
	<script type="text/javascript" src="../static/js/yxMobileSlider.js"></script>
    <title>首页</title>
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<style type="text/css">
		.tab-content img{
		width: 100%;
		}
	</style>
  </head>
<body>
<div class="goods-info">
    <div class="p-heat">
        <span class="back-btn" onclick="javascript :history.back(-1);"></span>
        <div class="title">定制详情</div>
    </div>
    <!--选规格弹出-->
    <div class="specifications-add">
        <div class="mask"></div>
        <div class="select-box">
            <div class="close-add"><i class="iconfont icon-cha"></i></div>
            <form action="" method="post" id="dzForm">
            <input type="hidden" name="dzId" value="${goods.id }"/>
            <div class="add25">
                <p class="p1"><span class="sp1">姓　　名:</span><span class="sp2"><input type="text" name="name"  placeholder="请输入姓名"></span></p>
                <p class="p1"><span class="sp1">联系方式:</span><span class="sp2"><input type="text" name="phone" placeholder="请输入联系方式"></span></p>
                <p class="p1"><span class="sp1">地　　址:</span><span class="sp2"><input type="text" name="addr"  placeholder="请输入地址"></span></p>
                <p class="p1"><span class="sp1">备　　注:</span><span class="sp2"><input type="text" name="mark"  placeholder="请输入备注"></span></p>
            </div>
            <div class="bottom-btn">
                <p class="p2" style="width: 100%;" onclick="replyDz();">提交</p>
            </div>
            </form>
        </div>
    </div>
    <div class="tab">
        <div class="tab-content">
        	${goods.content }
        </div>
    </div>
    <div class="bottom">
        <div class="gys">
            <i class="iconfont icon-yaoqing"></i><br>
            <a href="tel:4000167117"><label>客服</label></a>
        </div>
        <div class="shoppingCart" onclick="goGoodsCar()">
            <i class="iconfont icon-goumai1"></i><br>
            购物车
        </div>
        <c:if test="${empty store}">
        <div class="collect"  id="collectionAction">
            <i class="iconfont icon-wujiaoxing2"></i><br>
            	<span id="collection">收藏</span>
        </div>
        </c:if>
        <c:if test="${!empty store}">
        <div class="collect"  id="collectionActioned">
            <i class="iconfont icon-wujiaoxingshixin"></i><br>
            	<span id="collection">已收藏</span>
        </div>
        </c:if>
        <div class="play-btn clearfix">
            <p class="addShoppingCart">邀请好友</p>
            <c:if test="${empty dz}">
			<p class="goPlay">我要定制</p>	
			</c:if>
			<c:if test="${!empty dz}">
			<p class="goPlayed">已定制</p>
			</c:if>
        </div>
    </div>
</div>
    <script>
    	var goods_id = ${goods.id};
 		function is_weixn(){  
		    var ua = navigator.userAgent.toLowerCase();  
		    if(ua.match(/MicroMessenger/i)=="micromessenger") {  
		        return true;  
		    } else {  
		        return false;  
		    }  
		}
        //规格弹出
        $('.goPlay').click(function(){
            $('.specifications-add').show();
        });
        $('.close-add').click(function(){
            $('.specifications-add').hide();
        });
        $('.collect').click(collectionOperation);
        function collectionOperation(){
            var className = $('.collect').attr("id");
            var url="";
            var msg="";
            if(className == 'collectionAction'){
            	url="saveGoodsInStore";
            	msg="收藏成功";
            }else if(className == 'collectionActioned'){
            	url="deleteGoodsStore";
            	msg="取消成功";
            }
            var user = '${sessionScope.user}';
		                	if(user==null||user==""){
		                		var url1 = window.location.href;
		                		if(is_weixn()){
		                			window.location.href=<%=codeUrl%>+url1+"#wechat_redirect";
		                		}else{
		                			window.location.href="../user/toLogin?url="+url1;
		                		}
		                	}else{
                	var data={goods_id:goods_id,flag:"1"};
					$.ajax({
		                cache: true,
		                type: "POST",
		                url:url,
		                data:data,
		                timeout:5000,
		                async: false,
		                error: function(request) {
		                		jError('添加失败', {ShowOverlay: false});
		                },
		                success: function(data) {
							jSuccess(msg);
		                    if(className == 'collectionAction')
		                    {
		                        $('.collect').attr('id','collectionActioned');
		                        $('#collection').html("已收藏");
		                        $('.collect i').addClass("icon-wujiaoxingshixin")
		                        $('.collect i').removeClass("icon-wujiaoxing2")
		                    }
		                    else if(className == 'collectionActioned')
		                    {
		                        $('.collect').attr('id','collectionAction');
		                        $('.collect i').addClass("icon-wujiaoxing2")
		                        $('.collect i').removeClass("icon-wujiaoxingshixin")
		                        $('#collection').html("收藏");
		                    }
		                }
		            });
		         }   
        }
        function goGoodsCar(){
		   	window.location.href="getGoodsCar";
		   }
        $('.addShoppingCart').click(function(){
			var url = window.location.href;
			url = url.replace("&flag=app", "");
			var title='${goods.name}';
			var summarize='${goods.summarize}';
			var img='${ASSET_URL }'+'${goods.headImgUrl }';
            location.href="http://www.fenxiang.com?===="+url+"===="+title+"===="+summarize+"===="+img;
        });
        function replyDz(){
     	var user = '${sessionScope.user}';
		                	if(user==null||user==""){
		                		var url1 = window.location.href;
		                		if(is_weixn()){
		                			window.location.href=<%=codeUrl%>+url1+"#wechat_redirect";
		                		}else{
		                			window.location.href="../user/toLogin?url="+url1;
		                		}
		                	}else{
					$.ajax({
		                cache: true,
		                type: "POST",
		                url:'${pageContext.request.contextPath}'+"/goods/replyDz",
		                data:$('#dzForm').serialize(),
		                async: true,
		                error: function(request) {
		                    alert("Connection error");
		                },
		                success: function(data) {
		                	jSuccess('提交成功',{ShowOverlay:window.location.reload()});
		                }	
		  			});
		}  
	}
    </script>
</body>
</html>
