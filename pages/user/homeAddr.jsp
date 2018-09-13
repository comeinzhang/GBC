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
    <title>我家小区</title>
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
</head>
<body>
<div class="container login1 myct">
	<span class="back" onClick="javascript :history.back(-1);"></span>
  	<p>我家小区</p>
</div>

<!--登陆页面-->
<div class="container">
	<div class="registered">
   		<p>我家小区 : 
   		<select id="gardenId">
   			<option value="">-请选择-</option>
   			<c:forEach items="${gardenList }" var="garden">	
   				<option value="${garden.id }" <c:if test="${garden.id eq user.gardenId}">selected="selected"</c:if>>${garden.area}${garden.town}</option>
   			</c:forEach>
   		</select>
   		</p>
    </div>
    <p class="registered_zc" id="saveAddr">保存</p>
    <p class="registered_zc" id="addAddr" style="margin-top: 5px;" onclick="javaScript:location.href='toCreateHomeAddr'">添加小区</p>
</div>

<script>
	var flag = '${flag}';
    $(function(){
        $("#saveAddr").on("click",function(){
			var gardenId = $("#gardenId").val();
			if (gardenId == "" || gardenId.length == 0) {
				alert("请选择小区");
		  		return false;
			}
			$.ajax({
			       cache: true,
			       type: "POST",
			       url:"bindHomeAddr",
			       data:{gardenId:gardenId},
			       timeout:5000,
			       async: false,
			       beforeSend:function(XMLHttpRequest){
			       },
			       success: function (data){
			    	    alert("保存成功");
						location.href="mycenter";
			       },
			       error: function () {
			         jNotify("服务器或者网络错误",{ShowOverlay : false});
			       }
			});
        });
    });
</script>
</body>
</html>
