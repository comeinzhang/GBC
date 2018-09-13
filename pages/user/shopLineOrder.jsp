<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
    <script type="text/javascript" src="../static/js/json2-min.js"></script>
    <script type="text/javascript" src="../static/js/QryUrlStrParam.js"></script>
    <script type="text/javascript" src="../static/js/QxPublic.js"></script>
    <script type="text/javascript" src="../static/js/jquery.min.js"></script>
	<link rel="stylesheet" href="../static/css/jNotify.jquery.css">
	<script type="text/javascript" src="../static/js/jNotify.jquery.js"></script>
    <title>线下订单</title>
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
</head>
<body>
<div class="container myct">
    <span class="back" onClick="javascript :history.back(-1);"></span>
    <p>线下订单</p>
</div>
<div class="container">
    <!--下级分店-->
    <div class="next_Shop_list">
        
    </div>
     <script>
            $(function(){
                //分页加载
                var pages = 0;//初始页
                var list_count='';
                var isLastPage = false;
                var goodsGetIn=false;
                var ASSET_URL = '${ASSET_URL}';
                var loaDingGif = '<div class="spinner">'
                        +'<div class="bounce1"></div>'
                        +'<div class="bounce2"></div>'
                        +'<div class="bounce3"></div>'
                        +'</div>';
                window.onscroll = function(){
                    if(($(window).scrollTop()+50) >= ($(document).height() - $(window).height())){
                        if(list_count > 0 && pages> list_count / 10){
                            isLastPage = true;
                        }else{
                        	getGoods();
                        }
                    }
                };
                getGoods();
			    function getGoods(){
			        if(!isLastPage && !goodsGetIn){
			        	pages=parseInt(pages)+1;
			        	var data={pages:pages}
			            $.ajax({
			            	cache: true,
			                type: "POST",
			                url:"selectLineDetailListPage",
			                data:data,
			                timeout:5000,
			                async: false,
			                beforeSend:function(XMLHttpRequest){
			                	//努力加载
			                    $('.next_Shop_list').append(loaDingGif);
			                    goodsGetIn = true;
			                },
			                success: function (data){
			                    //请求成功时处理
			                    if(data.list.length != null && data.list.length != 'undefined'){
			                        list_count=data.page.totalResult;
			                        var lis = '';
			                        $(data.list).each(function(i,n){
			                            lis += "<div class='next_Shop_info'>"
				                            + "<p>订单号: <span>"+n.orderNum+"</span></p>"
				                            + "<p>商品名称: <span>"+n.goodsName+"</span></p>"
				                            + "<p>销售金额: <span>"+n.totalPrice+"</span></p>"
				                            + "<p>订单时间: <span>"+n.enableTime+"</span></p>"
				                            + "</div>";
			                        });
			                        $(".next_Shop_list").append(lis);
			                    }
			                },
			                complete:function(){
			                	$('.spinner').remove();//加载完成
			                    goodsGetIn=false;
			                },
			                error: function () {
			                    jNotify("服务器或者网络错误",{ShowOverlay : false});
			                }
			            });
			        }
			    }
            });
        </script>
</div>
</body>
</html>
