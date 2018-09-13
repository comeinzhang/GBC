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
    <link rel="stylesheet" href="../../static/css/base.css">
    <link rel="stylesheet" href="../../static/css/style.css">
    <title>走进大兴安岭</title>
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
</head>
<body>
<div class="container myct">
	<span class="back" onClick="javascript :history.back(-1);"></span>
  	<p>走进大兴安岭</p>
</div>
	<iframe id="myiframe" scrolling="no" width="100%;" frameborder="0" src="http://970c2f78.u.h5mgd.com/campaigns/59292fd692b579048247cb2a/20170601103011/592e860b92b57925d01c2fa6/index.html">
	</iframe>
<script type="text/javascript">
var ifm= document.getElementById("myiframe");

    ifm.height=document.documentElement.clientHeight-40;
</script>
</body>
</html>
