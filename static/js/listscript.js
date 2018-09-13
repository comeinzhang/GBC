$(document).ready(function() {
    //点击搜索框弹出单个搜索页面
    $(".qxtop_3").click(function () {
        $(".qxtop_screening").hide();
        $(".back").hide();
        $(".close_search").show();
        $(".search").show();
    });
    //点击搜索框隐藏单个搜索页面
    $(".close_search").click(closeSearch);
    function closeSearch() {
        $(".qxlogo").show();
        $(".back").show();
        $(".close_search").hide();
        $(".search").slideUp();
    }
    //点击热门搜寻关键字增加到输入框
    $(".search_r a").click(function () {
        var a = $(this).html();
        $("#keyword").val(a)
    });
    //搜索历史选项卡
    $(".search_rl li").click(function () {
        $(".search_rl li").eq($(this).index()).addClass("search_cl").siblings().removeClass("search_cl");
        $(".search_show").hide().eq($(this).index()).show();
    });
    
    //右边菜单
    function rightMenu() {
        var listDouble = $(".listDouble");
        var listCenterMask = $(".listCenterMask");
        $(".list_screening").click(function (){
            listDouble.animate({right: "80%"});
            listCenterMask.show().animate({right: "80%"});
        });
        listCenterMask.click(closeMenu);
        $(".screeningBtn").click(closeMenu);
        function closeMenu() {
            listDouble.animate({right: "0"});
            listCenterMask.animate({right: "0"}).hide();
        }
        $(".attributeTop").click(function () {
            $(this).next(".attribute").stop().slideToggle();
        });
        $(".attribute p").click(function () {
            var pclass = $(this).attr("class");
            $(this).addClass("screening_li_next_p");
            if (pclass == "screening_li_next_p") {
                $(this).removeClass("screening_li_next_p");
            }
        });
    }
    rightMenu(); //右边菜单
    
    var flag="sell";
    var list_count='';
    var goodsGetIn=false;
    var isLastPage = false;
    function resetpt(){
        pages=0;
        list_count='';
        flag="sell"
        goodsGetIn=false;
        isLastPage = false;
    }
    getGoods();
    function getGoods(){
        if(!isLastPage && !goodsGetIn){
        	pages=parseInt(pages)+1;
        	var data={pages:pages,catagory_id:catagory_id,flag:flag,keywordstr:keywordstr,sign:0}
            $.ajax({
            	cache: true,
                type: "POST",
                url:url,
                data:data,
                timeout:5000,
                async: false,
                beforeSend:function(XMLHttpRequest){
                	//努力加载
                    $(".loading").show();
                    goodsGetIn = true;
                },
                success: function (data){
                    //请求成功时处理
                    if(data.list.length != null && data.list.length != 'undefined'){
                        list_count=data.page.totalResult;
                        var lis = '';
                        $(data.list).each(function(i,n){
                            lis += "<li>"
                            + "<a href='getGoodsById?id=" + n.id + "'>"
                            + "<div class='list_content_goods_pic'><img style='height: 150px; width:175px;' src="+ ASSET_URL+ n.headImgUrl +"></div>"
                            + "<p class='goods_title'>" + n.name + "</p>"
                            + "<p class='goods_price'>&yen;" + n.price + "</p>"
                            + "</a>"
                            + "</li>";
                        });
                        $(".list_content_ul").append(lis);
                    }
                },
                complete:function(){
                	$(".loading").hide();
                    goodsGetIn=false;
                },
                error: function () {
                    jNotify("服务器或者网络错误",{ShowOverlay : false});
                }
            });
        }
    }
    $(".qxtop_searchbtn").click(searchKeyAction);
    function searchKeyAction(){
        var keyword = $("#keyword").val();
        if (keyword.trim() != "") {            
            if(keyword=="" || keyword=="输入关键词搜索"){
                jError('请输入关键词', {ShowOverlay: false});
            }else{               
                closeSearch();
                $(".list_nav li").eq(0).addClass('list_nav_1').siblings().removeClass('list_nav_1');
                $(".list_content_ul").html("");
                keywordstr = keyword.trim();
                resetpt();
                url="getGoodsByKeywordListPage";
                getGoods();
            }
        }
    }
    function enterSeach(){
        document.onkeydown=function(e){
            var keycode=document.all?event.keyCode:e.which;
            if(keycode==13){
                searchKeyAction();
            }
        }
    }
    enterSeach();
    //价格销量排序
    $(".list_nav li").click(function(){
        resetpt();
        var screening="";
        $(this).addClass('list_nav_1').siblings().removeClass('list_nav_1');
        var screeningIndex = $(this).index();
        $(".list_content_ul").html("");
        if(screeningIndex=="0"){
            flag="sell";  
        }else if(screeningIndex=="1"){
            var luj = $(".list_nav_2 img").attr("src");
            if( luj == "../static/img/list_04.png"){
                $(".list_nav_1 img").attr("src","../static/img/list_05.png");
                flag="price_down";
            }else if( luj == "../static/img/list_05.png"){
                $(".list_nav_1 img").attr("src","../static/img/list_04.png");
                flag="price_up";
            }
        }else if(screeningIndex=="2"){
        	flag="click";
        }
        getGoods();
    });
    $(window).scroll(function (){
        if(($(window).scrollTop())+100 >= ($(document).height() - $(window).height())) {
            if (list_count > 0 && pages+1 > list_count / 10)
            {
                isLastPage = true;
                jNotify("已经是最后一页",{ShowOverlay : false});
            }
            getGoods();
        }


    });
});
