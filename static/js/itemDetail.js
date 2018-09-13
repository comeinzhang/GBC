
    var itemId = getParameterByName('iid');
    var itemDetail = angular.module('itemDetail', []);
    itemDetail.filter('httpTohttps', function () {
        return function (input) {
            return input.replace('http://', 'https://');
        }
    });
    itemDetail.filter('parseFloat', function () {
        return function (input) {
            return parseFloat(input);
        }
    });
    itemDetail.filter('todirect', function () {
        return function (input) {
            var url = appUrlPrefix + 'v1/html/user/' + input;
            return redirectUrlPrefix + api.toredirect + "?topage=" + encodeURIComponent(url);
        }
    });


    itemDetail.filter('limitHtml', function () {
        return function (text, limit) {
            var changedString = String(text).replace(/<[^>]+>/gm, '');
            var length = changedString.length;
            var suffix = '…';
            return length > limit ? changedString.substr(0, limit - 1) + suffix : changedString;
        }
    });
    itemDetail.filter('timeFormat', function () {
        return function (input) {
            if (input.toString().length == 13 && parseInt(input)) {
                var tarTime = input;
                var curTime = new Date().getTime();
                var interval = curTime - tarTime;
                var timeText = '';
                if (interval <= 5 * 60 * 1000) {
                    timeText = '刚刚';
                } else if (interval > 5 * 60 * 1000 && interval <= 60 * 60 * 1000) {
                    timeText = parseInt(interval / 60000) + '分钟前';
                } else if (interval > 60 * 60 * 1000 && interval <= 24 * 60 * 60 * 1000) {
                    timeText = parseInt(interval / 3600000) + '小时前';
                } else if (interval > 24 * 60 * 60 * 1000) {
                    var curY = new Date(curTime).getFullYear();
                    var tarY = new Date(tarTime).getFullYear();
                    var isThisY = curY == tarY;
                    var fixNum = function (num) {
                        return num < 10 ? '0' + num : num;
                    }
                    var tarM = fixNum(new Date(tarTime).getMonth() + 1);
                    var tarD = fixNum(new Date(tarTime).getDate());
                    var tarH = fixNum(new Date(tarTime).getHours());
                    var tarMi = fixNum(new Date(tarTime).getMinutes());
                    if (isThisY) {
                        timeText = tarM + '-' + tarD + ' ' + tarH + ':' + tarMi;
                    } else {
                        timeText = tarY + '-' + tarM + '-' + tarD ;
                    }
                }
                return timeText;
            } else {
                return input;
            }
        }
    })


    itemDetail.controller('itemCtrl', function ($scope, $http, $timeout) {
        $scope.toItem = redirectUrlPrefix + api.toItemDetail + "?iid=";
        $scope.fileServer = tfsUrlPrefix;

        $http({
            method: 'POST',
            url: ajaxUrlPrefix + api.itemDetail,
            data: $.param({iid: itemId}),
            headers: {'Content-Type': 'application/x-www-form-urlencoded'}
        }).success(function (data) {
            if (0 == data.code) {
                var res = data.res;
                if (res === undefined) {
                    //删除,跳转404
                    window.location.href = notFound;
                } else if (res.saletype == 2) {  // 搭伙商品跳转到搭伙详情页
                    $("body").hide();
                    $http({
                        method: 'POST',
                        url: ajaxUrlPrefix + 'v2/board/base',
                        data: $.param({iid: itemId}),
                        headers: {'Content-Type': 'application/x-www-form-urlencoded'}
                    }).success(function (data) {
                        if (data.code == 0 && data.res) {
                            window.location.href = data.res.activityAddr.split('?')[0];
                        }
                    })
                }
                $scope.item = res;
                if($scope.item.activities) {
                    $scope.item.activities.addr  = decodeURIComponent($scope.item.activities.addr).split('?')[0];
                }
                $scope.pictures = eval(res.pictures)
                var types = {
                    1: '现货',
                    2: '定制',
                    3: '拍品'
                }
                $scope.itemType = types[res.type];

                var itemStock = res.stock;
                var itemStatus = res.status;
                var itemSStatus = res.sUserState;
                var salestatus = res.salestatus;
                if (itemStock > 0 && itemStatus == 1 && itemSStatus == 1
                        &&(salestatus == 0 || salestatus == 2)) {
                    var touchEvent = ('ontouchstart' in window) || window.DocumentTouch && document instanceof DocumentTouch ? 'tap' : 'click';
                    $(".buy-btn").on(touchEvent, function () {
                        if (!isWeixin) {
                            window.location.href = redirectUrlPrefix + api.qrcode + '?id=' + itemId;
                        } else {
                            weixinAuthorize(redirectUrlPrefix + api.toorder + "?iid=" + itemId);
                        }
                    })
//                } else if (itemStock <= 0) {
//                    $(".buy-btn").text("已售罄").addClass('disable');
//                } else if (itemStatus != 1 || itemSStatus != 1) {
//                    $(".buy-btn").text("已下架").addClass('disable');
//                } else if (salestatus != 0 && salestatus != 2){
//                    $(".buy-btn").text("即将开售");
//                    var touchEvent = ('ontouchstart' in window) || window.DocumentTouch && document instanceof DocumentTouch ? 'tap' : 'click';
//                    $(".buy-btn").on(touchEvent, function () {
//                        popTips("作品暂未开售，不能购买");
//                    })
                }
                // set title
                document.title = res.title;
                var $iframe = $('<iframe src="/favicon.ico" class="hide"></iframe>');
                $iframe.on('load', function () {
                    setTimeout(function () {
                        $iframe.off('load').remove();
                    }, 0);
                }).appendTo($('body'));

                weixinShare({
                    title: $scope.item.title,
                    desc: $scope.item.desc,
                    imgUrl: tfsUrlPrefix + $scope.pictures[0]
                })
            } else {
                window.location.href = notFound;
            }
        })

        $http({
            method: 'POST',
            url: ajaxUrlPrefix + api.replys,
            data: $.param({iid: itemId}),
            headers: {'Content-Type': 'application/x-www-form-urlencoded'}
        }).success(function (data) {
            if (0 == data.code) {
                var res = data.res;
                $scope.evaluates = res.evaluates;
                $scope.envnum = res.envnum;
                $scope.replies = res.replies;

                $scope.envtype = res.envtype;
                $timeout(function () {
                    $(".download-btn").tap(function () {
                        window.location.href = downloadUrl;
                    })
                })

            }
        })
        $http({

            method: 'POST',
            url: ajaxUrlPrefix + api.recommends,
            data: $.param({iid: itemId}),
            withCredentials: true,
            headers: {'Content-Type': 'application/x-www-form-urlencoded'}
        }).success(function (data) {

            if (0 == data.code) {
                var res = data.res;
                if (res.length % 2 !== 0) {
                    res.pop();
                }
                $scope.recommends = res;
            }

        })
    })

    itemDetail.directive('onFinishRender', function () {
        return {
            restrict: 'A',
            link: function (scope, element, attr) {
                if (scope.$last === true) {
                    element.ready(function () {
                        $(".container").show();
                        $("#loading").hide();
                        $(".lazy").lazyload({
                            threshold: 0
                        });
                    });
                }
            }
        }
    });
