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
    <link rel="stylesheet" href="../static/css/base.css">
    <link rel="stylesheet" href="../static/css/style.css">
    <link rel="stylesheet" href="../static/css/jNotify.jquery.css">
    <script type="text/javascript" src="../static/js/jquery.min.js"></script>
    <script type="text/javascript" src="../static/js/jNotify.jquery.js"></script>
    <title>申请退货</title>
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
</head>
<body>
<div class="container myct">
	<span class="back" onClick="javascript :history.back(-1);"></span>
  	<p>
  	<c:if test="${type eq '0'}">申请退货</c:if>
  	<c:if test="${type eq '1'}">申请换货</c:if>
  	</p>
</div>
<div class="container return_goods">
    <div class="return_goods_top">
        <p>选择商品 *</p>
        <span class="return_goods_top_1">收到商品十五天内可以申请退货</span>
    </div>
    <ul class="all_orders_list return_goods_list" >
    <c:forEach items="${order.detailList }" var="detail">
        <li id="${detail.id}">
            <div class="goods_vi goods_vi_2">
<!--                 <div class="xzspgg_sp_2_1 xzspgg_sp_2_2">退款中</div> -->
                <img src="${ASSET_URL }${detail.goods.headImgUrl }" width="66">
                <h1>${detail.goods.name }</h1>
                <p class="all_orders_list_fl">
	                	价格:${detail.price }　
                </p>
                <p class="all_orders_list_fl">商品单号 : ${detail.orderNum }　</p>
                <div class="clear"></div>                
            </div>
        </li>
     </c:forEach>   
    </ul>
    <div class="return_goods_add mt10">
        <div class="return_goods_title border_bottom">联系信息 *</div>
        <div class="return_goods_info">
            <p class="return_goods_name">收件人 : ${addr.name }</p>
            <p class="return_goods_phne">电　话：${addr.phone }</p>
            <div class="clear"></div>
            <p class="return_goods_add">地　址：${addr.addr }</p>
        </div>
    </div>
    <div class="return_goods_add mt10 mtb60">
        <div class="return_goods_title border_bottom">问题描述 *</div>
        <c:if test="${type eq '0'}">
	        <div class="return_goods_describe">
	        	退款金额：<input type="text" id="rePrice">
	        </div>
        </c:if>
        <div class="comments_4 return_goods_describe">
            <textarea id="return_info" onfocus="this.value='';" onblur="if(this.value==''){this.value='说出问题所在!好让售后审核'}">说出问题所在!好让售后审核
            </textarea>
        </div>
    </div>
    <div class="container submit_yf border_top buy_submit">
        <div class="submit_btn">提交申请</div>
    </div>
</div>

<script>
	var type='${type}';
	var orderNum='${order.orderNum}';
	var returnsId='${returnsId}';
    $(document).ready(function(){
        //选择要退的货品
        //function selectAction(){
        //    $(".return_goods_list li").addClass("screening_li_next_p")
       //     $(".return_goods_list li").click(function(){
       //         var str=$(this).attr("class")
       //         $(this).addClass("screening_li_next_p")
       //         if(str=="screening_li_next_p"){
       //             $(this).removeClass("screening_li_next_p");
       //         }else{
       //             $(this).addClass("screening_li_next_p");
       //         }
        //    })
       // }
        //selectAction();
        $(".submit_btn").click(function(){
        	//	var detailIdList="";
        	var selected=0;
        	//	$(".screening_li_next_p").each(function(){
        //		var id = $(this).attr("id");
        //		selected++;
		//		detailIdList+=(id+",");
        //	});
       // 	if(selected==0){
		//		jError('请选择要退换的商品', {ShowOverlay: false});
		//	}else{
		//		detailIdList=detailIdList.substring(0,detailIdList.length-1);
				var return_info = $("#return_info").val();
				var rePrice = $("#rePrice").val();
				var data={return_info:return_info,type:type,orderNum:orderNum,rePrice:rePrice,returnsId:returnsId}
	           $.ajax({
	            	cache: true,
	                type: "POST",
	                url:"applyReturnGoods",
	                data:data,
	                timeout:5000,
	                async: false,
	                error: function(request) {
	//                 	SimMessageAlert("登录失败");
	                },
	                success: function(data) {
	                	if(data=="success"){
	                		jSuccess('申请已发出',{ShowOverlay:window.location.href="../user/orderList?flag=RECH"});
	                	}else{
	                		jError('线下报单不允许退货', {ShowOverlay: false});
	                	}
	                	
	                }  
	            });
				//	}
        	
        });
    })
</script>
</body>
</html>
