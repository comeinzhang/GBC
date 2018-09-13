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
    <script type="text/javascript" src="../static/js/json2-min.js"></script>
    <script type="text/javascript" src="../static/js/QryUrlStrParam.js"></script>
    <script type="text/javascript" src="../static/js/QxPublic.js"></script>
    <script type="text/javascript" src="../static/js/jquery-1.8.3.min.js"></script>
    <script type="text/javascript" src="../static/js/jquery.cookie.js"></script>
	<link rel="stylesheet" href="../static/css/jNotify.jquery.css">
	<script type="text/javascript" src="../static/js/jNotify.jquery.js"></script>
    <title>我的店铺</title>
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<style type="text/css">
	.statusCount {
	    background: #ffffff none repeat scroll 0 0;
	    border: 1px solid #ccac6a;
	    border-radius: 50%;
	    color: #ccac6a;
	    display: block;
	    font-size: 10px;
	    height: 16px;
	    line-height: 16px;
	    overflow: hidden;
	    position: absolute;
	    width: 16px;
	    top: 45px;;
	}
	</style>
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
            	<div style="left: 19%;" class="statusCount uped" >${count1}</div>
                	已上架
            </a>
			<a href="javascript:;" target="_self" class="store_head_2ablockb"><div style="left: 44%;" class="statusCount updown">${count3}</div>已下架</a>
			<a href="javascript:;" target="_self" class="store_head_2ablockb"><div style="left: 69%;" class="statusCount upno">${count4}</div>待审核</a>
            <a href="javascript:;" target="_self">
<%--            <div style="left: 94%;" class="statusCount shareGoods">${count4}</div>--%>
            	平台商品
            </a>
        </div>
        <script type="text/javascript">
            $(document).ready(function(){
            	
                //选项卡
                var status;
                var list_count='';
                var pages=0;
                var goodsGetIn=false;
    			var isLastPage = false;
    			var flag="";
                $(".goods_manage_head a").click(function(){
                    $(".goods_manage_head a").eq($(this).index()).addClass("search_cl").siblings().removeClass("search_cl");
                    resetpt();
                    var stst = $(this).index();
                    if(stst==0){
                    	status=1;
                    }
                    if(stst==1){
                    	status=2;
                    }
                    if(stst==2){
                    	status=0;
                    }
                    if(stst==3){
                    	status=0;
                    	flag="shareGoods";
                    }
                    getGoods();
                });
                getGoods();
                function getGoods(){
			        if(!isLastPage && !goodsGetIn){
			        	pages=parseInt(pages)+1;
			        	var datas={pages:pages,status:status,flag:flag};
			            $.ajax({
			            	cache: true,
			                type: "POST",
			                url:"myPTGoods",
			                data:datas,
			                timeout:5000,
			                async: false,
			                beforeSend:function(XMLHttpRequest){
			                	//努力加载
			                    goodsGetIn = true;
			                },
			                success: function (data){
			                    //请求成功时处理
			                    if(data.list.length != null && data.list.length != 'undefined'){
			                        list_count=data.page.totalResult;
			                        var lis = '';
			                        $(data.list).each(function(i,n){
			                        	var price = n.price;
			                        	if(price==null||price==""){
			                        		price=0;
			                        	}
			                            lis += "<li>"
			                            + "<div class='promotion-goods-img' onclick='getGoodsById("+n.id+")'><img src="+data.ASSET_URL+n.headImgUrl+"></div>"
			                            + "<div class='goods_info' onclick='getGoodsById("+n.id+")'>"
			                            + "<p class='goods_name'>"+n.name+"</p>"
			                            + "<p class='goods_price'>"+n.price+"元</p>"
			                            //$(n.specList).each(function(j,m){
			                            //	lis += "<p class='goods_price'>"+m.specValue+":"+m.stock+":"+m.price+"元:"+m.coms+"元</p>";
			                            // });
			                            + "</div>";
			                            if(flag!=""&&flag!=null){
			                            		lis += "<div class='clear'></div>"
					                            + "<div class='bottom-btn mt10 border_top'>";
					                            if(n.status==1){
					                            	lis += "<div class='bottom-btn-1' onclick='setShareStatus("+n.id+",2,this)' style='cursor: pointer;' id="+n.id+">下架</div>";
					                            }
					                            if(n.status==2){
					                            	lis += "<div class='bottom-btn-1' onclick='setShareStatus("+n.id+",1,this)' style='cursor: pointer;' id="+n.id+">上架</div>";
					                            }
					                            lis += "</div>";	
			                            }else{
				                            if(n.c==3||n.status==1||n.status==2){
					                            lis += "<div class='clear'></div>"
					                            + "<div class='bottom-btn mt10 border_top'>";
					                            if(n.status==1){
					                            	lis += "<div class='bottom-btn-1 downGoods' style='cursor: pointer;' id="+n.id+">下架</div>";
					                            }
					                            if(n.status==3||n.status==2){
					                            	lis += "<div class='upGoods1 bottom-btn-1' style='cursor: pointer;' id="+n.id+">上架</div>";
					                            }
					                            lis += "</div>";
				                            }
			                            }
			                            lis += "<div class='clear'></div>"
			                            + "</li>";
			                        });
			                        $("#goodsList").append(lis);
			                    }
			                },
			                complete:function(){
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
			            if (list_count > 0 && pages > list_count / 10)
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
			        flag="";
			        $("#goodsList").html("");
			    }
			    $(".downGoods").live("click",function(){
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
// 			                    $(".loading").show();
			                },
			                success: function (data){
			                	var uped = Number($(".uped").text());
			                	var updown = Number($(".updown").text());
			                	$(".uped").html(uped-1);
			                	$(".updown").html(updown+1);
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
			    $(".upGoods1").live("click",function(){
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
// 			                    $(".loading").show();
			                },
			                success: function (data){
			                	var uped = Number($(".uped").text());
			                	$(".uped").html(uped+1);
			                	if(status==2){
			                		var updown = Number($(".updown").text());
			                		$(".updown").html(updown-1);
			                	}else if(status==3){
			                		var uping = Number($(".uping").text());
			                		$(".uping").html(uping-1);
			                	}
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
             function getGoodsById(id){
			    	location.href="../goods/getGoodsById?id="+id;
			    }
             function setShareStatus(goodsId,shareStatus,obj){
            	 var falg=false;
            	 $.ajax({
		            	cache: true,
		                type: "POST",
		                url:"../shop/setShareStatus",
		                data:{goodsId:goodsId,shareStatus:shareStatus},
		                timeout:5000,
		                async: false,
		                beforeSend:function(XMLHttpRequest){
		                	//努力加载
//		                    $(".loading").show();
		                },
		                success: function (data){
		                	flag=true;
		                },
		                error: function () {
		                   jNotify("服务器或者网络错误",{ShowOverlay : false});
		                }
		            });
            	 if(flag){
            		var statusName="已上架";
            		//$(obj).attr("onclick","");
                  	if(shareStatus==2){
                  		statusName="已下架";
                  		$(obj).attr("onclick","setShareStatus("+goodsId+",1,this)");
                  		$(obj).text("上架");
                  	}else{
                  		$(obj).attr("onclick","setShareStatus("+goodsId+",2,this)");
                  		$(obj).text("下架");
                  	}
                  	jSuccess(statusName);
            	 }
             }
			 $(function () {
				var str = window.location.href;
				str = str.substring(str.lastIndexOf("/") + 1);
				if ($.cookie(str)) {
				$("html,body").animate({ scrollTop: $.cookie(str) }, 1000);
				}
				else {
				}
			});
			$(window).scroll(function () {
				var str = window.location.href;
				str = str.substring(str.lastIndexOf("/") + 1);
				var top = $(document).scrollTop();
				$.cookie(str, top, { path: '/' });
				return $.cookie(str);
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
