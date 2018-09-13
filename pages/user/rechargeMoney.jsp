<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page language="java" import="com.tyh.model.ProConfigMap" %>
<%
String codeUrl = ProConfigMap.configMap.get("codeUrl");
String APPID = ProConfigMap.configMap.get("APPID");
String DOMAIN_NAME = ProConfigMap.configMap.get("DOMAIN_NAME");
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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/webuploader.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/release.css">
    <script src="${pageContext.request.contextPath}/static/iconfonts/icon_url.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/base_yph.css">
    <link rel="stylesheet" href="../static/css/css.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jNotify.jquery.js"></script>
    <link rel="stylesheet" href="../static/css/jNotify.jquery.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/webuploader.nolog.js"></script>  
    
    <title>充值金额</title>
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<style>
		.registered_zc {
    background: #c40000 none repeat scroll 0 0;
    border-radius: 5px;
    color: #fff;
    height: 40px;
    line-height: 40px;
    margin: 0 auto;
    text-align: center;
    width: 45%;
    float:left;
}
	</style>
	
  </head>
<body ontouchstart>
    <div class="details-img-block">
        <div class="t-btn">
            <p class="p1" style="background:url(../static/img/back_03.png) 10px 12px no-repeat;background-size:20px;" onClick="javascript :history.back(-1);">&nbsp;</p>
        </div>
        <form action="releaseGoods" id="releaseGoodsForm">
        <div class="ui-set-list">
            <div class="row">
                <div class="warp">
                    <div class="name">充值额度</div>
                    <div class="ip">
                        <p class="t p1 alertTi" id="cointsNum"><input type="text" placeholder="请输入充值额度，单次最高充值5万元" onkeyup="if(isNaN(value))execCommand('undo')" onafterpaste="if(isNaN(value))execCommand('undo')"  name="coints" id="coints" style="border-left:0px;border-top:0px;border-right:0px;border-bottom:0px;width: 90%;"/></p>
                        <p class="ico p1  f-999"><i class="iconfont icon-riqi"></i></p>
                    </div>
                </div>
            </div>
            <div class="row">
            	<div class="warp">
                	<p class="registered_zc" onclick="toRecharge();">充值</p>
                	<c:if test="${sessionScope.webIn ne 'kxz'}">
                		<p class="registered_zc" style="float:right;" onclick="window.location.href='toLogin2?url=applyRechargeMoney'">提现</p>
                	</c:if>
                </div>
            </div>
        </div>
      </form>  
        <script>
        function accMul(arg1,arg2)
    	{
    		var m=0,s1=arg1.toString(),s2=arg2.toString();
    		try{m+=s1.split(".")[1].length}catch(e){}
    		try{m+=s2.split(".")[1].length}catch(e){}
    		return Number(s1.replace(".",""))*Number(s2.replace(".",""))/Math.pow(10,m)
    	}
			var userId = '${user.id}';
            $(function () {
//                $('.alertTi').click(function () {
//                    $('.ti-alert').fadeIn();
//                });
//                $('.maskBox, .close-ti-alert').click(function (){
//                    $('.ti-alert').hide();
//                });

                //选择时间
                $('.ti-block p').click(function () {
                    var str1 = $(this).html()
                    $('.ti-alert').hide();
                    $('#cointsNum').html( str1);
					$('#coints').val( str1);
                });
                

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
			        	var data={pages:pages,type:"ye"};
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
			                        	var flag="+";
			                        	var typeName="";
			                        	if(type==5||type==6||type==7){
			                        		flag="-";
			                        	}
			                        	if(type==5){
			                        		typeName="线下报单";
			                        	}
										if(type==6){
											typeName="提现";		                        		
										}
										if(type==7){
											typeName="购物消费";
										}
										if(type==8){
											typeName="充值";
										}
			                            lis += "<div class='next_Shop_info'>"
				                            + "<p>单号: <span>"+n.orderNum+"</span></p>"
				                            + "<p>增/减余额  : <span>"+flag+n.givemoney+"</span></p>"
				                            + "<p>类型  : <span>"+typeName+"</span></p>"
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
            function toRecharge(){
            	var coints = $("input[name=coints]").val();
            	if(coints==null||coints==""){
            		alert("请输入充值额度");
            		return false;
            	}
            	if(coints>50000){
            		alert("单次最高充值5万元");
            		return false;
            	}
            	coints = accMul(coints,100);
            	var state = coints+"CUT"+userId+"CUT"+"CZ";
            	window.location.href='https://open.weixin.qq.com/connect/oauth2/authorize?appid='+'<%=APPID%>'+'&redirect_uri=http://'+'<%=DOMAIN_NAME%>'+'/order/getWxOpenId&response_type=code&scope=snsapi_userinfo&state='+state+'#wechat_redirect';
            }
        </script>
        <div class="ti-alert none">
            <div class="maskBox"></div>
            <div class="ti-block">
                <div class="close-ti-alert">关闭  <i class="iconfont icon-cha"></i></div>
                <div>
                    <div class="title" id="nowDate">充值额度</div>
                    <div class="links clearFix">
                        <p>10</p>
                        <p>20</p>
                        <p>50</p>
                        <p>100</p>
                        <p>200</p>
                        <p>500</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="container">
	    <div class="next_Shop_list">
	    </div>
    </div>
</body>
</html>
