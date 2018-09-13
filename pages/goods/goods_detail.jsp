<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page language="java" import="com.tyh.model.ProConfigMap" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String codeUrl = ProConfigMap.configMap.get("codeUrl");
%>
<!DOCTYPE HTML >

<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <meta content="yes" name="apple-mobile-web-app-capable" />
    <meta content="black" name="apple-mobile-web-app-status-bar-style" />
    <meta content="telephone=no" name="format-detection" />
    <link rel="stylesheet" href="../static/css/base_yph1.css">
    <script type="text/javascript" src="../static/iconfonts/icon_url.js"></script>
    <script type="text/javascript" src="../static/js/jquery.min.js"></script>
    <script type="text/javascript" src="../static/js/jNotify.jquery.js"></script>
    <script type="text/javascript" src="../static/plug-in/photoswipe/photoswipe.min.js"></script>
    <script type="text/javascript" src="../static/plug-in/photoswipe/photoswipe-ui-default.min.js"></script>
    <link rel="stylesheet" href="../static/plug-in/photoswipe/default-skin.css">
    <link rel="stylesheet" href="../static/plug-in/photoswipe/photoswipe.css">
    <!--主要样式-->
    <link rel="stylesheet" href="../static/css/npm.css">
    <link rel="stylesheet" href="../static/css/jNotify.jquery.css">
    <title>拍卖详情</title>
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
  </head>
<body>
<div class="p-heat">
    <span class="back-btn" onclick="javascript :history.back(-1);"></span>
    <p class="title">拍卖详情</p>
</div>
<div class="details-block">
    <div class="r-warp">
        <div class="user-name">
            <span class="s1"><i>
                    <c:choose> 
					      <c:when test="${fn:contains(publisher.headImgUrl,'http')}">    
					              <img src="${publisher.headImgUrl}"/>
					      </c:when>
					      <c:otherwise>    
					           <img src="${ASSET_URL }${publisher.headImgUrl}"/>
					      </c:otherwise> 
					</c:choose> 
                    </i>${publisher.nickName }</span>
                    <c:if test="${ISFocus eq 0 || empty ISFocus}">  
                    <p class="p1" id="focus" onclick="focusHim(${publisher.id})">关注</p>
                    </c:if>
                    <c:if test="${ISFocus > 0}">
                    <p class="p1 active">已关注</p>
                    </c:if>
        </div>
        <div class="good-text">
            <p>${goods.content }</p>
        </div>
        <!--img的src是小图  a链接href是中图 打他med是大图-->
        <div class="good-img clearfix demo-gallery" id="demo-test-gallery">
					<c:forEach items="${imgList }" var="img">
	                    <a href="${ASSET_URL }${img.imgUrl}" data-size="400x400" data-med="${ASSET_URL }${img.imgUrl}" data-med-size="800x800" data-author="Folkert Gorter" class="demo-gallery__img--main">
	                        <img src="${ASSET_URL }${img.imgUrl}" width="100%">
<!-- 	                        <img src="../static/images/820f43e8gw1f7u7qv34ugj20k00dx74u.jpg" width="100%"> -->
	                    </a>
                    </c:forEach>
        </div>
    </div>
    <div class="pm-index">
        <div class="content-block">
            <div class="title">
                <p>
                    <span>${fn:substring(goods.publishTime,0,11) }</span>
                </p>
                <p class="p1">
							<c:if test="${empty store}">
	                             <span class="collectionStatus">收藏</span>
	                             <i class="iconfont icon-wujiaoxing2 collectionAction" id="${goods.id }">
	                             </i>
                             </c:if>
                             <c:if test="${!empty store}">
                             	<span class="collectionStatus">已收藏</span>
	                             <i class="iconfont icon-wujiaoxingshixin collectionAction" id="${goods.id }">
	                             </i>
                             </c:if>
                             &nbsp;&nbsp;&nbsp;&nbsp;
                    		 <span id="share">分享 <i class="iconfont icon-share"></i></span>
                </p>
            </div>
            <div class="warp">

                <div class="time-title">
                    <p class="p1">正在拍卖</p>

                    <p class="p3"></p>

                    <p class="time" id="xsq_2402">
                        距离结束 : <span class="hour">00</span> 时<span class="minute"></span> 分<span
                            class="second"></span> 秒
                    </p>
                    <script language="javascript">
                        //限时抢购
                        var the_s = new Array();
                        function view_time(the_s_index, objid) {
                            if (the_s[the_s_index] >= 0) {
                                var the_D = Math.floor((the_s[the_s_index] / 3600) / 24)
                                var the_H = Math.floor((the_s[the_s_index] - the_D * 24 * 3600) / 3600);
                                var the_M = Math.floor((the_s[the_s_index] - the_D * 24 * 3600 - the_H * 3600) / 60);
                                var the_S = (the_s[the_s_index] - the_H * 3600) % 60;
                                var html = " ";
                                //if(the_D!=0) html += the_D+"天";
                                //if(the_D!=0 || the_H!=0) html += '<span class="hour">'+(the_H+(the_D*24))+"</span>小时";
                                html += '距离结束 : <span class="hour">' + the_H + "</span> 时";
                                if (the_D != 0 || the_H != 0 || the_M != 0) html += ' <span class="minute">' + the_M + "</span> 分";
                                html += ' <span class="second">' + parseInt(the_S) + "</span> 秒";
                                document.getElementById('xsq_2402').innerHTML = html;
                                the_s[the_s_index]--;
                            } else {
                                document.getElementById('xsq_2402').innerHTML = "已结束";

                            }
                        }
                        var startDate = new Date();//("2016/01/26 15:00:00")
                        var endDate = new Date("2017/06/20 17:00:00");
                        the_s[2402] = (endDate.getTime() - startDate.getTime()) / 1000;
                        setInterval("view_time(2402,'xsq_2402')", 1000);
                    </script>
                </div>
                <div class="btn">
                    <p class="button" onclick="priceMarkup()"></p>
                </div>
                <div class="jj clearfix">
                    <div class="inl inl-1"><p class="p1"><span class="sp1">起</span> ${goods.startPrice }元</p></div>
                            <div class="inl inl-1"><p class="p1"><span class="sp1">加</span> ${goods.increatePrice }元</p></div>
<!--                             <div class="inl"><p class="p1"><span class="sp1">保</span> ${goods.cashPrice }元</p></div> -->
                            <div class="inl inl-1"><p class="p1"><span class="sp1">延</span> 五分钟</p></div>
                             <div class="inl inl-1"><p class="p1"><span class="sp1">参考价</span> ${goods.referPrice }元</p></div>
                </div>
                <div class="user-ranking">
					<c:forEach items="${bidList}" var="bid" varStatus="status">
	                            <div  <c:if test="${status.index eq 0}">class="row ranking-1"</c:if><c:if test="${status.index ne 0}">class="row"</c:if>>
	                                <div class="pic">
	                                	<c:choose> 
										      <c:when test="${fn:contains(bid.user.headImgUrl,'http')}">    
										              <img src="${bid.user.headImgUrl }" width="100%" height="100%">
										      </c:when>
										      <c:otherwise>    
										           <img src="${ASSET_URL }${bid.user.headImgUrl }" width="100%" height="100%">
										      </c:otherwise> 
										</c:choose>
	                                </div>
	                                <div class="text">
	                                    <p class="name">${bid.user.nickName }</p>
	                                    <p class="price">&yen; ${bid.price }</p>
	                                </div>
	                                <div class="right">
	                                    <div class="ic"><i <c:if test="${status.index eq 0}">class="iconfont icon-icon-lingxian"</c:if><c:if test="${status.index ne 0}">class="iconfont icon-icon-chuju"</c:if>></i></div>
	                                    <div class="ti">${fn:substring(bid.updateTime,0,19) }</div>
	                                </div>
	                            </div>
                            </c:forEach>
                </div>
            </div>
        </div>
    </div>

</div>
<div class="pm-bottom">
    <div class="inner-b">
        <div class="row">
            <div class="tip-btn">
                <i class="iconfont icon-shizhong"></i>
                <p class="p1">设置<br>提醒</p>
            </div>
<!--             <input type="hidden" value="${bidList[0].price}" name="bidPrice" id="bidPrice"/> -->
            <div class="ip"><input type="text" class="clearIP" placeholder="最低加价${goods.increatePrice }" ></div>
            <div class="add-price-btn"><i class="iconfont icon-jiajian-"></i></div>
            <div class="add-btn" onclick="showTP()">出价</div>
        </div>
        <div class="row row2">
            <div class="ip"><input type="text" placeholder="评论"></div>
            <div class="add-btn">发送</div>
        </div>
        <div class="b-t">出价即表示同意<a href="" target="_self">《益拍行竞拍服务协议》</a></div>
    </div>
</div>
<script>
function is_weixn(){
		    var ua = navigator.userAgent.toLowerCase();  
		    if(ua.match(/MicroMessenger/i)=="micromessenger") {  
		        return true;  
		    }else{
		        return false;  
		    }
		}
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

	function focusHim(userId){
		var user = '${sessionScope.user}';
		if(user==null||user==""){
			var url1 = window.location.href;
			if(is_weixn()){
				window.location.href='<%=codeUrl%>'+url1+'#wechat_redirect';
			}else{
				window.location.href="../user/toLogin?url="+url1;
			}
		}else{
			var data={userId:userId};
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
							$("#focus").removeAttr("onclick");
							$("#focus").addClass("active");
							$("#focus").html("已关注");
						}
				});
		}	
	}
	$(document).ready(function(){
				$(".index_menubtn").click(function(){
					$(".index_menu").stop().fadeToggle('flow');
				});
			});
</script>
  
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
                                        //if(the_D!=0) html += the_D+"天";
                                        //if(the_D!=0 || the_H!=0) html += '<span class="hour">'+(the_H+(the_D*24))+"</span>小时";
                                        html += '距离结束 : <span class="hour">' + the_H + "</span>时";
                                        if (the_D != 0 || the_H != 0 || the_M != 0) html += ' <span class="minute">' + the_M + "</span>分";
                                        html += ' <span class="second">' + parseInt(the_S) + "</span>秒";
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
                                setInterval("view_time(2402,'xsq_2402')", 1000);
</script>         
<script>
                //弹出出价
                var ASSET_URL = '${ASSET_URL}';
                function showTP() {
                		if($("#xsq_2402").text()=="已结束"){
                			alert("拍卖已经结束");
                			return false;
                		}
                		var user = '${sessionScope.user}';
		                if(user==null||user==""){
		                		var url1 = window.location.href;
		                		if(is_weixn()){
		                			window.location.href='<%=codeUrl%>'+url1+'#wechat_redirect';
		                		}else{
		                			window.location.href="../user/toLogin?url="+url1;
		                		}
		                }else{
	                		var goods_id = '${goods.id}';
	                		var price = $(".clearIP").val();
	                		var data={goods_id:goods_id,price:price};
	                		if(parseInt(price)<totalPrice){
	                			alert("出价太低");
	                		}else{
		                		$.ajax({
									cache: true,
							        type: "POST",
							        url:"saveGoodsBid",
							        data:data,
							        async: false,
							        error: function(request) {
							            jError('评论失败', {ShowOverlay: false});
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
								        	$(".user-ranking").prepend(html);
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
                            var totalPrice="";
                            var increatePrice="";
                            var startPrice = "";
                            var goods_id='${goods.id}';
                            $(function () {
                            	$("#share").click(function(){
									var url = window.location.href;
									url = url.replace("&flag=app", "");
									var title='${goods.name}';
									var summarize='${goods.summarize}';
									var img='${ASSET_URL }'+'${goods.headImgUrl }';
						            location.href="http://www.fenxiang.com?===="+url+"===="+title+"===="+summarize+"===="+img;
						        });
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
                                var bid = ${bidSize};
                                if(bid==0){
//                                 	$(".bidPrice").text('0');
                                	$(".clearIP").val('${goods.startPrice }');
                                	totalPrice = '${goods.startPrice }';
                                }else{
                                	var price = '${bidList[0].price}';
                                	increatePrice = '${goods.increatePrice }';
                                	totalPrice = parseInt(price)+parseInt(increatePrice);
// 	                                $(".bidPrice").text('${bidList[0].price}');
	                                $(".clearIP").val(totalPrice);
                                }
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
						                	var data={goods_id:goods_id,flag:"1"};
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
<script>
    //图片放大插件
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
<div id="gallery" class="pswp" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="pswp__bg"></div>

    <div class="pswp__scroll-wrap">

        <div class="pswp__container" style="transform: translate3d(0px, 0px, 0px);">
            <div class="pswp__item" style="display: block; transform: translate3d(-420px, 0px, 0px);"><div class="pswp__zoom-wrap" style="transform: translate3d(0px, 146px, 0px) scale(1);"><img class="pswp__img" src="http://qx.fanershop.com/data/upload/shop/store/goods/7/7_05217214126729510_800.jpg" style="opacity: 1; width: 375px; height: 375px;"></div></div>
            <div class="pswp__item" style="transform: translate3d(0px, 0px, 0px);"><div class="pswp__zoom-wrap" style="transform: translate3d(188.281px, 303px, 0px) scale(0.204102);"><img class="pswp__img pswp__img--placeholder" src="images/820f43e8gw1f7u7qv34ugj20k00dx74u.jpg" style="width: 375px; height: 375px; display: none;"><img class="pswp__img" src="http://qx.fanershop.com/data/upload/shop/store/goods/7/7_05217214126729510_800.jpg" style="display: block; width: 400px; height: 400px;"></div></div>
            <div class="pswp__item" style="display: block; transform: translate3d(420px, 0px, 0px);"><div class="pswp__zoom-wrap" style="transform: translate3d(0px, 146px, 0px) scale(1);"><img class="pswp__img" src="http://qx.fanershop.com/data/upload/shop/store/goods/7/7_05217214126729510_800.jpg" style="opacity: 1; width: 375px; height: 375px;"></div></div>
        </div>

        <div class="pswp__ui pswp__ui--hidden">

            <div class="pswp__top-bar">

                <div class="pswp__counter">3 / 4</div>

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
                <div class="pswp__caption__center"></div>
            </div>
        </div>

    </div>


</div>           
</body>
</html>
