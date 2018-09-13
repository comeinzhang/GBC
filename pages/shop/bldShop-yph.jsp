<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML >

<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" />
    <meta name="apple-mobile-web-app-capable" content="yes" />
    <meta name="apple-mobile-web-app-status-bar-style" content="black" />
    <meta name="format-detection" content="telephone=no,email=no" />
    <meta name="HandheldFriendly" content="true"/>
    <!--公共资源-->
    <link rel="stylesheet" href="../static/css/base-yph.css">
    <link rel="stylesheet" href="../static/css/bld.css">
    <script type="text/javascript" src="../static/js/jquery.min.js"></script>
    <link rel="stylesheet" href="http://at.alicdn.com/t/font_450229_7k0kvgzblzjs8aor.css">
    <!--主要样式-->
    <script type="text/javascript" src="../static/js/jNotify.jquery.js"></script>
    <link rel="stylesheet" href="../static/css/jNotify.jquery.css">
    <script type="text/javascript" src="../static/plug-in/slider/swipeSlide.min.js"></script>
    <link rel="stylesheet" href="../static/plug-in/slider/slide.css">
    <link rel="stylesheet" href="../static/plug-in/layer/skin/default/layer.css">
    <script type="text/javascript" src="../static/plug-in/layer/layer.js"></script>
    <script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=FRtLDKq5GOmPdqdabCWMu3BXI3fvY8b4"></script>
	<script type="text/javascript" src="http://api.map.baidu.com/library/SearchInfoWindow/1.5/src/SearchInfoWindow_min.js"></script>
	<link rel="stylesheet" href="http://api.map.baidu.com/library/SearchInfoWindow/1.5/src/SearchInfoWindow_min.css" />
    <title>便利店</title>
</head>
<body ontouchstart >
<div class="page-warp">
    <div class="head-bar">
        <div class="t-bar">
            <div class="btn-l" onclick="javascript :history.back(-1);">
                <i class="iconfont icon-iconxiangzuo f21"></i>
            </div>
            <div class="text"><a href="bldAddrIndex" id="bldAddr"><i class="iconfont icon-dizhi1"></i><span id="myAddr"><c:if test="${empty addr }"> 获取地址中……</c:if><c:if test="${!empty addr }">${addr }</c:if></span><img src="../static/images/dw_03.png"></a></div>
        </div>
    </div>
    <div class="bld-index">
        <div class="slide" id="slide">
            <ul>
                <li><a href="javascript:void(0)" target="_self"><img src="../static/images/bn'_02.png"></a></li>
                <li><a href="javascript:void(0)" target="_self"><img src="../static/images/bn'_02.png"></a></li>
            </ul>
            <div class="dot">
            </div>
        </div>
        <div class="id-tt"><span class="s1">离你最近的店铺</span><span class="s2"><img src="../static/images/bn'_06.png" onclick="getCurrentPosition();"></span></div>
        <div class="g-list">
            
        </div>
    </div>
</div>
<div id="allmap" style="display: none;">
</div>
</body>
<script type="text/javascript">
var pages = 0;//初始页
var list_count='';
var isLastPage = false;
var goodsGetIn=false;
var ASSET_URL = '${ASSET_URL}';
var totalPage=0;
function resetpt(){
    pages=0;
    list_count='';
    goodsGetIn=false;
    isLastPage = false;
    totalPage=0;
}
var loaDingGif = '<div class="spinner">'
        +'<div class="bounce1"></div>'
        +'<div class="bounce2"></div>'
        +'<div class="bounce3"></div>'
        +'</div>';
	window.onscroll = function(){
	    if(($(window).scrollTop()+50) >= ($(document).height() - $(window).height())){
	        if(pages+1 > totalPage){
	            isLastPage = true;
	        }else{
	        	if(lon!=""&&lon!=null&&lat!=null&&lat!="")
	        	getGoods();
	        }
	    }
	};
var lon = '${lon}';
var lat = '${lat}';
if(lon==null||lon==""||lat==null||lat==""){
	getCurrentPosition();
}else{
	getGoods();
}
function getCurrentPosition(){
	var geolocation = new BMap.Geolocation();
	geolocation.getCurrentPosition(function(r){
		if(this.getStatus() == BMAP_STATUS_SUCCESS){
			var point1 = r.point;
			lon = point1.lng;
			lat = point1.lat;
			var geoc = new BMap.Geocoder(); 
			geoc.getLocation(point1, function(rs){
				var addComp = rs.addressComponents;
				//var addr = addComp.province + ", " + addComp.city + ", " + addComp.district + ", " + addComp.street + ", " + addComp.streetNumber;
				var addr = addComp.district + ", " + addComp.street + ", " + addComp.streetNumber;
				var city = addComp.city;
				$("#myAddr").text(addr);
				$("#bldAddr").attr("href","bldAddrIndex?lon="+lon+"&lat="+lat+"&addr="+addr+"&city="+city); 
			});
			$(".g-list").html("");
			resetpt();
			getGoods();
		}
		else {
			alert('failed'+this.getStatus());
		}        
	},{enableHighAccuracy: true})
}

    function getGoods(){
        if(!isLastPage && !goodsGetIn){
        	pages=parseInt(pages)+1;
        	//var data={pages:pages,name:name,addr:addr,shopType:3};
        	var data={pages:pages,lon:lon,lat:lat,shopType:3};
            $.ajax({
            	cache: true,
                type: "POST",
                url:"bldShopList",
                data:data,
                timeout:5000,
                async: false,
                beforeSend:function(XMLHttpRequest){
                	//努力加载
                	$('.fjsj-index').append(loaDingGif);//加载中动画
                    goodsGetIn = true;
                },
                success: function (data){
                    //请求成功时处理
                    if(data.list.length != null && data.list.length != 'undefined'){
                        list_count=data.page.totalResult;
                        totalPage=data.page.totalPage;
                        var lis = '';
                        $(data.list).each(function(i,n){
                        	var goods = n.mainGoods.split("，");
                            lis += "<div class='goods-box'>"
                            	+ "<a href='shopDetail?id="+n.id+"'>"
                            	+ "<div class='content'>"
	                            + "<div class='pic'><img src="+ASSET_URL+n.logoUrl+"></div>"
	                            + "<div class='text'>"
	                            + "<div class='name ellipsis'>"+n.name+"</div>"
	                            + "<div class='xx ellipsis'>"+n.mainGoods+"</div>"
	                            + "<div class='jl'>"+n.longNum+"Km</div>"
	                            + "</div>"
	                            + "</div>"
	                            + "</a>"
	                            + "</div>";
                        });
                        $(".g-list").append(lis);
                    }
                },
                complete:function(){
                	$('.spinner').remove();//加载完成
                    goodsGetIn=false;
                },
                error: function () {
                    jNotify("服务器或者网络错误",{ShowOverlay : false});
                }
            });
        }
    }
</script>
<script>
    $(function(){
        //小圆点
        var obj=$('.dot');
        for(var i=0; i<$('#slide li').length;i++){
            obj.append('<span></span>');
        }
        $('#slide').swipeSlide({
            continuousScroll:true,
            speed : 3000,
            transitionType : 'cubic-bezier(0.22, 0.69, 0.72, 0.88)',
            callback : function(i){
                $('.dot').children().eq(i).addClass('cur').siblings().removeClass('cur');
            }
        });
    });

</script>
</html>