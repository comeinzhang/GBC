!function(){var t=function(){var t='<li v-if="!list||list.length==0" class="noMsg">{{inject.content.isReplyPage ? \'该留言已删除\' : \'暂无留言, 就差你啦\'}}</li>\t\t\t<li v-on:click="gotoMsgReply(item, $event)" v-for="(item, index) in list" :key="item.rid" class="row">\t\t\t\t<div v-on:click="gotoProfile(item, $event)" class="avatar col-xs-1"><img class="img-circle rbPct" v-lazy="getImg(item.avatar)"/></div>\t\t\t\t<div :class="[list.length-1 == index?\'\':\'rbb\']" class="box col-xs-11"><div class="name l1eps col-xs-9"><span v-on:click="gotoProfile(item, $event)">{{item.username}}</span><span :class="[isIOS?\'rbPct\':\'hot-border\']" class="hot-comment" v-if="item.weight>0">热门</span></div><div v-on:click="toggleLike(item, $event)" :class="[item.liked?\'syLikeBefore\':\'syUnlikeBefore\']" class="like l1eps col-xs-3">{{item.likecnt ? (item.likecnt > 999 ? \'999+\' : item.likecnt) : 0}}</div><div class="content">{{item.content}}</div>\t\t\t\t<div class="time">{{getShortDate(index)}} &middot; <span class="rnt">{{item.rnt}}</span> 回复</div></div>\t\t\t</li><li v-if="isLoading" class="loading"><span class="icon"></span></li><li class="sendBar" v-if="inject.content.isEnterPage"><dl class="rb" v-on:click="gotoMsgPage(true)">\t\t\t<dd class="rbr" v-if="inject.content.isEnterPage" v-on:click="gotoCreateMsgPage($event)">我要留言</dd><dd>全部留言<span class="total">({{total}})</span></dd></dl></li>';return t},e={methods:{toggleLike:function(t,e){if(e.stopPropagation(),!SyApp.isInDjApp)return window.location.href=SyApp.APP_DOWNLOAD_URL,!1;var i=t.liked?"/v2/replys/unlike":"/v2/replys/like";SyApp.msg.djAjax({type:"POST",url:i,data:{rid:t.rid},dataType:"json",el:e.target,done:function(e,i){e&&0===i.code?(t.liked?t.likecnt--:t.likecnt++,t.liked=!t.liked):e&&(i.code===-504?(t.likecnt--,t.liked=!1):i.code===-203&&(t.likecnt++,t.liked=!0),i.code===-300?SyApp.ui.toast("该留言已删除，不能点赞哦"):void 0!==i.msg&&null!==i.msg?SyApp.ui.toast(i.msg):SyApp.ui.toast("操作失败！"))}},!0)},getImg:function(t){return{src:SyApp.util.getCraftAvatar(t,"_80x80"),loading:"/syui/img/people.jpg"}},gotoProfile:function(t,e){e.stopPropagation(),SyApp.util.gotoPageBind(2,t.uid)},gotoMsgReply:function(t,e){if(this.inject.content.isReplyPage){if(!this.inject.dispatch)return;e.stopPropagation(),this.$root.$emit("CptMsgComment",{cmd:"reply",data:{}})}else{e.stopPropagation();var i=SyApp.util.getURLParam("v")||(new Date).getTime(),n=SyApp.H5_HOST+"h5-MsgReply/"+SyApp.commentCpt.atid+"?share=0&rid="+t.rid+"&t="+i;SyApp.util.gotoPageBind(7,n)}},gotoMsgPage:function(t){if(this.inject.content.isEnterPage){var e=SyApp.util.getURLParam("v")||(new Date).getTime(),i=SyApp.H5_HOST+"h5-Msg/"+SyApp.commentCpt.atid+"?share=0&t="+e;SyApp.util.gotoPageBind(7,i)}},gotoCreateMsgPage:function(t){if(!SyApp.isInDjApp)return t.stopPropagation(),window.location.href=SyApp.APP_DOWNLOAD_URL,!1},loadMore:function(){if(!this.isLastPage&&!this.isLoading){var t,e,i=this;if(this.isLoading=!0,i.inject.content.isReplyPage){var n=SyApp.util.getURLParam("rid");t={rid:n},e="/v2/replys/reply"}else t={atid:SyApp.commentCpt.atid,limit:i.inject.content.count},t.page=i.page,e="/v2/replys/activity/replys";var s={type:"POST",url:e,data:t,dataType:"json",done:function(t,e){if(t&&0===e.code){if(i.inject.content.isReplyPage&&e.res)i.list.push(e.res),i.isLastPage=!0;else if(e.res&&e.res.replyList&&e.res.replyList.length>0){if(0===i.unshiftList.length)i.list=i.list.concat(e.res.replyList);else for(var n=0;n<e.res.replyList.length;n++)i.unshiftList.indexOf(e.res.replyList[n].rid)<0&&i.list.push(e.res.replyList[n]);i.total=e.res.count}else i.isLastPage=!0;i.ascroll&&i.ascroll.resetload(!0),i.page++}else t&&SyApp.ui.toast(e.msg||"获取数据失败"),i.isLastPage=!0;i.inject.dispatch&&i.$root.$emit("CptMsgComment",{cmd:"sum",data:{len:i.list.length,list:i.list}}),i.isLoading=!1}};SyApp.isInDjApp?SyApp.msg.djAjax(s,!1):SyApp.msg.ajax(s)}}},data:function(){var t=this;return{isIOS:Vue.util.isIOS,initload:!0,isLastPage:!1,page:1,isLoading:!1,list:[],unshiftList:[],total:0,getShortDate:function(t){return SyApp.util.getShortDate(1e3*this.list[t].createtm,SyApp.getSysTime(),!0)},style:{paddingTop:t.inject.top,paddingBottom:t.inject.down,background:t.inject.bg}}},mounted:function(){SyApp.commentCpt={atid:this.inject.atid||SyApp.util.getPathParam()},this.inject.content.isEnterPage||this.inject.content.isReplyPage?this.loadMore():this.$options.vue=this;var t=this;if(SyApp.isInDjApp){$("body").append('<div id="cptMsgboxBar"><div class="content"><div class="input"><input id="cptMsgboxInput" type="text" placeholder="请输入您的留言,不超过140字"/><a id="cptMsgboxInputBtn" class="btn btn-danger">留言</a></div></div></div>');var e=$("#cptMsgboxInput");$("#cptMsgboxBar").on("touchmove",function(t){$("body").hasClass("lockFixed")&&t.stopPropagation()},!1),e.on("blur",function(){$("body").removeClass("lockFixed")}),$("#cptMsgboxBar").click(function(i){var n=$(i.target);if("cptMsgboxInputBtn"==n.attr("id")){var s=e.val();if(0==s.trim().length)return!1;s=s.substring(0,140);var o={pid:SyApp.commentCpt.atid,type:5,content:s};SyApp.CommentCptReplyRId&&(o.rid=SyApp.CommentCptReplyRId);var a=$("#cptMsgboxInputBtn");a.html("发送中"),SyApp.msg.djAjax({type:"POST",url:"/v2/replys/add",data:o,dataType:"json",el:i.target,done:function(i,n){i&&0===n.code?(SyApp.CommentCptReplyRId?t.inject.dispatch&&t.$root.$emit("CptMsgComment",{cmd:"replyDone",data:n}):(t.list.unshift(n.res),t.unshiftList.push(n.res.rid),t.total++),SyApp.ui.toast("提交成功！")):i&&n.code===-300?SyApp.ui.toast("该留言已删除，不能回复哦"):i&&SyApp.ui.toast(n.msg||"提交失败！"),e.val(""),a.html("留言"),setTimeout(function(){e.attr({placeholder:e.attr("placeholder")}).val("")},200)}},!0)}return"cptMsgboxInput"==n.attr("id")?($("body").addClass("lockFixed"),!1):("cptMsgboxBar"==n.attr("id")||"cptMsgboxInputBtn"==n.attr("id"))&&($("body").removeClass("lockFixed"),t.inject.content.isEnterPage&&$("#cptMsgboxBar").hide(),t.inject.dispatch&&t.$root.$emit("CptMsgComment",{cmd:"hide"}),void 0)});var i=function(t){var e=t.val();if(e.length>140)return t.val(e.substring(0,140)),!1};$("#cptMsgboxBar input").on("keyup",function(t){i($(this))}).on("change",function(t){i($(this))}),this.inject.content.isEnterPage||($("#cptMsgboxBar").show(),$("#cptMsgboxBarBg").show())}}},i=Vue.extend({components:{"single-comment":{props:["inject"],methods:e.methods,data:e.data,mounted:e.mounted,template:'<ul :id="inject.id" :style="style" class="syCpt commentCpt">'+t()+"</ul>"},"comment-list":{props:["inject"],methods:e.methods,data:e.data,mounted:e.mounted,template:'<ul :id="inject.id" :style="style" class="syCpt commentCpt" v-infinite-scroll="loadMore" infinite-scroll-disabled="loading" infinite-scroll-distance="10" infinite-scroll-immediate-check="initload">'+t()+"</ul>"}},props:{inject:{type:Object}},data:function(){var t=this;return{currentView:t.inject.content.isEnterPage||t.inject.content.isReplyPage?"single-comment":"comment-list"}},template:'<component :inject="inject" :is="currentView"></component>'});Vue.component("commentCpt",i)}();