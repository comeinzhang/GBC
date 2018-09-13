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
    <link rel="stylesheet" href="../static/css/jNotify.jquery.css">
    <script type="text/javascript" src="../static/js/jquery.min.js"></script>
    <script type="text/javascript" src="../static/js/jNotify.jquery.js"></script>
    <title>订单列表</title>
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script>
		function is_weixn(){  
		    var ua = navigator.userAgent.toLowerCase();  
		    if(ua.match(/MicroMessenger/i)=="micromessenger") {  
		        return true;  
		    } else {  
		        return false;  
		    }  
		}
		if(is_weixn()){
			window.onload=function(){
			  if (location.href.indexOf("&xyz=")<0)
			 {
			 location.href=location.href+"&xyz="+Math.random();
			 }
			}
		}
		function goBack(){
			location.href='${pageContext.request.contextPath}/user/mycenter';
		}
	</script>
</head>
<body>
<div class="container myct">
	<span class="back" onClick="goBack();"></span>
  	<p>
  		<c:choose>
  			<c:when test="${flag eq 'UNREC'}">
  				待接单
  			</c:when>
  			<c:when test="${flag eq 'RECH'}">
  				退换列表
  			</c:when>
  			<c:when test="${flag eq 'NO'}">
  				未付款订单
  			</c:when>
  			<c:when test="${flag eq 'NOEMS'}">
  				待发货订单
  			</c:when>
  			<c:when test="${flag eq 'EMSING'}">
  				待收货订单
  			</c:when>
  			<c:when test="${flag eq 'SUCCESS'}">
  				已收货订单
  			</c:when>
  		</c:choose>
  	</p>
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
<div class="all_orders border_bottom">
    <!--全部-->
    <div class="all_orders_all">
    	<ul class="all_orders_list">
            <c:forEach items="${orderList }" var="order">
                <c:choose>
                		<c:when test="${flag eq 'UNREC'}">
			  			<li id="${detail.id }">
			  				<c:forEach items="${order.detailList }" var="detail">
			                <div class="goods_vi" onclick="orderDetail('${order.orderNum}')">
			                	<div class="clear"></div> 
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
			                 <div class="clear"></div>    
			                </div>
			              </li>
			  			</c:when>
			  			<c:when test="${flag eq 'NO'}">
			  			<li id="${order.orderNum}">
			  				<c:forEach items="${order.detailList }" var="detail">
			                <div class="goods_vi" onclick="orderDetail('${order.orderNum}')">
			                	<div class="clear"></div> 
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
			  			</c:when>
			  			<c:when test="${flag eq 'NOEMS'}">
			  				<li id="${order.orderNum}">
			  				<c:forEach items="${order.detailList }" var="detail">
			                <div class="goods_vi" onclick="orderDetail('${order.orderNum}')">
			                	<div class="clear"></div> 
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
			                	<p class="all_orders_list_statistics_l">共<span class="all_orders_list_statistics_sl"> ${order.totalStock } </span>件商品  实付：¥<span class="all_orders_list_statistics_jg"> ${order.totalPrice  }</span></p>                    
			                    <div class="all_orders_list_state">
<!-- 						  			<span class="all_orders_list_state_wl">提醒发货</span> -->
                        			<span class="all_orders_list_state_pl">暂无物流信息</span>
			                    </div>
			                 <div class="clear"></div>    
			                </div>
			                </li>
			                
			  			</c:when>
			  			<c:when test="${flag eq 'EMSING'}">
			  				<li id="${order.orderNum}">
			  				<c:forEach items="${order.detailList }" var="detail">
			                <div class="goods_vi" onclick="orderDetail('${order.orderNum}')">
			                	<div class="clear"></div> 
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
			                	<p class="all_orders_list_statistics_l">共<span class="all_orders_list_statistics_sl"> ${order.totalStock } </span>件商品  实付：¥<span class="all_orders_list_statistics_jg"> ${order.totalPrice  }</span></p>                    
			                    <div class="all_orders_list_state">
						  			<span class="all_orders_list_state_wl" onclick="completeOrder('${order.orderNum}')">确认收货</span>
                        			<span class="all_orders_list_state_pl trackPro">查看物流</span>
			                    </div>
			                 <div class="clear"></div>    
			                </div>
			                </li>
			  			</c:when>
			  			<c:when test="${flag eq 'RECH'}">
			  				<li id="${order.orderNum}">
			  				<c:forEach items="${order.detailList }" var="detail">
			                <div class="goods_vi" onclick="returnDetail('${order.orderNum}')">
			                	<div class="clear"></div> 
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
			                	<p class="all_orders_list_statistics_l">共<span class="all_orders_list_statistics_sl"> ${order.totalStock } </span>件商品  实付：¥<span class="all_orders_list_statistics_jg"> ${order.totalPrice  }</span></p>                    
			                    <div class="all_orders_list_state">
			                      <c:if test="${order.status eq 5}">
						  			<span class="all_orders_list_state_wl" onclick="delRe('${order.orderNum }')">撤销退换</span>
                        			<span class="all_orders_list_state_pl">查看物流</span>
                        		  </c:if>
                        		  <c:if test="${order.status eq 4}">
						  			<span class="all_orders_list_state_wl">退换完成</span>
                        		  </c:if>
			                    </div>
			                 <div class="clear"></div>    
			                </div>
			                </li>
			  			</c:when>
			  			<c:otherwise>
			  				<li id="${order.orderNum}">
			  				<c:forEach items="${order.detailList }" var="detail">
			                <div class="goods_vi" onclick="orderDetail('${order.orderNum}')">
			                	<div class="clear"></div> 
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
			                
			  			</c:otherwise>
			  		</c:choose>
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
							$("#"+orderNum).remove();
							jSuccess('已取消订单');
						},
						error: function() {
							jError('删除失败', {ShowOverlay: false});
				        }
					});
				}
			}
	function delRe(orderNum){
		if(confirm("确定撤销此订单吗？")){
				$.ajax({
				type : "post",
				async : false,  //同步请求
				url : "../order/delRe",
				timeout:5000,
				data:{orderNum:orderNum},
					success:function(dates){
						$("#"+orderNum).remove();
						jSuccess('已撤销此订单');
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
    });
    function orderDetail(orderNum){
    	//    	window.location.href="../goods/orderPay?order_num="+orderNum;
     	window.location.href="../order/orderDetail?orderNum="+orderNum;
    }
   function orderDetail_d(detail_id){
   		window.location.href="../order/orderDetail_d?detail_id="+detail_id;
   }
   function returnDetail(orderNum){
    	window.location.href="../order/returnDetail?orderNum="+orderNum;
   }
   $(".trackPro").click(function(){
       var orderNum = $(this).parents("li").attr("id");
       var url = window.location.href;
       $.ajax({
           	cache: true,
               type: "POST",
               url:"../order/checkTrackPro",
               data:{orderNum:orderNum},
               timeout:5000,
               async: false,
               error: function(request) {
//                 	SimMessageAlert("登录失败");
               },
               success: function(data) {
            	   if(data!=null){
            		   var emsCode = data.emsCode;
                      	var emsType = data.emsType;
                      	window.location.href="https://m.kuaidi100.com/index_all.html?type="+emsType+"&postid="+emsCode+"&callbackurl="+url;
            	   }else{
            		   alert("未获取相关物流信息！")
            	   }
               	
               }
           });
   });
    function completeOrder(orderNum){
	           $.ajax({
	            	cache: true,
	                type: "POST",
	                url:"../order/completeOrder",
	                data:{orderNum:orderNum},
	                timeout:5000,
	                async: false,
	                error: function(request) {
	//                 	SimMessageAlert("登录失败");
	                },
	                success: function(data) {
	                		$("#"+orderNum).remove();
	                		jSuccess('已确认收货');
	                }
	            });
    }
</script>
</body>
</html>
