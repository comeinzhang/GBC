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
    <link rel="stylesheet" href="../static/iconfonts/icon_url.js">
    <link rel="stylesheet" href="../static/css/base_yhlm.css">
    <link rel="stylesheet" href="../static/css/me.css">
    <script type="text/javascript" src="../static/js/jquery.min.js"></script>
    <script type="text/javascript" src="../static/iconfonts/icon_url.js"></script>
    <title>个人中心</title>
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script type="text/javascript">
	
	</script>
</head>
<body>
<div class="me-index" style="margin-top: 0px;">
<%--    <div class="p-heat" id="indexTop">--%>
<%--        <span class="back-btn" onclick="javascript :history.back(-1);"></span>--%>
<%--        <p class="title">我的</p>--%>
<%--    </div>--%>
    <div class="head-me head-me2">
        <div class="info">
            <div class="img" onclick="javascript:location.href='jbzl';">
            <c:choose> 
				<c:when test="${fn:contains(user.headImgUrl,'http')}">    
					  <img src="${user.headImgUrl}" style="width: 100%;height: 100%;"/>
				</c:when>
				<c:otherwise>    
					   <img src="${ASSET_URL }${user.headImgUrl}" style="width: 100%;height: 100%;"/>
				</c:otherwise> 
			</c:choose>
            </div>
            <div class="text">
                <p class="p1" style="padding-top: 20px;">${user.nickName} 欢迎你（贡献值：${user.offerNum}）</p>
            </div>
        </div>
    </div>
    <div class="i-li clearfix">
        <a href="javaScript:" target="_self">
            <img src="../static/images/iii_03.jpg">
            <p class="">${user.userRoleName}</p>
        </a>
        <a href="shopJifen" target="_self">
            <img src="../static/images/iii_05.jpg">
            <p>积分 ${user.jifenYes}</p>
        </a>
        <a href="toRechargeMoney" target="_self">
            <img src="../static/images/iii_07.jpg">
            <p>余额 ${user.balance}</p>
        </a>
        <c:if test="${fn:contains(user.userRoleId, 'g')}">
        <a href="jbzl" target="_self">
            <img src="../static/images/iii_12.png">
            <p>基本资料</p>
        </a>
        <a href="toSubmitOrder" target="_self">
            <img src="../static/images/iii_13.jpg">
            <p>报单中心</p>
        </a>
        <a href="shopLineOrder" target="_self">
            <img src="../static/images/iii_15.jpg">
            <p>我的报单</p>
        </a>
        </c:if>
        <c:if test="${fn:contains(user.userRoleId, 'd')}">
        <a href="jbzl" target="_self">
            <img src="../static/images/iii_12.png">
            <p>基本资料</p>
        </a>
        <a href="toReferMember" target="_self">
            <img src="../static/images/iii_13.jpg">
            <p>推荐会员</p>
        </a>
        <a href="myReferMember" target="_self">
            <img src="../static/images/iii_15.jpg">
            <p>我的会员</p>
        </a>
        </c:if>
        <c:if test="${fn:contains(user.userRoleId, 'f')}">
        <a href="jbzl" target="_self">
            <img src="../static/images/iii_12.png">
            <p>基本资料</p>
        </a>
        <a href="toReferShop" target="_self">
            <img src="../static/images/iii_13.jpg">
            <p>推广商家</p>
        </a>
        <a href="myReferShop" target="_self">
            <img src="../static/images/iii_15.jpg">
            <p>我的商家</p>
        </a>
        </c:if>
    </div>
    <div class="top-icon-url">
        <div class="go-od-url clearfix">
            <a href="orderList?flag=NO" target="_self">
                <img src="../static/images/wd_07.png">
                <p>待付款</p>
                <c:if test="${count1!=null && count1!=0}">
	    		<span>${count1==0?"":count1}</span>
    			</c:if>
            </a>
            <a href="orderList?flag=NOEMS" target="_self">
                <img src="../static/images/wd_09.png">
                <p>待发货</p>
                <c:if test="${count2!=null && count2!=0}">
	    		<span>${count2==0?"":count2}</span>
    			</c:if>
            </a>
            <a href="orderList?flag=EMSING" target="_self">
                <img src="../static/images/wd_11.png">
                <p>待收货</p>
                <c:if test="${count3!=null && count3!=0}">
	    		<span>${count3==0?"":count3}</span>
    			</c:if>
            </a>
            <a href="orderList?flag=SUCCESS" target="_self">
                <img src="../static/images/wd_13.png">
                <p>已发货</p>
                <c:if test="${count4!=null && count4!=0}">
	    		<span>${count4==0?"":count4}</span>
    			</c:if>
            </a>
            <a href="orderList?flag=RECH" target="_self">
                <img src="../static/images/wd_15.png">
                <p>退货/售后</p>
                <c:if test="${count5!=null && count5!=0}">
	    		<span>${count5==0?"":count5}</span>
    			</c:if>
            </a>
        </div>
    </div>
    <div class="menus">
    	<div class="p-row">
            <a href="myOrderList" target="_self"><img src="../static/images/wd_03.png" class="im">所有订单</a>
            <i class="iconfont icon-gengduo1 icon-por"></i>
        </div>
        <div class="p-row">
            <a href="../goods/getGoodsStore" target="_self"><img src="../static/images/wd_22.png" class="im">我的收藏</a>
            <i class="iconfont icon-gengduo1 icon-por"></i>
        </div>
        <div class="p-row">
            <a href="../goods/getGoodsCar" target="_self"><img src="../static/images/wd_26.png" class="im">我的购物车</a>
            <i class="iconfont icon-gengduo1 icon-por"></i>
        </div>
        <div class="p-row">
            <a href="toEditAddr" target="_self"><img src="../static/images/wd_30.png" class="im">地址管理</a>
            <i class="iconfont icon-gengduo1 icon-por"></i>
        </div>
        <c:if test="${fn:contains(user.userRoleId, 'd')}">
        <div class="p-row">
            <a href="qrcodeUrl" target="_self"><img src="../static/images/wd_30.png" class="im">推广二维码</a>
            <i class="iconfont icon-gengduo1 icon-por"></i>
        </div>
        </c:if>
<%--        <div class="p-row">--%>
<%--            <a href="" target="_self"><img src="../static/images/wd_34.png" class="im">我的拍品</a>--%>
<%--            <i class="iconfont icon-gengduo1 icon-por"></i>--%>
<%--        </div>--%>
<%--        <div class="p-row">--%>
<%--            <a href="" target="_self"><img src="../static/images/wd_38.png" class="im">关注商家</a>--%>
<%--            <i class="iconfont icon-gengduo1 icon-por"></i>--%>
<%--        </div>--%>
		<c:if test="${empty shop}">
		    <div class="p-row">
		        <a href="toReplyShop" target="_self"><img src="../static/images/wd_41.png" class="im">商家入驻</a>
		        <i class="iconfont icon-gengduo1 icon-por"></i>
		    </div>
		</c:if>
		<c:if test="${!empty shop and fn:contains(user.userRoleId, 'g')}">
	        <div class="p-row">
	            <a href="toMyShop" target="_self"><img src="../static/images/wd_41.png" class="im">我的店铺</a>
	            <i class="iconfont icon-gengduo1 icon-por"></i>
	        </div>
        </c:if>
        <div class="p-row">
            <a href="toRechargeMoney" target="_self"><img src="../static/images/wd_49.png" class="im">充值/提现</a>
            <i class="iconfont icon-gengduo1 icon-por"></i>
        </div>
        <c:if test="${fn:contains(user.userRoleId, 'a') or fn:contains(user.userRoleId, 'b') or fn:contains(user.userRoleId, 'c')}">
	        <div class="p-row">
	            <a href="myBonus?type=coms" target="_self"><img src="../static/images/wd_49.png" class="im">我的业绩</a>
	            <i class="iconfont icon-gengduo1 icon-por"></i>
	        </div>
        </c:if>
        <c:if test="${fn:contains(user.userRoleId, 'g')}">
	        <div class="p-row">
	            <a href="myBonus?type=payment" target="_self"><img src="../static/images/wd_49.png" class="im">我的货款</a>
	            <i class="iconfont icon-gengduo1 icon-por"></i>
	        </div>
        </c:if>
        <c:if test="${fn:contains(user.userRoleId, 'f')}">
	        <div class="p-row">
	            <a href="myBonus?type=refer" target="_self"><img src="../static/images/wd_49.png" class="im">我的推荐奖</a>
	            <i class="iconfont icon-gengduo1 icon-por"></i>
	        </div>
        </c:if>
        <c:if test="${fn:contains(user.userRoleId, 'd')}">
	        <div class="p-row">
	            <a href="myBonus?type=bonus" target="_self"><img src="../static/images/wd_49.png" class="im">我的佣金</a>
	            <i class="iconfont icon-gengduo1 icon-por"></i>
	        </div>
        </c:if>
        <c:if test="${fn:contains(user.userRoleId, 'a') or fn:contains(user.userRoleId, 'b') or fn:contains(user.userRoleId, 'c')}">
	        <div class="p-row">
	            <a href="myOwe?type=owe" target="_self"><img src="../static/images/wd_49.png" class="im">我的感恩奖</a>
	            <i class="iconfont icon-gengduo1 icon-por"></i>
	        </div>
	    </c:if>
        <c:if test="${fn:contains(user.userRoleId, 'd') or fn:contains(user.userRoleId, 'e')}">
		        <div class="p-row">
		            <a href="myRedPacket" target="_self"><img src="../static/images/wd_46.png" class="im">我的惠享</a>
		            <i class="iconfont icon-gengduo1 icon-por"></i>
		        </div>
	     </c:if>
    </div>
</div>
<div class="bottom_menu border-top">
		<c:if test="${empty shopId}">
        <ul id="sliderLeftI">
            <li>
                <a href="${pageContext.request.contextPath}/goods/index" target="_self" >
                    <i class="bottom_menu_bg1"></i>
                    <p>首页</p>
                </a>
            </li>
            <c:if test="${sessionScope.webIn eq 'kxz'}">
            <li>
                <a href="catagoryList">
                    <i class="bottom_menu_bg2"></i>
                    <p>分类</p>
                </a>
            </li>
            </c:if>
            <c:if test="${sessionScope.webIn ne 'kxz'}">
            <li>
                <a href="${pageContext.request.contextPath}/shop/shopLm" target="_self">
                    <i class="bottom_menu_bg2"></i>
                    <p>商家</p>
                </a>
            </li>
            </c:if>
            <li >
                <a href="${pageContext.request.contextPath}/goods/getGoodsCar" target="_self">
                    <i class="bottom_menu_bg3"></i>
                    <p>购物车</p>
                </a>
            </li>
            <li class="active">
                <a href="${pageContext.request.contextPath}/user/mycenter" target="_self" id="goMyCenter">
                    <i class="bottom_menu_bg4"></i>
                    <p>个人中心</p>
                </a>
            </li>
        </ul>
   </c:if> 
   <c:if test="${!empty shopId}">
        <ul id="sliderLeftI">
            <li style="width: 33.3%;">
                <a href="${pageContext.request.contextPath}/shop/shopDetail?id=${shopId}" target="_self" >
                    <i class="bottom_menu_bg1"></i>
                    <p>首页</p>
                </a>
            </li>
            <li style="width: 33.3%;">
                <a href="${pageContext.request.contextPath}/goods/getGoodsCar?shopId=${shopId}" target="_self" style="color: red;">
                    <i class="bottom_menu_bg3"></i>
                    <p>购物车</p>
                </a>
            </li>
            <li class="active" style="width: 33.3%;">
                <a href="javaScript:location.reload();" target="_self" id="goMyCenter">
                    <i class="bottom_menu_bg4"></i>
                    <p>个人中心</p>
                </a>
            </li>
        </ul>
   </c:if> 
 </div>
</body>
</html>
