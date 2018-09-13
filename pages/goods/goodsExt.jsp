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
    <title>描述详情</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <meta content="yes" name="apple-mobile-web-app-capable" />
    <meta content="black" name="apple-mobile-web-app-status-bar-style" />
    <meta content="telephone=no" name="format-detection" />
    <link rel="stylesheet" href="../static/css/base.css">
    <link rel="stylesheet" href="../static/css/style.css">
    <script type="text/javascript" src="../static/js/jquery.min.js"></script>
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
  </head>
<body>
<div id="wrapper">
        <div id="body">
<div class="container myct">
	<span class="back" onClick="javascript :history.back(-1);"></span>
  	<p>描述详情</p>
</div>
<div class="container">
    <div class="goodsdata_top border_bottom">
        <ul>
            <li class="goodsdata_top_1 search_cl">描述详情</li>
            <li>查看规格</li>

        </ul>
        <div class="clear"></div>
    </div>
    <div class="goodsdata_content">
        <div class="goodsdata_content_1">
        	<c:forEach items="${imgList }" var="img">
        		<img src="${ASSET_URL}${img.imgUrl }" alt="image" />
        	</c:forEach>
         </div>
        <div class="goodsdata_content_1 goodsdata_content_2">
        	<c:forEach items="${extList }" var="ext">
        		<p>${ext.proKey }: ${ext.proValue }</p>
        	</c:forEach>
        </div>
    </div>

</div>

            </div>
        </div>
    <div class="goods-downGo">
        ↓ 拉加返回商品页
    </div>
<script>
    $(document).ready(function(){
        //选项卡
        $(".goodsdata_top li").click(function(){
            var str = $(".goodsdata_content_1").width();
            $(".goodsdata_top li").eq($(this).index()).addClass("search_cl").siblings().removeClass("search_cl");
            $(".goodsdata_content").stop().animate({right:$(this).index() * str +"px"})
        });

    });
</script>






    <style>
        #body{background: #f3f2f7; max-width: 750px }
        body .goods-downGo{
            position: fixed;
            width: 100%;
            top: 0;
            z-index: -1;
            overflow: hidden;
            text-align: center;
            line-height: 45px;
            color: #969696;}

    </style>

    <script>

        $(document).ready(function(){
            $('body #wrapper').css('height',$(window).height()+'px');
        });

        var move = function(e) {
            e.preventDefault && e.preventDefault();
            e.returnValue = false;
            e.stopPropagation && e.stopPropagation();
            return false;
        };
        //禁止滚动
        function addliste() {
            var d =document.getElementsByTagName('html');
            for(var i=0;i< d.length;i++){
                d[i].addEventListener('touchmove', move, false);
            }

        }
        addliste();

        var dy = 0;
        //删除左右滑动
        function load(){
            document.getElementById('body').addEventListener('touchstart',fn, false);
            document.getElementById('body').addEventListener('touchmove',fn, false);
            document.getElementById('body').addEventListener('touchend',fn, false);
            function fn(e){
                var event = e || window.event;
                var a = $(this);
                var objW = a.height();
                var wiw = $(window).height();
                switch(event.type){
                    case "touchstart":
                        var touch = event.touches[0];
                        startX = touch.pageX;
                        startY = touch.pageY;
                        break;
                    case "touchmove":
                        var touch = event.touches[0];
                        X = touch.pageX - startX;
                        Y = touch.pageY - startY;
                        var mx = Math.abs(X);
                        var my = Math.abs(Y);
                        /*if ( mx > my && X > 0 ) {
                         }
                         else if ( mx > my && X < 0 ) {
                         //a右边向左滑动
                         }*/
                        if ( my > mx && Y > 0) {
                            //alert("top 2 bottom");
                            a.css('transform','translate(0,'+(dy+my)+'px)');
                            if(Math.abs((dy-my))>45){
                                $('.goods-downGo').html('松开返回商品页');
                            }else{
                                $('.goods-downGo').html('↓ 拉加返回商品页');
                            }
                        }
                        else if ( my > mx && Y < 0 ) {
                            //alert("bottom 2 top");
                            a.css('transform','translate(0,'+(dy-my)+'px)');
                        }
                        break;
                    case "touchend":
                        //event.preventDefault();//取消浏览器默认行为
                        var ex = Math.abs(X);
                        var ey = Math.abs(Y);
                        dy = a.offset().top;
                    function checkBottom(){
                        if(objW-Math.abs(dy)<wiw ){
                            dy=(objW-wiw);
                            //console.log(dy);
                            a.css('transform','translate(0,-'+dy+'px)');
                            dy = a.offset().top;
                        }
                    }

                        if ( ey > ex && Y > 0) {
                            //alert("top 2 bottom");
                            checkBottom();
                            if(Math.abs(dy)>0 && dy>0){
                                if(Math.abs((dy))>45){
                                    //跳转返回
                                    //location.href='8.html';
                                    var goodscookie = $.cookie('goodscookie');
                                    var pid = getQueryStringForName('id');
                                    $.cookie('goodsDetailcookie', pid);
                                    if(goodscookie == pid)
                                    {
                                        history.go(-1);
                                    }
                                    else
                                    {
                                        $.pjax({url: 'index.php?m=QxWeb&a=goods&id='+pid, container: 'html'});
                                    }
                                    dy = 0;
                                    a.css('transform','translate(0,0px)');
                                }else{
                                    dy = 0;
                                    a.css('transform','translate(0,0px)');
                                }
                            }

                        }
                        else if ( ey > ex && Y < 0 ) {
                            checkBottom();
                        }
                        break;
                }
            }
        }
        load();
    </script>

</body>

</html>
