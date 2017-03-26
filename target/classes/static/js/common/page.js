/*
    分页
 */
define(["/js/common/ajax.js"],function(req){

    // 缓存传入的选项
    var opt;

    var defaultOption = {
        pageSize: 20
    }

    /**
     * 初始化加载分页组件
     * @param  {[type]} options [description]
     * @return {[type]}         [description]
     */
    function init(options) {
        if (!options.pageSize) {
            options = $.extend(defaultOption, options);
        }
        opt = options;
        intoPage(options.totalPage, options.currentPage, 2);
        bindEvent(options);
    }

    /**
     * 更多的分页栏显示
     * @param  {[type]} last_page    最后一页
     * @param  {[type]} page_id      当前的页码
     * @param  {[type]} step         当前页左右各显示几个
     * @param  {[type]} step         默认显示几个页码,多了显示...
     */
    function intoPage(last_page, page_id, step, pagesDefault) {
        last_page = parseInt(last_page);
        page_id = parseInt(page_id);
        step = parseInt(step) || 1;
        var tpl = '';
        var threshold = step + 2; //临界值
        var pre = page_id - step;
        var next = page_id + step;
        pagesDefault = parseInt(pagesDefault) > 2 * threshold - 1 ? 2 * threshold - 1 : 5;

        if (page_id == 1) {
            //tpl += '<li class="disabled pagefirst"><a>首页</a></li>';
        } else if (page_id > 1 && last_page > 1) {
            tpl += '<li><a class="pagefirst">首页</a></li>';
            tpl += '<li class="pageprev"><a>上一页</a></li>';
        }

        if (last_page <= pagesDefault) {
            for (var i = 1; i <= last_page; i++) {
                if (i == page_id) {
                    tpl += '<li class="active pagenum"><a>' + i + '</a></li>';
                } else {
                    tpl += '<li class="pagenum"><a>' + i + '</a></li>';
                }
            }
        } else {
            if (page_id <= threshold) {
                //处理起始页
                for (var i = 1; i <= next; i++) {
                    if (i == page_id) {
                        tpl += '<li class="active pagenum"><a>' + i + '</a></li>';
                    } else {
                        tpl += '<li class="pagenum"><a>' + i + '</a></li>';
                    }
                }
                if (next <= last_page - 1) {
                    tpl += '<li><a>...</a></li>';
                }
                if (next != last_page) {
                    if (last_page == page_id) {
                        tpl += '<li class="active pagenum"><a>' + last_page + '</a></li>';
                    } else {
                        tpl += '<li class="pagenum"><a>' + last_page + '</a></li>';
                    }
                }
            } else if (page_id > last_page - threshold) {
                //处理结束页
                if (pre != 1) {
                    if (1 == page_id) {
                        tpl += '<li class="active pagenum"><a>1</a></li>';
                    } else {
                        tpl += '<li class="pagenum"><a>1</a></li>';
                    }
                }
                if (pre >= 2) {
                    tpl += '<li><a>...</a></li>';
                }
                for (var i = pre; i <= last_page; i++) {
                    if (i == page_id) {
                        tpl += '<li class="active pagenum"><a>' + i + '</a></li>';
                    } else {
                        tpl += '<li class="pagenum"><a>' + i + '</a></li>';
                    }
                }
            } else {
                //处理中间页
                tpl += '<li class="pagenum"><a>1</a></li>';
                tpl += '<li><a>...</a></li>';
                for (var i = pre; i <= next; i++) {
                    if (i == page_id) {
                        tpl += '<li class="active pagenum"><a>' + i + '</a></li>';
                    } else {
                        tpl += '<li class="pagenum"><a>' + i + '</a></li>';
                    }
                }
                tpl += '<li><a>...</a></li>';
                tpl += '<li class="pagenum"><a>' + last_page + '</a></li>';
            }
        }
        if (page_id == last_page) {
            tpl += '<li class="disabled"><a>尾页</a></li>';
        } else if (last_page > 1 && page_id < last_page) {
            tpl += '<li class="pagenext"><a>下一页</a></li>';
            tpl += '<li class="pagelast"><a>尾页</a></li>';
        }

        $('.pagination').html(tpl);
    }

    /**
     * 获取当前页面数据
     */
    function getCurPageData(pageNo, urlParam) {
        var param = {};
        for (var i in urlParam) {
            param[i] = urlParam[i];
        }

        param.pageNo = pageNo;
        param.pageSize = opt.pageSize;

        req({
            type: 'get',
            url: opt.url,
            data: param
        }).done(function(res){
            intoPage(opt.totalPage, pageNo, 2);
            opt.cb && opt.cb(res);
        }).fail(function(err){
            opt.error && opt.error(err);
        });
    }

    /**
     * 绑定换页事件
     */
    function bindEvent(options) {
        //点击首页
        $(document).off('click','.pagefirst').on('click', '.pagefirst', function () {
            var currentNum = parseInt($(this).parent().find('.active').find('a').text());
            if (currentNum != 1) { //判断一下,减少请求
                getCurPageData(1, options.param)
            }
        });

        //点击末页
        $(document).off('click','.pagelast').on('click', '.pagelast', function () {
            var currentNum = parseInt($(this).parent().find('.active').find('a').text());
            if (currentNum != options.totalPage) { //判断一下,减少请求
                getCurPageData(options.totalPage, options.param);
            }
        });

        //点击下一页
        $(document).off('click','.pagenext').on('click', '.pagenext', function () {
            var num = parseInt($(this).parent().find('.active').find('a').text()) + 1;
            getCurPageData(num, options.param);
        });

        //点击上一页
        $(document).off('click','.pageprev').on('click', '.pageprev', function () {
            var num = parseInt($(this).parent().find('.active').find('a').text()) - 1;
            getCurPageData(num, options.param);
        });

        //点击页码
        $(document).off('click','.pagenum').on('click', '.pagenum', function () {
            var num = parseInt($(this).find('a').text());
            var currentNum = parseInt($(this).parent().find('.active').find('a').text());
            if (num != currentNum) {
                getCurPageData(num, options.param);
            }
        });
    }

    return {
        init: init
    }
});