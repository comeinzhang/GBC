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
    <script type="text/javascript" src="../static/js/jquery.min.js"></script>
    <title>新增地址</title>
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script type="text/javascript">
		function saveAddr(){
			var s_city=$("#s_city").val();
			var addrdetail=$("#addrdetail").val();
			var addr=s_city+addrdetail;
			$("input(name=addr)").val(addr);
			$("#addrForm").submit();
		}
		function editAddr(){
			location.href="${pageContext.request.contextPath}/user/toEditAddr?orderIds=${orderIds}"
		}
	</script>
</head>
<body>
<div class="container myct">
	<span class="back" onClick="javascript :history.back(-1);"></span>
  	<p>选择收货地址</p>
  	<span style="line-height: 40px;" onclick="editAddr();">管理</span>
</div>
<div class="container">
	<ul class="glshdz">
		<c:forEach items="${addrList }" var="addr">
	        <li class="add_call_pay" id="${addr.id }">
	            <div class="add_call_pay_bg">
	            <p class="add_call_pay_name">
	            <c:if test="${addr.flag eq 1}">
	            	<span>默认</span>
	            </c:if>
	            姓　名：${addr.name }
	            </p>
	            <div class="clear"></div>
	            <p class="add_call_pay_phne">电　话：${addr.phone }</p>
	            <div class="clear"></div>
	            <p class="add_call_pay_add">地　址：${addr.addr }</p>
	            </div>
	            <div class=" clear"></div>
	        </li> 
        </c:forEach>
    </ul>
	<div>	
        <div class=" clear"></div>
        <p class="registered_zc address_gl">+ 增加新的收货地址</p>
    </div>
</div>
<script>
    $(document).ready(function(){
    	var orderIds = '${orderIds}';
        $(".add_call_pay").click(function(){
//             $(".add_call_pay").find("div").removeClass("screening_li_next_p");
//             $(this).find("div").addClass("screening_li_next_p");
            var id = $(this).attr("id");
            window.location.href="clickUserAddr?id="+id+"&orderIds="+orderIds;
        });
        $(".registered_zc").click(function(){
            window.location.href="toCreateAddr?orderIds="+orderIds;
        });
    });
</script>
</body>
</html>
