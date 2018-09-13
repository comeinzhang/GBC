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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/webuploader.css">
    <link rel="stylesheet" href="../static/css/base.css">
    <link rel="stylesheet" href="../static/css/style.css">
    <link rel="stylesheet" href="../static/css/css.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jNotify.jquery.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/webuploader.nolog.js"></script>  
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/jedate/jquery.jedate.js"></script>
	<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/static/jedate/skin/jedate.css">
	
    <script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/static/plug-in/ueditor/ueditor.config.js"></script>
	<script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/static/plug-in/ueditor/ueditor.all.js"> </script>
	<script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/static/plug-in/ueditor/lang/zh-cn/zh-cn.js"></script>
    <title>发布商品</title>
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<script type="text/javascript">
jQuery(function() {
    var $ = jQuery,
        $list = $('.upload_box'),
        // 优化retina, 在retina下这个值是2
        ratio = window.devicePixelRatio || 1,

        // 缩略图大小
        thumbnailWidth = 100 * ratio,
        thumbnailHeight = 100 * ratio,
        // Web Uploader实例
        uploader;
		var i = 0;//上传成功个数
    // 初始化Web Uploader
    uploader = WebUploader.create({
        // 自动上传。
        auto: true,
        fileNumLimit: 9,
        // swf文件路径
        swf: '../static/js/Uploader.swf',
        // 文件接收服务端。
        server: '../order/saveReplyImg',
        // 选择文件的按钮。可选。
        // 内部根据当前运行是创建，可能是input元素，也可能是flash.
        pick: '#filePicker',
        // 只允许选择文件，可选。
        accept: {
            title: 'Images',
            extensions: 'gif,jpg,jpeg,bmp,png',
            mimeTypes: 'image/*'
        }
    });

    // 当有文件添加进来的时候
    uploader.on( 'fileQueued', function( file ) {
        // 创建缩略图
    	var $li = $('<div class="img" id="' + file.id + '"><div class="warp-img pic"><img class="img'+ i +'"></div></div>'),
            $img = $li.find('img');
        $list.append( $li );
        
        uploader.makeThumb( file, function( error, src ) {
            if ( error ) {
//                 $img.replaceWith('<span>不能预览</span>');
//                 return;
            }else{
            	$img.attr( 'src', src );
            }
        }, thumbnailWidth, thumbnailHeight );

    });

//     文件上传过程中创建进度条实时显示。
    uploader.on( 'uploadProgress', function( file, percentage ) {
        var $li = $( '#'+file.id ),
            $percent = $li.find('.progress span');
//         避免重复创建
        if ( !$percent.length ) {
        	
            $percent = $('<p class="progress"><span></span></p>')
                    .appendTo( $li )
                    .find('span');
        }
        $percent.css( 'width', percentage * 100 + '%' );
    });

    // 文件上传成功，给item添加成功class, 用样式标记上传成功。
    uploader.on( 'uploadSuccess', function( file,response ) {
    	i++;
    	if(i==1){
    		$("input[name=headImgUrl]").val(response._raw);
    	}
        $( '#'+file.id ).addClass('upload-state-done');
        var $input = $(
                '<input name="imgUrl" id="' + file.id + '" value="'+response._raw+'" type="hidden"/>'
                );
        $list.append( $input );
//         alert(response._raw);
    });

    // 文件上传失败，现实上传出错。
    uploader.on( 'uploadError', function( file ) {
        var $li = $( '#'+file.id ),
            $error = $li.find('div.error');

        // 避免重复创建
        if ( !$error.length ) {
            $error = $('<div class="error"></div>').appendTo( $li );
        }

        $error.text('上传失败');
    });

    // 完成上传完了，成功或者失败，先删除进度条。
    uploader.on( 'uploadComplete', function( file ) {
        $( '#'+file.id ).find('.progress').remove();
    });
    uploader.on('error', function(handler) {
		if(handler=="Q_EXCEED_NUM_LIMIT"){
			alert("超出最大张数9张");
		}
		if(handler=="F_DUPLICATE"){
			alert("文件重复");
		}
	});
});
</script>
</head>
<body ontouchstart>
    <div class="container myct">
        <span class="back" onClick="javascript :history.back(-1);"></span>
        <p>上传商品</p>
    </div>
    <div class="container">
    <form action="releasePTGoods" id="myForms" method="post">
        <div class="registered upload-goods">
        	<input name="sellTime" type="hidden"/>
        	<input name="flg" id="flg" type="hidden" value="${flag }"/>
        	<c:if test="${empty flag }">
        	<input name="goodsType" type="hidden" value="0"/>
            <p><span class="x-block">*</span> 选择分类 : 
				<select name="catalogId">
					<c:forEach items="${catalogList }" var="catalog">
                    	<option value="${catalog.id }">${catalog.name }</option>
                    </c:forEach>
                </select>
			</p>
			</c:if>
            <p><span class="x-block">*</span> 商品名称 : <input type="text" name="name" placeholder="请输入商品名称"></p>
            <p><span class="x-block">*</span> 商品价格 : <input type="text" name="price" placeholder="请输入商品价格"></p>
            <p><span class="x-block">*</span> 邮费 : <input type="number" name="postPrice" placeholder="请输入邮费" value="0"></p>
            <p><span class="x-block">*</span> 商品简介 : <input type="text" name="summarize" placeholder="请输入商品简介"></p>
            <c:if test="${!empty flag }">
            <input name="goodsType" type="hidden" value="2"/>
            <p id="breakerTime"><span class="x-block">*</span> 时间 : <input style="width: 100px;text-align: center;" type="text" readonly="readonly" id="time1" name="time1"/>~<input type="text" style="width: 100px;text-align: center;" id="time2" readonly="readonly" name="time2"/></p>
            </c:if>
            <div class="upload-goods-block" id="addGoodsExtDiv">
                <span class="x-block">*</span> 商品属性 : <span class="upload-goods-scbtn" id="addaGoodsExtBtn">+添加属性</span>
                <div class="clear"></div>
                <div class="upload-goods-scbl">
                    
                </div>
                <div class="clear"></div>
                <div class="upload-goods-form">
                    <div class="upload-goods-form-bg"></div>
                    <div class="upload-goods-form-bl">
                        <h1>填写属性</h1>
                        <div class=" close-upload-goods-form-btn"></div>
                        <div class="clear"></div>
                        <ul>
                            <li>
                                <div class="sc-name">属性名：</div>
                                <div class="sc-input">
                                    <input type="text" id="proKey" placeholder="属性名">
                                </div>
                                <div class="clear"></div>
                            </li>
                            <li>
                                <div class="sc-name">属性值：</div>
                                <div class="sc-input">
                                    <input type="text" placeholder="属性值" id="proValue" style="ime-mode:Disabled">
                                </div>
                                <div class="clear"></div>
                            </li>
                        </ul>
                        <div class="form-bottom-btn">
<!--                             <div class="form-bottom-btn-delete">删除</div> -->
                            <div class="form-bottom-btn-true">确定</div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="upload-goods-block" id="addGoodsSpecDiv">
                <span class="x-block">*</span> 商品规格 : <span class="upload-goods-scbtn" id="addaSpecificationsdd">+添加规格</span>
                <div class="clear"></div>
                <div class="upload-goods-scbl">
                    
                </div>
                <div class="clear"></div>
                <div class="upload-goods-form" style="height: 150px;">
                    <div class="upload-goods-form-bg"></div>
                    <div class="upload-goods-form-bl" style="top:0;">
                        <h1>填写规格</h1>
                        <div class=" close-upload-goods-form-btn"></div>
                        <div class="clear"></div>
                        <ul>
                            <li>
                                <div class="sc-name">规格名：</div>
                                <div class="sc-input">
                                    <input type="text" id="specName" placeholder="规格名">
                                </div>
                                <div class="clear"></div>
                            </li>
                            <li>
                                <div class="sc-name">规格值：</div>
                                <div class="sc-input">
                                    <input type="text" placeholder="规格值" id="specValue" style="ime-mode:Disabled">
                                </div>
                                <div class="clear"></div>
                            </li>
                            <li>
                                <div class="sc-name"><span class="x-block">*</span>商品库存：</div>
                                <div class="sc-input">
                                    <input type="number" placeholder="" id="specStock" style="ime-mode:Disabled">
                                    <div class="sc-units">件</div>
                                </div>
                                <div class="clear"></div>
                            </li>
                            <li>
                                <div class="sc-name"><span class="x-block">*</span>价格：</div>
                                <div class="sc-input">
                                    <input type="number" placeholder="" id="specPrice">
                                    <div class="sc-units">元</div>
                                </div>
                                <div class="clear"></div>
                            </li>
                            <li>
                                <div class="sc-name">佣金：</div>
                                <div class="sc-input">
                                    <input type="number" placeholder="" id="specComs">
                                    <div class="sc-units">元</div>
                                </div>
                                <div class="clear"></div>
                            </li>
                        </ul>
                        <div class="form-bottom-btn">
<!--                             <div class="form-bottom-btn-delete">删除</div> -->
                            <div class="form-bottom-btn-true">确定</div>
                        </div>
                    </div>
                </div>
            </div>
            <p><span class="x-block">*</span> 商品详情 : <textarea name="content" id="content" style="height: 300px;"  placeholder="请输入商品详情"></textarea></p>
            <script type="text/javascript">
		 	   var ue = UE.getEditor('content', {
		 		    toolbars: [
			 		              ['simpleupload', 'emotion', 'bold', 'italic', 'underline', //'fontsize',
			 		              'justifyleft', 'justifycenter', 'justifyright', 'justifyjustify']
			 		          ],
			 		         maximumWords : 2000,
			 		       autoClearinitialContent:true
			 		      });
			</script>
			<p><span class="x-block">*</span> 售后 : <textarea name="service" id="service" style="height: 300px;"  placeholder="请输入售后描述"></textarea></p>
            <script type="text/javascript">
		 	   var ue = UE.getEditor('service', {
		 		    toolbars: [
			 		              ['simpleupload', 'emotion', 'bold', 'italic', 'underline', //'fontsize',
			 		              'justifyleft', 'justifycenter', 'justifyright', 'justifyjustify']
			 		          ],
			 		         maximumWords : 2000,
			 		       autoClearinitialContent:true
			 		      });
			</script>
            <div class="upload-goods-block border_top">
            	<input name="headImgUrl" type="hidden"/>
                <span class="x-block">*</span> 商品图片 : 
                <div class="upload-goods-block-minimg">
                	<div class="upload_box">
                    </div>
                    <div class="clear"></div>
                </div>
                <p id="filePicker" style="height: 100px;">添加图片</p>
                <div class="clear"></div>
            </div>
        </div>
       </form> 
      <p class="registered_zc">确定</p>
    </div>
<script>
    $(document).ready(function(){
        $("#time1").jeDate({
                    format:"hh:mm",
                    minDate: $.nowDate(0),
                    isinitVal:true,
                    isTime:true
        }); 
        $("#time2").jeDate({
                    format:"hh:mm",
                    minDate: $.nowDate(0),
                    isinitVal:true,
                    isTime:true
        });
        
        //************** 属性  ******************
      	//关闭打开添加属性
        $("#addaGoodsExtBtn").click(function(){
            $("#addGoodsExtDiv").find(".upload-goods-form").toggle();
        });
        var j=0;
        $("#addGoodsExtDiv").find(".form-bottom-btn-true").click(function(){
        	var proKey=$("#proKey").val().trim();
        	var proValue=$("#proValue").val().trim();
        	if(proKey==""){
        		alert("请输入属性名");
        		return;
        	}
        	if(proValue==""){
        		alert("请输入属性值");
        		return;
        	}
        		$("#proKey").val("");
        		$("#proValue").val("");
        	var html="";
        	html+="<span class='upload-goods-sclist'>"+proKey+"&nbsp;"+proValue+"</span>"
        		+"<input name='goodsExts["+j+"].proKey' value='"+proKey+"' type='hidden'/>"
        		+"<input name='goodsExts["+j+"].proValue' value='"+proValue+"' type='hidden'/>"
        	$("#addGoodsExtDiv").find(".upload-goods-scbl").append(html);	
        	j++;
        	$("#addGoodsExtDiv").find(".upload-goods-form").toggle();
        });
        $("#addGoodsExtDiv").find(".close-upload-goods-form-btn").click(function(){
        	$("#addGoodsExtDiv").find(".upload-goods-form").toggle();
        });//关闭打开添加规格
        
        
      	//************** 规格  ******************
      	//关闭打开添加规格
        $("#addGoodsSpecDiv").find("#addaSpecificationsdd").click(function(){
        	$("#addGoodsSpecDiv").find(".upload-goods-form").toggle();
        });
        var i=0;
        $("#addGoodsSpecDiv").find(".form-bottom-btn-true").click(function(){
        	var specName=$("#specName").val().trim();
        	var specValue=$("#specValue").val().trim();
        	var specStock=$("#specStock").val().trim();
        	var specPrice=$("#specPrice").val().trim();
        	var specComs=$("#specComs").val();
        	if(specStock==""){
        		alert("请输入库存");
        		return false;
        	}
        	if(specPrice==""){
        		alert("请输入价格");
        		return false;
        	}
        	if(specValue==""){
        		alert("请输入规格值");
        		return false;
        	}
        	if(specComs==""||specComs==null){
        		specComs=0;
        	}
        		$("#specValue").val("");
        		$("#specStock").val("");
        		$("#specPrice").val("");
        		$("#specComs").val("");
        	var html="";
        	html+="<span class='upload-goods-sclist'>"+specName+"&nbsp;"+specValue+"&nbsp;"+ specStock+"&nbsp;"+ specPrice+"&nbsp;"+ specComs+"</span>"
        		+"<input name='specList["+i+"].specValue' value='"+specValue+"' type='hidden'/>"
        		+"<input name='specList["+i+"].specName' value='"+specName+"' type='hidden'/>"
        		+"<input name='specList["+i+"].price' value='"+specPrice+"' type='hidden'/>"
        		+"<input name='specList["+i+"].coms' value='"+specComs+"' type='hidden'/>"
        		+"<input name='specList["+i+"].stock' value='"+specStock+"' type='hidden'/>";
       		$("#addGoodsSpecDiv").find(".upload-goods-scbl").append(html);	
        	i++;
        	$("#addGoodsSpecDiv").find(".upload-goods-form").toggle();
        });
        $("#addGoodsSpecDiv").find(".close-upload-goods-form-btn").click(function(){
        	$("#addGoodsSpecDiv").find(".upload-goods-form").toggle();
        });//关闭打开添加规格
        
        //提交表单
        $(".registered_zc").click(function(){
        	var guig = $("#addGoodsSpecDiv").find(".upload-goods-scbl").text().trim();
        	var names = $("input[name=name]").val().trim();
        	var price = $("input[name=price]").val().trim();
        	var summarize = $("input[name=summarize]").val().trim();
        	
        	if(guig==""){
        		alert("请输入商品规格");
        		return false;
        	}
        	if(names==""){
        		alert("请输入商品名称");
        		return false;
        	}
        	if(price==""){
        		alert("请输入商品价格");
        		return false;
        	}
        	if(summarize==""){
        		alert("请输入商品简介");
        		return false;
        	}
        	var val = $("input[name=goodsType]").val();
        	if(val=='2'){
        		var time1 = $("input[name=time1]").val().trim();
        		var time2 = $("input[name=time2]").val().trim();
        		if(time1==""||time2==""){
        			alert("请输入时间");
        			return false;
        		}else{
        			$("input[name=sellTime]").val(time1+"-"+time2);
        		}
        	}
        	
        	$("#myForms").submit();
        });
    });
</script>
</body>
</html>
