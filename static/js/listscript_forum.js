$(document).ready(function() {
    var flag="sell";
    var keywordstr="";
    var list_count='';
    var goodsGetIn=false;
    var isLastPage = false;
    var pages=0;
    var category ="&category=" + getQueryString("category");
    getForums();
    function getForums(){
        if(!isLastPage && !goodsGetIn){
        	pages=parseInt(pages)+1;
        	var data={pages:pages}
            $.ajax({
            	cache: true,
                type: "POST",
                url:"findMyForum",
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
                            lis += "<div class='goods_info'>"
                            	 + "<div class='goods_info_nr'>"
                            	 + "<h1 onclick='goIntoForums("+n.id+")'>"+n.title+"</h1>"
                            	 + "<span class='goods_info_deleter' id="+n.id+"></span>"
                            	 + "<br/>"
                            	 + "<br/>"
                            	 + "<div style='color:#c40000; width: 60%;'>"+n.publish_time+"</div>"
                            	 + "<div class='clear'></div>"
                            	 + "</div>"
                            	 + "</div>";
                        });
                        $(".goods_list").append(lis);
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
    $(window).scroll(function (){
        if(($(window).scrollTop())+100 >= ($(document).height() - $(window).height())) {
            if (list_count > 0 && pages+1 > list_count / 10)
            {
                isLastPage = true;
                jNotify("已经是最后一页",{ShowOverlay : false});
            }
            getForums();
        }
    });
});
