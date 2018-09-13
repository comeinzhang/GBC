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
    <title>分类</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <meta content="yes" name="apple-mobile-web-app-capable" />
    <meta content="black" name="apple-mobile-web-app-status-bar-style" />
    <meta content="telephone=no" name="format-detection" />
    <script src="${pageContext.request.contextPath}/static/iconfonts/icon_url.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery.min.js"></script>
    <script type="text/javascript" src="../static/js/jNotify.jquery.js"></script>
    <!--主要样式-->
    <link rel="stylesheet" href="http://at.alicdn.com/t/font_pst0nw8mmx9lik9.css">
    <link rel="stylesheet" href="../static/css/jNotify.jquery.css">
    <link rel="stylesheet" href="../static/css/base_yph1.css">
    <link rel="stylesheet" href="../static/css/mz.css">
     <link rel="stylesheet" href="../static/plug-in/photoswipe/default-skin.css">
    <link rel="stylesheet" href="../static/plug-in/photoswipe/photoswipe.css">
	<link rel="stylesheet" href="../static/iconfonts/iconfont.css">
    <script type="text/javascript" src="../static/plug-in/photoswipe/photoswipe.min.js"></script>
    <script type="text/javascript" src="../static/plug-in/photoswipe/photoswipe-ui-default.min.js"></script>
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
  </head>
<body>
<div class="p-heat">
    <span class="back-btn" onclick="javascript :location.href='index';"></span>
    <div class="title">${mzCatalog.name }</div>
</div>
<div class="mgz-index">
    <video width="100%" height="auto" controls="">
        <source src="${ASSET_URL}${mzCatalog.videoUrl }" type="video/mp4">
    </video>
    <div class="mz-nav">
    	<c:forEach items="${xzCatalogList }" var="catalog">
             <a href="xzGoodsList?mzCatalogId=${mzCatalog.id }&xzCatalogId=${catalog.id}" target="_self">
	            <img src="${ASSET_URL}${catalog.imgUrl}">
	            <p>${catalog.name }</p>
	         </a>
        </c:forEach>
    </div>
    <c:forEach items="${map }" var="m">
    <div class="mgz-row">
        <div class="lv-title">
            <span class="s1">
	            <c:if test="${m.key eq '65'}">
	            	<img src="../static/images/mz_mg_23.png">
	            </c:if>
	            <c:if test="${m.key eq '66'}">
	            	<img src="../static/images/mz_mg_19.png">
	            </c:if>
	            <c:if test="${m.key eq '69'}">
	            	<img src="../static/images/mz_mg_31.png">
	            </c:if>
	            <c:if test="${m.key eq '70'}">
	            	<img src="../static/images/mz_mg_35.png">
	            </c:if>
            </span>
            <span class="s2">
				<c:if test="${m.key eq '65'}">
            		服饰
	            </c:if>
	            <c:if test="${m.key eq '66'}">
	            	食品
	            </c:if>
	            <c:if test="${m.key eq '69'}">
	            	手工艺品
	            </c:if>
	            <c:if test="${m.key eq '70'}">
	            	全球优选
	            </c:if>
			</span>
        </div>
        <div class="row-slider">
            <div class="inner-box">
            	<c:forEach items="${m.value }" var="goods">
                <a href="getGoodsById?id=${goods.id}" target="_self">
                    <div class="a-warp">
                        <img src="${ASSET_URL }${goods.headImgUrl}">
                        <p class="p1">${goods.name }</p>
                        <p class="p2">价格 &yen;<span>${goods.price}</span></p>
                    </div>
                </a>
                </c:forEach>
                <a href="xzGoodsList?mzCatalogId=${mzCatalog.id }&xzCatalogId=${m.key}" target="_self">
                    <div class="a-warp">
                        <img src="../static/images/mz_mg_28.png">
                    </div>
                </a>
            </div>
        </div>
    </div>
   </c:forEach>
</div>
</body>
</html>
