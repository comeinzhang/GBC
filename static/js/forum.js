$(function(){

            //分页加载
            var loaDingGif = '<div class="spinner">'
                                +'<div class="bounce1"></div>'
                                +'<div class="bounce2"></div>'
                                +'<div class="bounce3"></div>'
                            +'</div>';
                            var counter = 0;
                            // 每页展示4个
                            var page=1;
                            var num = 2;
                            var pageStart = 0,pageEnd = 0;               
            //监听滚动条设置搜索框置顶
         // dropload
            $('.forum-list').dropload({
                scrollArea : window,
                domUp : {
                    domClass   : 'dropload-up',
                    domRefresh : loaDingGif,
                    domUpdate  : loaDingGif,
                    domLoad    : loaDingGif
                },
                domDown : {
                    domClass   : 'dropload-down',
                    domRefresh : loaDingGif,
                    domLoad    : loaDingGif,
                    domNoData  : '<div class="spinner">已全部加载</div>'
                },
                loadDownFn : function(me){
                	page++;
                	var data = {forum_catalog_id:forum_catalog_id,page:page};
                    $.ajax({
                    	type : "post",
            			async : false,  //同步请求
            			url : "/TYHWX/forum/findTypeForum",
            			data : data,
            			timeout:1000,
                        success: function(data){
                            var result = '';
                            counter++;
                            pageEnd = num * counter;
                            pageStart = pageEnd - num;
                            $(data.list).each(function(i,n){
                            	result+="<li>"
                							+"<a href='/TYHWX/forum/findForumById?id="+n.id+"' target='_self'>"
                							+"<p class='name'>"+n.title +"</p>"
                							+"<div class='icon'>"
                							+"<p class='text'><span class='span1'>"+n.b_forum_catalog.name+"</span> | <span class='span2'>发表于</span> | "+n.publish_time +"</p>"
                							+"<span class='comment'>"+n.discuss_count +"<i></i></span>"
                							+"</div>"
                							+"</a>"
                			           +"</li>";
                			});
                            if(data.list==""||data.list==null){
                                // 锁定
                                me.lock();
                                // 无数据
                                me.noData();
                            }
                            // 为了测试，延迟1秒加载
                            setTimeout(function(){
                                $('.forumlist').append(result);
                                // 每次数据加载完，必须重置
                                me.resetload();
                            },1000);
                        },
                        error: function(xhr, type){
                            alert('Ajax error!');
                            // 即使加载出错，也得重置
                            me.resetload();
                        }
                    });
                },
                threshold : 50
            });
        });