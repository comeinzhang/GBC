<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
	<meta charset="utf-8">
    <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no">
    <meta name="format-detection" content="telephone=no">
    <meta name="format-detection" content="email=no">
    <link rel="stylesheet" href="../static/css/base_yhlm.css">
    <title>通知详情</title>
	<style>
        .gyrrhy-index .d2{ line-height: 24px; text-indent: 2em; background: #f2f2f2; padding: 10px 15px;}
    </style>
  </head>
<body>
<%--<div class="public-top">--%>
<%--    <div class="back-btn" onClick="javascript :history.back(-1);"></div>--%>
<%--    <div class="msg" id="kk" style="margin-right: 20px;">${classTrain.title }</div>--%>
<%--</div>--%>
<div class="gyrrhy-index">
    <%--<div><img src="${ASSET_URL}${classTrain.headImgUrl}" width="100%"></div>
    --%><div class="d2">
    ${notice.content}
    </div>
<%--    <div><img src="../static/images/jj_03.png" width="100%"></div>--%>
</div>
</body>
</html>