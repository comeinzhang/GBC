var productApi = {
    toItemDetail: "items/todetail",
    itemDetail: "items/detail",
    replys: "items/replys",
    toorder: "orders/toorder",
    address: "address.json",
    addorder: "orders/add",
    orderdetail: "orders/detail",
    toOrderdetail: "orders/todetail",
    toPostal: "orders/topostal",

    code: "auth/bindcode",  // 验证码
    login: "auth/bindphone",  // 登录
    expressPara: "orders/kuaidi",  // 快递参数
    express: "tools/httpjson",  // 快递详情
    toredirect: "tools/toredirect",
    confirmReceipt: "orders/confirm",  // 确认收货
    cancelOrder: "orders/close",  // 取消订单
    orderList: "orders/list",   // 订单列表
    isbind: "auth/isbind",   // 用户是否绑定
    getWXUrl: "auth/wxauthparam",
    repay: "orders/repay",
    qrcode: "items/toqrcode",
    setPayed: "orders/payed",
    toPayResult: "orders/payresult",
    tobindphone: "auth/tobindphone",
    tomyorder: "orders/tomyorder",
    wxInfo: "auth/jsparam",
    recommends: "items/recommends", //推荐商品
    areaCode: "auth/areacode", // 国际区号
    shipTrace:"shipments/trace", //获取物流信息
    boardDetail: "v2/board/detail",  // 搭伙详情
    boardInfo: "v2/board/info",  // 搭伙信息

};
var api = productApi;

var ua = navigator.userAgent.toLowerCase();
var isWeixin = /micromessenger/.test(ua);
var isAndroid = /android/.test(ua);
var isIphone = /iphone/.test(ua);
var downloadUrl = 'https://app.kaipao.cc/v1/settings/install';

var notFound = 'https://app.kaipao.cc/404.html';

var popTips = function (msg, callback) {
    var templateHtml = '<div class="tip-pop pop"><div class="tip-container"><div class="text"><div class="title">提示</div><div class="message">' + msg + '</div></div><div class="foot-btn close-btn">关闭</div><span class="icon close-btn"></span> </div></div>';
    $("body").append(templateHtml);
    $("body").on("touchmove", false);
    $(".tip-pop").show().css('height', document.documentElement.clientHeight);
    $(".tip-pop .close-btn").click(function () {
        if (callback) {
            callback();
        } else {
            $(this).parents('.pop').remove();
        }
        $("body").unbind("touchmove");
    })
}
if ($(".share-btn").length > 0) {
    $(".share-btn").click(function () {
        if (isWeixin) {
            var imgUrl = isIphone ? 'T3YRZTBCKv1RCvBVdK.png' : 'T3daZTBjbT1RCvBVdK.png';
            var templateHtml = '<div class="pop share-pop"><img src="https://file.kaipao.cc/' + imgUrl + '" alt=""></div>';
            $("body").append(templateHtml);
            $(".share-pop").show();
            $(".share-pop").click(function () {
                $(this).remove();
            })
        } else {
            window.location.href = downloadUrl;
        }
    })
}
if ($(".download-btn").length > 0) {
    $(".download-btn").click(function () {
        window.location.href = downloadUrl;
    })
}

// 解析url
function getParameterByName(name) {
    name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
    var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"),
        results = regex.exec(location.search);
    return results === null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
}
// 确认订单
function confirmReceipt(isRefund, oid, callback) {
    if (isRefund) {
        if (confirm("该订单申请了退款，您确认后，退款申请会被取消并且相关款项将打入匠人的账户")) {
            confirmAjax(oid, callback);
        }
    } else {
        if (confirm("您确认后，相关款项将打入匠人的账户")) {
            confirmAjax(oid, callback);
        }
    }
}
function confirmAjax(oid, callback) {
    $.ajax({
        type: "POST",
        url: ajaxUrlPrefix + api.confirmReceipt,
        data: {ooid: oid},
        success: function (data) {
            if (0 == data.code) {
                callback();
            } else {
                popTips(data.msg)
            }
        },
        error: function (xhr, status) {
            console.log(status)
        }
    })
}

// 取消订单
function cancelOrder(oid, callback) {
    if (confirm("您确定要取消订单吗？")) {
        $.ajax({
            type: 'POST',
            url: ajaxUrlPrefix + api.cancelOrder,
            data: {ooid: oid},
            success: function (data) {
                if (0 == data.code) {
                    callback();
                } else {
                    popTips(data.msg)
                }
            }
        })
    }
}

// 时间格式转换
function getTime(leftSeconds) {
    var leftD = parseInt(leftSeconds / 86400);
    var leftDtext = leftSeconds < 86400 ? "" : leftD + "天";
    var leftH = parseInt(leftSeconds % 86400 / 3600);
    var leftHtext = leftSeconds < 3600 ? "" : leftH + "时";
    var leftM = parseInt(leftSeconds % 3600 / 60);
    var leftMtext = leftSeconds < 60 ? "1分" : leftM + "分钟";
    return leftDtext + leftHtext + leftMtext;
}

// 订单状态
function orderStatus(status) {
    var statusText;
    switch (status) {
        case 1:
            statusText = '等待您付款';
            break;
        case 2:
        case 3:
            statusText = '等待匠人发货';
            break;
        case 4:
            statusText = '匠人已发货';
            break;
        case 5:
        case 6:
            statusText = '交易成功';
            break;
        case 0:
            statusText = '订单已取消';
            break;
    }
    return statusText;
}

// 退款状态
function orderRefund(refund) {
    var refundText;
    switch (refund) {
        case 1:
        case 3:
        case 4:
        case 6:
        case 7:
        case 9:
        case 10:
            refundText = '退款中';
            break;
        case 5:
        case 12:
            refundText = '退款成功';
            break;
        case 2:
        case 8:
        case 11:
            refundText = '退款失败';
            break;
    }
    return refundText;
}

// 订单详情状态
function mergeOrderStatus(orderstatus, refundstatus, boardstatus) {
    var status;
    if(orderstatus == 3 && boardstatus == 2) {  //  已付款未成伙
        status = '还未成伙';
    } else if (boardstatus == 4) {   // 搭伙失败
        status = '搭伙失败';
    } else if (orderstatus == 3 && (boardstatus == 3|| boardstatus == 5)) {
        status = '已成伙，等待匠人发货';
    } else if ((orderstatus == 3 || orderstatus == 4) && refundstatus == 1) {
        status = '等待匠人处理仅退款申请';
    } else if (orderstatus == 4 && (refundstatus == 6 || refundstatus == 9)) {
        status = '等待匠人处理退货退款申请';
    } else if (orderstatus == 4 && refundstatus == 7) {
        status = '请尽快发出退货';
    } else if (refundstatus !== 0) {  // 有退款
        if (refundstatus == 3 || refundstatus == 10) {
            return '匠人处理退款中';
        } else if (refundstatus == 5 || refundstatus == 12) {
            return '退款成功';
        }
        if (refundstatus == 2 || refundstatus == 8 || refundstatus == 11) {
            status = orderStatus(orderstatus);
        } else {
            status = orderRefund(refundstatus);
        }
    } else {
        status = orderStatus(orderstatus);
    }
    return status;
}

function getPayResult(args) {
    $.ajax({
        type: "POST",
        url: ajaxUrlPrefix + api.orderdetail,
        data: {oid: args.orderId},
        success: function (data) {
            var res = data.res[0];
            if (res) {
                if (3 == res.status || 2 == res.status) {
                    window.location.href = redirectUrlPrefix + productApi.toPayResult + '?ooid=' + args.orderId + '&result=1&iid=' + args.itemId
                } else {
                    if (args.retry) {
                        setTimeout(function () {
                            getPayResult(args);
                        }, 500);
                    } else {
                        window.location.href = redirectUrlPrefix + productApi.toPayResult + '?ooid=' + args.orderId + '&result=0&iid=' + args.itemId
                    }
                }
            }
        }
    })
}

// 付款
function payOrder(oid) {
    // 预支付 确认状态
    $.ajax({
        type: "POST",
        url: ajaxUrlPrefix + api.orderdetail,
        data: {oid: oid},
        success: function (data) {
            if (0 == data.code && data.res) {
                var res = data.res[0];
                if (res.cancelAdminFlag) {
                    if (res.cancelAdminFlag == 0) {
                        popTips("抱歉，您的订单已经取消，请重新下单");
                        return;
                    } else if (res.cancelAdminFlag == 2) {
                        popTips("抱歉，您的订单因长时间未付款已经取消，请重新下单");
                        return;
                    }
                }
                var itemId = res.iid;
                $.ajax({
                    type: "POST",
                    url: ajaxUrlPrefix + api.repay,
                    data: {ooid: oid},
                    error: function (xhr, error) {
                        if (error == "abort" || error == "timeout") {
                            popTips("网络异常，请检查网络设置")
                        }
                    },
                    success: function (data) {
                        if (0 == data.code) { // 创建微信预支付订单成功
                            var data = data.res;
                            var orderId = data.ooid;
                            var appId = data.appId;
                            var timeStamp = data.timeStamp;
                            var nonceStr = data.nonceStr;
                            var package = data.package;
                            var signType = data.signType;
                            var paySign = data.paySign;
                            // 调起微信支付
                            if (typeof WeixinJSBridge == "undefined") {
                                if (document.addEventListener) {
                                    document.addEventListener('WeixinJSBridgeReady', onBridgeReady, false);
                                } else if (document.attachEvent) {
                                    document.attachEvent('WeixinJSBridgeReady', onBridgeReady);
                                    document.attachEvent('onWeixinJSBridgeReady', onBridgeReady);
                                }
                            } else {
                                // 微信支付
                                function onBridgeReady() {
                                    WeixinJSBridge.invoke(
                                        'getBrandWCPayRequest', {
                                            "appId": appId,
                                            "timeStamp": timeStamp,
                                            "nonceStr": nonceStr,
                                            "package": package,
                                            "signType": signType,
                                            "paySign": paySign
                                        },
                                        function (res) {
                                            var result;
                                            if (res.err_msg == "get_brand_wcpay_request:ok") {
                                                var pa = {
                                                    orderId: orderId
                                                };
                                                setPayed(pa);
                                                $("body").append('<div id="loading"><span class="icon"></span></div>')
                                                var param = {
                                                    retry: true,
                                                    orderId: orderId,
                                                    itemId: itemId
                                                };
                                                setTimeout(function () {
                                                    param.retry = false;
                                                }, 5000)

                                                getPayResult(param);

                                            } else if (res.err_msg == "get_brand_wcpay_request:cancel") {
                                                window.location.href = redirectUrlPrefix + productApi.toPayResult + '?ooid=' + orderId + '&result=2&iid=' + itemId
                                            } else {
                                                window.location.href = redirectUrlPrefix + productApi.toPayResult + '?ooid=' + orderId + '&result=0&iid=' + itemId
                                            }
                                        }
                                    );
                                }

                                onBridgeReady();
                            }
                        } else {
                            popTips(data.msg)
                        }
                    }
                })

            }
        },
        error: function (xhr, error) {
            if (error == "abort" || error == "timeout") {
                popTips("网络异常，请检查网络设置")
            }
        }
    });
}

function decryptByDES(ciphertext, key, callback) {
    var script = document.createElement('script');
    script.src = "https://file.kaipao.cc/T3yRZTBKJv1RCvBVdK.js";
    var last = document.scripts[document.scripts.length - 1];
    last.parentNode.appendChild(script);
    script.onload = function () {
        var last = document.scripts[document.scripts.length - 1];
        var doDecrypt = function () {
            var keyHex = CryptoJS.enc.Utf8.parse(key);
            var decrypted = CryptoJS.DES.decrypt({
                ciphertext: CryptoJS.enc.Base64.parse(ciphertext)
            }, keyHex, {
                mode: CryptoJS.mode.ECB,
                padding: CryptoJS.pad.Pkcs7
            });
            var result = decrypted.toString(CryptoJS.enc.Utf8);
            callback(result);
        }
        if (last.src == script.src) {
            doDecrypt();
        } else {
            last.onload = doDecrypt();
        }
    }
}
// 设置微信分享信息
function weixinShare(info) {
    var script = document.createElement('script');
    script.src = "https://file.kaipao.cc/T3rRdTB5Kv1RCvBVdK.js";
    var last = document.scripts[document.scripts.length - 1];
    last.parentNode.appendChild(script);
    script.onload = function () {
        var last = document.scripts[document.scripts.length - 1];
        var setShare = function () {
            $.ajax({
                type: "POST",
                url: ajaxUrlPrefix + api.wxInfo,
                data: {url: window.location.href},
                success: function (data) {
                    var res;
                    var key = "1234!@#$%";
                    var formatUrl = data.res.split("\n").join("");
                    var callback = function (str) {
                        res = $.parseJSON(str);
                        wx.config({
                            debug: false,
                            appId: res.appId, // 必填，公众号的唯一标识
                            timestamp: res.timestamp, // 必填，生成签名的时间戳
                            nonceStr: res.nonceStr, // 必填，生成签名的随机串
                            signature: res.signature,// 必填，签名，见附录1
                            jsApiList: ['onMenuShareTimeline', 'onMenuShareAppMessage'] // 必填，需要使用的JS接口列表，所有JS接口列表见附录2
                        });
                        wx.ready(function () {
                            var shareInfo = {
                                title: info.title || '东家', // 分享标题
                                desc: info.desc || '东家，让传承成为潮流', // 分享描述
                                link: info.link || window.location.href, // 分享链接
                                imgUrl: info.imgUrl || 'https://file.kaipao.cc/T3VydTBs_T1RCvBVdK.png', // 分享图标
                            }
                            wx.onMenuShareTimeline(shareInfo);
                            wx.onMenuShareAppMessage(shareInfo);
                        });
                    }
                    var url = decryptByDES(formatUrl, key, callback);
                }
            })
        }
        if (last.src == script.src) {
            setShare();
        } else {
            last.onload = setShare();
        }
    }
}
// 微信授权
function weixinAuthorize(page) {
    $.ajax({
        type: 'POST',
        url: ajaxUrlPrefix + api.getWXUrl,
        data: $.param({topage: page}),
        headers: {'Content-Type': 'application/x-www-form-urlencoded'},
        success: function (data) {
            var key = "1234!@#$%";
            var res = data.res;
            var formatUrl = res.split("\n").join("");
            var callback = function (str) {
                window.location.href = str;
            }
            var url = decryptByDES(formatUrl, key, callback);
        },
        error: function (xhr, error, status) {
            if (error == "abort" || error == "timeout") {
                popTips("网络异常，请检查网络设置")
            } else if (xhr.status == 404) {
                popTips("网络异常，请检查网络设置")
            }
        }
    })
}

function setPayed(args) {
    $.ajax({
        type: "POST",
        url: ajaxUrlPrefix + api.setPayed,
        data: {ooid: args.orderId},
        success: function (data) {
            if (0 == data.code) {

                //do nothing
            } else {
                popTips(data.msg)
            }
        }
    })
}
