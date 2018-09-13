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
<div class="myct">
	<span class="back" onClick="javascript :history.back(-1);"></span>
  	<p>订单详情</p>
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

</div>
<div class="clear"></div>
<div class="container">
	<div class="order_details_t border_bottom">
    	<p>商品订单号：${detail.orderNum }</p>
        <span>
        <c:choose>
        	<c:when test="${detail.status eq 0}">
        		订单状态：待付款
        	</c:when>
        	<c:when test="${detail.status eq 1}">
        		订单状态：待派件
        	</c:when>
        	<c:when test="${detail.status eq 2}">
        		订单状态：待收货
        	</c:when>
        	<c:when test="${detail.status eq 3}">
        		订单状态：已收货
        	</c:when>
        	<c:when test="${detail.status eq 7}">
        		订单状态：已取消
        	</c:when>
        </c:choose>
        </span>
    </div>
	<div class="add_call_pay">    	
    	<div class="add_call_pay_bg1">
    		<p class="add_call_pay_name">收件人：${addr.name }</p>
    		<div class="clear"></div>
        	<p class="add_call_pay_phne">电　话：${addr.phone }</p>
        	<div class="clear"></div>
        	<p class="add_call_pay_add">地　址：${addr.addr }</p>
        </div>
    </div>
	<div class="content_goods_list">
		<div class="xzspgg_sp xzspgg_sp_2 getComment9_1">
			<c:if test="${detail.status eq 3}">
				<c:if test="${detail.assessed eq 0}">
					<p class="getComment"><a href="replyGoods?id=${detail.id }" target="_self">去评论</a></p>
				</c:if>
				<c:if test="${detail.assessed eq 1}">
					<p class="getComment getComment_h"><a href="javascript:" target="_self">已评论</a></p>
				</c:if>
			</c:if>
			<c:if test="${order.sign eq 1}">
			<img src="${ASSET_URL }${detail.goods.headImgUrl }"height="80" onclick="getGoodsById(${detail.goods.id})">
			<h1 onclick="getGoodsById(${detail.goods.id})">${detail.goods.name }</h1>
			</c:if>
			<c:if test="${order.sign eq 2}">
			<img src="${ASSET_URL }${detail.crowd.headImgUrl }"height="80" onclick="getCrowdById(${detail.crowd.id})">
			<h1 onclick="getCrowdById(${detail.crowd.id})">${detail.crowd.title }</h1>
			</c:if>
<!-- 			<p class="xzspgg_sp_hh">货号: 01F70056377</p> -->
			<p class="xzspgg_sp_hh">
			</p>
			<p class="xzspgg_sp_jg">
			¥ ${detail.price }<span>　×${detail.stock }</span>
			</p>
			<div class="clear"></div>
		</div>
	</div>
    <div class="goods_tj">
    	<p>商品总价<span>¥${detail.price*detail.stock }</span></p>
		<div class="container submit_yf border_top buy_submit">
			<ul>
				<c:choose>
		        	<c:when test="${detail.status eq 0}">
		        		<li><a href="tel:4000167117">联系客服</a></li>
						<li onclick="deleteOrder('${detail.id}')">取消订单</li>
		        	</c:when>
		        	<c:when test="${detail.status eq 1}">
		        		<li><a href="tel:4000167117">联系客服</a></li>
						<li onclick="returnGoods('${detail.id}')">申请退货</li>
		        	</c:when>
		        	<c:when test="${detail.status eq 2}">
		        		<li><a href="tel:4000167117">联系客服</a></li>
						<li onclick="returnGoods('${detail.id}')">申请退货</li>
		        	</c:when>
		        	<c:when test="${detail.status eq 3}">
		        		<li onclick="changeGoods('${detail.id}')">申请换货</li>
						<li onclick="returnGoods('${detail.id}')">申请退货</li>
		        	</c:when>
		        </c:choose>
				<!--<li>联系客服</li>
                <li>取消订单</li>-->
			</ul>
			<c:choose>
	        	<c:when test="${detail.status eq 0}">
	        		<div class="submit_btn" onclick="window.location.href='../goods/orderPay?order_num=${detail.orderNum }'">立即支付</div>
	        	</c:when>
	        	<c:when test="${detail.status eq 1}">
	        		<div class="submit_btn">等待发货</div>
	        	</c:when>
	        	<c:when test="${detail.status eq 2}">
	        		<div class="submit_btn" onclick="completeOrder('${detail.id }')">确认收货</div>
	        	</c:when>
	        	<c:when test="${detail.status eq 3}">
	        		<div class="submit_btn" onclick="">再次购买</div>
	        	</c:when>
	        </c:choose>
		</div>
	</div>	
		<script>
			$(document).ready(function(){
				$(".index_menubtn").click(function(){
					$(".index_menu").stop().fadeToggle('flow');
				})
			});
			function getGoodsById(id){
			    	location.href="../goods/getGoodsById?id="+id;
			}
			function getCrowdById(id){
			    	location.href="../goods/getCrowdById?id="+id;
			}
			function deleteOrder(orderNum){
			if(confirm("确定取消此订单吗？")){
					$.ajax({
					type : "post",
					async : false,  //同步请求
					url : "deleteOrder",
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
			function returnGoods(detail_id){
			if(confirm("确定申请退换货吗？")){
					window.location.href="returnGoods?detail_id="+detail_id+"&type=0";
				}
			}
			function changeGoods(detail_id){
			if(confirm("确定申请退换货吗？")){
					window.location.href="returnGoods?detail_id="+detail_id+"&type=1";
				}
			}
			function completeOrder(detail_id){
	           $.ajax({
	            	cache: true,
	                type: "POST",
	                url:"completeOrder",
	                data:{detail_id:detail_id},
	                timeout:5000,
	                async: false,
	                error: function(request) {
	//                 	SimMessageAlert("登录失败");
	                },
	                success: function(data) {
	                	jSuccess('已确认收货');
	                	window.location.href='<%=lastPage%>';
	                }
	            });
    		}
		</script>
</div>		
</body>
</html>
