<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page language="java" import="com.tyh.model.ProConfigMap" %>
<%
String codeUrl = ProConfigMap.configMap.get("codeUrl");
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String DOMAIN_NAME = ProConfigMap.configMap.get("DOMAIN_NAME");
%>
<!DOCTYPE HTML >

<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <meta content="yes" name="apple-mobile-web-app-capable" />
    <meta content="black" name="apple-mobile-web-app-status-bar-style" />
    <meta content="telephone=no" name="format-detection" />
    <!--Safari书签图标-->
    <link rel="apple-touch-icon-precomposed" href="../static/img/bookmark.png"/>
    <script type="text/javascript" src="../static/js/QryUrlStrParam.js"></script>
    <link rel="stylesheet" href="../static/css/base_yph1.css">
    <link rel="stylesheet" href="../static/css/style_yph.css">
    <link rel="stylesheet" href="../static/css/details_yph.css">
    <script type="text/javascript" src="../static/js/jquery.min.js"></script>
	<link rel="stylesheet" href="../static/css/jNotify.jquery.css">
	<script type="text/javascript" src="../static/js/jNotify.jquery.js"></script>
	<script type="text/javascript" src="../static/js/yxMobileSlider.js"></script>
	<!--插件-->
    <link rel="stylesheet" href="../static/plug-in/slide/slide.css">
    <script type="text/javascript" src="../static/plug-in/slide/swipeSlide.min.js"></script>
	<link rel="stylesheet" href="http://at.alicdn.com/t/font_q9mn6nzxifk9y66r.css">
    <link rel="stylesheet" href="../static/plug-in/photoswipe/default-skin.css">
    <link rel="stylesheet" href="../static/plug-in/photoswipe/photoswipe.css">
	<link rel="stylesheet" href="../static/iconfonts/iconfont.css">
	<link rel="stylesheet" href="../static/iconfonts/icon_url.js">
    <script type="text/javascript" src="../static/plug-in/photoswipe/photoswipe.min.js"></script>
    <script type="text/javascript" src="../static/plug-in/photoswipe/photoswipe-ui-default.min.js"></script>
    <script src="http://res.wx.qq.com/open/js/jweixin-1.0.0.js"></script>
    <title>商品详情</title>
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<style type="text/css">
		.sale-service-content img{
		width: 100%;
		}
	</style>
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
	        link: 'http://www.rrhxzg.com/goods/getGoodsById?id='+'${goods.id}'+'&shareId='+'${user.id}',
	        imgUrl: '${ASSET_URL }${goods.headImgUrl}' 
	    });  
	      
	      
	    // 获取"分享给朋友"按钮点击状态及自定义分享内容接口  
	    wx.onMenuShareAppMessage({  
	        title: '${goods.name}', // 分享标题  
	        desc: '商品详情',
	        link: 'http://www.rrhxzg.com/goods/getGoodsById?id='+'${goods.id}'+'&shareId='+'${user.id}',
	        imgUrl: '${ASSET_URL }${goods.headImgUrl }'
	    });  
	      
	      
	    //获取"分享到QQ"按钮点击状态及自定义分享内容接口  
	    wx.onMenuShareQQ({  
	    	title: '${goods.name}', // 分享标题  
	    	desc: '商品详情',
	        link: 'http://www.rrhxzg.com/goods/getGoodsById?id='+'${goods.id}'+'&shareId='+'${user.id}',
	        imgUrl: '${ASSET_URL }${goods.headImgUrl }'
	    }); 
	      
	      
	    //获取"分享到腾讯微博"按钮点击状态及自定义分享内容接口  
	    wx.onMenuShareWeibo({  
	    	title: '${goods.name}', // 分享标题  
	    	desc: '商品详情',
	        link: 'http://www.rrhxzg.com/goods/getGoodsById?id='+'${goods.id}'+'&shareId='+'${user.id}',
	        imgUrl: '${ASSET_URL }${goods.headImgUrl }'
	    });  
	      
	      
	    //获取"分享到QQ空间"按钮点击状态及自定义分享内容接口  
	    wx.onMenuShareQZone({  
	    	title: '${goods.name}', // 分享标题  
	    	desc: '商品详情',
	        link: 'http://www.rrhxzg.com/goods/getGoodsById?id='+'${goods.id}'+'&shareId='+'${user.id}',
	        imgUrl: '${ASSET_URL }${goods.headImgUrl }'
	    });  
	});
	</script>
  </head>
<body>
<div class="goods-info">
	<div class="k-index" style="margin-bottom:40px;">
	<div class="head" style="padding-top: 0px;">
        	<div class="container myct">
            <span class="back" onClick="javascript :history.back(-1);"></span>
            <p>商品详情</p>
            <c:if test="${flag eq 'app'}">
			<div class="index_menubtn1" id="topMenu1"></div>
			</c:if>
    		</div>
     </div>
    </div> 
    <div class="banner picbg" style="margin-top: 0px;">
        <div class="slide" id="slide">
            <ul>
            	<c:forEach items="${imgList }" var="img">
                        <li><img src="${ASSET_URL }${img.imgUrl }" width="100%"></li>
                    </c:forEach> 
            </ul>
            <div class="dot">
                <span class="cur"></span>
            </div>
        </div>
    </div>

    <div class="goods-msg bgfff">
        <p class="name">${goods.name }</p>
        <p class="price">	
	        <span>&yen;${specList[0].price }</span>
	        <c:if test="${!empty sessionScope.user and fn:contains(sessionScope.user.userRoleId,'g') and sessionScope.user.id ne goods.publisherId}">
		        <span class="circle">佣</span>
		        <span style="font-size: 15px;">&yen;${specList[0].coms }</span>
		        <span class="s3 saveInShop" onclick="saveInShop();">加入我的店铺</span>
	        </c:if>
        </p>
        <p class="yj">库存 ${specList[0].stock }</p>
    </div>
    <!--选规格-->
    <div class="select-specifications">
        <span class="s1">已选</span>
        <span class="s2 setText">${specList[0].specValue }  1件</span>
        <i class="iconfont icon-gengduo2"></i>
    </div>
    <!--选规格弹出-->
    <div class="specifications-add">
    	<input type="hidden" name="spec_id" value="${specList[0].id }"/>
<!--     	<input type="hidden" name="spec_price" value="${specList[0].price }"/> -->
<!--     	<input type="hidden" name="spec_stock" value="${specList[0].stock }"/> -->
        <div class="mask"></div>
        <div class="select-box">
            <div class="close-add"><i class="iconfont icon-cha"></i></div>
            <div class="item">
                <div class="pic"><img src="${ASSET_URL }${goods.headImgUrl }"></div>
                <div class="text">
                    <p class="name" style="padding-right: 25px;">${goods.name }</p>
                    <p class="price" style="padding-right: 25px;">&yen;<span id="goodsPrice">${specList[0].price }</span>
                    	<c:if test="${!empty sessionScope.user and fn:contains(sessionScope.user.userRoleId,'g') and sessionScope.user.id ne goods.publisherId}">
                    		<span class="circle">佣</span><span style="font-size: 15px;" class="coms">&yen;${specList[0].coms }</span>
                    	</c:if>
                    </p>
                    <p class="price" style="padding-right: 25px;"><span style="color: gray;font-size: 12px;">库存  <span id="goodsStock" style="color: gray;font-size: 12px;">${specList[0].stock }</span></span></p>
                </div>
            </div>
            <p class="text-1">
                <span class="s1">已选</span>
                <span class="s2 setText">${specList[0].specValue }  1件</span>
            </p>
            <div class="select-list clearfix">
                <div class="left">${specList[0].specName }</div>
                <div class="right">
                	<c:forEach items="${specList }" var="spec" varStatus="status">
                    <p id="${spec.id }" <c:if test="${status.index eq 0}">class="active"</c:if>>${spec.specValue }</p>
                    </c:forEach>
                </div>
            </div>
            <div class="add-num">
                <p class="p1">数量</p>
                <p class="p2" id="numAddJ"><i class="iconfont icon-jiajian-1"></i></p>
                <p class="p3"><input type="text" value="1" id="quantity" readonly="readonly"></p>
                <p class="p2" id="numAddJa"><i class="iconfont icon-jiajian-"></i></p>
            </div>
            <div class="bottom-btn">
                <p class="p1 gocart">加入购物车</p>
                <p class="p2 buy_new">立即购买</p>
            </div>

        </div>
    </div>
	
    <!--评论+店铺-->
<!--     <div class="commentsAndShops"> -->
<!--         <div class="shops border-top"> -->
<!--             <div class="pic"><img src="https://img.alicdn.com/ef/59/TB19CeBGXXXXXbkaXXXSutbFXXX.jpg" width="100%"></div> -->
<!--             <div class="shops-info"> -->
<!--                 <p class="name">上海最世家私集团有限公司</p> -->
<!--                 <p class="location">发货地:上海</p> -->
<!--                 <p class="satisfaction">满意度 <span>★ ★ ★ ★ ★ ★ ★ ★</span></p> -->
<!--             </div> -->
<!--         </div> -->
<!--     </div> -->
    <div class="tab">
        <div class="tab-title">
            <p class="active">图文详情</p>
            <p>规格参数</p>
            <p>包装售后</p>
            <p>评价</p>
        </div>
        <div class="tab-content tw">
<!--             <p><img src="../static/images/船歌鱼水饺-京东定制装-混合口味-860g-（墨鱼_1，黄花鱼_1，鲅鱼_1，蛎虾三鲜_1）【图片-价格-品牌-报价】-京东.png"></p> -->
				<p>${goods.content}</p>
        </div>
        <div class="tab-content cans none">
            <table class="table-border" width="100%">
                <tbody>
                <tr>
                    <td colspan="2" style="text-align: center;"><strong>主体</strong></td>
                </tr>
                <c:forEach items="${extList }" var="ext">
	                <tr>
	                    <td>${ext.proKey }</td>
	                    <td>${ext.proValue }</td>
	                </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
        <div class="tab-content sh none">
            <div class="row">
<!--                 <div class="sale-service-title"><span class="title-text">包装清单</span></div> -->
                <div class="sale-service-content">
                	${goods.service }
                </div>
            </div>
        </div>
        <div class="tab-content pj none">
            <div class="comments">
<!--                 <ul class="evaluation_top clearfix"> -->
<!--                     <li class="default_pl">全部评论12</li> -->
<!--                     <li>好评10</li> -->
<!--                     <li>中评1</li> -->
<!--                     <li>差评1</li> -->
<!--                 </ul> -->
                <div class="evaluation_body">
                    <ul>
                    	<c:forEach items="${replyList }" var="reply">
                        <li class="evaluation_list">
                            <div class="evaluation_title border_bottom">
                                <div class="head_portrait">
                                    <img src="${ASSET_URL }${reply.user.headImgUrl}" >
                                </div>
                                <p>${reply.user.nickName }</p>
                                <span>${reply.updateTime }</span>
                            </div>
                            <div class="evaluation_content clearfix  evaluation_picture">
                                <p>${reply.reply }</p>
                                <div class="evaluation_picture demo-gallery clearfix"  id="demo-test-gallery" data-pswp-uid="1">
                                	<c:if test="${!empty reply.imgUrl1}">
                                    <a href="${ASSET_URL }${reply.imgUrl1}" data-size="400x400" data-med="${ASSET_URL }${reply.imgUrl1}" data-med-size="400x400" data-author="Folkert Gorter" class="demo-gallery__img--main">
                                        <img src="${ASSET_URL }${reply.imgUrl1}" width="100%">
                                    </a>
                                    </c:if>
                                    <c:if test="${!empty reply.imgUrl2}">
                                    <a href="${ASSET_URL }${reply.imgUrl2}" data-size="400x400" data-med="${ASSET_URL }${reply.imgUrl2}" data-med-size="400x400" data-author="Folkert Gorter" class="demo-gallery__img--main">
                                        <img src="${ASSET_URL }${reply.imgUrl2}" width="100%">
                                    </a>
                                    </c:if>
                                    <c:if test="${!empty reply.imgUrl3}">
                                    <a href="${ASSET_URL }${reply.imgUrl3}" data-size="400x400" data-med="${ASSET_URL }${reply.imgUrl3}" data-med-size="400x400" data-author="Folkert Gorter" class="demo-gallery__img--main">
                                        <img src="${ASSET_URL }${reply.imgUrl3}" width="100%">
                                    </a>
                                    </c:if>
                                </div>
                            </div>
                            <div class="sfandtime">
                                <p>${reply.spec.specName }:${reply.spec.specValue }</p>
                                <p>购买日期:${reply.buyTime }</p>
                            </div>
                        </li>
                        </c:forEach>
                    </ul>
                </div>
            </div>
        </div>
    </div>

	<c:if test="${goods.status eq 1}">
    <div class="bottom">
        <div class="gys">
        	<a href="tel:${shop.phone }">
            <i class="iconfont icon-yaoqing"></i><br>
            <label>联系客服</label></a>
        </div>
        <div class="shoppingCart" onclick="goGoodsCar()">
            <i class="iconfont icon-goumai1"></i><br>
            购物车
        </div>
        <c:if test="${empty store}">
        <div class="collect"  id="collectionAction">
            <i class="iconfont icon-wujiaoxing2"></i><br>
            	<span id="collection">收藏</span>
        </div>
        </c:if>
        <c:if test="${!empty store}">
        <div class="collect"  id="collectionActioned">
            <i class="iconfont icon-wujiaoxingshixin"></i><br>
            	<span id="collection">已收藏</span>
        </div>
        </c:if>
        <div class="play-btn clearfix">
            <p class="addShoppingCart ">加入购物车</p>
            <p class="goPlay ">立即购买</p>
        </div>
    </div>
    </c:if>
</div>
<!-- Root element of PhotoSwipe. Must have class pswp. -->
<div id="gallery" class="pswp" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="pswp__bg"></div>

    <div class="pswp__scroll-wrap">

        <div class="pswp__container">
            <div class="pswp__item"></div>
            <div class="pswp__item"></div>
            <div class="pswp__item"></div>
        </div>

        <div class="pswp__ui pswp__ui--hidden">

            <div class="pswp__top-bar">

                <div class="pswp__counter"></div>

                <button class="pswp__button pswp__button--close" title="Close (Esc)"></button>

                <button class="pswp__button pswp__button--share" title="Share" style="display: none!important;"></button>

                <button class="pswp__button pswp__button--fs" title="Toggle fullscreen"></button>

                <button class="pswp__button pswp__button--zoom" title="Zoom in/out"></button>

                <div class="pswp__preloader">
                    <div class="pswp__preloader__icn">
                        <div class="pswp__preloader__cut">
                            <div class="pswp__preloader__donut"></div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="pswp__share-modal pswp__share-modal--hidden pswp__single-tap">
                <div class="pswp__share-tooltip">
                </div>
            </div>

            <button class="pswp__button pswp__button--arrow--left" title="Previous (arrow left)"></button>
            <button class="pswp__button pswp__button--arrow--right" title="Next (arrow right)"></button>
            <div class="pswp__caption">
                <div class="pswp__caption__center">
                </div>
            </div>
        </div>

    </div>
</div>

   <script>
   var goodsFlag = '${goods.flag}';
   function goGoodsCar(){
   	window.location.href="getGoodsCar";
   }
   function produceXsGg(specId){
			var data={spec_id:specId};
			$.ajax({
                cache: true,
                type: "POST",
                url:"getGoodsSpec",
                data:data,
                timeout:5000,
                async: false,
                error: function(request) {
//                 	SimMessageAlert("登录失败");
                },
                success: function(data) {
                	$("input[name=spec_id]").val(data.spec.id);
	                $("#quantity").val(1);
	                $("#goodsPrice").text(data.spec.price);
	                $(".coms").text("¥"+data.spec.coms);
	                $("#goodsStock").text(data.spec.stock);
                }
            });
	}
    </script>

<script>

    $(function(){
			 //规格弹出
        $('.select-specifications').click(function(){
            $('.specifications-add').show();
        });
        $('.goPlay').click(function(){
            $('.specifications-add').show();
        });
        $('.addShoppingCart').click(function(){
            $('.specifications-add').show();
        });
        
        $('.close-add').click(function(){
            $('.specifications-add').hide();
        });
        //选择规格
        $('.select-list p').click(function(){
            $(this).addClass('active').siblings().removeClass('active');
            var spec_id=$(this).attr("id");
			produceXsGg(spec_id);
            setText();
        });

        //购物车加减
        //改变选择值已选择的变化
        function setText(){
                $('.setText').html($('.select-list .active').text()+' &nbsp;'+$('#quantity').val()+'件')
        }
        /*商品数量+1*/
        $('#numAddJa').click(function(){
            var quantity = $("#quantity").val();
            var num_add = parseInt(quantity)+1;
            if(quantity==""){
                num_add = 1;
            }
            	var stock = $("#goodsStock").text();
	            if(num_add>=stock){
	                $("#quantity").val(num_add-1);
	                alert("商品数量不能大于库存");
	            }else{
	                $("#quantity").val(num_add);
	            }
	            setText();
        });
        /*商品数量-1*/
        $('#numAddJ').click(function(){
            var quantity = $("#quantity").val();
            var num_dec = parseInt(quantity)-1;
            if(num_dec>0){
                $("#quantity").val(num_dec);
            }
            setText();
        });
			
        $('#topMenu').click(function(){
            $('.public-top-menus').toggle();
        });
		$('#topMenu1').click(function(){
			var url = window.location.href;
			url = url.replace("&flag=app", "");
			var title='${goods.name}';
			var summarize='${goods.summarize}';
			var img='${ASSET_URL }'+'${goods.headImgUrl }';
            location.href="http://www.fenxiang.com?===="+url+"===="+title+"===="+summarize+"===="+img;
        });
		
        ///图文切换
        $('.tab-title p').click(function(){
            $(this).addClass('active').siblings().removeClass('active');
            $('.tab-content').hide().eq($(this).index()).show()
        });

        //首页滚动
        //小圆点
        var obj=$('.dot');
        for(var i=0; i<$('#slide li').length-1;i++){
            obj.append('<span></span>');
        }
        //居中
        var w = obj.width();
        obj.css({'left':'50%','margin-left':'-'+ w/2 +'px'});


        $('#slide').swipeSlide({
            autoSwipe : true,
            continuousScroll:true,
            speed : 3000,
            transitionType : 'cubic-bezier(0.22, 0.69, 0.72, 0.88)',
            callback : function(i){
                obj.children().eq(i).addClass('cur').siblings().removeClass('cur');
            }
        });



    });
    (function() {

        var initPhotoSwipeFromDOM = function(gallerySelector) {

            var parseThumbnailElements = function(el) {
                var thumbElements = el.childNodes,
                        numNodes = thumbElements.length,
                        items = [],
                        el,
                        childElements,
                        thumbnailEl,
                        size,
                        item;

                for(var i = 0; i < numNodes; i++) {
                    el = thumbElements[i];

                    // include only element nodes
                    if(el.nodeType !== 1) {
                        continue;
                    }

                    childElements = el.children;

                    size = el.getAttribute('data-size').split('x');

                    // create slide object
                    item = {
                        src: el.getAttribute('href'),
                        w: parseInt(size[0], 10),
                        h: parseInt(size[1], 10),
                        author: el.getAttribute('data-author')
                    };

                    item.el = el; // save link to element for getThumbBoundsFn

                    if(childElements.length > 0) {
                        item.msrc = childElements[0].getAttribute('src'); // thumbnail url
                        if(childElements.length > 1) {
                            item.title = childElements[1].innerHTML; // caption (contents of figure)
                        }
                    }


                    var mediumSrc = el.getAttribute('data-med');
                    if(mediumSrc) {
                        size = el.getAttribute('data-med-size').split('x');
                        // "medium-sized" image
                        item.m = {
                            src: mediumSrc,
                            w: parseInt(size[0], 10),
                            h: parseInt(size[1], 10)
                        };
                    }
                    // original image
                    item.o = {
                        src: item.src,
                        w: item.w,
                        h: item.h
                    };

                    items.push(item);
                }

                return items;
            };

            // find nearest parent element
            var closest = function closest(el, fn) {
                return el && ( fn(el) ? el : closest(el.parentNode, fn) );
            };

            var onThumbnailsClick = function(e) {
                e = e || window.event;
                e.preventDefault ? e.preventDefault() : e.returnValue = false;

                var eTarget = e.target || e.srcElement;

                var clickedListItem = closest(eTarget, function(el) {
                    return el.tagName === 'A';
                });

                if(!clickedListItem) {
                    return;
                }

                var clickedGallery = clickedListItem.parentNode;

                var childNodes = clickedListItem.parentNode.childNodes,
                        numChildNodes = childNodes.length,
                        nodeIndex = 0,
                        index;

                for (var i = 0; i < numChildNodes; i++) {
                    if(childNodes[i].nodeType !== 1) {
                        continue;
                    }

                    if(childNodes[i] === clickedListItem) {
                        index = nodeIndex;
                        break;
                    }
                    nodeIndex++;
                }

                if(index >= 0) {
                    openPhotoSwipe( index, clickedGallery );
                }
                return false;
            };

            var photoswipeParseHash = function() {
                var hash = window.location.hash.substring(1),
                        params = {};

                if(hash.length < 5) { // pid=1
                    return params;
                }

                var vars = hash.split('&');
                for (var i = 0; i < vars.length; i++) {
                    if(!vars[i]) {
                        continue;
                    }
                    var pair = vars[i].split('=');
                    if(pair.length < 2) {
                        continue;
                    }
                    params[pair[0]] = pair[1];
                }

                if(params.gid) {
                    params.gid = parseInt(params.gid, 10);
                }

                return params;
            };

            var openPhotoSwipe = function(index, galleryElement, disableAnimation, fromURL) {
                var pswpElement = document.querySelectorAll('.pswp')[0],
                        gallery,
                        options,
                        items;

                items = parseThumbnailElements(galleryElement);

                // define options (if needed)
                options = {

                    galleryUID: galleryElement.getAttribute('data-pswp-uid'),

                    getThumbBoundsFn: function(index) {
                        // See Options->getThumbBoundsFn section of docs for more info
                        var thumbnail = items[index].el.children[0],
                                pageYScroll = window.pageYOffset || document.documentElement.scrollTop,
                                rect = thumbnail.getBoundingClientRect();

                        return {x:rect.left, y:rect.top + pageYScroll, w:rect.width};
                    },

                    addCaptionHTMLFn: function(item, captionEl, isFake) {
                        if(!item.title) {
                            captionEl.children[0].innerText = '';
                            return false;
                        }
                        captionEl.children[0].innerHTML = item.title +  '<br/><small>Photo: ' + item.author + '</small>';
                        return true;
                    },

                };


                if(fromURL) {
                    if(options.galleryPIDs) {
                        // parse real index when custom PIDs are used
                        // http://photoswipe.com/documentation/faq.html#custom-pid-in-url
                        for(var j = 0; j < items.length; j++) {
                            if(items[j].pid == index) {
                                options.index = j;
                                break;
                            }
                        }
                    } else {
                        options.index = parseInt(index, 10) - 1;
                    }
                } else {
                    options.index = parseInt(index, 10);
                }

                // exit if index not found
                if( isNaN(options.index) ) {
                    return;
                }



                var radios = document.getElementsByName('gallery-style');
                for (var i = 0, length = radios.length; i < length; i++) {
                    if (radios[i].checked) {
                        if(radios[i].id == 'radio-all-controls') {

                        } else if(radios[i].id == 'radio-minimal-black') {
                            options.mainClass = 'pswp--minimal--dark';
                            options.barsSize = {top:0,bottom:0};
                            options.captionEl = false;
                            options.fullscreenEl = false;
                            options.shareEl = false;
                            options.bgOpacity = 0.85;
                            options.tapToClose = true;
                            options.tapToToggleControls = false;
                        }
                        break;
                    }
                }

                if(disableAnimation) {
                    options.showAnimationDuration = 0;
                }

                // Pass data to PhotoSwipe and initialize it
                gallery = new PhotoSwipe( pswpElement, PhotoSwipeUI_Default, items, options);

                // see: http://photoswipe.com/documentation/responsive-images.html
                var realViewportWidth,
                        useLargeImages = false,
                        firstResize = true,
                        imageSrcWillChange;

                gallery.listen('beforeResize', function() {

                    var dpiRatio = window.devicePixelRatio ? window.devicePixelRatio : 1;
                    dpiRatio = Math.min(dpiRatio, 2.5);
                    realViewportWidth = gallery.viewportSize.x * dpiRatio;


                    if(realViewportWidth >= 1200 || (!gallery.likelyTouchDevice && realViewportWidth > 800) || screen.width > 1200 ) {
                        if(!useLargeImages) {
                            useLargeImages = true;
                            imageSrcWillChange = true;
                        }

                    } else {
                        if(useLargeImages) {
                            useLargeImages = false;
                            imageSrcWillChange = true;
                        }
                    }

                    if(imageSrcWillChange && !firstResize) {
                        gallery.invalidateCurrItems();
                    }

                    if(firstResize) {
                        firstResize = false;
                    }

                    imageSrcWillChange = false;

                });

                gallery.listen('gettingData', function(index, item) {
                    if( useLargeImages ) {
                        item.src = item.o.src;
                        item.w = item.o.w;
                        item.h = item.o.h;
                    } else {
                        item.src = item.m.src;
                        item.w = item.m.w;
                        item.h = item.m.h;
                    }
                });

                gallery.init();
            };

            // select all gallery elements
            var galleryElements = document.querySelectorAll( gallerySelector );
            for(var i = 0, l = galleryElements.length; i < l; i++) {
                galleryElements[i].setAttribute('data-pswp-uid', i+1);
                galleryElements[i].onclick = onThumbnailsClick;
            }

            // Parse URL and open gallery if it contains #&pid=3&gid=1
            var hashData = photoswipeParseHash();
            if(hashData.pid && hashData.gid) {
                openPhotoSwipe( hashData.pid,  galleryElements[ hashData.gid - 1 ], true, true );
            }
        };

        initPhotoSwipeFromDOM('.demo-gallery');

    })();

</script>
    <script>
    var goods_id = ${goods.id};
    var isHaveProSpecificationPrice = true;
    var shopId = ${shop.id};
    var c = getQueryString('c');
    var sstr = (c == null || c == '')?"":"&c="+c;
    function is_weixn(){  
		    var ua = navigator.userAgent.toLowerCase();  
		    if(ua.match(/MicroMessenger/i)=="micromessenger") {  
		        return true;  
		    } else {  
		        return false;  
		    }  
		}
    function saveInShop(){
    	$.ajax({
            cache: true,
            type: "POST",
            url:"../shop/setShareStatus",
            data:{goodsId:goods_id,shareStatus:"1"},
            timeout:5000,
            async: false,
            error: function(request) {
            	jError('添加失败', {ShowOverlay: false});
            },
            success: function(data) {
				jSuccess('已经添加到店铺');
				$(".saveInShop").removeAttr("onclick");
            }
        });
    }
    $(document).ready(function(){
        $(".gocart").click(function(){
            		var spec_id=$("input[name=spec_id]").val();
            		var number=$("#quantity").val();
                //添加到购物篮
                    var data={goods_id:goods_id,spec_id:spec_id,stock:number};
                    var user = '${sessionScope.user}';
		            if(user==null||user==""||user==undefined){
		            		var url1 = window.location.href;
		            		url1 = url1.replace(/&/g,"$");
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
								jSuccess('已经添加到购物车中');
			                }
			            });
		        }    
        });
        var shareId = '${shareId}';
        $(".buy_new").click(function(){
        					var user = '${sessionScope.user}';
		                	if(user==null||user==""||user==undefined){
		                		var url1 = window.location.href;
		                		url1 = url1.replace(/&/g,"$");
			                		if(is_weixn()){
			                			window.location.href='<%=codeUrl%>'+url1+'#wechat_redirect';
			                		}else{
			                			window.location.href="../user/toLogin?url="+url1;
			                		}
		                	}else{
		                		var spec_id=$("input[name=spec_id]").val();
	            				var number=$("#quantity").val();
		                    	var goodsType=$("input[name=goodsType]").val();
		                    	var price=$("#goodsPrice").text();
		                		$.ajax({
					                cache: true,
					                type: "POST",
					                url:"checkStock",
					                data:{spec_id:spec_id,stock:number,goodsFlag:goodsFlag},
					                timeout:5000,
					                async: false,
					                error: function(request) {
					                	jError('添加失败', {ShowOverlay: false});
					                },
					                success: function(data) {
					                	data = parseInt(data);
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
					                    		window.location.href="createOrder?goods_id="+goods_id+"&spec_id="+spec_id+"&shopId="+shopId+"&stock="+number+"&price="+price+"&sign=1&shareId="+shareId;
					                    	}
					                	}
					                }
					            });
		                	}
        					
        });
        $('.collect').click(collectionOperation);
        function collectionOperation(){
            var className = $('.collect').attr("id");
            var url="";
            var msg="";
            if(className == 'collectionAction'){
            	url="saveGoodsInStore";
            	msg="收藏成功";
            }else if(className == 'collectionActioned'){
            	url="deleteGoodsStore";
            	msg="取消成功";
            }
            var user = '${sessionScope.user}';
		                	if(user==null||user==""||user==undefined){
			                		var url1 = window.location.href;
			                		url1 = url1.replace(/&/g,"$");
				                		if(is_weixn()){
				                			window.location.href='<%=codeUrl%>'+url1+'#wechat_redirect';
				                		}else{
				                			window.location.href="../user/toLogin?url="+url1;
				                		}
		                	}else{
			                	var data={goods_id:goods_id,flag:"1"};
								$.ajax({
					                cache: true,
					                type: "POST",
					                url:url,
					                data:data,
					                timeout:5000,
					                async: false,
					                error: function(request) {
					                		jError('添加失败', {ShowOverlay: false});
					                },
					                success: function(data) {
										jSuccess(msg);
					                    if(className == 'collectionAction')
					                    {
					                        $('.collect').attr('id','collectionActioned');
					                        $('#collection').html("已收藏");
					                        $('.collect i').addClass("icon-wujiaoxingshixin")
					                        $('.collect i').removeClass("icon-wujiaoxing2")
					                    }
					                    else if(className == 'collectionActioned')
					                    {
					                        $('.collect').attr('id','collectionAction');
					                        $('.collect i').addClass("icon-wujiaoxing2")
					                        $('.collect i').removeClass("icon-wujiaoxingshixin")
					                        $('#collection').html("收藏");
					                    }
					                }
					            });
		         }   
        }
       
    });

</script>
</body>
</html>
