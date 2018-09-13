<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page language="java" import="com.tyh.common.CommonParam" %>
<%@ page language="java" import="com.tyh.model.ProConfigMap" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String lastPage = (String)request.getSession().getAttribute("lastPage");
if(lastPage==null||"".equals(lastPage)){
	lastPage = "http://"+ProConfigMap.configMap.get("DOMAIN_NAME")+"/user/mycenter?";
}
String logo = ProConfigMap.configMap.get("RESOURECE_URL")+ProConfigMap.configMap.get("webLogo");

System.out.println("lastPageLogin::::::::::::::::::::"+lastPage);
%>
<!DOCTYPE HTML >

<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <meta content="yes" name="apple-mobile-web-app-capable" />
    <meta content="black" name="apple-mobile-web-app-status-bar-style" />
    <meta content="telephone=no" name="format-detection" />
    <link rel="stylesheet" href="../static/css/base-yph.css">
    <link rel="stylesheet" href="../static/css/rz.css">
    <script type="text/javascript" src="../static/js/jquery.min.js"></script>
    <script type="text/javascript" src="../static/js/json2-min.js"></script>
    <script type="text/javascript" src="../static/js/QryUrlStrParam.js"></script>
    <script type="text/javascript" src="../static/js/QxPublic.js"></script>
    <script type="text/javascript" src="../static/js/jquery.min.js"></script>
	<link rel="stylesheet" href="../static/css/jNotify.jquery.css">
	<script type="text/javascript" src="../static/js/jNotify.jquery.js"></script>
    <script type="text/javascript" src="../static/js/province_city.js"></script>
    <script type="text/javascript" src="../static/js/ajaxfileupload.js"></script>
	<link rel="stylesheet" href="http://at.alicdn.com/t/font_450229_7k0kvgzblzjs8aor.css">
	<script type="text/javascript" src="../static/plug-in/layer/layer.js"></script>
	<link rel="stylesheet" href="../static/plug-in/layer/skin/default/layer.css">
	<link href="../static/css/showLoading.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="../static/js/jquery.showLoading.min.js"></script>
	
    <title>我要入驻</title>
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
</head>
<body>
<div class="page-warp">
    <div class="head-bar">
        <div class="t-bar">
            <div class="btn-l" onClick="javascript :history.back(-1);">
                <i class="iconfont icon-iconxiangzuo f21"></i>
            </div>
            <div class="text">我要入住</div>
        </div>
    </div>
    <div class="wyrz-index">
        <div class="gz">
            <img src="../static/images/wyrz_03.png">
        </div>
        <div class="tt1 bdr5">请您依据您的条件选择入驻类型</div>
        <div class="rz-tp">
            <a href="toReplyShopYph?sign=have" class="bdr5">
                <img src="../static/images/wyrz_07.png">
                <p>我有实体店</p>
            </a>
            <a href="toReplyShopYph?sign=nohave" class="bdr5">
                <img src="../static/images/wyrz_10.png">
                <p>我没实体店</p>
            </a>
        </div>
    </div>
</div>
</body>
</html>
