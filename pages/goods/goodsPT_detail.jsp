<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page language="java" import="com.tyh.model.ProConfigMap" %>
<%
String codeUrl = ProConfigMap.configMap.get("codeUrl");
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
	<script type="text/javascript" src="../static/js/goods_xq.js"></script>
	<script type="text/javascript" src="../static/js/jNotify.jquery.js"></script>
	<script type="text/javascript" src="../static/js/QryUrlStrParam.js"></script>
	<script src="http://res.wx.qq.com/open/js/jweixin-1.0.0.js"></script>
	<script type="text/javascript"
	src="${pageContext.request.contextPath}/static/js/layer/layer.js"></script>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/static/js/layer/skin/default/layer.css">
    <title>商品详细</title>
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script type="text/javascript">
    var url = location.href.split('#').toString();
    $.ajax({
	    type : "POST",  
	    url : "../user/getWxConfig", 
	    dataType : "html",
	    async : false, 
	    data:"url="+url,  
	    success : function(dataStr) {
	        var data = $.parseJSON(dataStr);
	        wx.config({  
	            debug: false,  
	            appId: data.appid,  
	            timestamp: data.timestamp,  
	            nonceStr: data.nonceStr,  
	            signature: data.signature,          
	            jsApiList: [  
	                'onMenuShareTimeline', 'onMenuShareAppMessage', 'onMenuShareQQ', 'onMenuShareWeibo', 'onMenuShareQZone'  
	            ]  
	        });  
	    }, 
	    error: function(xhr, status, error) {  
	        alert(status);  
	        alert(xhr.responseText);  
	    },  
	});
    wx.ready(function(){
	    // 获取"分享到朋友圈"按钮点击状态及自定义分享内容接口  
	    wx.onMenuShareTimeline({  
	        title: '${goods.name}', // 分享标题  
	        desc: '商品详情', 
	        link: 'http://m.kxiaozao.com/goods/getGoodsById?shareId='+'${user.id}'+'&id='+'${goods.id}',
	        imgUrl: '${ASSET_URL }${goods.headImgUrl }' 
	    });  
	      
	      
	    // 获取"分享给朋友"按钮点击状态及自定义分享内容接口  
	    wx.onMenuShareAppMessage({  
	        title: '${goods.name}', // 分享标题  
	        desc: '商品详情',
	        link: 'http://m.kxiaozao.com/goods/getGoodsById?shareId='+'${user.id}'+'&id='+'${goods.id}' ,
	        imgUrl: '${ASSET_URL }${goods.headImgUrl }'
	    });  
	      
	      
	    //获取"分享到QQ"按钮点击状态及自定义分享内容接口  
	    wx.onMenuShareQQ({  
	    	title: '${goods.name}', // 分享标题  
	    	desc: '商品详情',
	        link: 'http://m.kxiaozao.com/goods/getGoodsById?shareId='+'${user.id}'+'&id='+'${goods.id}',
	        imgUrl: '${ASSET_URL }${goods.headImgUrl }'
	    }); 
	      
	      
	    //获取"分享到腾讯微博"按钮点击状态及自定义分享内容接口  
	    wx.onMenuShareWeibo({  
	    	title: '${goods.name}', // 分享标题  
	    	desc: '商品详情',
	        link: 'http://m.kxiaozao.com/goods/getGoodsById?shareId='+'${user.id}'+'&id='+'${goods.id}',
	        imgUrl: '${ASSET_URL }${goods.headImgUrl }'
	    });  
	      
	      
	    //获取"分享到QQ空间"按钮点击状态及自定义分享内容接口  
	    wx.onMenuShareQZone({  
	    	title: '${goods.name}', // 分享标题  
	    	desc: '商品详情',
	        link: 'http://m.kxiaozao.com/goods/getGoodsById?shareId='+'${user.id}'+'&id='+'${goods.id}',
	        imgUrl: '${ASSET_URL }${goods.headImgUrl }'
	    });  
	      
	});
	</script>
  </head>
<body>
<div id="wrapper" style="width: 100%;">
    <div id="body">
        <div class="container myct">
            <span class="back" onClick="javascript :history.back(-1);"></span>
            <p>商品详情</p>
            <div class="index_menubtn"></div>
            <div class="index_menu">
                <div class="index_menu_top"></div>
                <ul>
                    <li><a href="index" target="_self"><i class="index_menu_icon1"></i>首页</a></li>
                    <li><a href="getGoodsCar" target="_self"><i class="index_menu_icon2"></i>购物车</a></li>
                    <li><a href="getGoodsStore" target="_self"><i class="index_menu_icon3"></i>收藏夹</a></li>
                    <li><a href="../user/mycenter" target="_self"><i class="index_menu_icon4"></i>个人中心</a></li>
                </ul>
            </div>
			<script type="text/javascript">
				$(document).ready(function(){
					$(".index_menubtn").click(function(){
						$(".index_menu").stop().toggle();
						});
					$("#goMyCenter").click(function(){
						if(GetLoginName() != null){
							location.href="index.php?m=QxWeb&a=mycenter";
						}else{
							location.href="index.php?m=QxWeb&a=login";
						}
					});	        
				});
			</script>
        </div>
        <div class="clear"></div>
        <div class="container">
			<input id="goodsType" name="goodsType" value="${goods.goodsType }" type="hidden"/>
            <div class="container goods_hd">
                <div class="slider2">
                    <ul>
                    <c:forEach items="${imgList }" var="img">
                        <li><img src="${ASSET_URL }${img.imgUrl }" height="400px;"></li>
                    </c:forEach>    
                    </ul>
                </div>

                <div class="goods_bt">
					<span class="sandf">
						<c:if test="${goods.status eq 1}">
						<i class="goods_collection"></i>
						<i id="collectionAction">
						<c:if test="${empty store}">
						<div class="goods_sharenone"></div>
						<span class="collectionStatus">收藏</span>
						</c:if>
						<c:if test="${!empty store}">
						<div class="goods_share"></div>
						<span class="collectionStatus">已收藏</span>
						</c:if>
						</i>
						</c:if>
					</span>
                    <p class="goods_name">${goods.name }</p>
                    <p class="goods_gg" id="SpecPrice">
                    	&yen;${goods.price} &nbsp;&nbsp;
                    </p>
                   	<c:if test="${isDiscount}">
	                   	<p class="goods_gg" >
	                   		<span>
	                   		消费合伙人折扣：${discount*10}折&nbsp;&nbsp;
	                   		</span>
                   		</p>
                   	</c:if>
                    <c:if test="${!empty goods.sellTime}">
                    <p class="goods_cxinfo">时间：<span>${goods.sellTime }</span></p>
                    </c:if>
<!--                     <p class="goods_yj">原价￥${goods.priceBefore }</p> -->
                    <p></p>
                </div>
            </div>

        </div>
        <div class="container goods_ggxx goods_ggxx_1">

            <div class="xzspgg">
                <div class="spsx">
                    <div><p id="spsx_ggName"></p></div>
                    <ul id="spsx_gg">
                    </ul>
                </div>
                <div class="clear"></div>
                <div class="clear"></div>
                <div class="spsx_sl">
                    <div class="spsx_div"><p>数量 : </p></div>
                    <div class="spsx_sl_1">
                        <a class="slkz_min">-</a>
                        <input type="text" value="1" name="数量" class="slkz_input">
                        <a class="slkz_max">+</a>
                    </div>
                    <p class="spsx_kc">库存(<span id="stockNum"></span>)件</p>
                </div>
                <!--<div class="dz-78 clearfix">
                    <a href="index.php?m=QxWeb&c=Customize&a=CustomizeDiamondSelect">裸钻定制</a>
                </div>-->
                <div class="clear"></div>
            </div>
            
<!--             <div class="goods_choose border_bottom add_call_pay_bg"><a href="选择商品规格.html" target="_self">商品评价</a></div> -->
			
            
            <c:if test="${!empty extList }">
	            <div class="goods_choose border_bottom add_call_pay_bg">
	            	商品属性:
	            	<c:forEach items="${extList }" var="ext">
	        		<p>${ext.proKey }: ${ext.proValue }</p>
	        		</c:forEach>
	            </div>
        	</c:if>
        	<div class="goods_choose border_bottom add_call_pay_bg">
	            	商品详情:
	        </div>
        	<div class="goodsdata_content">
        		<div class="goodsdata_content_1" style="margin-bottom: 30px;">
        			${goods.content }
         		</div>
        	</div>
    </div>
            <div class="clear"></div>
            <!-- 店铺 -->
<!--             <div class="goods_ggxx mt10 bgfff" id="container"> -->
<!--                 <div class="store_title"> -->
<!--                     <p>${goods.publisherName }</p> -->
<!--                     <span class="add_call_pay_bg">9.5分</span> -->
<!--                 </div> -->
<!--                 <div class="store_comment_for_goods"> -->
<!--                     <div class="store_Score_for_goods"> -->
<!--                         <img src="../static/img/xxxxxx_07.png" width="120"> -->
<!--                     </div> -->
<!--                     <p>上新商品<span>100件</span>　　促销商品<span>100件</span></p> -->
<!--                 </div> -->
<!--                 <div class="store_btn"> -->
<!--                     <a href="tel:13557112800" target="_self"><img src="../static/img/phonemin.png" width="23px;">咨询客服</a> -->
<!--                     <a href="" target="_self" style=" margin-left: 8.5%;"><img src="../static/img/Storeiconmini.png" width="23px;">进入店铺</a> -->
<!--                 </div> -->
<!--                 <div class="clear"></div> -->

<!--             </div> -->
            <div class="tophomecart">
                <p class="tophomecart_top"><a href="#top" target="_self"></a></p>
            </div>
        </div>
    </div>
<div class="container buy_submit border_top">
	<c:if test="${goods.status eq 1}">
    <p class="gocart"><img src="../static/img/goumai_03.png" width="25"> &nbsp;加入购物车</p>
    <p class="buy_new"><img src="../static/img/goumai_06.png" width="25"> &nbsp;立即购买</p>
    </c:if>
</div>

<style>
    body{position: relative;}
/*     #wrapper{ position: absolute; max-width: 750px; height: 637px;  overflow: hidden; } */
    #body{background: #f3f2f7; max-width: 750px }
</style>

   <script>
   var goods_id = ${goods.id};
        $(document).ready(function(){
            $('body #wrapper').css('height',$(window).height()+'px');
            //begin规格
            
            //alert(num);
            $(".slkz_min").click(function(){
	            var num = $(".slkz_input").val();
	            var zd = parseInt($(".spsx_kc span").html());
                $(".slkz_input").val(--num);
                if( num <= 0){
                    $(".slkz_input").val(++num);//商品数量不能为0
                }
            });
            $(".slkz_max").click(function(){
	            var num = $(".slkz_input").val();
	            var zd = parseInt($(".spsx_kc span").html());
                $(".slkz_input").val(++num);
                if( num > zd ){
                    $(".slkz_input").val(--num);//商品数量不能大于库存
                }
            });
            $(".spsx ul li").click(function(){
                $(this).addClass("spsx_default").siblings().removeClass("spsx_default");
                var price = GetSpecificationRePrice();
                if(price != null)
                {
                    $("#SpecPrice").html('&yen;'+price);
                }
                var stockNumt = GetSpecificationstockNum();
                $('#stockNum').html(stockNumt);
            });
            //eng规格数量
        });
        //begin规格
  var productSpecPrice ="";
  var productSpecOne=false;
  
  produceXsGg(goods_id);
  function produceXsGg(goods_id){
			var data={goods_id:goods_id};
			$.ajax({
                cache: true,
                type: "POST",
                url:"getGoodsSpecList",
                data:data,
                timeout:5000,
                async: false,
                error: function(request) {
//                 	SimMessageAlert("登录失败");
                },
                success: function(data) {
                	productSpecPrice=data.specList;
                	var html="";
                	if(data.specName==""||data.specName==null){
                		productSpecOne=true;
						$("#stockNum").html(data.specList[0].stock);
						$("#SpecPrice").html('&yen;'+data.specList[0].price);
					}else{
						$(data.specList).each(function(i,n){
							if(i==0){
								html+="<li class='spsx_default'>"+n.specValue+"</li>";
								$(this).addClass("spsx_default").siblings().removeClass("spsx_default");
			                    $("#SpecPrice").html('&yen;'+n.price);
				                $('#stockNum').html(n.stock);
							}else{
								html+="<li>"+n.specValue+"</li>";
							}
							
						});
						$("#spsx_gg").html(html);
						$("#spsx_ggName").html(data.specName+":");
					}
                }
            });
	}
        function GetSpecification()
        {
            if(productSpecPrice!=null)
            {
              if(productSpecOne){
                	json = eval(productSpecPrice);
                    return json[0];
              }else{
                var txt = "";
                $.each(jQuery(".spsx .spsx_default"), function (i, v) {
                    txt += $(this).text().trim();
                });
                json = eval(productSpecPrice);
                for(var i=0; i<json.length; i++)
                {
                    if(json[i].specValue == txt.trim())
                        return json[i];
                }
               } 
            }
            return null;
        }
        function GetSpecificationReId()
        {
            var obj = GetSpecification();
            if(obj!=null)
            {
                return obj.id;
            }
            return -1;
        }
        function GetSpecificationstockNum()
        {
            var obj = GetSpecification();
            if(obj!=null)
            {
                return obj.stock;
            }
            return 0;
        }
        function GetSpecificationRePrice() {
            var obj = GetSpecification();
            if(obj!=null)
            {
                return obj.price;
            }
            return null;
        }
        //end规格
       
        
    </script>

<script>
    $(".slider2").yxMobileSlider2({width:750,height:750,during:30});
</script>
<script>
    var isHaveProSpecificationPrice = true;
    var spec_id = "";
    var c = getQueryString('c');
    var sstr = (c == null || c == '')?"":"&c="+c;
    $(document).ready(function(){
       	function is_weixn(){  
		    var ua = navigator.userAgent.toLowerCase();  
		    if(ua.match(/MicroMessenger/i)=="micromessenger") {  
		        return true;  
		    } else {  
		        return false;  
		    }  
		}
        $(".gocart").click(function(){
            var spec_id = GetSpecificationReId();
            var number = $('.slkz_input').val();
            var zd = parseInt($("#stockNum").html());
            if( number > zd ) {
                jError('库存不足', { ShowOverlay: false });
            }
            else if(spec_id == -1)
            {
                jError('请选择规格', {ShowOverlay: false});
            }
            else
            {
            	
                //添加到购物篮
                if(!isNaN(spec_id)) {
                    var data={goods_id:goods_id,spec_id:spec_id,stock:number};
                    var user = '${sessionScope.user}';
		                	if(user==null||user==""){
		                		var url1 = window.location.href;
		                		if(is_weixn()){
		                			window.location.href='<%=codeUrl%>'+url1+'#wechat_redirect';
		                		}else{
		                			window.location.href="../user/toLogin?url="+url1;
		                		}
		                	}else{
								$.ajax({
					                cache: true,
					                type: "POST",
					                url:"saveGoodsInCar",
					                data:data,
					                timeout:5000,
					                async: false,
					                error: function(request) {
					                	jError('添加失败', {ShowOverlay: false});
					                },
					                success: function(data) {
										jSuccess('已经添加到购物篮中');
					                }
					            });
		            }
                }
            }
        });
        $(".buy_new").click(function(){
            var spec_id = GetSpecificationReId();
            var price = GetSpecificationRePrice();
            if(spec_id == -1)
            {
                jError('请选择规格', {ShowOverlay: false});
            }
            else
            {
                //添加到购物篮
                //alert(proid);
                var zd = parseInt($("#stockNum").html());
                var number = $('.slkz_input').val();
                if( number > zd ) {
                    jError('库存不足', { ShowOverlay: false });
                }
                else {
	                    if(!isNaN(spec_id)) {
	                    	var goodsType=$("input[name=goodsType]").val();
	                    	var user = '${sessionScope.user}';
		                	if(user==null||user==""){
		                		var url1 = window.location.href;
		                		if(is_weixn()){
		                			window.location.href='<%=codeUrl%>'+url1+'#wechat_redirect';
		                		}else{
		                			window.location.href="../user/toLogin?url="+url1;
		                		}
		                	}else{
		                		$.ajax({
					                cache: true,
					                type: "POST",
					                url:"checkStock",
					                data:{spec_id:spec_id,stock:number},
					                timeout:5000,
					                async: false,
					                error: function(request) {
					                	jError('添加失败', {ShowOverlay: false});
					                },
					                success: function(data) {
					                	data = parseInt(data)
					                	if(data==2){
					                		jError('库存不足', {ShowOverlay: false});
					                	}else{
					                		if(goodsType==2){
					                    		layer.prompt({title: '请输入送餐时间，例如：08:30', formType: 0}, function(postTime, index){
													$("input[name=postTime]").val(postTime);
										  			layer.close(index);
										  			window.location.href="createOrder?goods_id="+goods_id+"&spec_id="+spec_id+"&stock="+number+"&price="+price+"&postTime="+postTime+"&sign=1";
												});
					                    	}else{
					                    		window.location.href="createOrder?goods_id="+goods_id+"&spec_id="+spec_id+"&stock="+number+"&price="+price+"&sign=1";
					                    	}
					                	}
					                }
					            });
	                    	}
	                	}
                }

            }
        });
        $('#collectionAction').click(collectionOperation);
        function collectionOperation(){
            var className = $('#collectionAction div').attr("class");
            if(className == 'goods_sharenone'){
                	var data={goods_id:goods_id};
					$.ajax({
		                cache: true,
		                type: "POST",
		                url:"saveGoodsInStore",
		                data:data,
		                timeout:5000,
		                async: false,
		                error: function(request) {
		                	var user = '${sessionScope.user}';
		                	if(user==null||user==""){
		                		if(is_weixn()){
		                			window.location.href='<%=codeUrl%>'+url1+'#wechat_redirect';
		                		}else{
		                			window.location.href="../user/toLogin";
		                		}
		                	}else{
		                		jError('添加失败', {ShowOverlay: false});
		                	}
		                },
		                success: function(data) {
							jSuccess('收藏成功');
		                    if(className == 'goods_sharenone')
		                    {
		                        $('#collectionAction div').attr('class','goods_share');
		                        $('.collectionStatus').html("已收藏");
		                    }
		                    else
		                    {
		                        $('#collectionAction div').attr('class','goods_sharenone');
		                        $('.collectionStatus').html("收藏");
		                    }
		                }
		            });
            }
        }
    });

</script>
</body>
</html>
