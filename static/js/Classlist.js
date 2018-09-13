$(document).ready(function(){
		//修复classify高的问题
		var wh=$(window).height();
		$(".classify").css("height",wh-45+"px");
		var wh=$(window).height();		


		$(".classify ul li").click(function(){
			$(".classify ul li").eq($(this).index()).addClass("classify_li").siblings().removeClass('classify_li');
			$(".classify_view").hide().eq($(this).index()).show();
		});

        function getGoods_list(){
            $.ajax({
                    url: "http://www.fanerjewelry.com/mobile/index.php?act=goods_list",
                    type: "GET",
                    dataType: "jsonp",
                beforeSend:function(XMLHttpRequest){

                },
                success: function (data){
                	var ClassList = '';
                	var subClassList = '<ul>';
                	for(var i=0; i<data.data.length; i++ ){                		
                		ClassList = '<div class=\"classify_view\">'
                		+ '<a class=\"classify_view_img\" href=\"商品详情.html?&proid=' + data.data[i].parentId + '\">'                		
                		+'<img src=\"'+data.data[i].pic + '\" /></a>'                		
                		+ subClassList + '</ul>'
                		+'</div>'
                		for(var j=0; j<data.data[i].subCategoryList.length; j++){
                			subClassList +='<li><a href=\"list.html?&category=' + data.data[i].subCategoryList[j].categoryId + '\">'
                			+'<img src=\"' + data.data[i].subCategoryList[j].pic + '\" />'
                			+'</a>'               			
                			+'<p>' + data.data[i].subCategoryList[j].categoryName +'</p>'                  			             			
                			+ '<li>'  
                		}
                		//alert(ClassList)
                	}
                	$(".classify_content").append(ClassList);                	
                },
                complete:function(){
                },
                error: function () {
                	jNotify("服务器或者网络错误",{ShowOverlay : false});
                }
            });
            
        }
        getGoods_list();



		//点击搜索框弹出单个搜索页面
		$(".qxtop_3").click(function(){
			$(".qxtop_screening").hide();
			$(".back").hide();
			$(".close_search").show();
			$(".qxtop_searchbtn").show();
			$(".search").show();
		});
		//点击搜索框隐藏单个搜索页面
		$(".close_search").click(function(){
			$(".qxlogo").show();
			$(".qxtop_searchbtn").show();
			$(".back").show();
			$(".close_search").hide();
			$(".search").slideUp();
		});

		//点击热门搜寻关键字增加到输入框
		$(".search_r a").click(function(){
			var a = $(this).html()
			$("#keyword").val(a)
		});
		//搜索历史选项卡
		$(".search_rl li").click(function(){
			$(".search_rl li").eq($(this).index()).addClass("search_cl").siblings().removeClass("search_cl");
			$(".search_show").hide().eq($(this).index()).show();
		});
		//删除单个历史记录
		$(".search_l span").click(function(){
			var pstr = $(".search_l span").index(this);
			$(".search_l p").eq(pstr).remove();
		});
	})