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
    <title>我的订单</title>
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
</head>
<body>
<div class="container myct">
	<span class="back" onClick="javascript :history.back(-1);"></span>
  	<p>我的订单</p>
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
            <li><a href="mycenter" target="_self"><i class="index_menu_icon4"></i>个人中心</a></li>
        </ul>
    </div>
</div>
<div class="all_orders border_bottom">
	<div class="all_orders_title">
    	<ul>
     		<li class="all_orders_select" style="width: 20%;">全部</li> 
            <li style="width: 20%;">待付款</li>
            <li style="width: 20%;">待发货</li>
            <li style="width: 20%;">待收货</li>
            <li style="width: 20%;">待评价</li>
            <div class="clear"></div>
        </ul>        
    </div>
    <!--待接单-->
    <div class="all_orders_all">
    	<ul class="all_orders_list">
    		<c:forEach items="${orderList }" var="order">
            <li>
            	<c:forEach items="${order.detailList }" var="detail">
                <div class="goods_vi" onclick="orderDetail('${order.orderNum}')">
                    <c:if test="${order.sign eq 2}">
			                    <img src="${ASSET_URL }${detail.crowd.headImgUrl }" height="80" width="66">
			                    <h1>${detail.crowd.title }</h1>
			                    </c:if>
			                    <c:if test="${order.sign ne 2}">
			                    <img src="${ASSET_URL }${detail.goods.headImgUrl }" height="80" width="66">
			                    <h1>${detail.goods.name }</h1>
			                    </c:if>
                    <p class="all_orders_list_fl">
                    </p>
                    <p class="all_orders_list_price">¥ ${detail.price }<span> × ${detail.stock }</span></p>                    
                    <div class="clear"></div>  
                </div>
                </c:forEach>
                <div class="all_orders_list_statistics">
                	<p class="all_orders_list_statistics_l">共<span class="all_orders_list_statistics_sl"> ${order.totalStock } </span>件商品  实付：¥<span class="all_orders_list_statistics_jg"> ${order.totalPrice }</span></p>                    
                    <div class="all_orders_list_state">
                    	<c:if test="${order.status eq 0}">
                        <span class="all_orders_list_state_wl" onclick="window.location.href='../goods/orderPay?order_num=${order.orderNum }'">去付款</span>
                        <span class="all_orders_list_state_wl" onclick="deleteOrder('${order.orderNum}')">取消订单</span>
                        </c:if>
                        <c:if test="${order.status eq 1}">
                        <span class="all_orders_list_state_pl">暂无物流信息</span>
                        </c:if>
                        <c:if test="${order.status eq 2}">
                        <span class="all_orders_list_state_wl" onclick="completeOrder('${detail.id }')">确认收货</span>
                        <span class="all_orders_list_state_pl trackPro">查看物流</span>
                        </c:if>
                        <c:if test="${order.status eq 3}">
                        <span class="all_orders_list_state_wl">已收货</span>
                        <span class="all_orders_list_state_pl trackPro">查看物流</span>
                        </c:if>
                    </div>
                 <div class="clear"></div>    
                </div>                            
            </li>
			</c:forEach>
        </ul>
    </div>
    <!--待付款-->
    <div class="all_orders_all" style="display: none;">
    	<ul class="all_orders_list">
    		<c:forEach items="${orderList0 }" var="order">
            <li>
            	<c:forEach items="${order.detailList }" var="detail">
                <div class="goods_vi" onclick="orderDetail('${order.orderNum}')">
                    <c:if test="${order.sign eq 2}">
			                    <img src="${ASSET_URL }${detail.crowd.headImgUrl }" height="80" width="66">
			                    <h1>${detail.crowd.title }</h1>
			                    </c:if>
			                    <c:if test="${order.sign ne 2}">
			                    <img src="${ASSET_URL }${detail.goods.headImgUrl }" height="80" width="66">
			                    <h1>${detail.goods.name }</h1>
			                    </c:if>
                    <p class="all_orders_list_fl">
                    </p>
                    <p class="all_orders_list_price">¥ ${detail.price }<span> × ${detail.stock }</span></p>                    
                    <div class="clear"></div>  
                </div>
                </c:forEach>
                <div class="all_orders_list_statistics">
                	<p class="all_orders_list_statistics_l">共<span class="all_orders_list_statistics_sl"> ${order.totalStock } </span>件商品  实付：¥<span class="all_orders_list_statistics_jg"> ${order.totalPrice }</span></p>                    
                    <div class="all_orders_list_state">
                        <span class="all_orders_list_state_wl" onclick="window.location.href='../goods/orderPay?order_num=${order.orderNum }'">去付款</span>
                        <span class="all_orders_list_state_wl" onclick="deleteOrder('${order.orderNum}')">取消订单</span>
                    </div>
                 <div class="clear"></div>    
                </div>                            
            </li>
			</c:forEach>
        </ul>
    </div>
    <!--代发货-->
    <div class="all_orders_all" style="display: none;">
    	<ul class="all_orders_list">
    		<c:forEach items="${orderList1 }" var="order">
            	 <li>
            	 <c:forEach items="${order.detailList }" var="detail">
                <div class="goods_vi" onclick="orderDetail('${order.orderNum}')">
                    <c:if test="${order.sign eq 2}">
			                    <img src="${ASSET_URL }${detail.crowd.headImgUrl }" height="80" width="66">
			                    <h1>${detail.crowd.title }</h1>
			                    </c:if>
			                    <c:if test="${order.sign ne 2}">
			                    <img src="${ASSET_URL }${detail.goods.headImgUrl }" height="80" width="66">
			                    <h1>${detail.goods.name }</h1>
			                    </c:if>
                    <p class="all_orders_list_fl">
                    </p>
                    <p class="all_orders_list_price">¥ ${detail.price }<span> × ${detail.stock }</span></p>                    
                    <div class="clear"></div>  
                </div>
                </c:forEach> 
                <div class="all_orders_list_statistics">
                	<p class="all_orders_list_statistics_l">共<span class="all_orders_list_statistics_sl"> ${order.totalStock } </span>件商品  实付：¥<span class="all_orders_list_statistics_jg"> ${order.totalPrice }</span></p>                    
                    <div class="all_orders_list_state">
<!--                         <span class="all_orders_list_state_wl">提醒发货</span> -->
                        <span class="all_orders_list_state_pl">暂无物流信息</span>
                    </div>
                 <div class="clear"></div>    
                </div> 
                </li>
			</c:forEach>
        </ul>        
    </div>
	<!--待收货-->
    <div class="all_orders_all" style="display: none;">
    	<ul class="all_orders_list">
    	<c:forEach items="${orderList2 }" var="order">
            	
            	<li id="${detail.id }">
            	<c:forEach items="${order.detailList }" var="detail">
                <div class="goods_vi" onclick="orderDetail('${order.orderNum}')">
                    <c:if test="${order.sign eq 2}">
			                    <img src="${ASSET_URL }${detail.crowd.headImgUrl }" height="80" width="66">
			                    <h1>${detail.crowd.title }</h1>
			                    </c:if>
			                    <c:if test="${order.sign ne 2}">
			                    <img src="${ASSET_URL }${detail.goods.headImgUrl }" height="80" width="66">
			                    <h1>${detail.goods.name }</h1>
			                    </c:if>
                    <p class="all_orders_list_fl">
                    </p>
                    <p class="all_orders_list_price">¥ ${detail.price }<span> × ${detail.stock }</span></p>                    
                    <div class="clear"></div>  
                </div>
                </c:forEach>
                <div class="all_orders_list_statistics">
                	<p class="all_orders_list_statistics_l">共<span class="all_orders_list_statistics_sl"> ${order.totalStock } </span>件商品  实付：¥<span class="all_orders_list_statistics_jg"> ${order.totalPrice }</span></p>                    
                    <div class="all_orders_list_state">
                        <span class="all_orders_list_state_wl" onclick="completeOrder('${detail.id }')">确认收货</span>
                        <span class="all_orders_list_state_pl trackPro">查看物流</span>
                    </div>
                 <div class="clear"></div>    
                </div>  
                </li>
			</c:forEach>
        </ul>        
    </div>
	<!--交易完成-->
    <div class="all_orders_all" style="display: none;">
    	<ul class="all_orders_list">
    	<c:forEach items="${orderList3 }" var="order">
            	<li id="${detail.id }">
            	<c:forEach items="${order.detailList }" var="detail">
                <div class="goods_vi" onclick="orderDetail('${order.orderNum}')">
                    <c:if test="${order.sign eq 2}">
			                    <img src="${ASSET_URL }${detail.crowd.headImgUrl }" height="80" width="66">
			                    <h1>${detail.crowd.title }</h1>
			                    </c:if>
			                    <c:if test="${order.sign ne 2}">
			                    <img src="${ASSET_URL }${detail.goods.headImgUrl }" height="80" width="66">
			                    <h1>${detail.goods.name }</h1>
			                    </c:if>
                    <p class="all_orders_list_fl">
                    </p>
                    <p class="all_orders_list_price">¥ ${detail.price }<span> × ${detail.stock }</span></p>                    
                    <div class="clear"></div>  
                </div>
                </c:forEach>
                <div class="all_orders_list_statistics">
                	<p class="all_orders_list_statistics_l">共<span class="all_orders_list_statistics_sl"> ${order.totalStock } </span>件商品  实付：¥<span class="all_orders_list_statistics_jg"> ${order.totalPrice }</span></p>                    
                    <div class="all_orders_list_state">
                        <span class="all_orders_list_state_wl">已收货</span>
                        <span class="all_orders_list_state_pl trackPro">查看物流</span>
                    </div>
                 <div class="clear"></div>    
                </div>   
                </li>   
			</c:forEach>
        </ul>        
    </div>
    <div class="clear"></div>
</div>
<script>
		function deleteOrder(orderNum){
			if(confirm("确定取消此订单吗？")){
					$.ajax({
					type : "post",
					async : false,  //同步请求
					url : "../order/deleteOrder",
					timeout:5000,
					data:{orderNum:orderNum},
						success:function(dates){
							jSuccess('已取消订单',{ShowOverlay:window.location.href='../user/mycenter'});
						},
						error: function() {
							jError('删除失败', {ShowOverlay: false});
				        }
					});
				}
			}
    $(document).ready(function(){
        $(".index_menubtn").click(function(){
            $(".index_menu").stop().fadeToggle('flow');
        });
        $(".all_orders_title ul li").click(function(){
            $(".all_orders_title ul li").eq($(this).index()).addClass("all_orders_select").siblings().removeClass("all_orders_select");
            $(".all_orders_all").hide().eq($(this).index()).show();
        });	
        $(".trackPro").click(function(){
            var id = $(this).parents("li").attr("id");
            var url = window.location.href;
            $.ajax({
	            	cache: true,
	                type: "POST",
	                url:"../order/checkTrackPro",
	                data:{detail_id:id},
	                timeout:5000,
	                async: false,
	                error: function(request) {
	//                 	SimMessageAlert("登录失败");
	                },
	                success: function(data) {
	                	var emsCode = data.emsCode;
	                	var emsType = data.emsType;
	                	window.location.href="https://m.kuaidi100.com/index_all.html?type="+emsType+"&postid="+emsCode+"&callbackurl="+url;
	                }
	            });
        });
        //模拟跳到订单详情
        $(".all_orders_list_state span").click(function(){
            var str=$(this).html();
            if(str=="去评论"){
                location.href="评价商品.html"
            }
//             if(str=="查看物流"){
//                 location.href="物流详情.html"
//             }
        });

    });
    function orderDetail(orderNum){
    	//   	window.location.href="../goods/orderPay?order_num="+orderNum;
     	window.location.href="../order/orderDetail?orderNum="+orderNum;
    }
    function orderDetail_d(detail_id){
   		window.location.href="../order/orderDetail_d?detail_id="+detail_id;
   	}
     function completeOrder(detail_id){
    			
	           $.ajax({
	            	cache: true,
	                type: "POST",
	                url:"../order/completeOrder",
	                data:{detail_id:detail_id},
	                timeout:5000,
	                async: false,
	                error: function(request) {
	//                 	SimMessageAlert("登录失败");
	                },
	                success: function(data) {
	                		$("#"+detail_id).remove();
	                		jSuccess('已确认收货');
	                }
	            });
    }
</script>
</body>
</html>
