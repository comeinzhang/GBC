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
    <script src="${pageContext.request.contextPath}/static/iconfonts/icon_url.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/base_yph.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery.min.js"></script>
    <script type="text/javascript" src="../static/js/jNotify.jquery.js"></script>
    <!--主要样式-->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/details.css">
    <link rel="stylesheet" href="../static/css/jNotify.jquery.css">
    <link rel="stylesheet" href="../static/css/base.css">
    <link rel="stylesheet" href="../static/css/style.css">
     <link rel="stylesheet" href="../static/plug-in/photoswipe/default-skin.css">
    <link rel="stylesheet" href="../static/plug-in/photoswipe/photoswipe.css">
	<link rel="stylesheet" href="../static/iconfonts/iconfont.css">
	<link rel="stylesheet" href="../static/iconfonts/icon_url.js">
    <script type="text/javascript" src="../static/plug-in/photoswipe/photoswipe.min.js"></script>
    <script type="text/javascript" src="../static/plug-in/photoswipe/photoswipe-ui-default.min.js"></script>
    <title>拍卖详情</title>
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
  </head>
<body ontouchstart>

<script>
	function is_weixn(){  
		    var ua = navigator.userAgent.toLowerCase();  
		    if(ua.match(/MicroMessenger/i)=="micromessenger") {  
		        return true;  
		    } else {  
		        return false;  
		    }  
		}
    $(function () {
//         吊起微信图片预览器
        var imgsObj = $('.img-warp img');
        var imgs = new Array();
        for (var i = 0; i < imgsObj.size(); i++) {
            imgs.push(imgsObj.eq(i).attr('src'));
        }

        $('.img-warp img').on('click', function () {
            WeixinJSBridge.invoke('imagePreview', {
                'current': $(this).attr('src'),
                'urls': imgs
            });
        });
        
        //关注
        $(".focus").on("click",function(){
        	var userId = $(this).attr("id");
        	var data={userId:userId};
        	var flag = false;
        	var user = '${sessionScope.user}';
		    if(user==null||user==""){
		    	 var url = window.location.href;
		    	if(is_weixn()){
		    		window.location.href='<%=codeUrl%>'+url1+'#wechat_redirect';
		     	}else{
		           window.location.href="../user/toLogin?url="+url;
		        }
		    }else{
				$.ajax({
						cache: true,
						type: "POST",
						url:"saveMyFocus",
						data:data,
						timeout:5000,
						async: false,
						error: function(request) {
							jError('关注失败', {ShowOverlay: false});
						},
						success: function(data) {
							jSuccess('已关注');
							flag=true;
						}
				});
				if(flag){
				
				}
		   }
        });
    });

    //图片撑满
    function setImgCenter(objClass){
        var imgObj =  $(objClass).find('img');
        $(objClass).find('.img').height($(objClass).eq(0).width()).css('padding','0');
        imgObj.each(function(){
            if($(this).height() > 0){
                if($(this).height() < $(this).parent('.img').height()){
                    $(this).css({
                        'width':'auto',
                        'height':'100%'
                    });
                }else{
                    $(this).css({
                        'width':'100%',
                        'height':'auto'
                    });
                }
            }
        });
    }
    window.onload=function(){
        setImgCenter('.img-warp');
    };
    window.onresize=function() {
        setImgCenter('.img-warp');
    };

</script>
<script>
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

        initPhotoSwipeFromDOM('.img-warp');

    })();

</script>
<div class="details-block">
	<div class="container myct">
            <span class="back" onClick="javascript :history.back(-1);"></span>
            <p>拍卖列表</p>
    </div>
<!--     <div class="piHeard"> -->
<!--         <div class="p">${publisher.nickName }</div> -->
<!--         <div class="pic"><img -->
<!--                 src="${ASSET_URL }${publisher.headImgUrl}" -->
<!--                 width="100%"> -->
<!--         </div> -->
<!--     </div> -->
    <c:forEach items="${typeGoodsList }" var="goods">
    <div class="b-warp" id="goods_${goods.id}">
        <div class="left-1">
            <div class="img">
                <img src="${ASSET_URL }${goods.publisher.headImgUrl}"
                     width="100%">
                <c:if test="${goods.ISFocus eq 0}">
                <div id="${goods.publisher.id}" class="focus" style="text-align: center;font-size: 14px;margin-top:5px;border: 1px #ccc solid;display: block;color: red;">  
                     <span id="focusIs">关注+</span>
                </div>
                </c:if>
                <c:if test="${goods.ISFocus > 0}">     
                <div style="text-align: center;font-size: 14px;margin-top:5px;border: 1px #ccc solid;display: block;color: gray;">  
                     <span>已关注</span>
                </div>
                </c:if>
            </div>
        </div>
        <div class="right-1">
            <div class="r-warp">
                <div class="user-name">
                    <i class="iconfont icon-lv4"></i><!--icon-lv0~icon-lv5-->
                    <span>${goods.publisher.nickName }</span>
                </div>
                <div class="good-text">
                    ${goods.content }
                </div>
                <div class="good-img clearFix">
                	<c:forEach items="${goods.imgList }" var="img">
                    <div class="img-warp">
                        <div class="img"><img src="../static/images/000_03.png"></div>
                    </div>
                    </c:forEach>
                </div>
            </div>
            <div class="pm-index">
                <div class="content-block">
                    <div class="title">
                        <p>
                        	<c:if test="${goods.freePost eq 1}">
                            <span class="sp1">包邮</span>
                            </c:if>
                            <span>${fn:substring(goods.publishTime,5,11) } </span>
                        </p>
                        <p class="p1">
<!--                             41<i class="iconfont icon-fire"></i> -->
							<c:if test="${empty goods.store}">
	                             <i class="iconfont icon-wujiaoxing2 collectionAction" id="${goods.id }">
		                             <span class="collectionStatus">收藏</span>
	                             </i>
                             </c:if>
                             <c:if test="${!empty goods.store}">
	                             <i class="iconfont icon-wujiaoxingshixin collectionAction" id="${goods.id }">
		                             <span class="collectionStatus">已收藏</span>
	                             </i>
                             </c:if>
                        </p>
                    </div>
                    <div class="warp">
                    <c:if test="${!empty goods.storeList}">
                        <div class="us-pic clearFix " <c:if test="${goods.storeSize > 13}">class="active"</c:if> >
                        	<c:forEach items="${goods.storeList }" var="store">
                            <p id="${store.storer.id}"><span><img height="30px;" src="${ASSET_URL}${store.storer.headImgUrl}"></span></p>
                            </c:forEach>
							<c:if test="${goods.storeSize > 13}">
                            <p class="p1"><span class="iconfont icon-gengduo"></span></p>
                            </c:if>
                        </div>
                    </c:if>    
                        <div class="time-title">
                            <p class="p1">正在拍卖</p>
                            <p class="p3"></p>
                            <p class="time" id="xsq_2402${goods.id}">
                                	距离结束 : <span class="hour">00</span> 时<span class="minute"></span> 分<span
                                    class="second"></span> 秒
                            </p>
                            <input type="hidden" name="endTime" value="${goods.endTime }"/>
                        </div>
                        <div class="btn">
                            <p class="button" id="priceMarkup" onclick="priceMarkup(${goods.startPrice },${goods.increatePrice },${goods.cashPrice },${goods.id },${goods.bidMaxPrice})">出价</p>
                        </div>
                        <div class="jj clearFix">
                            <div class="inl inl-1"><p class="p1"><span class="sp1">起</span> ${goods.startPrice }元</p></div>
                            <div class="inl inl-1"><p class="p1"><span class="sp1">加</span> ${goods.increatePrice }元</p></div>
                            <div class="inl"><p class="p1"><span class="sp1">保</span> ${goods.cashPrice }元</p></div>
                            <div class="inl inl-1"><p class="p1"><span class="sp1">延</span> 五分钟</p></div>
                             <div class="inl inl-3"><p class="p1"><span class="sp1">参考价</span> ${goods.referPrice }元</p></div>
                        </div>
                        <div class="user-ranking">
                        	<c:forEach items="${goods.bidList}" var="bid" varStatus="status">
	                            <div  <c:if test="${status.index eq 0}">class="row ranking-1"</c:if><c:if test="${status.index ne 0}">class="row"</c:if>>
	                                <div class="pic">
	                                    <img src="${ASSET_URL }${bid.user.headImgUrl }" width="100%">
	                                    <p>学士</p>
	                                </div>
	                                <div class="text">
	                                    <p class="name">${bid.user.nickName }</p>
	                                    <p class="price">&yen; ${bid.price }</p>
	                                </div>
	                                <div class="right">
	                                    <div class="ic"><i class="iconfont icon-icon-lingxian"></i></div>
	                                    <div class="ti" style="font-size: 12px;">${fn:substring(bid.updateTime,0,19) }</div>
	                                </div>
	                            </div>
                            </c:forEach>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    </c:forEach>
    <div class="ip-alert none">
                <div class="maskBox" id="mb_1" onclick="closeIA()"></div>
                <div class="sp-box">
                    <div class="title">
                        <p class="p1">领先价 <span class="bidPrice"></span>元</p>
                        <p class="p2" onclick="closeIA()"><i class="iconfont icon-cha"></i></p>
                    </div>
                    <div class="ip">出价 <input type="number" class="clearIP clearIP1"> <span
                            onclick="delValue()"><i class="iconfont icon-cha1"></i></span></div>
                    <div class="btn">
                        <p class="button" onclick="showTP()">出价</p>
                        <div class="p2">
                           	 出价即表示同意《协议》
                        </div>
                    </div>
                </div>
                <div class="maskBox maskBox1 none" id="mb_2"></div>
                <div class="tp-box none">
                    <div class="warp">
                        <div class="p1">
                            <p>本商户已设置出价保护, 您本次出价需支付保证金</p>
                            <p>如违约, 保证金将扣除并赔偿给卖家</p>
                        </div>
                        <div class="btn">
                            <p class="button">支付保证金</p>
                            <p class="button button1" onclick="closeIP()">取消</p>
                        </div>
                    </div>
                </div>
            </div>
</div>
<script language="javascript">
                                //限时抢购
                                var the_s = new Array();
	                                function view_time(the_s_index) {
	                                    $(".time-title").each(function (index,element){
											var startDate = new Date();//("2016/01/26 15:00:00")
											var endTime = $(this).find("input[name=endTime]").val();
											var objid = $(this).find(".time").attr("id");
			                                var endDate = new Date(endTime);
			                                the_s[2402] = (endDate.getTime() - startDate.getTime()) / 1000;
			                               
		                                    if (the_s[the_s_index] >= 0) {
		                                        var the_D = Math.floor((the_s[the_s_index] / 3600) / 24)
		                                        var the_H = Math.floor(the_s[the_s_index] / 3600);
		                                        var the_M = Math.floor((the_s[the_s_index] - the_H * 3600) / 60);
		                                        var the_S = (the_s[the_s_index] - the_H * 3600) % 60;
		                                        var html = " ";
		                                        //if(the_D!=0) html += the_D+"天";
		                                        //if(the_D!=0 || the_H!=0) html += '<span class="hour">'+(the_H+(the_D*24))+"</span>小时";
		                                        html += '距离结束 : <span class="hour">' + the_H + "</span> 时";
		                                        if (the_D != 0 || the_H != 0 || the_M != 0) html += ' <span class="minute">' + the_M + "</span> 分";
		                                        html += ' <span class="second">' + parseInt(the_S) + "</span> 秒";
		                                        document.getElementById(objid).innerHTML = html;
		                                        the_s[the_s_index]--;
		                                    } else {
		                                    	$(this).parents().find("#priceMarkup").removeAttr("onclick");
		                                        document.getElementById(objid).innerHTML = "已结束";
		                                    }	
		                                });
	                                }
                                $(document).ready(function(){
									 setInterval("view_time(2402)", 1000);
								});
                                
</script>         
<script>
				var totalPrice="";
                var increatePrice="";
                var startPrice = "";
                var goods_id = "";
                var cashPrice="";
                var bidMaxPrice="";
                var ASSET_URL='${ASSET_URL}';
                //弹出出价
                function priceMarkup(startPrice1,increatePrice1,cashPrice1,id,bidMaxPrice1) {
               	 	var user = '${sessionScope.user}';
                	if(user==null||user==""){
                		 var url = window.location.href;
						if(is_weixn()){
							window.location.href='<%=codeUrl%>'+url1+'#wechat_redirect';
						}else{
							window.location.href="../user/toLogin?url="+url;
						}
					}else{
	                	startPrice=startPrice1;
	                	increatePrice=increatePrice1;
	                	cashPrice=cashPrice1;
	                	goods_id=id;
	                	bidMaxPrice=bidMaxPrice1;
	                	if(bidMaxPrice==0){
	                		 $(".bidPrice").text(bidMaxPrice);
		                     $(".clearIP").val(startPrice);
	                	}else{
	                		totalPrice = parseInt(bidMaxPrice)+parseInt(increatePrice);
		                     $(".bidPrice").text(bidMaxPrice);
		                     $(".clearIP").val(totalPrice);
	                	}
	                    $('.ip-alert').show();
	                    $(".details-block").css('height', $(window).height());
                    }
                }
                //关闭出价
                function closeIA() {
                    $('.ip-alert').hide();
                    $(".details-block").css('height', 'auto');
                }
                //弹出支付定金
                function showTP() {
                	if(cashPrice!=0){
                		$('#mb_1').hide();
                    	$('#mb_2, .tp-box').show()
                	}else{
                		var ASSET_URL = '${ASSET_URL}';
                		var price = $(".clearIP").val();
                		var data={goods_id:goods_id,price:price};
                		var parentsId = "goods_"+goods_id;
                		if(parseInt(price)<totalPrice){
                			alert("最少加"+increatePrice);
                		}else{
	                		$.ajax({
								cache: true,
						        type: "POST",
						        url:"saveGoodsBid",
						        data:data,
						        async: false,
						        error: function(request) {
						            jError('网络异常', {ShowOverlay: false});
						        },
						        success: function(data) {
							        	$('.ip-alert').hide();
		                    			$(".details-block").css('height', 'auto');
	                    			if(data.state=="500"){
	                    				jError('出价失败，已有人比您出的价高！', {ShowOverlay: false});
	                    			}else{
							        	jSuccess('出价成功');
							        	$(".ranking-1").removeClass('ranking-1');
							        	var html="<div class='row ranking-1'>";
							        	html+="<div class='pic'>"
							        		+"<img src="+ASSET_URL+data.bid.user.headImgUrl+" width='100%'>"
							        		+"<p>学士</p>"
							        		+"</div>"
							        		+"<div class='text'>"
							        		+"<p class='name'>"+data.bid.user.nickName+"</p>"
							        		+"<p class='price'>"+data.bid.price+"</p>"
							        		+"</div>"
							        		+"<div class='right'>"
							        		+"<div class='ic'><i class='iconfont icon-icon-lingxian'></i></div>"
							        		+"<div class='ti' style='font-size: 12px;'>"+data.bid.updateTime+"</div>"
							        		+"</div>"
							        		+"</div>";
							        	$("#"+parentsId).find(".user-ranking").prepend(html);
						        	}
						        }
							});
                		}
                	}
                    
                }
                //关闭支付定金
                function closeIP() {
                    $('#mb_1').show();
                    $('#mb_2, .tp-box').hide();
                }
                //情况数字
                function delValue() {
                    $('.clearIP1').val('');
                }

            </script>

                        <script>
                            //收缩
                            
                            $(function () {
                                $('.us-pic .p1').click(function () {
                                    var sp1 = '<span class="iconfont icon-gengduo"></span>';
                                    var sp2 = '<span class="iconfont icon-shouqi"></span>';
                                    var obj = $(this).parent();
                                    if(obj.hasClass('active')){
                                        obj.removeClass('active');
                                        $(this).html(sp2);
                                    }else{
                                        obj.addClass('active');
                                        $(this).html(sp1);
                                    }
                                });
                                $(".collectionAction").on("click",function(){
                                var className = $(this).attr("class");
                                var url="";
            					var msg="";
            					var html="";
            					var sign="";
                                if(className.indexOf("icon-wujiaoxing2") != -1){
					            	url="saveGoodsInStore";
					            	msg="收藏成功";
					            	html="已收藏";
					            	sign="store";
					            }else if(className.indexOf("icon-wujiaoxingshixin") != -1){
					            	url="deleteGoodsStore";
					            	msg="取消成功";
					            	html="收藏";
					            	sign="del";
					            }
                                goods_id=$(this).attr("id");
                                var parentsId="goods_"+goods_id;
                                var user = '${sessionScope.user}';
								    if(user==null||user==""){
								    	var url1 = window.location.href;
								    	if(is_weixn()){
								    		window.location.href='<%=codeUrl%>'+url1+'#wechat_redirect';
								     	}else{
								           window.location.href="../user/toLogin?url="+url1;
								        }
								    }else{
						                	var data={goods_id:goods_id,flag:"detail"};
						                	var flag = false;
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
								                    flag=true;
								                }
								            });
								            if(flag){
								            	$(this).find('.collectionStatus').html(html);
								            	if(sign=="store"){
								            		html="<p><span><img height='30px;' src="+ASSET_URL+user.headImgUrl+"></span></p>"
								            		$("#"+parentsId).find(".us-pic").prepend(html);
								            		$(this).removeClass("icon-wujiaoxing2");
								            		$(this).addClass("icon-wujiaoxingshixin");
								            	}else if(sign=="del"){
								            		$(this).removeClass("icon-wujiaoxingshixin");
								            		$(this).addClass("icon-wujiaoxing2");
								            	}
								            	
								            }
								        }    
						        });
                            })
                        </script>
</body>
</html>
