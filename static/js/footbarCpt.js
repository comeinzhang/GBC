!function(){var i=function(){return'<div id="footerBar" :class="[inject.type]" v-if="isShow">\t\t\t\t<a v-if="inject.type==\'xinjing\'" v-on:click="goXinJin($event)" href="javascript:;" class="btn btn-danger btn-block btn-lg"> 立即参加 </a>\t\t\t\t<div v-if="inject.type==\'download\'" class="download"><img src="/syui/scss/h5/fixed/icons/logoIcon.png" /></span><div class="text"><p>東家</p><p class="slogan">让传承成为潮流</p></div><a href="'+SyApp.APP_DOWNLOAD_URL+'" class="btn btn-danger">下载APP</a></div>\t\t\t    <ul v-if="inject.type==\'link\'" class="link row rbt"><li v-on:click="goPage(item)" :class="[getColClass(), (item.selected)?\' selected\':\'\', (index+1 == inject.content.length)?\'\':\'rbr\']" v-for="(item, index) in inject.content" :key="index"><span>{{item.name}}</span></li></ul>\t\t\t   </div>'},n=function(){window.scrollY>40?$("#footerBar").addClass("show"):$("#footerBar").removeClass("show")},t=Vue.extend({props:{inject:{type:Object}},template:i(),data:function(){var i=this;return{isGoing2Xinjing:!1,isShow:!(SyApp.isInDjApp&&"download"==i.inject.type),getColClass:function(){var n=i.inject.content.length;return 0==n?"col-xs-12":"col-xs-"+parseInt(12/n)}}},methods:{goPage:function(i){SyApp.util.gotoPageBind(i.djtype,i.djaddr)},goXinJin:function(i){if(i.stopPropagation(),i.preventDefault(),!SyApp.xinjing)return void SyApp.ui.toast("系统错误，稍后再试");if(this.isGoing2Xinjing=!0,SyApp.xinjing.clickmessage)return void SyApp.ui.toast(SyApp.xinjing.clickmessage);var n=this,t=function(){n.isGoing2Xinjing=!1,!SyApp.isInDjApp||(0!=SyApp.xinjing.auditStatus||1!=SyApp.xinjing.cStatus&&2!=SyApp.xinjing.cStatus)&&1!=SyApp.xinjing.auditStatus&&2!=SyApp.xinjing.auditStatus?SyApp.isInDjApp&&3===SyApp.xinjing.auditStatus?SyApp.ui.confirm("您已挑战成功，把返现机会留给其他朋友吧，心经仍可以继续请购哦。",function(){window.location.href=SyApp.util.openH5Url(11,SyApp.xinjing.iid)}):window.location.href=SyApp.util.openH5Url(11,SyApp.xinjing.iid):window.location.href=SyApp.util.openH5Url(7,encodeURIComponent(SyApp.H5_HOST+"h5-xinjing/"+(n.inject.atid||SyApp.util.getPathParam())+"?share=0"))};SyApp.msg.djAjax({done:function(i,o){return i?SyApp.xinjing.cStatus||SyApp.xinjing.auditStatus?void t():(SyApp.msg.djAjax({type:"POST",url:"/v2/transcribe/main",data:{atid:n.inject.atid||SyApp.util.getPathParam()},dataType:"json",done:function(i,n){i&&0===n.code?(SyApp.xinjing=n.res,t()):SyApp.ui.toast("获取心经数据失败！")}}),!1):void SyApp.ui.toast("需要登录后才能参加心经活动")}},!0)}},mounted:function(){this.isShow&&(this.inject.rmph&&SyApp.isWeixin||$("#syapp").addClass("footer"),"download"==this.inject.type?setTimeout(function(){$("#footerBar").addClass("show")},300):(n(),$(window).scroll(function(){n()})))}});Vue.component("footbarCpt",t)}();