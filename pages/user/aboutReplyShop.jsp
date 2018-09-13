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
    <div class="msg" id="kk">入驻须知</div>
</div>
<div class="logo">
    <img src="${ASSET_URL }${logoImg}" width="30%">
    <p class="p1">${webName } V1.0</p>
</div>
<div class="jj-text">
    <p>
    	1、	申请商户须确保其企业营业执照、组织机构代码证、银行开户许可证、税务登记证、一般纳税人资格证均真实有效，一旦发现虚假资质，申请企业将被${companyName }商城列入非诚信客户名单，并不再进行合作；
    </p>
    <p>
    	2、	请确保您所售商品已取得国家规定的相关行业资质。
    </p>
    <p>
    	3、	${companyName }有权根据（包括但不仅限于）品牌需求、公司经营状况、服务水平等其他因素退回客户申请；
    </p>
    <p>
    	4、	${companyName }有权在申请入驻及后续经营阶段要求客户提供其他资质；${companyName }将结合各行业发展动态、国家相关规定及消费者购买需求，不定期更新招商标准；
    </p>
    <c:if test="${PRO_NAME eq 'YHLM'}">
    <p>
    	5、	商家入驻需要签纸质合作协议，一切补充条例以协议为准。
    </p>
    </c:if>
</div>

<!-- <div class="bt-text"> -->
<!--     <p>Copyright 2016 Rights Reserved 广州讯南网络科技公司 版权所有</p> -->
<!--     <p> 粤ICP备12012574号</p> -->
<!-- </div> -->
</body>
</html>