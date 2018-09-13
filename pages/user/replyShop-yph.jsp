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
    <script type="text/javascript" src="../static/js/json2-min.js"></script>
    <script type="text/javascript" src="../static/js/QryUrlStrParam.js"></script>
    <script type="text/javascript" src="../static/js/QxPublic.js"></script>
    <script type="text/javascript" src="../static/js/jquery-1.8.3.min.js"></script>
	<link rel="stylesheet" href="../static/css/jNotify.jquery.css">
	<script type="text/javascript" src="../static/js/jNotify.jquery.js"></script>
    <script type="text/javascript" src="../static/js/province_city.js"></script>
    <script type="text/javascript" src="../static/js/ajaxfileupload.js"></script>
	<link rel="stylesheet" href="http://at.alicdn.com/t/font_450229_7k0kvgzblzjs8aor.css">
	<script type="text/javascript" src="../static/plug-in/layer/layer.js"></script>
	<link rel="stylesheet" href="../static/plug-in/layer/skin/default/layer.css">
	<link href="../static/css/showLoading.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="../static/js/jquery.showLoading.min.js"></script>
	
	<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=FRtLDKq5GOmPdqdabCWMu3BXI3fvY8b4"></script>
	<script type="text/javascript" src="http://api.map.baidu.com/library/SearchInfoWindow/1.5/src/SearchInfoWindow_min.js"></script>
	<link rel="stylesheet" href="http://api.map.baidu.com/library/SearchInfoWindow/1.5/src/SearchInfoWindow_min.css" />
    <style type="text/css">
	body, html{width: 100%;height: 100%;margin:0;font-family:"微软雅黑";}
	#allmap {width:100%;overflow: hidden;}
	</style>
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
            <div class="text">商家入驻</div>
        </div>
    </div>
    <form action="" method="post" id="shopForm">
    <input id="txtProCity" name="userAddr"  type="hidden" />
    <input id="lon" name="lon"  type="hidden" />
    <input id="lat" name="lat"  type="hidden" />
    <input type="hidden" name="idstr" value="${shop.id }">
	<input type="hidden" name="flag" value="${flag }">
    <div class="wyrz-page1-index" id="one">
        <div class="banner">
            <img src="../static/images/st_02.png">
        </div>
        <div class="set-info">
            <ul class="ui-list-base  mgt10">
                <li>
                    <div class="div1">门店名称</div>
                    <div class="pw"><input type="text" name="name" value="${shop.name }" placeholder="请输入门店名称" class="clearIP"></div>
                </li>
                <li>
                    <div class="div1">商品品类</div>
                    <div class="pw"><input type="text" name="mainGoods" value="${shop.mainGoods }" placeholder="请输入主营产品，产品按“，”隔开" class="clearIP"></div>
                </li>
                <li>
                    <div class="div1">店面面积</div>
                    <div class="pw"><input type="text" name="shopDes" value="${shop.shopDes }" placeholder="请输入店面面积" class="clearIP"></div>
                </li>
                <li>
	                <div class="div1">所在省:</div>
	                <div class="pw"><select id="province" style="border: 0" name="province" class="clearIP"></select></div>
	            </li>
	            <li>
	                <div class="div1">所在市:</div>
	                <div class="pw"><select id="city" style="border: 0" name="city" class="clearIP"></select></div>
	            </li>
	            <li>
	                <div class="div1">所在区:</div>
	                <div class="pw"><select id="area" style="border: 0" name="area" class="clearIP"></select></div>
	            </li>
                <li>
                    <div class="div1">店面地址</div>
                    <div class="pw"><input type="text" name="addrDetail" value="${shop.addrDetail }" placeholder="请输入店面地址" class="clearIP"></div>
                </li>
                <li>
                    <div class="div1">当前定位</div>
                    <div class="pw pw1"><input type="text" id="baidu_geo" name="bankName" readonly="readonly" class="clearIP"></div>
<%--                    <div class="sx-btn"><img src="../static/images/sx_05.png"> 刷新</div>--%>
                </li>
            </ul>
            <div class="map" id="allmap" style="height: 300px;">
            </div>
            <div class="mg15">
                <div class="button" id="oneNext">下一步</div>
            </div>
        </div>
    </div>
	<div class="wyrz-page1-index none" id="two">
        <div class="set-info">
            <ul class="ui-list-base  mgt10">
                <li>
                    <div class="div1">商户姓名</div>
                    <div class="pw"><input type="text" name="realName" value="${shop.realName }" placeholder="请输入商户姓名" class="clearIP"></div>
                </li>
                <li>
                    <div class="div1">身份证号码</div>
                    <div class="pw"><input type="text" name="card" value="${shop.card }" placeholder="请输入身份证号码" class="clearIP"></div>
                </li>
                <li>
                    <div class="div1">商户电话</div>
                    <div class="pw"><input type="text" name="phone" placeholder="请输入商户电话" class="clearIP"></div>
                </li>
                <li>
                    <div class="div1">验证码</div>
                    <div class="pw pw1"><input type="text" name="checkCode" class="clearIP"></div>
                    <div class="sx-btn sx-btn2" id="getMessage">获取验证码</div>
                </li>
                <li>
                    <div class="div1">推荐人电话</div>
                    <div class="pw pw2"><input type="text" name="referPhone"  <c:if test="${flag eq 'refer'}">value="${user.phone }" readonly="readonly"</c:if> placeholder="请输入推荐人电话" class="clearIP"></div>
                </li>
            </ul>
            <div class="mg15">
                <div class="button" id="twoNext">下一步</div>
            </div>
        </div>
    </div>
	<div class="wyrz-page2-index none" id="three">
        <div class="row-title mgt10 f-9">请上传对应的照片和证书(照片一定要清晰哦)</div>
        <div class="up-sfz clearFix">
            <div class="row">
                <div class="uf">
                    <img src="../static/images/wy_03.gif">
                    <input type="hidden" name="cardUrl1">
                    <input type="file" name="file" id="file2" multiple="multiple" class="up-btn">
                </div>
                <p>本人手持身份证正面</p>
            </div>
            <div class="row">
                <div class="uf">
                    <img src="../static/images/wy_05.gif">
                    <input type="hidden" name="cardUrl2">
                    <input type="file" name="file" id="file1" multiple="multiple" class="up-btn">
                </div>
                <p>本人手持身份证反面</p>
            </div>
            <div class="row">
                <div class="uf">
                    <img src="../static/images/wy_09.gif">
                    <input type="hidden" name="account">
                    <input type="file" name="file" id="file5" multiple="multiple" class="up-btn">
                </div>
                <p>门头照</p>
            </div>
            <div class="row">
                <div class="uf">
                    <img src="../static/images/wy_10.gif">
                    <input type="hidden" name="chartUrl">
                    <input type="file" name="file" id="file3" multiple="multiple" class="up-btn">
                </div>
                <p>印业执照</p>
            </div>
            <div class="row">
                <div class="uf">
                    <img src="../static/images/wy_13.gif">
                    <input type="hidden" name="chartUrl1">
                    <input type="file" name="file" id="file4" multiple="multiple" class="up-btn">
                </div>
                <p>店内照片1</p>
            </div>
            <div class="row">
                <div class="uf">
                    <img src="../static/images/wy_14.png">
                    <input type="hidden" name="bank">
                    <input type="file" name="file" id="file6" multiple="multiple" class="up-btn">
                </div>
                <p>店内照片2</p>
            </div>
        </div>
         <div class="mg15">
	        <div class="button registered_zc" id="button">提交</div>
	    </div>
    </div>
   
    </form>
    <div class="wyrz-index-alert none">
        <div class="mask"></div>
        <div class="warp-p">
            <div class="warp">
                <div class="img"><img src="../static/images/163506.png"></div>
                <div class="text">您的申请已经成功提交,我们会在三个工作日内给你反馈</div>
                <div class="button"><a href="mycenter">确定</a></div>
            </div>
        </div>
    </div>
</div>
</body>
<script>
	function IdentityCodeValid(code) {
		var city={11:"北京",12:"天津",13:"河北",14:"山西",15:"内蒙古",21:"辽宁",22:"吉林",23:"黑龙江 ",31:"上海",32:"江苏",33:"浙江",34:"安徽",35:"福建",36:"江西",37:"山东",41:"河南",42:"湖北 ",43:"湖南",44:"广东",45:"广西",46:"海南",50:"重庆",51:"四川",52:"贵州",53:"云南",54:"西藏 ",61:"陕西",62:"甘肃",63:"青海",64:"宁夏",65:"新疆",71:"台湾",81:"香港",82:"澳门",91:"国外 "};
	var tip = "";
	var pass= true;
	
	 if(!code || !/^\d{6}(18|19|20)?\d{2}(0[1-9]|1[12])(0[1-9]|[12]\d|3[01])\d{3}(\d|X)$/i.test(code)){
//		  tip = "身份证号格式错误";
		pass = false;
	  }
	
	 else if(!city[code.substr(0,2)]){
//		  tip = "身份证号错误";
		pass = false;
	  }
	  else{
	  //18位身份证需要验证最后一位校验位
	if(code.length == 18){
	  code = code.split('');
	  //∑(ai×Wi)(mod 11)
	  //加权因子
	var factor = [ 7, 9, 10, 5, 8, 4, 2, 1, 6, 3, 7, 9, 10, 5, 8, 4, 2 ];
	  //校验位
	var parity = [ 1, 0, 'X', 9, 8, 7, 6, 5, 4, 3, 2 ];
	  var sum = 0;
	  var ai = 0;
	  var wi = 0;
	  for (var i = 0; i < 17; i++)
	  {
	  ai = code[i];
	  wi = factor[i];
	  sum += ai * wi;
	  }
	  var last = parity[sum % 11];
	  if(parity[sum % 11] != code[17]){
//		  tip = "身份证号错误";
	  pass =false;
	  }
	  }
	  }
//		  if(!pass) alert(tip);
	  return pass;
}
    $(function(){
//     	$("#aboutShop").change(function() {
// 			if ($("#aboutShop").is(':checked')) {
// 			    $(".registered_zc").css("background-color","#c40000");
// 			}else{
// 				$(".registered_zc").css("background-color","gray");
// 			}
// 		});
        $('#getMessage').click(function(){
            var btn = $(this);
            var count = 90;
            var phone = $('input[name="phone"]').val().trim();
		  	var myphreg = /^(((13[0-9]{1})|(17[0-9]{1})|(15[0-9]{1})|(18[0-9]{1}))+\d{8})$/;
			if (phone == "" || phone.length == 0) {
				alert("请输入手机号码");
		  		return false;
			}else{
				 if(!myphreg.test(phone))
		          {
					 alert('请输入有效的手机号码！');
		               return false;
		         }
			}
            $.ajax({
			       cache: true,
			       type: "POST",
			       url:"postCode",
			       data:{phone:phone},
			       timeout:5000,
			       async: false,
			       beforeSend:function(XMLHttpRequest){
			       },
			       success: function (data){
					  var resend = setInterval(function(){
			                count--;
			                if (count > 0){
			                	btn.html(count+'s').addClass('getIng');
			                }else {
			                	clearInterval(resend);
		                        btn.html('获取验证码').removeClass('getIng')
			                }
			            }, 1000);
			            //btn.attr('disabled',true).css('cursor','not-allowed');
			       },
			       error: function () {
			    	 $("body").hideLoading();
			         jNotify("服务器或者网络错误",{ShowOverlay : false});
			       }
			});
            
        });
        $(".registered_zc").on("click",function(){
        	var lon = $('input[name="lon"]').val().trim();
        	var lat = $('input[name="lat"]').val().trim();
        	if(lon == "" || lon.length == 0||lat == "" || lat.length == 0){
        		alert("您填写的地址没有解析到结果，请检查是否正确！");
        		return false;
        	}
			var file2 = $('input[name="cardUrl1"]').val().trim();
			var file1 = $('input[name="cardUrl2"]').val().trim();
			var file6 = $('input[name="bank"]').val().trim();
			var file5 = $('input[name="account"]').val().trim();
			var file3 = $('input[name="chartUrl"]').val().trim();
			var file4 = $('input[name="chartUrl1"]').val().trim();
			if (file3 == "" || file3.length == 0) {
				alert("请上传证件");
		  		return false;
			}
			if (file4 == "" || file4.length == 0) {
				alert("请上传证件");
		  		return false;
			}
			if (file5 == "" || file5.length == 0) {
				alert("请上传证件");
		  		return false;
			}
			if (file6 == "" || file6.length == 0) {
				alert("请上传证件");
		  		return false;
			}
			if (file2 == "" || file2.length == 0||file1 == "" || file1.length == 0) {
				alert("请上传身份证");
		  		return false;
			}
			$("#three").showLoading();
			var formData = new FormData($( "#shopForm" )[0]);
			//var index = layer.load(0, {shade: false});
			$.ajax({
			       cache: true,
			       type: "POST",
			       url:"replyShop",
			       data:formData,
			       timeout:30000,
			       async: true,
			       processData: false,  // 告诉jQuery不要去处理发送的数据
			       contentType: false,
			       beforeSend:function(XMLHttpRequest){
			       },
			       success: function (data){
			       	  data = parseInt(data);
			       	  if(data==1){
			       		$('.wyrz-index-alert').show();
					  }else if(data==2){
					  	  alert("验证码错误！");
					  }else if(data==3){
					  	  alert("您已有店铺或正在审核中！请勿重复提交！");
					  	  location.href="mycenter";
					  }else if(data==4){
					  	  alert("未找到此推荐人，请核实后重新填写！");
					  }else if(data==5){
					  	  alert("该手机已经被使用，请重新填写！");
					  }else if(data==6){
					  	  alert("推荐人不能填写自己");
					  }
			       },
			       error: function (textStatus) {
			    	   jNotify("网络超时，请确保网络畅通再重新提交",{ShowOverlay : false});
			         //jNotify(textStatus,{ShowOverlay : false});
			       },
			       complete: function (XMLHttpRequest,status) {
			    	    $("#three").hideLoading(); 
		                
		            }
			});
			//layer.close(index);
        });
    });
</script>
<script>
    $(function(){
        $("#oneNext").on('click', function() {
        	var name = $('input[name="name"]').val().trim();
        	if (name == "" || name.length == 0) {
				alert("请输入店铺名称");
		  		return;
			}
        	var mainGoods = $('input[name="mainGoods"]').val().trim();
        	if (mainGoods == "" || mainGoods.length == 0) {
				alert("请输入主营商品");
		  		return;
			}
        	var shopDes = $('input[name="shopDes"]').val().trim();
        	if (shopDes == "" || shopDes.length == 0) {
				alert("请输入门店面积");
		  		return;
			}
        	var addrDetail = $('input[name="addrDetail"]').val().trim();
        	if (addrDetail == "" || addrDetail.length == 0) {
				alert("请输入门店地址");
		  		return;
			}
			var userAddr = $('input[name="userAddr"]').val().trim();
        	if (userAddr == "" || userAddr.length == 0) {
				alert("请输入所在区域");
		  		return;
			}
        	getPoint(userAddr,addrDetail);
        	$("#two").css('display','block');
        	$("#one").css('display','none');
        });
        $("#twoNext").on('click', function() {
        	var realName = $('input[name="realName"]').val().trim();
			if (realName == "" || realName.length == 0) {
				alert("请输入姓名");
		  		return false;
			}else{
				var regName =/^[\u4e00-\u9fa5]{2,4}$/;  
				if(!regName.test(realName)){ 
				    alert('姓名填写有误');  
				    return false;  
				}
			}
			var phone = $('input[name="phone"]').val().trim();
		  	var myphreg = /^(((13[0-9]{1})|(15[0-9]{1})|(17[0-9]{1})|(18[0-9]{1}))+\d{8})$/;
			if (phone == "" || phone.length == 0) {
				alert("请输入手机号码");
		  		return false;
			}else{
				 if(!myphreg.test(phone))
		          {
					 alert('请输入有效的手机号码！');
		             return false;
		          }
			}
			var card = $('input[name="card"]').val().trim();
			if (card == "" || card.length == 0) {
				alert("请输入身份证号码");
		  		return false;
			}
			var checkCode = $('input[name="checkCode"]').val().trim();
			if (checkCode == "" || checkCode.length == 0) {
				alert("请输入验证码");
		  		return false;
			}
			$("#three").css('display','block');
        	$("#two").css('display','none');
        	$("#one").css('display','none');
        });
    });
</script>
<script>
            $(function(){
            	 $(document).on('change','.up-btn',function ajaxFileUpload() {
            		 var a = $(this);
            		 var imgUrl = "";
                 	 var id = a.attr("id");
                 	 var obj_fifle=document.getElementById(id);
                 	 var reg_pic=/(.gif|.jpg|.jpeg|.bmp|.png)$/;
            	     if(!reg_pic.test(obj_fifle.value.toLowerCase())){
            	         alert('请上传图片！');
            	         return;
            	     }
            	     //var index = layer.load(0, {shade: false});
            	     $("body").showLoading();
            	     a.siblings('img').attr('src',(window.URL).createObjectURL(this.files[0]));
                 	 var name = a.siblings('input').attr("name");
                     $.ajaxFileUpload(
                             {
                                 url: '../order/saveReplyShopImg',
                                 secureuri: false,
                                 fileElementId: id,
                                 timeout:10000,
                                 dataType: 'json',
//         	                        data: { name: 'logan', id: 'id' },
                                 success: function (data, status) {
                                	 //layer.close(index);
                                	 $("body").hideLoading(); 
                                     if (typeof (data.error) == 'undefined') {
                                    	 $('input[name='+name+']').val(data.img_url);
                                    	 imgUrl = data.img_url;
                                     }
                                 },
                                 error: function (data, status, e) {
                                	$("body").hideLoading(); 
             		                jNotify("网络超时，请确保网络畅通再重新提交",{ShowOverlay : false});
                                 }
                             }
                    );
                    return false;
             	});
            });
</script>
<script type="text/javascript">
var map = new BMap.Map("allmap");
var point = new BMap.Point();
map.centerAndZoom(point,18);

var geolocation = new BMap.Geolocation();
geolocation.getCurrentPosition(function(r){
	if(this.getStatus() == BMAP_STATUS_SUCCESS){
		var mk = new BMap.Marker(r.point);
		map.addOverlay(mk);
		map.panTo(r.point);
		var pt = r.point;
		var geoc = new BMap.Geocoder(); 
		geoc.getLocation(pt, function(rs){
			var addComp = rs.addressComponents;
			var addr = addComp.province + ", " + addComp.city + ", " + addComp.district + ", " + addComp.street + ", " + addComp.streetNumber;
			$("#baidu_geo").val(addr); 
		});  
	}
	else {
		alert('failed'+this.getStatus());
	}        
},{enableHighAccuracy: true})

function getPoint(city,addr){
	var myGeo = new BMap.Geocoder();
	myGeo.getPoint(addr, function(point2){
		if (point2) {
			$("#lon").val(point2.lng);
			$("#lat").val(point2.lat);
		}else{
			alert("您填写的地址没有解析到结果，请检查是否正确！");
			return false;
		}
	}, city);
}
</script>
</html>
