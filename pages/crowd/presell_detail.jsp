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
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" />
    <meta name="apple-mobile-web-app-capable" content="yes" />
    <meta name="apple-mobile-web-app-status-bar-style" content="black" />
    <meta name="format-detection" content="telephone=no,email=no" />
    <meta name="HandheldFriendly" content="true"/>
    <!--Safari书签图标-->
    <link rel="stylesheet" href="../static/css/base_yph1.css">
    <link rel="stylesheet" href="../static/css/style_yph.css">
    <link rel="stylesheet" href="../static/css/ycys.css">
    <script type="text/javascript" src="../static/js/jquery.min.js"></script>
    <link rel="stylesheet" href="../static/css/jNotify.jquery.css">
	<script type="text/javascript" src="../static/js/jNotify.jquery.js"></script>
	<!--插件-->
    <script type="text/javascript" src="../static/iconfonts/icon_url.js"></script>
    <link rel="stylesheet" href="../static/plug-in/slide/slide.css">
    <script type="text/javascript" src="../static/plug-in/slide/swipeSlide.min.js"></script>
    <link rel="stylesheet" href="../static/plug-in/photoswipe/default-skin.css">
    <link rel="stylesheet" href="../static/plug-in/photoswipe/photoswipe.css">
    <script type="text/javascript" src="../static/plug-in/photoswipe/photoswipe.min.js"></script>
    <script type="text/javascript" src="../static/plug-in/photoswipe/photoswipe-ui-default.min.js"></script>
    <title>众筹</title>
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<style type="text/css">
		.content-tw img{
		width: 100%;
		}
	</style>
  </head>
<body>
<div class="goods-info">
    <div class="p-heat" id="indexTop">
        <span class="back-btn" onclick="javascript :history.back(-1);"></span>
        <div class="top-tab">
            <span class="active" id="GoIndexTop">商品</span>
            <span id="GoInfo">详情</span>
            <span id="GoCo">评论</span>
        </div>
    </div>
    <div id="shangpin">
        <div class="banner">
            <div class="slide" id="slide">
                <ul>
                	<c:forEach items="${imgList }" var="img">
                    <li><img src="${ASSET_URL }${img.imgUrl}" width="100%"></li>
                	</c:forEach>
                </ul>
            </div>
            <div class="text-yd-info">
                <p class="p1">定金<span class="s1">&yen;</span><span class="s2">${goods.cashPrice }</span><span class="s3">${goods.sellCount }件已定</span></p>
                <div class="time">
                    <p class="p3">距离结束时间</p>
                    <p class="p4" id="endTime">xx天xx时xx分</p>
                </div>
            </div>
        </div>
		<script language="javascript">
                                //限时抢购
                                var the_s = new Array();
                                function view_time(the_s_index, objid) {
                                    if (the_s[the_s_index] >= 0) {
                                        var the_D = Math.floor((the_s[the_s_index] / 3600) / 24)
		                                var the_H = Math.floor(the_s[the_s_index] / 3600);
		                                var the_M = Math.floor((the_s[the_s_index] - the_H * 3600) / 60);
		                                var the_S = (the_s[the_s_index] - the_H * 3600) % 60;
                                        var html = " ";
                                        if(the_D!=0) html += the_D+"天";
                                        if(the_D!=0 || the_H!=0) html += '<span class="hour">'+(the_H-(the_D*24))+"</span>时";
//                                         html += '<span class="hour">' + the_H + "</span>时";
                                        if (the_D != 0 || the_H != 0 || the_M != 0) html += ' <span class="minute">' + the_M + "</span>分";
//                                         html += ' <span class="second">' + parseInt(the_S) + "</span>秒";
                                        document.getElementById(objid).innerHTML = html;
                                        the_s[the_s_index]--;
                                    } else {
                                    	$("#priceMarkup").removeAttr("onclick");
                                        document.getElementById(objid).innerHTML = "已结束";
                                    }
                                }
                                var startDate = new Date();//("2016/01/26 15:00:00")
                                var endDate = new Date('${endTime}');
                                the_s[2402] = (endDate.getTime() - startDate.getTime()) / 1000;
                                setInterval("view_time(2402,'endTime')", 1000);
</script> 
        <div class="goods-msg">
            <p class="name" style="margin-right: 0px;">${goods.name }</p>
        </div>
        <div class="pingGo">
            <p class="p1">成长期水果成本预售</p>
            <p class="p2"><span class="s3">拼购</span>商品总预定数量越多,价格越低,快邀请好友一起拼价吧!</p>
            <div class="jd-bar">
                <div class="tx clearfix">
                	<c:forEach items="${presellList }" var="presell" varStatus="status">
                    <p <c:if test="${cgoodssellCount ge presell.presell }">class="active"</c:if> <c:if test="${!status.last and !status.first}">class="p4"</c:if> <c:if test="${status.last }">class="p5"</c:if> >满${presell.presell }件<br><span>&yen;${presell.price }</span></p>
                    </c:forEach>
                </div>
                <div class="jdp">
                    <!--进度条等于已购件数除以满件数-->
                    <div class="ttt" style="width:${result}"><span>${goods.sellCount}件已定</span></div>
                </div>
                <p class="p6">流程 1.付定金 2.付尾款 3.发货</p>
            </div>
        </div>
        <div class="select-specifications">
            <span class="s1">已选</span>
            <span class="s2 setText">${specList[0].specValue }  1件</span>
            <i class="iconfont icon-gengduo2"></i>
        </div>
        <!--选规格弹出-->
        <div class="specifications-add">
        <div class="mask"></div>
        <div class="select-box">
            <div class="close-add"><i class="iconfont icon-cha"></i></div>
            <div class="item">
                <div class="pic"><img src="${ASSET_URL }${goods.headImgUrl }"></div>
                <div class="text">
                    <p class="name" style="padding-right: 25px;">${goods.name }</p>
                </div>
            </div>
            <p class="text-1">
                <span class="s1">已选</span>
                <span class="s2 setText">1件</span>
            </p>
            <div class="add-num">
                <p class="p1">数量</p>
                <p class="p2" id="numAddJ"><i class="iconfont icon-jiajian-1"></i></p>
                <p class="p3"><input type="text" value="1" id="quantity" readonly="readonly"></p>
                <p class="p2" id="numAddJa"><i class="iconfont icon-jiajian-"></i></p>
            </div>
            <div class="bottom-btn">
                <p class="p1 addShoppingCart">邀请好友</p>
                <p class="p2 buy_new">支付定金</p>
            </div>
        </div>
    </div>
    </div>

    <div class="tab">
        <!--<div class="tab-title">
            <p class="active">图文详情</p>
            <p>评价</p>
        </div>-->
        <div class="tab-content content-tw none">
            <video width="100%" height="240"  controls >
                <source <c:if test="${!empty goods.videoUrl1 }">src="${goods.videoUrl1}"</c:if><c:if test="${empty goods.videoUrl1 }">src="${ASSET_URL }${goods.videoUrl}"</c:if> type="video/mp4"></source>
                	您的浏览器不支持Video标签。
            </video>
            <p>${goods.content }</p>
        </div>

        <div class="tab-content pj">
            <!--这个展示几条-->
            <div class="comments comments-w">
                <div class="title-w" id="ckPl"><span class="s1">评价(${fn:length(replyList)})</span><div class="icon-r">好评度<span class="s2">90%</span> <i class="iconfont icon-gengduo1"></i></div></div>
                <div class="evaluation_body">
                    <ul>
                    <c:forEach items="${replyList }" var="reply" begin="0" end="5">
                        <li class="evaluation_list">
                            <div class="evaluation_title border_bottom">
                                <div class="head_portrait">
                                    <img src="${ASSET_URL }${reply.user.headImgUrl}" >
                                </div>
                                <p>${reply.user.nickName}</p>
                                <span>${fn:substring(reply.createTime,0.19) }</span>
                            </div>
                            <div class="evaluation_content clearfix  evaluation_picture">
                                <p>${reply.reply }
                                </p>
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
<!--                                 <p>规格:1f70平安  型号:10g</p> -->
                                <p>购买日期:${reply.buyTime }</p>
                            </div>
                        </li>
                        </c:forEach>
                    </ul>
                </div>
            </div>

            <!--这个才是评论需要加载的-->
            <div class="comments none comments-show">
                <div class="evaluation_body">
                    <ul>
                        <c:forEach items="${replyList }" var="reply">
                        <li class="evaluation_list">
                            <div class="evaluation_title border_bottom">
                                <div class="head_portrait">
                                    <img src="${ASSET_URL }${reply.user.headImgUrl}" >
                                </div>
                                <p>${reply.user.nickName}</p>
                                <span>${fn:substring(reply.createTime,0.19) }</span>
                            </div>
                            <div class="evaluation_content clearfix  evaluation_picture">
                                <p>${reply.reply }
                                </p>
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
<!--                                 <p>规格:1f70平安  型号:10g</p> -->
                                <p>购买日期:${reply.buyTime }</p>
                            </div>
                        </li>
                        </c:forEach>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <div class="bottom">
        <div class="gys">
            <i class="iconfont icon-yaoqing"></i><br>
            <a href="tel:4000167117"><label>客服</label></a>
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
            <p class="addShoppingCart">邀请好友</p>
            <p class="goPlay">支付定金</p>
        </div>
    </div>
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


            <!-- <div class="pswp__loading-indicator"><div class="pswp__loading-indicator__line"></div></div> -->

            <div class="pswp__share-modal pswp__share-modal--hidden pswp__single-tap">
                <div class="pswp__share-tooltip">
                    <!-- <a href="#" class="pswp__share--facebook"></a>
                    <a href="#" class="pswp__share--twitter"></a>
                    <a href="#" class="pswp__share--pinterest"></a>
                    <a href="#" download class="pswp__share--download"></a> -->
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
 	var crowd_id = ${goods.id};
 	function is_weixn(){  
		    var ua = navigator.userAgent.toLowerCase();  
		    if(ua.match(/MicroMessenger/i)=="micromessenger") {  
		        return true;  
		    } else {  
		        return false;  
		    }  
		}
   function goGoodsCar(){
   	window.location.href="getGoodsCar";
   }
    </script>
<script>
    $(function(){
        //规格弹出
        $('.select-specifications').click(function(){
            $('.specifications-add').show();
        });
        $('.close-add').click(function(){
            $('.specifications-add').hide();
        });
        $('.goPlay').click(function(){
            $('.specifications-add').show();
        });
//         $('.addShoppingCart').click(function(){
//             $('.specifications-add').show();
//         });
        //选择规格
        $('.select-list p').click(function(){
            $(this).addClass('active').siblings().removeClass('active');
        });
		$('.addShoppingCart').click(function(){
			var url = window.location.href;
			url = url.replace("&flag=app", "");
			var title='${goods.name}';
			var summarize='${goods.summarize}';
			var img='${ASSET_URL }'+'${goods.headImgUrl }';
            location.href="http://www.fenxiang.com?===="+url+"===="+title+"===="+summarize+"===="+img;
        });
        //购物车加减
        //改变选择值已选择的变化
        function setText(){
                $('.setText').html($('#quantity').val()+'件')
        }
        /*商品数量+1*/
        $('#numAddJa').click(function(){
            var quantity = $("#quantity").val();
            var num_add = parseInt(quantity)+1;
            if(quantity==""){
                num_add = 1;
            }
            $("#quantity").val(num_add);
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

        ///图文切换
        $('.tab-title p').click(function(){
            $(this).addClass('active').siblings().removeClass('active');
            $('.tab-content').hide().eq($(this).index()).show()
        });

        //首页滚动
        $('#slide').swipeSlide({
            autoSwipe : true,
            continuousScroll:true,
            speed : 3000/*,
            transitionType : 'cubic-bezier(0.22, 0.69, 0.72, 0.88)',
            callback : function(i){
                obj.children().eq(i).addClass('cur').siblings().removeClass('cur');
            }*/
        });

        var inCo = true;//切换到品论才滚动翻页
        //选择商品标签
        $('#GoIndexTop').click(function(){
            $(this).addClass('active').siblings().removeClass('active');
            $('#shangpin').show();//商品
            $('.content-tw').hide();//图文
            $('.comments-w').show();//默认显示的三个评论
            $('.comments-show').hide();//所有评论
            $('body').scrollTo('0');
            inCo = true;
        });

        //选择详情标签
        $('#GoInfo').click(function(){
            $(this).addClass('active').siblings().removeClass('active');
            $('#shangpin').hide();
            $('.content-tw').show();
            $('.comments-w').hide();
            $('.comments-show').hide();
            $('body').scrollTo('0');
            inCo = true;
        });
        //选择评论标签
        $('#GoCo').click(function() {
            $('.content-tw').hide();
            $(this).addClass('active').siblings().removeClass('active');
            $('#shangpin').hide();
            $('.comments-w').hide();
            $('.comments-show').show();
            $('body').scrollTo('0');
            inCo = false;
        });

        //点击查看更多评论
        $('#ckPl').click(function() {
            $('.content-tw').hide();
            $('#GoCo').addClass('active').siblings().removeClass('active');
            $('#shangpin').hide();
            $('.comments-w').hide();
            $('.comments-show').show();
            $('body').scrollTo('0');
            inCo = false;
        });



        //分页加载
        var pageIng = 1;//初始页
        var pages = 3;//模拟总页数
        var inBottom = false;
        var loaDingGif = '<div class="spinner">'
                +'<div class="bounce1"></div>'
                +'<div class="bounce2"></div>'
                +'<div class="bounce3"></div>'
                +'</div>';
        var data = $('.comments-show ul').html();
        window.onscroll = function(){
            if(!inCo){
                //不是评论加载框下面就不执行了
                if(($(window).scrollTop()+50) >= ($(document).height() - $(window).height())){
                    if(pageIng > pages && !inBottom){
                        inBottom = true;
                    }else{
                        if(!inBottom){
                            pageIng++;
                            inBottom = true;
                            $('.comments-show').append(loaDingGif);//加载中动画
                            // 触发加载模拟ajax
                            setTimeout(function(){
                                $('.comments-show ul').append(data);
                                $('.spinner').remove();//加载完成
                                inBottom = false;
                            },1500);
                        }
                    }

                }
            }

        };
		$(".buy_new").click(function(){
        					var user = '${sessionScope.user}';
		                	if(user==null||user==""){
		                		var url1 = window.location.href;
		                		if(is_weixn()){
		                			window.location.href=<%=codeUrl%>+url1+"#wechat_redirect"
		                		}else{
		                			window.location.href="../user/toLogin?url="+url1;
		                		}
		                	}else{
	            				var number=$("#quantity").val();
		                    	var price='${goods.cashPrice}';
		                    	var endIs = $("#endTime").text();
		                    	if(endIs=="已结束"){
		                    		alert("此活动已经结束！")
		                    		return false;
		                    	}else{
		                    		window.location.href="createOrder?goods_id="+crowd_id+"&stock="+number+"&price="+price+"&sign=2";
		                    	}
		                    	
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
		                	if(user==null||user==""){
		                		var url1 = window.location.href;
		                		if(is_weixn()){
		                			window.location.href=<%=codeUrl%>+url1+"#wechat_redirect"
		                		}else{
		                			window.location.href="../user/toLogin?url="+url1;
		                		}
		                	}else{
                	var data={goods_id:crowd_id,flag:"1"};
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
    //评论图片放大器
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
</body>
</html>
