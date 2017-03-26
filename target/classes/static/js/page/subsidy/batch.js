define(['/js/common/ajax.js'], function(req) {

    /*
     ** 初始化函数
     */
    function init(){
        bindEvent();
    }

    /*
     ** 事件绑定函数
     */
    function bindEvent(){
        var wrap = $('.wrap');

        wrap.on('click', '.search-btn', triggerFile)
            .on('change', '#upload', chooseFile);
    }
                                            
    /*
     ** 触发图片上传
     */
    function triggerFile(){
        throttle($('#upload').trigger('click'), 300)
    }

    function chooseFile(e){
        var file = e.target.files[0];

        $('.file-name').val(file.name);
        upload(file);
    }

    function upload(file) {
        var formData = new FormData();
        var url = '/admin/batch/refund';

        formData.append('file', file);
        req({
            type: 'post',
            url: url,
            data: formData,
            processData: false,
            contentType: false
        }).done(function(res) {
            alert('上传成功');
        });
    }

    /**
     * 函数节流
     */
    function throttle(fn, delay){
        var timer = null;
        return function(){
            var context = this, args = arguments;
            clearTimeout(timer);
            timer = setTimeout(function(){
                fn.apply(context, args);
            }, delay);
        };
    };

    return {
        init: init
    }
});










