(function (win, doc) {
    'use strict';
    if (!win || !doc)
        return;
    var Share = function (options) {
        return new _Share(options);
    };

    var _Share = function (options) {
        this.text = options.text ? options.text : '开源中国众包平台';
        this.url = options.url ? options.url : 'https//zb.oschina.net';
        this.desc = options.desc ? options.desc : '快来分享吧';
        return this.init();
    };

    _Share.prototype = {
        constructor: _Share,
        init: function () {
            win._bd_share_config = {
                common: {
                    bdText: this.text,
                    bdDesc: this.desc,
                    bdUrl: this.url,
                    bdPic: "",
                    bdMini: 1,	// 展示在页面的分享媒体所占行数（1，2，3）
                    onBeforeClick: function (cmd, cfg) {
                        var l = location.href;
                        if (cmd === "weixin") {
                            cfg.bdUrl = l.indexOf("?") !== -1 ? l + "&wx" : l + "?wx";
                        }
                        return cfg;
                    }
                },
                slide: [{
                    bdImg: 3,
                    bdPos: "right",
                    dbTop: 350
                }]
            };
            // src=原来是百度的服务器文件，改为本工程源代码目录文件 “shareResCode.js”
            doc.getElementsByTagName('body')[0].appendChild(doc.createElement('script')).src = '/js/baidshare/shareResCode.js';
            return this;
        }
    };

    win.share = Share;
})(window, document);