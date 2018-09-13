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
    <link rel="stylesheet" href="../static/css/base-yph.css">
    <link rel="stylesheet" href="../static/css/gwc.css">
    <link rel="stylesheet" href="../static/css/jNotify.jquery.css">
    <script type="text/javascript" src="../static/js/jquery.min.js"></script>
    <script type="text/javascript" src="../static/js/jNotify.jquery.js"></script>
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
  </head>
<body>
<div class="page-warp">
    <div class="head-bar">
        <div class="t-bar">
            <div class="text">
                购物车
            </div>
            <div class="ddr">
                <span style="color: #fe6345">管理</span>
            </div>

        </div>
    </div>
    <div class="gwc-index">
        <div class="g-list">
            <div class="goods-box">
                <div class="info-list">
                    <div class="item">
                        <div class="d1 dsl">
                            <div class="select-btn">
                                <p class=""></p>
                            </div>
                            <p class="dp">店铺: <a href="">方店铺 <i class="iconfont icon-more"></i></a></p>
                        </div>
                        <div class="d3"><span class="s1">共3件商品</span></div>
                    </div>
                </div>
                <div class="content">
                    <div class="select-btn">
                        <p></p>
                    </div>
                    <div class="del-btn">删除</div>
                    <div class="g-add">
                        <div class="pic">
                            <a href=""><img src="../../images/a_04.png" alt=""></a>
                        </div>
                        <div class="text">
                            <div class="name ellipsis"><a href="">2017年秋季民族风男装藏族  禅意披...</a></div>
                            <div class="msg-gg">
                                <p>颜色：藏蓝</p>
                                <p>尺码：L</p>
                            </div>
                            <div class="pc">
                                <p class="p1">￥260</p>
                                <p class="p2">￥186</p>
                            </div>
                            <div class="add-num">
                                <p class="p1">数量</p>
                                <p class="p2 numAddJ"><i class="iconfont icon-jiajian-1"></i></p>
                                <p class="p3"><input type="number" value="1" class="quantity"></p>
                                <p class="p2 numAddJa"><i class="iconfont icon-jiajian-"></i></p>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="content">
                    <div class="select-btn">
                        <p></p>
                    </div>
                    <div class="del-btn">删除</div>
                    <div class="g-add">
                        <div class="pic">
                            <a href=""><img src="../../images/a_04.png" alt=""></a>
                        </div>
                        <div class="text">
                            <div class="name ellipsis"><a href="">2017年秋季民族风男装藏族  禅意披...</a></div>
                            <div class="msg-gg">
                                <p>颜色：藏蓝</p>
                                <p>尺码：L</p>
                            </div>
                            <div class="pc">
                                <p class="p1">￥260</p>
                                <p class="p2">￥186</p>
                            </div>
                            <div class="add-num">
                                <p class="p1">数量</p>
                                <p class="p2 numAddJ"><i class="iconfont icon-jiajian-1"></i></p>
                                <p class="p3"><input type="number" value="1" class="quantity"></p>
                                <p class="p2 numAddJa"><i class="iconfont icon-jiajian-"></i></p>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="content">
                    <div class="select-btn">
                        <p></p>
                    </div>
                    <div class="del-btn">删除</div>
                    <div class="g-add">
                        <div class="pic">
                            <a href=""><img src="../../images/a_04.png" alt=""></a>
                        </div>
                        <div class="text">
                            <div class="name ellipsis"><a href="">2017年秋季民族风男装藏族  禅意披...</a></div>
                            <div class="msg-gg">
                                <p>颜色：藏蓝</p>
                                <p>尺码：L</p>
                            </div>
                            <div class="pc">
                                <p class="p1">￥260</p>
                                <p class="p2">￥186</p>
                            </div>
                            <div class="add-num">
                                <p class="p1">数量</p>
                                <p class="p2 numAddJ"><i class="iconfont icon-jiajian-1"></i></p>
                                <p class="p3"><input type="number" value="1" class="quantity"></p>
                                <p class="p2 numAddJa"><i class="iconfont icon-jiajian-"></i></p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="goods-box">
                <div class="info-list">
                    <div class="item">
                        <div class="d1 dsl">
                            <div class="select-btn">
                                <p class=""></p>
                            </div>
                            <p class="dp">店铺: <a href="">方店铺 <i class="iconfont icon-more"></i></a></p>
                        </div>
                        <div class="d3"><span class="s1">共3件商品</span></div>
                    </div>
                </div>
                <div class="content">
                    <div class="select-btn">
                        <p></p>
                    </div>
                    <div class="del-btn">删除</div>
                    <div class="g-add">
                        <div class="pic">
                            <a href=""><img src="../../images/a_04.png" alt=""></a>
                        </div>
                        <div class="text">
                            <div class="name ellipsis"><a href="">2017年秋季民族风男装藏族  禅意披...</a></div>
                            <div class="msg-gg">
                                <p>颜色：藏蓝</p>
                                <p>尺码：L</p>
                            </div>
                            <div class="pc">
                                <p class="p1">￥260</p>
                                <p class="p2">￥186</p>
                            </div>
                            <div class="add-num">
                                <p class="p1">数量</p>
                                <p class="p2 numAddJ"><i class="iconfont icon-jiajian-1"></i></p>
                                <p class="p3"><input type="number" value="1" class="quantity"></p>
                                <p class="p2 numAddJa"><i class="iconfont icon-jiajian-"></i></p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="gwc-bottom">
            <div class="show2 none">
                <div class="d1">
                    <div class="select-btn">
                        <p class=""></p>
                    </div>
                    <p class="sp">全选</p>
                </div>
                <div class="show2-btn">
                    <div class="sc-btn btn">加入收藏夹</div>
                    <div class="del-btn btn">删除</div>
                </div>
            </div>
            <div class="show1">
                <div class="js">合计 : &yen;128</div>
                <div class="right-btn">结算</div>
            </div>

        </div>
    </div>
    <div class="bottom_menu">
        <ul id="sliderLeftI">
            <li>
                <a href="index.html" target="_self">
                    <i class="bottom_menu_bg1"></i>
                    <p>首页</p>
                </a>
            </li>
            <li>
                <a href="">
                    <i class="bottom_menu_bg2"></i>
                    <p>商城</p>
                </a>
            </li>
            <li class="active">
                <a href="" target="_self">
                    <i class="bottom_menu_bg3"></i>
                    <p>购物车</p>
                </a>
            </li>
            <li class="">
                <a href="" target="_self" id="goMyCenter">
                    <i class="bottom_menu_bg4"></i>
                    <p>我的</p>
                </a>
            </li>
        </ul>
    </div>
</div>
<script>
    $(function () {
        /*商品数量+1*/
        $('.numAddJa').click(function(){
            var ip = $(this).siblings('.p3').find('.quantity');
            var quantity = ip.val();
            var num_add = parseInt(quantity)+1;
            if(quantity==""){
                num_add = 1;
            }
            if(num_add>=10){
                ip.val(num_add-1);
                alert("商品数量不能大于库存");
            }else{
                ip.val(num_add);
            }
        });
        /*商品数量-1*/
        $('.numAddJ').click(function(){
            var ip = $(this).siblings('.p3').find('.quantity');
            var quantity = ip.val();
            var num_dec = parseInt(quantity)-1;
            if(num_dec>0){
                ip.val(num_dec);
            }
        });
		$('.t-bar .ddr').click(function () {
            var a = $(this);
            var b = $('.gwc-bottom .show1');
            var c = $('.gwc-bottom .show2');
            if(!a.hasClass('active')){
                a.addClass('active').find('span').html('完成');
                b.hide();
                c.show();

            }else {
                a.removeClass('active').find('span').html('管理');;
                b.show();
                c.hide();
            }

        });

        //检查全选
        function ckSl(parents) {
            var arr=[];
            parents.find('.content').each(function (i) {
                arr[i]=$(this).find(' .select-btn p').hasClass('active')
            });
            for(var i=0;i<arr.length;i++){
                if(!arr[i]){
                    parents.find('.dsl .select-btn p').removeClass('active');
                    //$('.show2  .select-btn p').removeClass('active');
                    return
                }else if(arr.length-1 || arr.length){
                    parents.find('.dsl .select-btn p').addClass('active');
                    //$('.show2  .select-btn p').addClass('active');
                }
            }
            console.log(arr)
        }
        //选择店铺
		$('.dsl .select-btn').click(function () {
            var a =$(this);
            var p = a.find('p');
            if(!p.hasClass('active')){
                a.parents('.goods-box').find('.content .select-btn p').addClass('active');
                p.addClass('active');
            }else {
                a.parents('.goods-box').find('.content .select-btn p').removeClass('active');
                p.removeClass('active');
            }
        });
        //底部全选
		$('.show2 .d1').click(function () {
            var a =$(this);
            var p = a.find('p');
            if(!p.hasClass('active')){
                $('.select-btn p').addClass('active');
                p.addClass('active');
            }else {
                $('.select-btn p').removeClass('active');
                p.removeClass('active');
            }
        });
        //单选商品
		$('.content .select-btn').click(function () {
            var a =$(this);
            var p = a.find('p');
            if(!p.hasClass('active')){
                p.addClass('active');
            }else {
                p.removeClass('active');
            }
            //console.log($(this).parents('.goods-box'));
            ckSl($(this).parents('.goods-box'));
        });
        
        //滚动加载滑动删除
        $(document).on('touchstart','.g-add',touchForItem);
        $(document).on('touchmove','.g-add',touchForItem);
        $(document).on('touchend','.g-add',touchForItem);
        var startX,startY,X,Y,mx,my;
        function touchForItem(e) {
            var a = $(this);
            var boxLeft = 0;
            var boxRight = 0;
            //console.log(e.type);
            switch(e.type){
                case "touchstart":
                    var touch = e.originalEvent.targetTouches[0];
                    startX = touch.clientX;
                    startY = touch.clientY;
                    break;
                case "touchmove":
                    var touch = e.originalEvent.targetTouches[0];
                    X = touch.clientX - startX;
                    Y = touch.clientY - startY;
                    mx = Math.abs(X);
                    my = Math.abs(Y);
                    if ( mx > my && X > 0 ) {
                        //左向右滑动
                        a.css('left','0px');

                    }else if( mx > my && X < 0 ) {
                        boxRight = boxRight - mx;
                        a.css('left',boxRight+'px')
                    }
                    break;
                case "touchend":
                    var ex = Math.abs(X);
                    if ( mx > my && X > 0 ) {
                        a.css('left','0px');
                    }else if( mx > my && X < 0 ) {
                        a.css('left','-60px')
                    }
                    break;
            }

        }
        
        

    })
</script>
</body>

</html>
