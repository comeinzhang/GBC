// JavaScript Document
pageCount = '${page.totalPage}';
$(function(){
	//根据总页数判断，如果小于5页，则显示所有页数，如果大于5页，则显示5页。根据当前点击的页数生成
	//生成分页按钮
	if(pageCount>5){
		page_icon(1,5,0);
	}else{
		page_icon(1,pageCount,0);
	}
	
	//点击分页按钮触发
	$("#pageGro li").on("click",function(){
		var pageNum = parseInt($(this).html());//获取当前页数
		if(pageCount > 5){
			pageGroup(pageNum,pageCount);
		}else{
			$(this).addClass("on");
			$(this).siblings("li").removeClass("on");
		}
		if(url.indexOf("coc/findSupplyReplyListPage")>0){
			var data = {supply_id:supply_id,page:pageNum};
			$.ajax({
				type : "post",
				async : false,  //同步请求
				url : url,
				data : data,
				timeout:5000,
				success:function(dates){
				var html="";
				$(dates).each(function(i,n){
					html+="<li>"
						+"<div class='pic'><img src=''></div>"
						+"<div class='text clearfix'>"
						+"<p class='name'>"+n.replyer.name+"</p>"
						+"<p class='time'>"+n.create_time+"</p>"
						+"<p class='comment-info'>"+n.content+"</p>"
						+"</div>"
						+"</li>";
				});
				$("#comments-list").html(html);
				},
				error: function() {
	               // alert("失败，请稍后再试！");
	            }
			});
		}
	});
	
	//点击上一页触发
	$("#pageGro .pageUp").click(function(){
		var pageNum = parseInt($("#pageGro li.on").html());//获取当前页
		if(pageCount > 5){
			pageUp(pageNum,pageCount);
		}else{
			var index = $("#pageGro ul li.on").index();//获取当前页
			if(index > 0){
				$("#pageGro li").removeClass("on");//清除所有选中
				$("#pageGro ul li").eq(index-1).addClass("on");//选中上一页
			}
		}
		if(pageNum>1){
			if(url.indexOf("coc/findSupplyReplyListPage")>0){
				var data = {supply_id:supply_id,page:pageNum-1};
				$.ajax({
					type : "post",
					async : false,  //同步请求
					url : url,
					data : data,
					timeout:5000,
					success:function(dates){
					var html="";
					$(dates).each(function(i,n){
						html+="<li>"
							+"<div class='pic'><img src=''></div>"
							+"<div class='text clearfix'>"
							+"<p class='name'>"+n.replyer.name+"</p>"
							+"<p class='time'>"+n.create_time+"</p>"
							+"<p class='comment-info'>"+n.content+"</p>"
							+"</div>"
							+"</li>";
					});
					$("#comments-list").html(html);
					},
					error: function() {
		               // alert("失败，请稍后再试！");
		            }
				});
			}
		}
	});
	
	//点击下一页触发
	$("#pageGro .pageDown").click(function(){
		var pageNum = parseInt($("#pageGro li.on").html());//获取当前页
		if(pageCount > 5){
			pageDown(pageNum,pageCount);
		}else{
			var index = $("#pageGro ul li.on").index();//获取当前页
			if(index+1 < pageCount){
				$("#pageGro li").removeClass("on");//清除所有选中
				$("#pageGro ul li").eq(index+1).addClass("on");//选中上一页
			}
		}
		if(pageNum<pageCount){
			if(url.indexOf("coc/findSupplyReplyListPage")>0){
				var data = {supply_id:supply_id,page:pageNum+1};
				$.ajax({
					type : "post",
					async : false,  //同步请求
					url : url,
					data : data,
					timeout:5000,
					success:function(dates){
					var html="";
					$(dates).each(function(i,n){
						html+="<li>"
							+"<div class='pic'><img src=''></div>"
							+"<div class='text clearfix'>"
							+"<p class='name'>"+n.replyer.name+"</p>"
							+"<p class='time'>"+n.create_time+"</p>"
							+"<p class='comment-info'>"+n.content+"</p>"
							+"</div>"
							+"</li>";
					});
					$("#comments-list").html(html);
					},
					error: function() {
		               // alert("失败，请稍后再试！");
		            }
				});
			}
		}
	});
});

//点击跳转页面
function pageGroup(pageNum,pageCount){
	switch(pageNum){
		case 1:
			page_icon(1,5,0);
		break;
		case 2:
			page_icon(1,5,1);
		break;
		case pageCount-1:
			page_icon(pageCount-4,pageCount,3);
		break;
		case pageCount:
			page_icon(pageCount-4,pageCount,4);
		break;
		default:
			page_icon(pageNum-2,pageNum+2,2);
		break;
	}
}

//根据当前选中页生成页面点击按钮
function page_icon(page,count,eq){
	var ul_html = "";
	for(var i=page; i<=count; i++){
		ul_html += "<li>"+i+"</li>";
	}
	$(".pageList").html(ul_html);
	$(".pageList ul li").eq(eq).addClass("current");
}

//上一页
function pageUp(pageNum,pageCount){
	switch(pageNum){
		case 1:
		break;
		case 2:
			page_icon(1,5,0);
		break;
		case pageCount-1:
			page_icon(pageCount-4,pageCount,2);
		break;
		case pageCount:
			page_icon(pageCount-4,pageCount,3);
		break;
		default:
			page_icon(pageNum-2,pageNum+2,1);
		break;
	}
}

//下一页
function pageDown(pageNum,pageCount){
	switch(pageNum){
		case 1:
			page_icon(1,5,1);
		break;
		case 2:
			page_icon(1,5,2);
		break;
		case pageCount-1:
			page_icon(pageCount-4,pageCount,4);
		break;
		case pageCount:
		break;
		default:
			page_icon(pageNum-2,pageNum+2,3);
		break;
	}
}