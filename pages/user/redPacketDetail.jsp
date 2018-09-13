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
    <title>惠享明细</title>
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
</head>
<body>
<div class="container myct">
    <span class="back" onClick="javascript :history.back(-1);"></span>
    <p>惠享明细</p>
</div>
<div class="container">
    <div class="next_Shop_list">
	    <c:forEach items="${redPacketList}" var="record">
	        <div class='next_Shop_info'>
	        	<c:if test="${record.type eq 0}">
				<p>赠送金额: <span>${record.givemoney}</span></p>
				</c:if>
				<c:if test="${record.type eq 1}">
				<p>消费金额: <span>${record.givemoney}</span></p>
				</c:if>
				<c:if test="${record.type eq 4}">
					<p>惠享豆: <span>+${record.redNum }</span></p>
				</c:if>
				<c:if test="${record.type ne 4}">
					<p>惠享豆: <span>-${record.redNum }</span></p>
				</c:if>
				<p>生成时间: <span>${record.createTime }</span></p>
			</div>
		</c:forEach>
    </div>
</div>
<script>
     function accMul(arg1,arg2)
 	{
 		var m=0,s1=arg1.toString(),s2=arg2.toString();
 		try{m+=s1.split(".")[1].length}catch(e){}
 		try{m+=s2.split(".")[1].length}catch(e){}
 		return Number(s1.replace(".",""))*Number(s2.replace(".",""))/Math.pow(10,m)
 	}
 	function accAdd(arg1,arg2){  
 	    var r1,r2,m;  
 	    try{r1=arg1.toString().split(".")[1].length}catch(e){r1=0}  
 	    try{r2=arg2.toString().split(".")[1].length}catch(e){r2=0}  
 	    m=Math.pow(10,Math.max(r1,r2))  
 	    return (arg1*m+arg2*m)/m  
 	}
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
                        if(list_count > 0 && pages > list_count / 10){
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
			        	var data={pages:pages,type:"hx"};
			            $.ajax({
			            	cache: true,
			                type: "POST",
			                url:"bonusList",
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
			                        	var type = n.type;
			                        	var flag="";
			                        	var flag1="";
			                        	if(type==0){
			                        		flag="+";
			                        		flag1="-";
			                        	}
			                        	if(type==1){
			                        		flag="-";
			                        	}
			                        	if(type==9){
			                        		flag1="+";
			                        	}
			                            lis += "<div class='next_Shop_info'>"
				                            + "<p>惠享分: <span>"+flag+n.givemoney+"</span></p>"
				                            + "<p>惠享豆  : <span>"+flag1+n.redNum+"</span></p>"
				                            + "<p>时间  : <span>"+n.createTime+"</span></p>"
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
</body>
</html>
