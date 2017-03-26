/*
 自动提示完成
 */
define(["/js/common/ajax.js"],function(req){

    /**
     * 自动提示完成类
     */
    function AutoCmp(opt) {
        this.dom = opt.dom;
        this.key = opt.key;
        this.type = opt.type;
        this.url = opt.url;
        this.buildList = opt.buildList;
        this.interval = opt.interval || 500;
        this.selectCb = opt.selectCb;
        this.noDataCb = opt.noDataCb;
        this.retId = opt.retId || 'id';
        this.retName = opt.retName || 'name';
        this.dataIdKey = opt.dataIdKey || 'id';
        this.param = opt.param || '';
        bindEvent(this);
    }

    /**
     * 绑定下拉框li的单击事件
     */
    function bindEvent(self) {
        if (self.dom) {
            var $ul = self.dom.parent().find('.ac-outer');
            $ul.on('mousedown', 'li', function() {
                var $this = $(this);
                if (!$this.hasClass('no')) {
                    self.dom.val($(this).text());
                    var obj = $(this).attr('obj');
                    $ul.addClass('hide');
                    if (obj) {
                        if ($this.data('escape')) {
                            self.selectCb && self.selectCb(JSON.parse(unescape(obj)))
                        } else {
                            self.selectCb && self.selectCb(JSON.parse(obj))
                        }
                    }
                }
            });

            self.dom.off('keyup').on('keyup', debounce(getAutoCompleteList.bind(self), self.interval))
                .off('blur').on('blur', function() {
                    $ul.addClass('hide');
                });

            // 隐藏自动完成提示
            $(document).on('click', function() {
                $ul.addClass('hide');
            })
        }
    }

    /**
     * 获取自动提示的数据
     */
    function getAutoCompleteList() {
        var self = this;
        var key = self.key;
        var text = self.dom.val();
        if (text) {
            var data = {};
            data[key] = text;

            // 如果需要携带额外的参数
            if (self.param) {
                data = $.extend(data, self.param);
            }

            req({
                type: self.type,
                url: self.url,
                data: data
            }).done(function(res) {
                if (!res.data || !res.data.length) {
                    htmlstr = '<li class="no">暂无</li>';
                    self.dom.parent().find('.ac-ul').html(htmlstr)
                    self.dom.parent().find('.ac-outer').removeClass('hide');
                    self.dom.removeData();
                    self.noDataCb && self.noDataCb();
                } else {
                    if (res.data && res.data.length && res.data.length >= 1) {
                        if (res.data[0] && text == res.data[0][self.retName]) {
                            self.dom.data(self.dataIdKey, res.data[0][self.retId]);
                        }
                        self.buildList && self.buildList(res);
                    }
                }
            });
        } else {
            // 如果上次有选中的数据,则移除
            self.dom.removeData();
            self.dom.parent().find('.ac-outer').addClass('hide');
            self.noDataCb && self.noDataCb();
        }
    }

    /**
     * keyup事件去抖
     */
    function debounce(func, wait, immediate) {
        var timeout;
        return function() {
            var context = this,
                args = arguments;
            var later = function() {
                timeout = null;
                if (!immediate) func.apply(context, args);
            };
            var callNow = immediate && !timeout;
            clearTimeout(timeout);
            timeout = setTimeout(later, wait);
            if (callNow) func.apply(context, args);
        };
    };

    return AutoCmp;
});
