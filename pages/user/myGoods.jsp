<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
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
    <link rel="stylesheet" href="../static/css/css.css">
    <script type="text/javascript" src="../static/js/jquery.min.js"></script>
    <script type="text/javascript" src="../static/js/json2-min.js"></script>
    <script type="text/javascript" src="../static/js/QryUrlStrParam.js"></script>
    <script type="text/javascript" src="../static/js/QxPublic.js"></script>
    <script type="text/javascript" src="../static/js/jquery.min.js"></script>
	<link rel="stylesheet" href="../static/css/jNotify.jquery.css">
	<script type="text/javascript" src="../static/js/jNotify.jquery.js"></script>
    <title>我的店铺</title>
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
</head>
<body>
<div class="container">
    <!--搜索框开始-->
    <div class="myct">
    <span class="back" onClick="javascript :history.back(-1);"></span>
    <p>我的商品</p>
	</div>
    <div class="goods_manage">
        <div class="goods_manage_head border_bottom">
            <a href="javascript:;" target="_self" class="store_head_2ablockb search_cl">
                	竞拍中
            </a>
			<a href="javascript:;" target="_self" class="store_head_2ablockb">已截拍</a>
            <a href="javascript:;" target="_self" class="store_head_2ablockb">已流拍</a>
            <a href="javascript:;" target="_self">已停拍</a>
        </div>
        <script type="text/javascript">
            $(document).ready(function(){
            	
                //选项卡
                var status=0;
                var list_count='';
                var pages=0;
                var goodsGetIn=false;
    			var isLastPage = false;
                $(".goods_manage_head a").click(function(){
                    $(".goods_manage_head a").eq($(this).index()).addClass("search_cl").siblings().removeClass("search_cl");
                    resetpt();
                    var index = $(this).index();
                    if(index==0){
                    	status=1;
                    }else if(index==1){
                    	status=8;
                    }else if(index==2){
                    	status=7;
                    }else if(index==3){
                    	status=2;
                    }
                    getGoods();
                });
                getGoods();
                function getGoods(){
			        if(!isLastPage && !goodsGetIn){
			        	pages=parseInt(pages)+1;
			        	var datas={pages:pages,status:status};
			            $.ajax({
			            	cache: true,
			                type: "POST",
			                url:"myGoods",
			                data:datas,
			                timeout:5000,
			                async: false,
			                beforeSend:function(XMLHttpRequest){
			                	//努力加载
			                    $(".loading").show();
			                    goodsGetIn = true;
			                },
			                success: function (data){
			                    //请求成功时处理
			                    if(data.list.length != null && data.list.length != 'undefined'){
			                        list_count=data.page.totalResult;
			                        var lis = '';
			                        $(data.list).each(function(i,n){
			                            lis += "<li>"
			                            + "<div class='promotion-goods-img'><img src="+data.ASSET_URL+n.headImgUrl+"></div>"
			                            + "<div class='goods_info'>"
			                            + "<p class='goods_name'>"+n.name+"</p>";
			                            if(n.bidMaxPrice==0){
			                            	lis += "<p class='goods_price'>当前价格:"+n.startPrice+"元</p>";
			                            }else{
			                            	lis += "<p class='goods_price'>当前价格:"+n.bidMaxPrice+"元</p>";
			                            }
			                            lis += "<p class='goods_price'>出价次数:"+n.bidSize+"次</p>"
			                            + "</div>";
			                            if(status==1){
				                            lis += "<div class='clear'></div>"
				                            + "<div class='bottom-btn mt10 border_top'>";
				                            if(n.bidSize==0){
				                            	lis += "<div class='bottom-btn-1 downGoods' id="+n.id+">下架</div>";
				                            }
				                            lis += "</div>";
			                            }else if(status==2){
			                            	lis += "<div class='clear'></div>"
				                            + "<div class='bottom-btn mt10 border_top'>";
				                            if(n.bidSize==0){
				                            	lis += "<div class='bottom-btn-1 upGoods' id="+n.id+">上架</div>";
				                            }
				                            lis += "</div>";
			                            }
			                            lis += "<div class='clear'></div>"
			                            + "</li>";
			                        });
			                        $("#goodsList").append(lis);
			                    }
			                },
			                complete:function(){
			                	$(".loading").hide();
			                    goodsGetIn=false;
			                },
			                error: function () {
			                    jNotify("服务器或者网络错误",{ShowOverlay : false});
			                }
			            });
			        }
			    }
			     $(window).scroll(function (){
			        if(($(window).scrollTop())+100 >= ($(document).height() - $(window).height())) {
			            if (list_count > 0 && pages+1 > list_count / 10)
			            {
			                isLastPage = true;
			                jNotify("已经是最后一页",{ShowOverlay : false});
			            }
			            getGoods();
			        }
			    });
			    function resetpt(){
			        pages=0;
			        list_count='';
			        goodsGetIn=false;
			        isLastPage = false;
			        $("#goodsList").html("");
			    }
			    $(".downGoods").on("click",function(){
			    	var id = $(this).attr("id");
			    	var flag = false;
			    	$.ajax({
			            	cache: true,
			                type: "POST",
			                url:"../goods/downGoods",
			                data:{id:id},
			                timeout:5000,
			                async: false,
			                beforeSend:function(XMLHttpRequest){
			                	//努力加载
			                    $(".loading").show();
			                },
			                success: function (data){
			                	flag=true;
			                	jSuccess('已下架');
			                },
			                error: function () {
			                   jNotify("服务器或者网络错误",{ShowOverlay : false});
			                }
			            });
			        if(flag){
			        	$(this).parents("li").remove();
			        }    
			    });
			    $(".upGoods").on("click",function(){
			    	var id = $(this).attr("id");
			    	var flag = false;
			    	$.ajax({
			            	cache: true,
			                type: "POST",
			                url:"../goods/upGoods",
			                data:{id:id},
			                timeout:5000,
			                async: false,
			                beforeSend:function(XMLHttpRequest){
			                	//努力加载
			                    $(".loading").show();
			                },
			                success: function (data){
			                	flag=true;
			                	jSuccess('已上架');
			                },
			                error: function () {
			                   jNotify("服务器或者网络错误",{ShowOverlay : false});
			                }
			            });
			        if(flag){
			        	$(this).parents("li").remove();
			        }    
			    });
            });
        </script>
        <div class="goods_manage_content mt10" style="display: block;">
            <ul id="goodsList">
            </ul>
             <div class="clear"></div>
        </div>
    </div>
</div>
</body>
</html>
