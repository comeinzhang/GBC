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
    <script type="text/javascript" src="../static/iconfonts/icon_url.js"></script>
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
    <title>我的感恩奖</title>
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
</head>
<body>
<div class="container myct">
    <span class="back" onClick="javascript :history.back(-1);"></span>
    <p>我的感恩奖</p>
</div>
<div class="container">
    <div class="spread brokerage_top">
        <p class="spread_p1">总业绩(元)</p>
        <p class="spread_p2" style="font-size: 35px;">
        	${totalAmount}
        </p>
    </div>
    <div style="text-align: right;background:#EE4F3B;padding-right: 10px;"><a href="myOweDetail?type=${type }" target="_self">线上业绩明细</a><i class="iconfont icon-gengduo1 icon-por"></i></div>
    <div class="brokerage_info border-bottom">
        <%--
        <div class="brokerage_info_tabl brokerage_info_tab2">
          <p>历史累计佣金(元)</p>
          <span>${shop.maxMoney }</span>
        </div>
        <div class="brokerage_info_tabl">
          <p>最近一笔佣金(元)</p>
          <span>${shop.latelyMoney }</span>
        </div>
        --%>
        <div class="brokerage_info_tabl1 brokerage_info_tab2">
          <p>本月业绩</p>
          <span style="font-size: 23px;">${monthAmount}</span>
        </div>
        <div class="brokerage_info_tabl1 brokerage_info_tab2">
          <p>奖金比例</p>
          <span style="font-size: 23px;">${bonus}</span>
        </div>
        <div class="brokerage_info_tabl1  brokerage_info_tab2">
          <p>本月感恩奖</p>
          <span style="font-size: 23px;">${monthBonus}</span>
        </div>
        <div class="brokerage_info_tabl1">
          <p>可提感恩奖</p>
          <span style="font-size: 23px;">${pickUpOwe}</span>
        </div>
        <div class="clear"></div>
    </div>
     <div class="withdraw_cash_btn"> 
         <a href="toLogin2?url=applyPickUpOwe" target="_self">申请提现</a> 
     </div> 
    <!--下级分店-->
    <div class="next_Shop_list">
        
    </div>
     <script>
     var type='${type}';
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
			        	var data={pages:pages,type:type,flag:"xx"};
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
			                        	var totalPrice = n.order.totalPrice;
			                            lis += "<div class='next_Shop_info'>"
				                            + "<p>订单号: <span>"+n.orderNum+"</span></p>"
				                            + "<p>商品总价: <span>"+totalPrice+"</span></p>"
				                            + "<p>惠享分支付金额: <span>"+n.order.prePayment+"</span></p>"
				                            + "<p>佣金  : <span>"+n.givemoney+"</span></p>"
				                            + "<p>时间  : <span>"+n.createTime+"</span></p>"
				                            + "<p>买家 : <span>"+n.buyer.loginName+"</span></p>"
				                            + "<p>卖家  : <span>"+n.seller.loginName+"</span></p>"
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
