<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML">
<html>
  <head>
	<meta charset="utf-8">
    <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no">
    <meta name="format-detection" content="telephone=no">
    <meta name="format-detection" content="email=no">
    <title>幸运链玩家俱乐部</title>
    <link rel="stylesheet" type="text/css" href="../static/css/style_gslc.css" />
    <link rel="stylesheet" type="text/css" href="../static/css/font-awesome.min.css" />
    <script src="../static/js/jquery-1.7.2.min.js"></script>
    <script src="../static/js/jquery.scrollTo.js"></script>
    <script src="../static/js/banner.js"></script>
	<!--
	-->
  </head>
  
<body>
    <div class="header" id="header">
        <div class="top-info">
            <div class="inner container">
                <div class="wx-wb" style="display:none">
                    <div class="wb"><a href="" target="_blank"><i class="fa fa-weibo f-b79a56" title="关注微博"></i></a></div>
                    <div class="wb"><a href="" target="_blank"><i class="fa fa-wechat f-b79a56" title="关注微信"></i></a></div>
                </div>
                <div class="e-p">
                    <span>欢迎访问幸运链玩家俱乐部</span>
                </div>
            </div>
        </div>

        <div class="logo-info">
            <div class="inner container">
                <div class="logo">
                    <a href="index" target="_self"><img src="../static/images/logo_gslc.png"></a><span></span>
                </div>
                <div class="nav f17">
                    <a href="#header" class="nav-header">首页</a>
                    <a href="#index_price" class="nav-dl">最新价值</a>
                    <a href="#index_superiority" class="nav-ys">幸运链的优势</a>
                    <a href="#about_us" class="nav-gy">关于幸运链</a>
                    <a href="#index_questions" class="nav-wt">常见问题</a>
                </div>
            </div>
        </div>

    </div>

    <!--banner-->
    <!--全屏滚动-->
    <div class="banner">
        <div class="b-img">
            <a href="javascript:;" style="background:url(../static/images/pjwp_05.jpg) center no-repeat;"></a>
            <a href="javascript:;" style="background:url(../static/images/pjwp_06.jpg) center no-repeat;"></a>
            
        </div>
        <div class="b-list"></div>
        <a class="bar-left" href="#"><em></em></a><a class="bar-right" href="#"><em></em></a>
    </div>
    <!--end 全屏滚动-->

    <!--最新幸运链价值-->
    <div class="index-price" id="index_price">
        <div class="container">
            <div class="i-p-title">
                <p class="t1 f24">最新幸运链价值</p>
                <p class="t2">截至上一个交易日</p>
              <p class="t3"></p>
            </div>
            <div class="content clear">
                <div class="main_p">
                    <div class="p_de">
                        <p class="name"><i><img src="../static/images/p_gslc.png"></i>GSLC</p>
                        <p class="price"><span>￥</span>${gslcPrice }</p>
                        <p class="num">总量：1000万</p>
                    </div>
                </div>
                <div class="sec_p">
                    <div class="a_50">
                        <div class="p_de">
                            <p class="name"><i><img src="../static/images/p_sce.png"></i>SCE</p>
                            <p class="price"><span>￥</span>${scePrice }</p>
                            <p class="num">总量：9900万</p>
                        </div>
                    </div>
                    <div class="a_50" style="border-left:1px solid #FFF;">
                        <div class="p_de">
                            <p class="name"><i><img width="30" height="30" src="../static/images/p_gbc.png"></i>GBC</p>
                            <p class="price"><span>￥</span>${gbcPrice }</p>
                            <p class="num">总量：2200万</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!--幸运链  六大优势-->
    <div class="index-superiority" id="index_superiority">
        <div class="container">
            <div class="i-p-title">
                <p class="t1 f24">六大优势</p>
                <p class="t2">OUR  ADVANTAGES </p>
                <p class="t3"></p>
            </div>
            <div class="content clear">
                <div class="floor">
                    <div class="f-inner clear">
                        <div class="icon icon-1"></div>
                        <div class="text">
                            <p class="f18 p1">减少供应链中间机构</p>
                            <p class="f12 p2 f-999">Reducing intermediary</p>
                            <p class="p3 f-bbb"></p>
                            <p class="f12 p4 f-999">幸运链可以帮助确保供应链避开控制媒体清单的中介或者广告拦截器之类的第三方</p>
                        </div>
                    </div>
                </div>
                <div class="floor floor1">
                    <div class="f-inner clear">
                        <div class="icon icon-2"></div>
                        <div class="text">
                            <p class="f18 p1">促进数据共享</p>
                            <p class="f12 p2 f-999">data sharing</p>
                            <p class="p3 f-bbb"></p>
                            <p class="f12 p4 f-999">有利于打破数据孤岛。能够确切了解合作伙伴获得了哪些可用数据资产以及何时获得的。</p>
                        </div>
                    </div>
                </div>
                <div class="floor">
                    <div class="f-inner clear">
                        <div class="icon icon-3"></div>
                        <div class="text">
                            <p class="f18 p1">智能合约 </p>
                            <p class="f12 p2 f-999">Intelligent contract</p>
                            <p class="p3 f-bbb"></p>
                            <p class="f12 p4 f-999">一旦被触发时，“智能合约”就执行相应的条款或记录条款是否被执行。</p>
                        </div>
                    </div>
                </div>
                <div class="floor">
                    <div class="f-inner clear">
                        <div class="icon icon-4"></div>
                        <div class="text">
                            <p class="f18 p1">构建信任体系</p>
                            <p class="f12 p2 f-999">Trust system</p>
                            <p class="p3 f-bbb"></p>
                            <p class="f12 p4 f-999">幸运链+电商，基于幸运链的共享信任体系，所有记录可以查询。</p>
                        </div>
                    </div>
                </div>
                <div class="floor floor1">
                    <div class="f-inner clear">
                        <div class="icon icon-5"></div>
                        <div class="text">
                            <p class="f18 p1">物联网</p>
                            <p class="f12 p2 f-999">Internet of things</p>
                            <p class="p3 f-bbb"></p>
                            <p class="f12 p4 f-999">毫无疑问，幸运链可以为物联网提供很多应用场景，而且这些可能已经不再是未来主义，而是此刻！</p>
                        </div>
                    </div>
                </div>
                <div class="floor">
                    <div class="f-inner clear">
                        <div class="icon icon-6"></div>
                        <div class="text">
                            <p class="f18 p1">数字货币</p>
                            <p class="f12 p2 f-999">Digital currency</p>
                            <p class="p3 f-bbb"></p>
                            <p class="f12 p4 f-999">数字货币可以替代当下的现金钞票，让人们的交易数字化，简单化。</p>
                        </div>
                    </div>
                </div>
            </div>
            <div class="i-p-title" id="about_us">
                <p class="t1 f24">关于幸运链</p>
                <p class="t2">ABOUT US</p>
                <p class="t3"></p>
            </div>
            <div class="content2">
                <div class="f24 f-b79a56 title">它代表了下一个互联网时代</div>
                <div class="text f-999">
                    <p>&nbsp;&nbsp;幸运链是一种按照时间顺序将数据区块以顺序相连的方式组合成的一种链式数据结构， 并以密码学方式保证的不可篡改和不可伪造的分布式账本。广义来讲，幸运链技术是利用块链式数据结构来验证与存储数据、利用分布式节点共识算法来生成和更新数据、利用密码学的方式保证数据传输和访问的安全、利用由自动化脚本代码组成的智能合约来编程和操作数据的一种全新的分布式基础架构与计算方式  。
       幸运链 – 原始幸运链 ，是一种去中心化的数据库，它包含一张被称为区块的列表，有着持续增长并且排列整齐的记录。每个区块都包含一个时间戳和一个与前一区块的链接：设计幸运链使得数据不可篡改 — 一旦记录下来，在一个区块中的数据将不可逆。</p>
                </div>
                <div class="img">
                    <img src="../static/images/pjwp_09.png">
                </div>
            </div>
        </div>
    </div>

    <!--常见问题全解答-->
    <div class="index-questions" id="index_questions" >
        <div class="content container clear">
            <div class="i-p-title">
                <p class="t1 f24">常见问题全解答</p>
                <p class="t2">Frequently Asked Questions</p>
                <p class="t3"></p>
            </div>
            <script>
                $(function(){
                    $('.index-questions .pt').click(function(){
                        var a = $(this).parent('li');
                        if(!a.hasClass('select')){
                            a.find('.text').slideToggle();
                            a.siblings().find('.text').slideUp();
                            a.parents('.c-list').siblings().find('.text').slideUp();
                            a.parents('.c-list').siblings().find('li').removeClass('select');
                            a.addClass('select').siblings().removeClass('select');
                        }else{
                            a.removeClass('select').find('.text').slideToggle();
                        }
                    });
                });
            </script>
            <ul class="c-list clear">
                <li>
                    <div class="pt">
                        <p>01. 幸运链的获取方式？</p>
                        <i></i>
                    </div>
                    <div class="text">
                        <p>幸运链系统的主链是整个系统生态的驱动剂，将用于支持应用发展、支付应用消耗及费用、支持子链数字资产智能兑换、参与共识奖励、支付交易手费等。个人或机构均可免费参与。。</p>
                    </div>
                </li>
                <li>
                    <div class="pt">
                        <p>02.   幸运链的要收费吗？</p>
                        <i></i>
                    </div>
                    <div class="text">
                        <p>只收取1%维护费用，用于维护和开发延伸领域。</p>
                    </div>
                </li>
                <li>
                    <div class="pt">
                        <p>03.   幸运链是否公平以？</p>
                        <i></i>
                    </div>
                    <div class="text">
                        <p>公开、公平；不融资、不众筹，无私募，把市场决定权交给社区会员；开盘价：自由集合竞价产生，联盟期内涨跌幅5%，真正去中心化。</p>
                    </div>
                </li>
                <li>
                    <div class="pt">
                        <p>04.   如何描述幸运链的应用场景？</p>
                        <i></i>
                    </div>
                    <div class="text">
                        <p>在幸运链社区，基于幸运链的个人数据价值将被重塑和尊重，任何人读取你的数据，将为你支付幸运链，并需要得到你得同意。同样，你要在幸运链共享社区获得有价信息，也需要向对方支付幸运链。</p>
                    </div>
                </li>
                <li>
                    <div class="pt">
                        <p>05.   未来幸运链有什么前景？</p>
                        <i></i>
                    </div>
                    <div class="text">
                        <p>幸运链应用已延伸到金融科技、数字资产交易、物联网与互联网应用、供应链管理、政府公共管理与社会治理、能源管理、智能制造等多个领域，有可能引发新一轮的技术创新和产业变革。</p>
                    </div>
                </li>
                <li>
                    <div class="pt">
                        <p>06.   交易过程安全吗？</p>
                        <i></i>
                    </div>
                    <div class="text">
                        <p>期间无需中介参与、过程高效透明且降低了安全成本、提升了数据安全度，依靠一套严密的算法，去中心化后更加保证数据的真实、准确、透明及可追踪性、不可被篡改性。</p>
                    </div>
                </li>

            </ul>
            <ul class="c-list clear"><li>
                <div class="pt">
                    <p>07.   目前幸运链大规模商用有哪些挑战？</p>
                    <i></i>
                </div>
                <div class="text">
                    <p>从总体来看，幸运链从数字货币领域向现实世界的扩展已经越来越近，但是距离大规模商用，仍需要一段时间。</p>
                </div>
            </li>
                <li>
                    <div class="pt">
                        <p>08.   当前幸运链的设计使命？</p>
                        <i></i>
                    </div>
                    <div class="text">
                        <p>幸运链以普及幸运链实际应用为主线，采用平台共享和链上链下的加电商O2O 的创新模式，构建由联盟单位共同运营的商业服务平台。成为全球第一为全球客户开放商务后台幸运链技术应用。尊重所在国对幸运链律法的管理和主权，选择所在国独立运行或多国联盟运行。建立健康绿色生态的幸运链商业社区。</p>
                    </div>
                </li>
                <li>
                    <div class="pt">
                        <p>09.   什么是POS？</p>
                        <i></i>
                    </div>
                    <div class="text">
                        <p>POS 也称股权证明，类似于财产储存在银行，这种模式会根据你持有数字货币的量和时间，分配给你相应的利息。POS 模式的一大好处就是节省资源，仅需较低的算力就能维持整个幸运链网络的运作，有的甚至通过前期的短时间挖矿阶段直接进入纯 POS 模式，实现后期无需挖矿仅靠运行钱包客户端就能确认全网交易。</p>
                    </div>
                </li>
                <li>
                    <div class="pt">
                        <p>10.   幸运链的算力递减规则？</p>
                        <i></i>
                    </div>
                    <div class="text">
                        <p>a、分十期释放，第一至九期每期释放100万，第十期释放50万；<br />
b、第一期算力为基准算力的3倍，每一期释放完毕算力减半；950万发行完毕，算力终止。<br />
c、每一枚GSLC均有独立的代码，算力派息最高为2倍；</p>
                    </div>
                </li>
                <li>
                    <div class="pt">
                        <p>11.   幸运链网络的几个特点？</p>
                        <i></i>
                    </div>
                    <div class="text">
                        <p>① 所有的网络参与者参与审核，审核人身份不可抵赖；<br />
② 以大家达成共识的方式见证、封存交易记录；<br />
③ 封存的交易记录按时间排列，分布式地存储共享，但不可篡改。</p>
                    </div>
                </li>
                <li>
                    <div class="pt">
                        <p>12.   幸运链会带来什么改变？</p>
                        <i></i>
                    </div>
                    <div class="text">
                        <p>幸运链的诞生替代了“第三方机构”，避免了因记录不详、信息丢失，而发生的不公正现象。创造了一种解决彼此间不信任的“记账方式”，而这一解决方案的诞生将重新定义世界。</p>
                    </div>
                </li>
				
            </ul>

        </div>
    </div>

    
    <!--底部页脚-->
    <div class="footer">
        <div class="container">
            <div class="link">
            	<a href="#header" class="nav-header">首页</a>
                <a href="#index_price" class="nav-dl">最新价值</a>
                <a href="#index_superiority" class="nav-ys">六大优势</a>
                <a href="#about_us" class="nav-gy">关于幸运链</a>
                <a href="#index_questions" class="nav-wt">常见问题</a>
            </div>
            <div class="bq">
                <p>Copyright © 2018 LCP Club</p>
				
            </div>
        </div>
    </div>

</body>
</html>
