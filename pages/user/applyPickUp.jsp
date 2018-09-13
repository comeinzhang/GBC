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
    <title>申请提现</title>
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
</head>
<body>
<div class="container myct">
    <span class="back" onClick="javascript :history.back(-1);"></span>
    <p>申请提现</p>
</div>
<div class="container">
    <div class="tx_input mt10">
        <p class="tx_input_1">提现金额 : <input  type="text" name="pickNum" value="" placeholder="本次可提现${comsYes}元"></p>
        <span>本次可提现${comsYes}元</span>
        <div class="clear"></div>
    </div>
    <div class="account_list mt10">
        <div class="account_wx">
            <div class="selectCard">
                <span class="account_wx_1"></span>
                <p class="account_wx_2 account_wx_4">提现到银行卡</p>
            </div>
            <div class="clear"></div>
            <div class="account_num">
                <ul>
                	<c:forEach items="${bankList }" var="bank">
                		<li id="${bank.id}">
                        <p>${bank.bankNam } ${bank.bank}${bank.branch} ${bank.cardCode }</p>
                        <span><a href="toEditBank?id=${bank.id }&type=${type}">编辑</a></span>
                        <div class="clear"></div>
                    </li>
                	</c:forEach>
                </ul>
                <a href="toEditBank?type=${type}" target="_self" class="account_num_a">+ 添加账号</a>
            </div>
            <div class="clear"></div>
        </div>
        
        <div class="withdraw_cash_btn">
            <a href="javascript:" id="pickUp" target="_self">立即提现</a>
        </div>
        <script type="text/javascript">
        	var type = '${type}';
            $(document).ready(function(){
                $('.account_num p').click(function(){
                    $(this).addClass('select_cardid');
                    $(this).parents('li').siblings().find('p').removeClass('select_cardid');
                });
                $('.selectCard').click(function(){
                    if($(this).find('.account_wx_1').hasClass('account_wx_sl'))
                    {
                        $(this).find('.account_wx_1').removeClass('account_wx_sl');
                        $(this).siblings('.account_num').find('p').removeClass('select_cardid');//卡号去掉勾选
                    }
                    else
                    {
                        $(this).find('.account_wx_1').addClass('account_wx_sl');
                        $(this).siblings('.account_num').find('ul li').eq(0).find('p').addClass('select_cardid');
                    }
                    $(this).parents('.account_wx').siblings().find('p').removeClass('select_cardid');//卡号去掉勾选
                    $(this).siblings('.account_num').slideToggle();//关闭银行卡列表
                    $(this).parents('.account_wx').siblings().find('.account_wx_1').removeClass('account_wx_sl');//去掉勾选微信勾选
                    $(this).parents('.account_wx').siblings().find('.account_num').slideUp();//关闭银行卡列表
                });
                $('#pickUp').click(function(){
                   var bankId = $(".select_cardid").parents("li").attr("id");
                   var pickNum = $("input[name=pickNum]").val();
                   if(pickNum==""){
                   		alert("请输入提现金额");
                   		return false;
                   }
                   if(pickNum<100){
                	   alert("每次最少提取100元");
                  		return false;
                   }
                   if(bankId==""){
                   		alert("请选择银行卡");
                   		return false;
                   }
                   var data={bankId:bankId,pickNum:pickNum,type:type};
                   $.ajax({
						cache: true,
						type: "POST",
						url:"saveBill",
						data:data,
						timeout:5000,
						async: false,
						error: function(request) {
// 							jError('关注失败', {ShowOverlay: false});
						},
						success: function(data) {
							data = parseInt(data);
							if(data==3){
								alert("您没那么多的钱！");
							}
							if(data==1){
								alert("提现申请已提交，等待系统工作人员审核！");
							}
						}
					});
                });
            });
        </script>
    </div>
</div>
</body>
</html>
