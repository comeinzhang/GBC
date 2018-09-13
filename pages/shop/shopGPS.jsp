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
    <style type="text/css">
	body, html{width: 100%;height: 100%;margin:0;font-family:"微软雅黑";}
	#allmap {width:100%;overflow: hidden;}
	</style>
    <!--公共资源-->
    <link rel="stylesheet" href="../static/css/base_yhlm.css">
    <script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=FRtLDKq5GOmPdqdabCWMu3BXI3fvY8b4"></script>
	<script type="text/javascript" src="http://api.map.baidu.com/library/SearchInfoWindow/1.5/src/SearchInfoWindow_min.js"></script>
	<link rel="stylesheet" href="http://api.map.baidu.com/library/SearchInfoWindow/1.5/src/SearchInfoWindow_min.css" />
    <title>店铺导航</title>
</head>
<body>
<div class="p-heat">
    <span class="back-btn" onclick="javascript :history.back(-1);"></span>
    <div class="title">店铺导航</div>
</div>
<div id="allmap" style="margin-top: 50px;">
 
</div>
<script type="text/javascript">
	var addr1 = '${shop.userAddr}';
	var addrDetail = '${shop.addrDetail}';
	var addr = addr1+addrDetail;
	var phone = '${shop.phone}';
	var name = '${shop.name}';
	var shopDes = '${shop.shopDes}';
	var imgUrl = '${shop.chartUrl1}';
	var ASSET_URL = '${ASSET_URL}';
    // 调用HTML5 GeoLocation API获取地理位置
    function getLocation(){
        document.getElementById('allmap').innerHTML = '正在搜寻中，请稍候。。。';
        var options = {
            enableHighAccuracy:true, 
            maximumAge:1000
        }
        if(navigator.geolocation){
            //浏览器支持geolocation
            navigator.geolocation.getCurrentPosition(onSuccess,onError,options);
        }else{
            //浏览器不支持geolocation
            alert('浏览器不支持GeoLocation!');
        }
    }

    // 获取成功
    function onSuccess(position){
        // 经度
        var longitude =position.coords.longitude;
        // 纬度
        var latitude = position.coords.latitude;
        // 使用百度地图API创建地图实例  
        var map =new BMap.Map("allmap");
        // 创建一个坐标
        var point1 =new BMap.Point(longitude,latitude);

        // 地图初始化，设置中心点坐标和地图级别  
        map.centerAndZoom(point1, 18);

        // 设置标注的图标,可自己定义图标
        //var icon = new BMap.Icon("http://api.map.baidu.com/img/markers.png", new BMap.Size(23, 25), {  
        //    offset: new BMap.Size(10, 25),              // 定位图标尺寸  
        //    imageOffset: new BMap.Size(0, 0 - 11 * 25)  // 设置图片偏移  
        //}); 

        // 设置标注的经纬度
        //var marker = new BMap.Marker(new BMap.Point(longitude,latitude),{icon:icon});
        var marker = new BMap.Marker(new BMap.Point(longitude,latitude));

        // 把标注添加到地图上
	    map.addOverlay(marker);
	 	// 设置点击事件
        //marker.addEventListener("click", function(){
        //    alert("经度:" + longitude + ", 纬度:" + latitude);
        //});
	 
	    var content = '<div style="margin:0;line-height:20px;padding:2px;">' +
	        '<img src='+ASSET_URL+imgUrl+' alt="" style="float:right;zoom:1;overflow:hidden;width:100px;height:100px;margin-left:3px;"/>' +
	        '地址：'+addr+'<br/>电话：'+phone+'<br/>简介：'+shopDes+'' +
	      	'</div>';
			//创建检索信息窗口对象
		var searchInfoWindow = null;
		searchInfoWindow = new BMapLib.SearchInfoWindow(map, content, {
			title  : name,      //标题
			width  : 290,             //宽度
			height : 105,              //高度
			panel  : "panel",         //检索结果面板
			enableAutoPan : true,     //自动平移
			searchTypes   :[
				BMAPLIB_TAB_SEARCH,   //周边检索
				BMAPLIB_TAB_TO_HERE,  //到这里去
				BMAPLIB_TAB_FROM_HERE //从这里出发
			]
		});
			
		var myGeo = new BMap.Geocoder();
			// 将地址解析结果显示在地图上,并调整地图视野
		myGeo.getPoint(addr, function(point2){
			if (point2) {
				//map.centerAndZoom(point, 16);
				//map.addOverlay(new BMap.Marker(point));
				var marker = new BMap.Marker(point2); //创建marker对象
				marker.enableDragging(); //marker可拖拽
				marker.addEventListener("click", function(e){
					searchInfoWindow.open(marker);
				});
				map.addOverlay(marker);
				var driving = new BMap.DrivingRoute(map, {renderOptions:{map: map, autoViewport: true}});
				driving.search(point1, point2);
				//searchInfoWindow.open(marker);
			}else{
				alert("您选择地址没有解析到结果!");
			}
		}, addr);
    }

    // 获取失败
    function onError(error){
        switch(error.code){
            case 1:
                alert("位置服务被拒绝");
            break;

            case 2:
                alert("暂时获取不到位置信息");
            break;

            case 3:
                alert("获取信息超时");
            break;

            case 4:
                alert("未知错误");
            break;
        }
    }
    window.onload = getLocation;
</script>
</body>
</html>