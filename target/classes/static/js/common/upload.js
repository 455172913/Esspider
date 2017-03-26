/*
	上传图片组件
 */
define(["/js/common/ajax.js"],function(req){

    // 当前上传的dom元素
    var currentUpload;
    var opt;
    
    /**
     * 组件初始化方法
     * @return {[type]} [description]
     */
    function init(option) {
        opt = option || {};
        opt.selector = opt.selector || '.img';
        bindEvent(opt);
    }

    /**
     * 绑定图片上传的相关事件
     * @param  {[type]} option [description]
     * @return {[type]}        [description]
     */
    function bindEvent(option) {
        //监听文件改变事件
        $('#upload').on('change', function(e) {
            var file = e.target.files[0];

            var reader = new FileReader();
            reader.readAsDataURL(file);

            //异步加载图片成功
            reader.onload = function(e) {
                //删除原来的图片
                currentUpload.find('.imgitem').remove();
                currentUpload.prepend('<div class="imgitem"><a href="javascript:;" class="del"></a><img class="is-img" src="' + reader.result + '" /></div><div class="mask"></div>');
                $('#upload').val('');

                var $parent = currentUpload.parent().parent();
                var max = $parent.data('max');
                if (max && $parent.find('li').length < parseInt(max) || max === -1) {
                    $parent.append($('<li class="photo-wrapper"><div class="img"></div></li>'));
                }

                // 如果错误提示信息存在则隐藏
                if ($parent.next('.form-error').is(":visible")) {
                    $parent.next('.form-error').addClass('hide');
                }
            }

            upload(file);
        })

        //触发图片上传
        $(document).on('click', option.selector, function() {
            currentUpload = $(this);
            var img = currentUpload.find('img');
            var hasImg = img.hasClass('is-img');

            if(hasImg){
                return 
            }else{
                throttle($('#upload').trigger('click'), 300)
            }
        });

        //删除当前已上传的图片
        $(document).on('click', option.selector + ' .del', function(e) {
            e.stopPropagation();
            var $this = $(this);
            var $ul = $this.parent().parent().parent().parent();
            var $li = $this.parent().parent().parent();
            var $img = $this.parent().parent();
            var $imgItem = $this.parent();
            if ($ul.find('li').length - $ul.find('.imgitem').length >= 1) {
                $li.remove();
            }

            $img.data('src', '');
            $imgItem.remove();
        });

        //按照原图比例进行查看
        $(document).on('click', '.mask', function(e) {
            e.stopPropagation();
            var $this = $(this);
            var imgsrc = $this.parent().find('img').attr('src');
            if (imgsrc) {
                $('.previewContent img').attr('src', imgsrc);
                $('.previewWrapper').removeClass('hide');

                var scrollTop = document.body.scrollTop;
                var clientHeight = document.body.clientHeight;
                if (scrollTop) {
                    var topValue = parseInt((scrollTop+clientHeight) / 2);
                    
                    $('.previewContent').css('top', topValue + 'px');
                }else{
                    $('.previewContent').css('top', '');
                }
            }
        });

        //隐藏图片预览
        $(document).on('click', '.previewContent .close', function(e) {
            e.stopPropagation();
            $('.previewWrapper').addClass('hide');
        });
    }

    /**
     * 移除DOM元素绑定的事件
     * @return {[type]} [description]
     */
    function unload(option) {
        option.selector = option.selector || '.img';
        $(document).off('click', option.selector);
        $(document).off('click', option.selector + ' .del');
    }

    /**
     * 上传图片到服务器
     */
    function upload(file) {
        var formData = new FormData();
        var url = '/admin/settle/deposit/imgUpload';

        $('.shade').removeClass('hide');
        formData.append('file', file);
        req({
            type: 'post',
            url: url,
            data: formData,
            processData: false,
            contentType: false
        }).done(function(res) {
            if (res.data) {
                if (!currentUpload.data('iscdc')) {
                    currentUpload.data('src', res.data);
                    alert('图片上传成功');
                } else {
                    currentUpload.data('fileid', res.data);
                }
                currentUpload.data('success', true);
            }
            $('.shade').addClass('hide');
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
        init: init,
        unload: unload,
        upload: upload
    };
});
