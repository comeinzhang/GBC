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
    <script type="text/javascript" src="../static/js/json2-min.js"></script>
    <script type="text/javascript" src="../static/js/QryUrlStrParam.js"></script>
    <script type="text/javascript" src="../static/js/QxPublic.js"></script>
    <script type="text/javascript" src="../static/js/jquery-1.8.3.min.js"></script>
	<link rel="stylesheet" href="../static/css/jNotify.jquery.css">
	<script type="text/javascript" src="../static/js/jNotify.jquery.js"></script>
    <title>我的推广</title>
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
</head>
<body>
<div class="container myct">
    <span class="back" onClick="javascript :history.back(-1);"></span>
    <p>我的推广</p>
</div>
<div class="container spread_people">
  <div class="clear"></div>
  <div class="container">
      <!--我的推广-->  
      <div class="spread_people_tab_content" style="display: block;">
          <ul>
          <c:forEach items="${shopList }" var="shop">
              <li>
                  <div class="spread_people_tab_content_1"><img src="${ASSET_URL }${shop.logoUrl}"></div>
                  <div class="spread_people_tab_content_2">
                    <p>店铺名称:${shop.name }</p>
                    <p>手机号:${shop.user.phone }</p>
                  </div>
                  <div class="spread_people_tab_content_3">
                      <p>${shop.createTime}</p>
                  </div>
              </li>
           </c:forEach>   
          </ul>
      </div>
  </div>
</div>
</body>
</html>
