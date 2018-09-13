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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/release.css">
    <script src="${pageContext.request.contextPath}/static/iconfonts/icon_url.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/base_yph.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jNotify.jquery.js"></script>
    <link rel="stylesheet" href="../static/css/jNotify.jquery.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/webuploader.nolog.js"></script>  
    
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
            mimeTypes: '/*'
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
                $img.replaceWith('<span>不能预览</span>');
                return;
            }

            $img.attr( 'src', src );
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

function submitForm(){
	var endTime = $('#endTime').val();
	if(endTime==''){
		jNotify("请选择截止时间",{ShowOverlay : false});
		return;
	}
	var length = $("input[name=imgUrl]").length;
	if (length==0){
		jNotify("请上传图片",{ShowOverlay : false});
		return;
	}
	$("#releaseGoodsForm").submit();
}
</script>
  </head>
<body ontouchstart>
    <div class="details-img-block">
        <div class="t-btn">
            <p class="p1" style="background:url(../static/img/back_03.png) 10px 12px no-repeat;background-size:20px;" onClick="javascript :history.back(-1);">&nbsp;</p>
            <p class="p2" onclick='javascript: submitForm();'>发布</p>
        </div>
        <form action="releaseGoods" id="releaseGoodsForm">
        <input type="hidden" value="32" name="headImgUrl"/>
        <div class="ip-text">
            <div class="warp">
                <div class="fo">
                    <textarea name="content" placeholder="我的拍卖描述..."></textarea>
                </div>
                <div class="add-img clearFix">
                    <div class="upload_box"></div>
                    <div class="img btn">
                        <div class="warp-img" >
                            <div class="add-btn">
                                <p id="filePicker">添加图片</p>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="rz">
                    <p class="p1">鉴定证书</p>
<!--                     <p class="p2" style="margin-right: 10%;">已上传</p> -->
                    <p class="p2"><i class="iconfont icon-zhengshu"></i></p>
                    <input class="p3" type="file">
                </div>
            </div>
        </div>
        <div class="ui-set-list">
            <div class="row">
                <div class="warp">
                    <div class="name">截止时间</div>
                    <div class="ip">
                    	<input type="hidden" name="endTime" id="endTime"/>
                        <p class="t p1 alertTi" id="timeNUM">请选择时间</p>
                        <p class="ico p1  f-999"><i class="iconfont icon-riqi"></i></p>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="warp">
                    <div class="name">起拍价</div>
                    <div class="tx-1"><input type="number" name="startPrice" class="clearIP" value="0"></div>
                </div>
            </div>
            <div class="row">
                <div class="warp">
                    <div class="name">加价幅度</div>
                    <div class="tx-1"><input type="number" name="increatePrice" class="clearIP" value="0"></div>
                </div>
            </div>
            <div class="row">
                <div class="warp">
                    <div class="name">一口价</div>
                    <div class="tx-1"><input type="number" name="buyoutPrice" class="clearIP" value="0"></div>
                </div>
            </div>
        </div>
        <div class="mgl15 f-999">可选设置</div>
        <div class="ui-set-list">
            <div class="row">
                <div class="warp">
                    <div class="name">七天包退</div>
                    <div class="ip">
                        <div class="ico">
                            <div class="onoffswitch">
                                <input type="checkbox" checked="checked" name="freeReturn" value="1" class="onoffswitch-checkbox" id="myonoffswitch">
                                <label class="onoffswitch-label" for="myonoffswitch"></label>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="warp">
                    <div class="name">包邮</div>
                    <div class="ip">
                        <div class="ico">
                            <div class="onoffswitch">
                                <input type="checkbox"  name="freePost" value="1" class="onoffswitch-checkbox" id="myonoffswitch2">
                                <label class="onoffswitch-label" for="myonoffswitch2"></label>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="warp">
                    <div class="name">保证金</div>
                    <div class="tx-1"><input type="number" name="cashPrice" class="clearIP" value="0"></div>
                </div>
            </div>
<!--             <div class="row"> -->
<!--                 <div class="warp"> -->
<!--                     <div class="name">保证金</div> -->
<!--                     <div class="ip f-999"> -->
<!--                         <p class="t p1 f-666">0</p> -->
<!--                         <p class="ico p1"><span>点击开通</span></p> -->
<!--                     </div> -->
<!--                 </div> -->
<!--             </div> -->
        </div>
        <div class="p4">发布即表示同意<a href="" target="_self">《服务协议》</a></div>
      </form>  
        <script>
//         	document.write("前天："+GetDateStr(-2)); 
// 			document.write("<br />昨天："+GetDateStr(-1)); 
// 			document.write("<br />今天："+GetDateStr(0)); 
// 			document.write("<br />明天："+GetDateStr(1)); 
// 			document.write("<br />后天："+GetDateStr(2)); 
// 			document.write("<br />大后天："+GetDateStr(3));
        	function GetDateStr(AddDayCount) { 
				var dd = new Date(); 
				dd.setDate(dd.getDate()+AddDayCount);//获取AddDayCount天后的日期 
				var y = dd.getFullYear(); 
				var m = dd.getMonth()+1;//获取当前月份的日期 
				var d = dd.getDate(); 
				return m+"月"+d+"日"; 
			}
			
            $(function () {
            	var nowDate = GetDateStr(0)+"(今天)";
				var nextDate = GetDateStr(1)+"(明天)";
				$('#nowDate').html(nowDate);
				$('#nextDate').text(nextDate);
                $('.alertTi').click(function () {
                    $('.ti-alert').fadeIn();
                });
                $('.maskBox, .close-ti-alert').click(function (){
                    $('.ti-alert').hide();
                });

                //选择时间
                $('.ti-block p').click(function () {
                    var str1 = $(this).html()
                    var str2 = $(this).parent().siblings('.title').html();
                    $('.ti-alert').hide();
                    $('#timeNUM').html( str1 +' '+ str2);
					$('#endTime').val( str1 +' '+ str2);
                });
            });
        </script>
        <div class="ti-alert none">
            <div class="maskBox"></div>
            <div class="ti-block">
                <div class="close-ti-alert">关闭  <i class="iconfont icon-cha"></i></div>
                <div>
                    <div class="title" id="nowDate">1</div>
                    <div class="links clearFix">
                        <p>17:00</p>
                        <p>19:00</p>
                        <p>20:00</p>
                        <p>21:00</p>
                        <p>22:00</p>
                        <p>23:00</p>
                    </div>
                </div>
                <div>
                    <div class="title" id="nextDate">2</div>
                    <div class="links clearFix">
                        <p>10:00</p>
                        <p>12:00</p>
                        <p>16:00</p>
                        <p>17:00</p>
                        <p>20:00</p>
                        <p>21:00</p>
                        <p>22:00</p>
                        <p>23:00</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
