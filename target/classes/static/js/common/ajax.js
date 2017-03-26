/*
    ajax
 */
define(function() {

    /**
     * 统一的调用接口方法
     */
    function req(option) {
        var defaultOption = {
            type: 'get',
            url: '',
            dataType: 'json',
            // 非文件传输processData为true,反之设置为false
            processData: true
        }

        option = $.extend(defaultOption, option);
        option.data = option.data || {};
        return $.ajax(option).done(function(res) {
            option.cb && option.cb();
        }).fail(function(err) {
            console.log('系统错误');
            option.error && option.error();
        });
    }

    return req;
});