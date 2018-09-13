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
    <title>协议</title>
	<style>
        .gyrrhy-index .d2{ line-height: 24px; text-indent: 2em; background: #f2f2f2; padding: 10px 15px;}
    </style>
    <style type="text/css">
		.d2 img{
		width: 100%;
		}
	</style>
  </head>
  <%--<script type="text/javascript">
  	location.href="http://m.xylsqzg.com/media/GSLC.pdf";
  </script>
--%><body>
<div class="public-top">
    <div class="back-btn" onClick="javascript :history.back(-1);"></div>
    <div class="msg" id="kk" style="margin-right: 20px;">用户协议</div>
</div>
<div class="gyrrhy-index">
    <%--<div><img src="${ASSET_URL}${guideImg}" width="100%"></div>
    --%><div class="d2">
    ${classTrain.info}
    </div>
<%--    <div><img src="../static/images/jj_03.png" width="100%"></div>--%>
</div>
</body>
</html>