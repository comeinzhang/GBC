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
    <link rel="apple-touch-icon-precomposed" href="../static/img/bookmark.png"/>
    <link rel="stylesheet" href="../static/css/base_yph1.css">
    <script type="text/javascript" src="../static/js/jquery.min.js"></script>
    <title>首页</title>
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<style>
        body{left: 0; top: 0; width: 100%; height: 100%;}
        .logo{ margin-top: 40px; margin-bottom: 20px; text-align: center;}
        .logo .p1{ margin-top: 15px; }
        .jj-text{ width: auto; text-indent: 2em; line-height: 20px; margin: 15px 30px;}
        .bt-text{ position: absolute; left: 0; bottom:10px; width: 100%; line-height: 20px; text-align: center;}
    </style>
  </head>
<body>
<div class="public-top">
    <div class="back-btn" onClick="javascript :history.back(-1);"></div>
    <div class="msg" id="kk">活动规则</div>
</div>
<div class="logo">
    <img src="${ASSET_URL }${logoImg}" width="30%">
    <p class="p1">善业众邦 V1.0</p>
</div>
<div class="jj-text">
    <p>
    	1、本次活动仅限善业众邦注册新用户参与，新用户指从未在善业众邦平台注册过的用户
    </p>
    <p>
    	2、注册成功并登录，点击想要购买的杂粮，选择想要购买的数量，点击购买并支付
    </p>
    <p>
    	3、购买一件免费送，每单的购买数量不限，但每单只免一件的价格，邮费不变
    </p>
    <p>
    	4、活动时间：2017年7月 1日至2017年8月1 日
    </p>
    <p>
    	5、本次活动领取的商品的运费由买家自理
    </p>
    <p>
    	6、点击购买并支付，商品会在 48小时内发出
    </p>
    <p>
    	7、商品数量有限，先到先得，发完即止
    </p>
    <p>
    	8、活动期间一位用户（一个手机、一个账号）只限领取一次
    </p>
    <p>
		9、若出现违背上述活动规则、恶意刷单、作弊购买等非正常方式参与活动的行为，善业众邦有权取消活动参与资格及相关订单，回收用户特权
	</p>
	<p>
		&nbsp;
	</p>
	<p>
	*本次活动最终解释权归本公司所有
	</p>
</div>

<!-- <div class="bt-text"> -->
<!--     <p>Copyright 2016 Rights Reserved 广州讯南网络科技公司 版权所有</p> -->
<!--     <p> 粤ICP备12012574号</p> -->
<!-- </div> -->
</body>
</html>