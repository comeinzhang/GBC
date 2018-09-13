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
    <link rel="stylesheet" href="http://at.alicdn.com/t/font_7lcctgn2yw91wcdi.css">
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
<div class="container myct">
    <span class="back" onClick="javascript :history.back(-1);"></span>
    <p>店铺详情</p>
</div>
<div class="container">
    <!--店铺头部开始-->
    <form action="" id="shopForm" enctype="multipart/form-data" method="post">
    <div class="myydl store_head">
    	<input type="hidden" name="logoUrl" value="${shop.logoUrl}"/>
    	<input type="hidden" name="id" value="${shop.id}"/>
        <div class="store_head_1">
            <img src="${ASSET_URL }${shop.logoUrl}" height="45" class="store_logo">
            <input type="file" class="upload_file logoUrl" id="head_img_url"  name="headImgUrlFile"  style="display:block; width: 70px;height: 70px; position: absolute;left: 0;top: 0; opacity: 0;"/>
                <p class="" style="font-size: 21px;padding-left: 70px;">${shop.name}
<!--                 <img src="img/store_06.png" height="19"> -->
                </p>
<!--                 <p style="line-height: 25px;">查看店铺详情</p> -->
        </div>
    </div>
    <!--店铺头部结束-->
    <div class="clear"></div>
    <!--店铺详情开始-->
    <div class="store_info">
<!--         <div class="store_info_score border_top"> -->
<!--             <p>商品评分<span>4.5分</span></p> -->
<!--             <p>服务评分<span>4.5分</span></p> -->
<!--             <p>发货速度<span>4.5分</span></p> -->
<!--         </div> -->
        <div class="store_info_list">
        	<p>店铺名称<span><input style="width: 50%; height: 20px;" name="name" value="${shop.name }" placeholder="最多输入15个字"/></span></p>
        	<p>主营商品<span><input style="width: 50%; height: 20px;" name="mainGoods" value="${shop.mainGoods }"/></span></p>
            <p>店铺简介<span><input style="width: 50%; height: 20px;" name="shopDes" value="${shop.shopDes }"/></span></p>
            <p>商家电话<span>${shop.user.phone }</span></p>
            <p style="border: none;">开店时间<span>${shop.createTime}</span></p>
        </div>
    </div>
    <div class="add-img clearFix" style="height: 250px;">
                   <div class="upload_box">
                   <input type="hidden" name="goodsImgIndex"/>
                   <c:forEach items="${imgList }" var="img" varStatus="vs" end="3">
                    <div class="img btn">
                        <div class="warp-img" <c:if test="${!empty img}">style="display:none; "</c:if> >
                            <div class="add-btn">
                                <i class="iconfont icon-jia"></i>
                                <p>店铺图片${vs.count }</p>
                            </div>
                            <input type="file" name="imgUrlFile" id="file${vs.count }" class="upload_file imgArr">
                        </div>
                        <div class="warp-img pic"><img class="img${vs.index }" src="${ASSET_URL }${img.imgUrl}" ><i class="iconfont icon-cha1"></i></div>
                    </div>
                   </c:forEach>
                    </div>
                    <script>
                        $(function(){
                            var urls = [];
                            var fileInfo =[];
                            $('.upload_box .imgArr').on('change',selectPIC);
                            function selectPIC(){
                                var $this = $(this);
                                alert($(this).index());
                                // 获取上传文件信息集合
                                for(var i=0; i<this.files.length; i++){
                                    fileInfo[i] = this.files[i];
                                    if(fileInfo[i].type.indexOf('image') == -1){
                                        alert('请选择图片');
                                        $(this).find(".imgArr").val("");
                                        return;
                                    }else{
                                    	$(this).parents('.warp-img').css('display','none');
                                        urls[i] = (window.webkitURL ? webkitURL : window.URL).createObjectURL(fileInfo[i]);
                                        var divs=$('<div class="warp-img pic"><img class="img'+ i +'" src="'+urls[i]+'"att="" ><i class="iconfont icon-cha1"></i></div>').on('click',delIMG);
                                        $(this).parents('.img').append(divs);
                                        if($('.upload_box .img').length > 9){
                                            alert('图片太多啦');
                                            return;
                                        }
                                    }
                                }
                            }
                            $('.upload_box .pic').on('click',delIMG);
                            function delIMG(){
                                var a = $(this);
                                var index = a.index();
                                $(this).siblings().css('display','block');
                                $(this).siblings().find(".imgArr").val("");
                                a.remove();
//                                 fileInfo.splice(index,index);//删除input对象合集相应key
                                //alert(fileInfo.length);
                            }
                        });
                    </script>
                </div>
    <div class="withdraw_cash_btn">
            <a href="javascript:" onclick="save();" target="_self">保存</a>
    </div>
    </form>
    <!--店铺详情结束-->
</div>
<script>
                    $(function(){
                        $('.logoUrl').on('change',selectPIC);
                        function selectPIC(){
                            var $this = $(this);
                            // 获取上传文件信息集合
                            var fileInfo = this.files[0];

                            // 判断是否为图片格式
                            var obj_fifle=document.getElementById("head_img_url");
							var reg_pic=/(.gif|.jpg|.jpeg|.bmp|.png)$/;
                            if(!reg_pic.test(obj_fifle.value.toLowerCase())){
                                alert('请上传图片！');
                                return;
                            }else{
									var formData = new FormData($( "#shopForm" )[0]);
									 $.ajax({
						                cache: true,
						                type: "POST",
						                url:"saveShopImg",
						                data:formData,
						                async: false,
						                timeout:10000,
						                processData: false,  // 告诉jQuery不要去处理发送的数据
			            				contentType: false,
						                error: function(request) {
						                    layer.alert("Connection error");
						                },
						                success: function(data) {
						                	$("input[name='logoUrl']").val(data.img_url);
						                	$('.store_logo').attr('src',data.headImgUrl);
						                	$("#head_img_url").val("");
						                }
						            });
						      }      
                            // 获取图片暂存路径 https://developer.mozilla.org/zh-CN/docs/Web/API/URL/createObjectURL
//                             var url = (window.webkitURL ? webkitURL : window.URL).createObjectURL(fileInfo);
//                             var divs= '<img src="'+url+'">';
//                             $('#wImg').html(divs);
                        }
                        
                    });
                    function save(){
                    		var length = $("input[name=name]").val().length;
                    		if(length>15){
                    			alert("名字过长");
                    			return false;
                    		}
                    		var formData = new FormData($( "#shopForm" )[0]);
									 $.ajax({
						                cache: true,
						                type: "POST",
						                url:"editShop",
						                data:formData,
						                async: false,
						                timeout:10000,
						                processData: false,  // 告诉jQuery不要去处理发送的数据
			            				contentType: false,
						                error: function(request) {
						                    //alert("Connection error");
						                },
						                success: function(data) {
						                	data = parseInt(data)
						                	if(data==2){
						                		alert("店铺名称过长");
						                	}else{
							                	alert("保存成功");
							                	location.href="toMyShop";
						                	}
						                }
						            });
//                         	$("#shopForm").submit();
                        }
 </script>
</body>
</html>
