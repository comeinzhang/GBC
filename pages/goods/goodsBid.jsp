<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML>

<html>
<head>
    <title>我的参拍</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <meta content="yes" name="apple-mobile-web-app-capable" />
    <meta content="black" name="apple-mobile-web-app-status-bar-style" />
    <meta content="telephone=no" name="format-detection" />
    <link rel="stylesheet" href="../static/css/base.css">
    <link rel="stylesheet" href="../static/css/style.css">
    <link rel="stylesheet" href="../static/css/jNotify.jquery.css">
    <script type="text/javascript" src="../static/js/jquery.min.js"></script>
    <script type="text/javascript" src="../static/js/jNotify.jquery.js"></script>
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
  </head>
<body>
<div class="myct">
	<span class="back" onClick="javascript :history.back(-1);"></span>
  	<p>我的参拍</p>
</div>
<div class="container mycollection ">
<!-- 	<div class="mycollection_head"> -->
<!--     	<p class="mycollection_classification">全部分类</p> -->
<!--         <span></span> -->
<!--         <div class="clear"></div> -->
<!--         <ul> -->
<!--         	<c:forEach items="${catalogList }" var="catagory"> -->
<!--         		<li id="${catagory.id }">${catagory.name}</li> -->
<!--         	</c:forEach> -->
<!--         </ul> -->
<!--     </div> -->
	  <div class="container goods_list">   
	  <c:forEach items="${bidList }" var="bid" >	
	   	  <div class="goods_info">
	           <div class="goods_info_nr">
	       	  		<img src="${ASSET_URL }${bid.goods.headImgUrl}" width="66">
	                <h1 onclick="goIntoGoods('${bid.goods.id}')">${bid.goods.name}</h1>
<!-- 	                <span class="goods_info_deleter" id="${bid.id}"></span> -->
	                <br/>
	                <p style="color:#c40000;">¥ <span>${bid.price}</span></p>
	                <div class="clear"></div>
	          	</div>
	      </div>
      </c:forEach> 
    </div>
</div>

<script>
	var ASSET_URL='${ASSET_URL}';
	function goIntoGoods(id){
		window.location.href="getGoodsById?id="+id;
	}
    $(function(){
        $(".mycollection_classification").click(function(){
            $(".mycollection_head ul").slideToggle('fast');
        })
        $(".goods_info_deleter").click(function(){
	        if(confirm("确定删除此收藏吗？")){
	           var id=$(this).attr("id");
	           $.ajax({
	            	cache: true,
	                type: "POST",
	                url:"deleteGoodsStore",
	                data:{id:id},
	                timeout:5000,
	                async: false,
	                error: function(request) {
	//                 	SimMessageAlert("登录失败");
	                },
	                success: function(data) {
	                	data = parseInt(data,10);
	                	if(data==1){
	                		$("#"+id).parents(".goods_info").remove();
	                		jSuccess('已取消收藏');
	                	}
	                	if(data==2){
	                		jError('删除失败', {ShowOverlay: false});
	                	}
	                }
	            });
	           }
        })
        $(".mycollection_head ul li").click(function(){
//             $(".goods_list").hide().eq($(this).index()).show();
            $(".mycollection_head ul").hide()
            var catalog_id=$(this).attr("id");
            var data={catalog_id:catalog_id};
            $.ajax({
            	cache: true,
                type: "POST",
                url:"getGoodsStoreList",
                data:data,
                timeout:5000,
                async: false,
                error: function(request) {
//                 	SimMessageAlert("登录失败");
                },
                success: function(data) {
                	var html="";
                	$(data).each(function(i,n){
						html+="<div class='goods_info'>"
	           				+"<div class='goods_info_nr'>"
	       	  				+"<img src="+ASSET_URL+n.goods.headImgUrl+" width='66'>"
	                		+"<h1 onclick='goIntoGoods("+n.goods.id+")'>"+n.goods.name+"</h1>"
	                		+"<span class='goods_info_deleter' id="+n.id+"></span>"
	                		+"<br/>"
	                		+"<p style='color:#c40000;'>¥ <span>"+n.goods.price+"</span></p>"
	                		+"<div class='clear'></div>"
	          				+"</div>"
	      					+"</div>";
					});
					$(".goods_list").html(html);
                }
            });
        })

    })
</script>

</body>

</html>
