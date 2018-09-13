﻿<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
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
    <!--Safari书签图标-->
    <link rel="apple-touch-icon-precomposed" href="../static/img/bookmark.png"/>
    <script type="text/javascript" src="../static/js/QryUrlStrParam.js"></script>
    <link rel="stylesheet" href="../static/css/base_yph1.css">
    <link rel="stylesheet" href="../static/css/details_yph.css">
    <script type="text/javascript" src="../static/js/jquery.min.js"></script>
	<script type="text/javascript" src="../static/js/yxMobileSlider.js"></script>
	<!--插件-->
	<link rel="stylesheet" href="http://at.alicdn.com/t/font_q9mn6nzxifk9y66r.css">
	<link rel="stylesheet" href="../static/iconfonts/iconfont.css">
	<link rel="stylesheet" href="../static/iconfonts/icon_url.js">
    <title>商品详情</title>
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<style type="text/css">
		.sale-service-content img{
		width: 100%;
		}
	</style>
  </head>
<body>
<div class="goods-info" style="margin-bottom: 0px;height:100%;">
    <div class="tab">
        <div class="tab-title">
            <p class="active">图文详情</p>
            <p>规格参数</p>
            <p>包装售后</p>
            <p>评价</p>
        </div>
        <div class="tab-content tw">
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
                                	<c:choose> 
										<c:when test="${fn:contains(reply.user.headImgUrl,'http')}">    
											  <img src="${reply.user.headImgUrl}"/>
										</c:when>
										<c:otherwise>    
											   <img src="${ASSET_URL }${reply.user.headImgUrl}"/>
										</c:otherwise> 
									</c:choose>
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
</div>
<!-- Root element of PhotoSwipe. Must have class pswp. -->
<div id="gallery" class="pswp" tabindex="-1" role="dialog" aria-hidden="true" style="display: none;">
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

    $(function(){
		
        ///图文切换
        $('.tab-title p').click(function(){
            $(this).addClass('active').siblings().removeClass('active');
            $('.tab-content').hide().eq($(this).index()).show()
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
</body>
</html>