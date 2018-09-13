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
    <script type="text/javascript" src="../static/js/jquery.min.js"></script>
    <script type="text/javascript" src="../static/js/json2-min.js"></script>
    <script type="text/javascript" src="../static/js/QryUrlStrParam.js"></script>
    <script type="text/javascript" src="../static/js/QxPublic.js"></script>
    <script type="text/javascript" src="../static/js/jquery.min.js"></script>
	<link rel="stylesheet" href="../static/css/jNotify.jquery.css">
	<script type="text/javascript" src="../static/js/jNotify.jquery.js"></script>
    <title>账户绑定</title>
    <style>
        .content{ margin: 20px; font-size: 16px; }
        .div-1{ line-height: 45px; text-align: center; color: #444;  background: #f9f9f9; border-bottom: 1px #ccc solid; font-size: 18px;}
        .p1{ font-size: 30px;}
        .p2{ font-size: 16px; margin-top: 25px;}
        .button{ display: block; line-height: 45px; border-radius: 8px; background: #FF9914; text-align: center; margin: 15px 0;color: #fff;}
        .button2{  background: #069EDB; }
    </style>
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
</head>
<body>
<div class="container">
    <div class="div-1">账号绑定</div>
    <div class="content">
        <p class="p1">你好! 微信用户</p>
        <p class="p2">已有账号?</p>
        <a href="toBindAccount?flag=bind" target="_self" class="button">直接进去</a>
        <p class="p2">还没有账号?</p>
        <a href="toBindAccount?flag=build" target="_self" class="button">注册帐号</a>
<%--        <a href="noBindAccount" target="_self" class="button button2">直接进入</a>--%>
    </div>
</div>
</body>
</html>
