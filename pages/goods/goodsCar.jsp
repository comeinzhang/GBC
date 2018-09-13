<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML>

<html>
<head>
    <title>购物车</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <meta content="yes" name="apple-mobile-web-app-capable" />
    <meta content="black" name="apple-mobile-web-app-status-bar-style" />
    <meta content="telephone=no" name="format-detection" />
    <link rel="stylesheet" href="../static/css/base.css">
    <link rel="stylesheet" href="../static/css/style.css">
    <link rel="stylesheet" href="../static/css/jNotify.jquery.css">
    <script type="text/javascript" src="../static/js/jquery.min.js"></script>
    <script type="text/javascript" src="../static/js/jNotify.jquery.js"></script>
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
  </head>
<body>
<div class="container myct">
	<span class="back" onClick="javascript :history.back(-1);"></span>
  	<p>购物车</p>
  	<div class="index_menubtn"></div>
	<div class="index_menu">
		<div class="index_menu_top"></div>
		<c:if test="${empty shopId}">
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
		</c:if>
		<c:if test="${!empty shopId}">
		<ul>
			<li>
	                <a href="${pageContext.request.contextPath}/shop/shopDetail?id=${shopId}" target="_self">
	                    <i class="index_menu_icon1"></i>
	                    	首页
	                </a>
			</li>
            <li><a href="javaScript:location.reload();" target="_self"><i class="index_menu_icon2"></i>购物车</a></li>
            <li><a href="../user/mycenter" target="_self"><i class="index_menu_icon4"></i>个人中心</a></li>
		</ul>
		</c:if>
	</div>
</div>
	<div class="container goods_list">
   	  <div class="goods_info">
          <div class="clear"></div>
          <c:forEach items="${carList }" var="car">
          <!--单个商品-->
          <div class="goods_info_nr border_top" id='${car.id}'>
          	<input type="hidden" value="${car.goods.flag}" name="goodsFlag" id="goodsFlag">
            <div class="goods_info_nr_l">
              <span class="goods_info_title_span" ></span>
            </div>
            <div class="goods_info_nr_r">
                <img onclick="goIntoGoods('${car.goods.id}')" src="${ASSET_URL }${car.goods.headImgUrl }" width="66">
                <h1 onclick="goIntoGoods('${car.goods.id}')"><!--<span class="goods_tj_yhq">限时优惠</span>-->${car.goods.name }</h1>
                <span class="goods_info_deleter"></span>
                <p class="goods_info_fl">
	                <c:if test="${!empty car.spec.specName }">
	                ${car.spec.specName }:${car.spec.specValue }　
	                </c:if>
                </p>
                <br/>
                <c:choose>
	                <c:when test="${user.userRoleId eq '2'&&car.goods.comsType==2&&car.goods.discount!=null}">
	                	<p style=" color:#c40000;">¥ <span class="priceSource">${car.spec.price }</span></p>
		                <p style=" color:#c40000;">折扣：${car.goods.discount*10}折&nbsp;&nbsp;折后价：¥ <span class="price">${car.spec.price*car.goods.discount}</span></p>
	                	<br/>
	                </c:when>
	                <c:otherwise>
	                	<p style=" color:#c40000;">¥ <span class="price">${car.spec.price }</span></p>
	                </c:otherwise>
                </c:choose>
                <div class="goods_info_slkz">
                  <a class="slkz_min">-</a>
                    <input type="text" value="${car.stock }" name="数量" id="spsl" class="slkz_input"/>
                    <a class="slkz_max" id="${car.spec.stock}">+</a>
                </div>
                <div class="clear"></div>
            </div>       	  		
        </div>
          <!--单个商品-->
          </c:forEach>
      </div>
        <div class="container goods_settle" style="bottom: 40px;">
      	<div class="goods_settle_qx">
        <span class="goods_info_title_span"></span>
        全选
        </div>	
        <div class="goods_settle_hz">
           <p>合计：¥ <span id="total">0</span></p>
        </div>
        <div class="goods_settle_js">
        	去结算
        </div>
      </div>
    </div>
<div class="bottom_menu border-top">
	<c:if test="${empty shopId}">
        <ul id="sliderLeftI">
            <li>
                <a href="${pageContext.request.contextPath}/goods/index" target="_self" >
                    <i class="bottom_menu_bg1"></i>
                    <p>首页</p>
                </a>
            </li>
            <c:if test="${sessionScope.webIn eq 'kxz'}">
            <li>
                <a href="catagoryList">
                    <i class="bottom_menu_bg2"></i>
                    <p>分类</p>
                </a>
            </li>
            </c:if>
            <c:if test="${sessionScope.webIn ne 'kxz'}">
            <li>
                <a href="${pageContext.request.contextPath}/shop/shopLm" target="_self">
                    <i class="bottom_menu_bg2"></i>
                    <p>商家</p>
                </a>
            </li>
            </c:if>
            <li class="active">
                <a href="${pageContext.request.contextPath}/goods/getGoodsCar" target="_self" style="color: red;">
                    <i class="bottom_menu_bg3"></i>
                    <p>购物车</p>
                </a>
            </li>
            <li>
                <a href="${pageContext.request.contextPath}/user/mycenter" target="_self" id="goMyCenter">
                    <i class="bottom_menu_bg4"></i>
                    <p>个人中心</p>
                </a>
            </li>
        </ul>
   </c:if> 
   <c:if test="${!empty shopId}">
        <ul id="sliderLeftI">
            <li style="width: 33.3%;">
                <a href="${pageContext.request.contextPath}/shop/shopDetail?id=${shopId}" target="_self" >
                    <i class="bottom_menu_bg1"></i>
                    <p>首页</p>
                </a>
            </li>
            <li class="active" style="width: 33.3%;">
                <a href="javaScript:location.reload();" target="_self" style="color: red;">
                    <i class="bottom_menu_bg3"></i>
                    <p>购物车</p>
                </a>
            </li>
            <li style="width: 33.3%;">
                <a href="${pageContext.request.contextPath}/user/mycenter?shopId=${shopId}" target="_self" id="goMyCenter">
                    <i class="bottom_menu_bg4"></i>
                    <p>个人中心</p>
                </a>
            </li>
        </ul>
   </c:if> 
</div>
<script>
	$(document).ready(function(){
				$(".index_menubtn").click(function(){
					$(".index_menu").stop().fadeToggle('flow');
				})
	});
	function goIntoGoods(id){
		window.location.href="getGoodsById?id="+id;
	}
	var totalStock=0;
	$(document).ready(function(){
		$(".goods_settle_js").click(function(){
			var totalPrice = $("#total").text();
			if(totalPrice==null||totalPrice==""||totalPrice==0){
				jError('无商品', {ShowOverlay: false});
			}else{
				var listId="";
				$(".goods_info_title_span_1").each(function (){
				   var id = $(this).parents(".goods_info_nr").attr("id");
				   if(id==undefined||id==null){
				   	return ;
				   }
				   listId+=(id+",");	
				});
				listId=listId.substring(0,listId.length-1);
				window.location.href="createCarOrder?ListId="+listId+"&totalPrice="+totalPrice+"&totalStock="+totalStock+"&sign=1";
			}
		});
        //商品选择操作//单个选中
        $(".goods_info_nr_l span").click(function () {
            var bg = $(this).attr("class");
            if (bg == "goods_info_title_span") {
                $(this).removeClass("goods_info_title_span").addClass("goods_info_title_span_1");
//                 $(this).parents(".goods_info_nr_l").parents(".goods_info_nr").siblings('.goods_info_title').find("span").addClass("goods_info_title_span_1");
            } else {
                $(this).removeClass("goods_info_title_span_1").addClass('goods_info_title_span');
                var ischeck = false;
                //alert($(this).parents(".goods_info").find(".goods_info_nr_l").find('span').attr("class"));
                $(this).parents(".goods_info").find(".goods_info_nr_l").find('span').each
                (function () {
                    if ($(this).hasClass('goods_info_title_span_1')) {
                        ischeck = true;
                        return false;
                    }
                });
//                 if (!ischeck) {
//                     $(this).parents(".goods_info").find(".goods_info_title span").removeClass("goods_info_title_span_1");
//                 }
            }
            totalPrice();
        });
        $(".goods_info_deleter").click(function(){
	        if(confirm("确定要删除吗？")){
	           var id=$(this).parents(".goods_info_nr").attr("id");
	           $.ajax({
	            	cache: true,
	                type: "POST",
	                url:"deleteGoodsCar",
	                data:{id:id},
	                timeout:5000,
	                async: false,
	                error: function(request) {
	//                 	SimMessageAlert("登录失败");
	                },
	                success: function(data) {
	                	data = parseInt(data,10);
	                	if(data==1){
	                		$("#"+id).remove();
	                		jSuccess('删除成功',{ShowOverlay:window.location.reload()});
	                	}
	                	if(data==2){
	                		jError('删除失败', {ShowOverlay: false});
	                	}
	                }
	            });
	           }
        })
        //店铺全选
//         $('.goods_info_title span').click(selectAllGoods);
//         function selectAllGoods() {
//             var bg = $(this).attr("class");
//             if (bg == "goods_info_title_span") {
//                 $(this).addClass("goods_info_title_span_1");
//                 $(this).parents(".goods_info_title").siblings(".goods_info_nr").find(".goods_info_nr_l span").addClass('goods_info_title_span_1');
//             }
//             else {
//                 $(this).removeClass("goods_info_title_span_1");
//                 $(this).parents(".goods_info_title").siblings(".goods_info_nr").find(".goods_info_nr_l span").removeClass('goods_info_title_span_1').addClass('goods_info_title_span');
//             }
//         }


        //全选
        $(".goods_settle_qx span").click(function(){
            var bg = $(this).attr("class");
            if( bg == "goods_info_title_span"){
//                 $(".goods_info_title span").addClass("goods_info_title_span_1");//全选
                $(this).addClass("goods_info_title_span_1");
                $(".goods_info_nr_l span").addClass('goods_info_title_span_1');
            }else{
//                 $(".goods_info_title span").removeClass("goods_info_title_span_1");//取消全选
                $(this).removeClass("goods_info_title_span_1");
                $(".goods_info_nr_l span").removeClass('goods_info_title_span_1');
            }
            totalPrice();
        });

		//总额
		function totalPrice(){
			var total=0;
			var flagCount=0;
			$(".goods_info_title_span_1").each(function (){
			   var sl = $(this).parents(".goods_info_nr").find("#spsl").val();
			   var price = $(this).parents(".goods_info_nr").find(".price").text();
			   var goodsFlag = $(this).parents(".goods_info_nr").find("#goodsFlag").val();
// 			   if(goodsFlag.indexOf("6")>=0){
// 					    $.ajax({
// 		            	cache: true,
// 					    type: "POST",
// 					    url:"checkStock",
// 					    data:{spec_id:spec_id,stock:number,goodsFlag:goodsFlag},
// 					    timeout:5000,
// 					    async: false,
// 		                error: function(request) {
// 		                	SimMessageAlert("登录失败");
// 		                },
// 		                success: function(data) {
// 		                	data = parseInt(data,10);
// 		                	if(data==1){
// 		                		$("#"+id).remove();
// 		                		jSuccess('删除成功');
// 		                	}
// 		                	if(data==2){
// 		                		jError('删除失败', {ShowOverlay: false});
// 		                	}
// 		                }
// 		            });
// 			   }
			   if(sl==undefined||sl==null){
			   	return ;
			   }
			   totalStock+=sl;
			   total+=Number(sl)*Number(price);
			});
			$("#total").html(total);
		}
		//商品数量操作
		$(".slkz_min").click(function(){
			var num = $(this).siblings(".slkz_input").val();
			$(this).siblings(".slkz_input").val(--num);
			if( num <= 0){
				$(this).siblings(".slkz_input").val(++num);//商品数量不能为0
			}
			num = $(this).siblings(".slkz_input").val();
			var id = $(this).parents(".goods_info_nr").attr("id");
			 $.ajax({
	            	cache: true,
	                type: "POST",
	                url:"updateGoodsCar",
	                data:{id:id,stock:num},
	                timeout:5000,
	                async: false,
	                error: function(request) {
	//                 	SimMessageAlert("登录失败");
	                },
	                success: function(data) {
	                }
	            });
			totalPrice();
		});
		$(".slkz_max").click(function(){
			var num = $(this).siblings(".slkz_input").val();
			$(this).siblings(".slkz_input").val(++num);
			var zd = $(this).attr("id");
            if( num > zd ){
               $(this).siblings(".slkz_input").val(--num);//商品数量不能大于库存
            }
            num = $(this).siblings(".slkz_input").val();
			var id = $(this).parents(".goods_info_nr").attr("id");
			 $.ajax({
	            	cache: true,
	                type: "POST",
	                url:"updateGoodsCar",
	                data:{id:id,stock:num},
	                timeout:5000,
	                async: false,
	                error: function(request) {
	//                 	SimMessageAlert("登录失败");
	                },
	                success: function(data) {
	                }
	            });
            totalPrice();
		});
		
	});
</script>
</body>

</html>
