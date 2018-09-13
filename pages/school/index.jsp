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
    <!--Safari书签图标-->
    <link rel="stylesheet" href="../static/css/base_school.css">
    <script type="text/javascript" src="../static/js/jquery.min.js"></script>
    <script type="text/javascript" src="../static/js/public.js"></script>
    <link rel="stylesheet" href="http://at.alicdn.com/t/font_bdwb33jx9e1giudi.css">
    <script type="text/javascript" src="http://www.jq22.com/demo/jquery-qh20151117/js/scroll.1.3.js"></script>
    <link rel="stylesheet" href="http://www.jq22.com/demo/jquery-qh20151117/css/style.css">
    <link rel="stylesheet" href="../static/plug-in/slide/slide.css">
    <link rel="stylesheet" href="../static/css/xq.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/webuploader.nolog.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/webuploader.css">
    <title>首页</title>
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script type="text/javascript">
jQuery(function() {
    var $ = jQuery,
        $list = $('.wrapBox1'),
        // 优化retina, 在retina下这个值是2
        ratio = window.devicePixelRatio || 1,
		
        // 缩略图大小
        thumbnailWidth = 100 * ratio,
        thumbnailHeight = 100 * ratio,
        // Web Uploader实例
        uploader;
		var i = 1;
    // 初始化Web Uploader
    uploader = WebUploader.create({
        // 自动上传。
        auto: true,
//         fileNumLimit: 9,
        // swf文件路径
        swf: '../static/js/Uploader.swf',
        // 文件接收服务端。
        server: '../order/saveSchoolImg?schoolId='+i,
        // 选择文件的按钮。可选。
        // 内部根据当前运行是创建，可能是input元素，也可能是flash.
        pick: '#filePicker',
        // 只允许选择文件，可选。
        accept: {
            title: 'Images',
            extensions: 'gif,jpg,jpeg,bmp,png,docx,doc,xlsx',
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
// 		if(handler=="F_DUPLICATE"){
// 			alert("文件重复");
// 		}
	});
});
</script>
</head>
<body>
<div class="header">
    <div class="container clearfix">
        <div class="logo"><a href="index.html" target="_self"><img src="../static/images/logo.png"></a></div>
        <div class="user-login-info">
            <div class="ydl none">

            </div>
            <div class="wdl">
                <a href="" target="_blank" class="a1"><i class="iconfont icon-weixin"></i>微信快速登录</a>
                <a href="" target="_blank" class="a2">登陆</a>
                <a href="" target="_blank" class="a2">注册</a>
            </div>
        </div>
        <div class="menu">
            <a href="" target="_self">关于图特</a>
            <a href="" target="_self">联系我们</a>
            <a href="" target="_self">帮助</a>
        </div>
        <div class="menu1">
            <a href="javascript:" id="filePicker" target="_self">导入</a>
        </div>
        <div class="call">
            <span class="s1">咨询热线</span>
            <span class="s2">4008 556 123</span>
        </div>
    </div>
</div>
<div class="container">
    <div class="xq-index">
        <div class="xq-banner">
            <img src="${ASSET_URL }${school.headImgUrl }" style="height: 400px;width: 1200px;">
            <div class="logo">
                <img src="${ASSET_URL }${school.logoImgUrl }">
                <p>${school.name }</p>
            </div>
        </div>
        <div class="info-text mgt20">
            <div class="name">
                <p class="p1">${school.name }</p>
                <p class="button"><a href="#k_list" class="f-fff">快速申请</a></p>
            </div>
            <div class="text">
                <div class="text-inner">
                    ${school.content }
                </div>
                <div class="plus-btn">查看更多<i class="iconfont icon-xia"></i></div>
            </div>
        </div>
        <div class="map-info bg-fff mgt20 clearFix">
            <div class="map-left">
                <div class="map"><img src="../static/images/xq_11.png"></div>
                <p class="p1"><i class="iconfont icon-dizhi1"></i>位置 : ${school.addressEng }</p>
            </div>
            <div class="text-right">
                <p><span><i class="iconfont icon-tubiao05"></i>成立于</span> : ${school.foundedin }</p>
                <p><span><i class="iconfont icon-tubiao05"></i>学校注册号</span> : ${school.registerNum }</p>
                <p><span><i class="iconfont icon-tubiao05"></i>学校性质</span> : ${school.intype}</p>
                <p><span><i class="iconfont icon-money"></i>官网</span> :${school.website }</p>
                <p><span><i class="iconfont icon-money"></i>学校申请费</span> : ${school.applicationfee }</p>
                <p><span><i class="iconfont icon-money"></i>生活成本</span> : ${school.livingcost }</p>
                <p><span><i class="iconfont icon-huihuan"></i>在校生人数</span> : ${school.totalstudents }</p>
                <p><span><i class="iconfont icon-huihuan"></i>国际学生人数</span> : ${school.internationalstudents }</p>
            </div>
            <div class="text-right1">
                <p><span><i class="iconfont icon-tubiao05"></i>成立于</span> : ${school.foundedin }</p>
                <p><span><i class="iconfont icon-tubiao05"></i>学校注册号</span> : ${school.registerNum }</p>
                <p><span><i class="iconfont icon-tubiao05"></i>学校性质</span> : ${school.intype}</p>
                <p><span><i class="iconfont icon-money"></i>官网</span> :${school.website }</p>
                <p><span><i class="iconfont icon-money"></i>学校申请费</span> : ${school.applicationfee }</p>
                <p><span><i class="iconfont icon-money"></i>生活成本</span> : ${school.livingcost }</p>
                <p><span><i class="iconfont icon-huihuan"></i>在校生人数</span> : ${school.totalstudents }</p>
                <p><span><i class="iconfont icon-huihuan"></i>国际学生人数</span> : ${school.internationalstudents }</p>
            </div>
        </div>
        <div class="xq-block">
            <div class="title">代理证明</div>
            <div class="agent-block">
                <img src="${ASSET_URL }${school.dlImgUrl}">
            </div>
        </div>
        <div class="xq-block">
            <div class="title">校园风光</div>
            <div class="school-scenery">

                <div class="wc1200 row rowE">
                    <div id="sca1" class="warp-pic-list">
                        <div id="wrapBox1" class="wrapBox">
                            <ul id="count1" class="count clearfix example">
                            	<c:forEach items="${imgList }" var="img">
                                <li>
                                    <img src="${ASSET_URL }${img.imgUrl}" >
                                </li>
                                </c:forEach>
                            </ul>

                        </div>
                        <a id="right1" class="prev icon btn"></a>
                        <a id="left1" class="next icon btn"></a>
                    </div>
                </div>

            </div>
        </div>
        <div class="select-block mgt20">
            <div class="s-row">
                <span class="s1">
                    <select>
                        <option>按级别搜索</option>
                        <option>按级别搜索</option>
                        <option>按级别搜索</option>
                        <option>按级别搜索</option>
                    </select>
                </span>
                <span class="s1">
                    <select>
                        <option>按级别搜索</option>
                        <option>按级别搜索</option>
                        <option>按级别搜索</option>
                        <option>按级别搜索</option>
                    </select>
                </span>
                <span class="s2">
                    <input type="text" class="clear-input" placeholder="关键字搜索">
                    <i class="iconfont icon-sousuo-sousuo"></i>
                </span>
            </div>
            <div class="s-row1 mgt20">
                <span class="active">20160101</span>
                <span>20160101</span>
                <span>20160101</span>
            </div>
        </div>
        <!---课程列表-->
        <div class="k-list" id="k_list">
            <div class="xq-block">
                <div class="title">课程名字</div>
                <div class="info-s clearFix">
                    <p><i class="iconfont icon-rili"></i>每十周长7个级别</p>
                    <p><i class="iconfont icon-money"></i>报名费 : <span class="s1">$ 111</span><span class="s2">$ 111</span></p>
                    <p><i class="iconfont icon-times"></i>开始时间 : </p>
                    <p><i class="iconfont icon-times"></i>学费 : </p>
                    <p><i class="iconfont icon-money"></i>学费 : </p>
                </div>
                <div class="d-btn clearFix">
                    <p class="button">申请本课程</p>
                </div>

            </div>
            <div class="xq-block">
                <div class="title">课程名字</div>
                <div class="info-s clearFix">
                    <p><i class="iconfont icon-rili"></i>每十周长7个级别</p>
                    <p><i class="iconfont icon-money"></i>报名费 : <span class="s1">$ 111</span><span class="s2">$ 111</span></p>
                    <p><i class="iconfont icon-times"></i>开始时间 : </p>
                    <p><i class="iconfont icon-times"></i>学费 : </p>
                    <p><i class="iconfont icon-money"></i>学费 : </p>
                </div>
                <div class="d-btn clearFix">
                    <p class="button">申请本课程</p>
                </div>

            </div>
            <div class="xq-block">
                <div class="title">课程名字</div>
                <div class="info-s clearFix">
                    <p><i class="iconfont icon-rili"></i>每十周长7个级别</p>
                    <p><i class="iconfont icon-money"></i>报名费 : <span class="s1">$ 111</span><span class="s2">$ 111</span></p>
                    <p><i class="iconfont icon-times"></i>开始时间 : </p>
                    <p><i class="iconfont icon-times"></i>学费 : </p>
                    <p><i class="iconfont icon-money"></i>学费 : </p>
                </div>
                <div class="d-btn clearFix">
                    <p class="button">申请本课程</p>
                </div>

            </div>
            <div class="xq-block">
                <div class="title">课程名字</div>
                <div class="info-s clearFix">
                    <p><i class="iconfont icon-rili"></i>每十周长7个级别</p>
                    <p><i class="iconfont icon-money"></i>报名费 : <span class="s1">$ 111</span><span class="s2">$ 111</span></p>
                    <p><i class="iconfont icon-times"></i>开始时间 : </p>
                    <p><i class="iconfont icon-times"></i>学费 : </p>
                    <p><i class="iconfont icon-money"></i>学费 : </p>
                </div>
                <div class="d-btn clearFix">
                    <p class="button">申请本课程</p>
                </div>

            </div>
            <div class="xq-block">
                <div class="title">课程名字</div>
                <div class="info-s clearFix">
                    <p><i class="iconfont icon-rili"></i>每十周长7个级别</p>
                    <p><i class="iconfont icon-money"></i>报名费 : <span class="s1">$ 111</span><span class="s2">$ 111</span></p>
                    <p><i class="iconfont icon-times"></i>开始时间 : </p>
                    <p><i class="iconfont icon-times"></i>学费 : </p>
                    <p><i class="iconfont icon-money"></i>学费 : </p>
                </div>
                <div class="d-btn clearFix">
                    <p class="button">申请本课程</p>
                </div>

            </div>
            <div class="xq-block">
                <div class="title">课程名字</div>
                <div class="info-s clearFix">
                    <p><i class="iconfont icon-rili"></i>每十周长7个级别</p>
                    <p><i class="iconfont icon-money"></i>报名费 : <span class="s1">$ 111</span><span class="s2">$ 111</span></p>
                    <p><i class="iconfont icon-times"></i>开始时间 : </p>
                    <p><i class="iconfont icon-times"></i>学费 : </p>
                    <p><i class="iconfont icon-money"></i>学费 : </p>
                </div>
                <div class="d-btn clearFix">
                    <p class="button">申请本课程</p>
                </div>

            </div>
            <div class="xq-block">
                <div class="title">课程名字</div>
                <div class="info-s clearFix">
                    <p><i class="iconfont icon-rili"></i>每十周长7个级别</p>
                    <p><i class="iconfont icon-money"></i>报名费 : <span class="s1">$ 111</span><span class="s2">$ 111</span></p>
                    <p><i class="iconfont icon-times"></i>开始时间 : </p>
                    <p><i class="iconfont icon-times"></i>学费 : </p>
                    <p><i class="iconfont icon-money"></i>学费 : </p>
                </div>
                <div class="d-btn clearFix">
                    <p class="button">申请本课程</p>
                </div>

            </div>
            <div class="xq-block">
                <div class="title">课程名字</div>
                <div class="info-s clearFix">
                    <p><i class="iconfont icon-rili"></i>每十周长7个级别</p>
                    <p><i class="iconfont icon-money"></i>报名费 : <span class="s1">$ 111</span><span class="s2">$ 111</span></p>
                    <p><i class="iconfont icon-times"></i>开始时间 : </p>
                    <p><i class="iconfont icon-times"></i>学费 : </p>
                    <p><i class="iconfont icon-money"></i>学费 : </p>
                </div>
                <div class="d-btn clearFix">
                    <p class="button">申请本课程</p>
                </div>

            </div>
        </div>

    </div>
</div>
<div class="footer">
    <div class="text">
        <span><i class="iconfont icon-svg17"></i> public@royalethothgroup.com</span>
        <span><i class="iconfont icon-kefu"></i> 400-800-4522   周一 至 周日 08:00 - 20:00</span>
        <span><i class="iconfont icon-dizhi"></i> 广州市海珠区新港中路58号理想国际大厦11层</span>
    </div>
    <p>©2017图特科技有限公司版权所有｜粤ICP备 16005563号</p>
</div>
<div class="alert-img none">
    <div class="mask"></div>
    <img src="">
</div>
<script>
    $(function(){
        //首页切换效果
        $("#count1").dayuwscroll({
            parent_ele: '#wrapBox1',
            list_btn: '#tabT04',
            pre_btn: '#left1',
            next_btn: '#right1',
            path: 'left',
            auto: true,
            time: 3000,
            num: 5,
            gd_num: 5,
            waite_time: 1000

        });
        //查看更多
        $('.text .plus-btn').click(function(){
            if($(this).hasClass('active')){
                $(this).removeClass('active');
                $('.text .text-inner').css({
                    height:'250px',
                    overflow:'hidden'
                });
            }else{
                $(this).addClass('active');
                $('.text .text-inner').css({
                    height:'auto',
                    overflow:'inherit'
                });
            }

        });
        //赛选
        $('.select-block .s-row1 span').click(function(){
            $(this).addClass('active').siblings().removeClass('active');
        });
        //图片放大
        $('.example img').click(function(){
            $('.alert-img').show().find('img').attr('src',$(this).attr('src'));
        });
        //图片放大
        $('.alert-img img').click(function(){
            $(this).attr('src','');
             $('.alert-img').hide()
        });

    });
</script>
</body>
</html>