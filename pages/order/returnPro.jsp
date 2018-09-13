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
    <link rel="stylesheet" href="../static/css/jNotify.jquery.css">
    <script type="text/javascript" src="../static/js/jquery.min.js"></script>
    <script type="text/javascript" src="../static/js/jNotify.jquery.js"></script>
    <title>退款/售后详情</title>
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script type="text/javascript">
		var id = '${id}';
		function saveEMS(){
			var EMS = $("#EMS").val();
			var emscode = $("#emscode").val();
			var data = {id:id,EMS:EMS,emscode:emscode};
			$.ajax({
				type : "post",
				async : false,  //同步请求
				url : "saveEMS",
				timeout:5000,
				data:data,
				success:function(dates){
					jSuccess('保存成功');
				},
				error: function() {
					jError('保存失败', {ShowOverlay: false});
		        }
			});
		}
	</script>
</head>
<body>
<div class="myct">
	<span class="back" onClick="javascript :history.back(-1);"></span>
  	<p>申请退货</p>
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
    <script>
        $(document).ready(function(){
            $(".index_menubtn").click(function(){
                $(".index_menu").stop().fadeToggle('flow');
            })
        });
    </script>
</div>
<div class="container return_goods">
    <div class="return_goods_top">
        <p>处理进度<span>${fn:substring(returns.createTime,0,10)}</span></p>
    </div>
    <div class="psrogress_bar border_top">
        <script>
            $(document).ready(function(){
                var dom='${returns.status}';
                function psrogressBar(){
                    if(dom=="0"){
                        $(".psrogress_bar ul").addClass("psrogress_bar_1")//提交
                    }
                    if(dom=="0"){
                       $(".psrogress_bar ul").addClass("psrogress_bar_2")//审核
                    }
                    if(dom=="1"||dom=="4"||dom=="5"){
                       $(".psrogress_bar ul").addClass("psrogress_bar_3")//退款
                    }
                    if(dom=="2"){
                       $(".psrogress_bar ul").addClass("psrogress_bar_4")//完成
                    }
                }
                psrogressBar()
            })

        </script>
        <ul class="psrogress_bar_1">
            <li>提交</li>
            <li>审核中</li>
            <li>退款中</li>
            <li>完成</li>
        </ul>
        <div class="clear"></div>
    </div>
    <div class="return_goods_add mt10 mtb60">
        <div class="return_goods_title border_bottom">退货单号：${returns.orderNum}</div>
        <div class="return_item_details">
            <p>物流信息</p>
<!--             <span>收货人:</span> -->
<!--             <span>地址:</span> -->
            <span>快递公司:${returns.buyerEms}</span>
            <span>运单号码:${returns.buyerEmsCode}</span>
            <span>物流信息:</span>
            <p>问题描述:</p>
            <span>${returns.applyDesc}</span>
        </div>
    </div>
<!--     <div class="container submit_yf border_top buy_submit"> -->
<!--         <div class="submit_btn">取消退货</div> -->
<!--     </div> -->
</div>
</body>
</html>
