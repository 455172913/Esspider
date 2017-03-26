define(['/js/lib/juicer.js', '/js/common/ajax.js', '/js/common/page.js', '/js/common/autoComplete.js'], function(juicer, req, pagenation, autoCmp) {


    var $startDate = $('#start-date');
    /*
     ** 初始化函数
     */
    function init(){
        datePicker();
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
        var recordTime = $startDate.val();
        var organizationNo = $('.organizationNo').val();

        console.log(organizationNo)
        if(recordTime == '' || organizationNo == null ){
            alert('日期请填写完全');
        }else{
            throttle($('#upload').trigger('click'), 300)
        }


    }
    function chooseFile(e){
        var file = e.target.files[0];

        upload(file);
    }

    function upload(file) {
        var formData = new FormData();
        var url = '/admin/refund/refundExcel';
        var recordTime = $startDate.val();
        var organizationNo = $('.organizationNo').val();
        var needNotify = $('#needNotify').prop('checked');

        $('.file-name').val(file.name);
        formData.append('file', file);
        formData.append('recordTime' , recordTime);
        formData.append('organizationNo' , organizationNo);
        formData.append('needNotify' , needNotify);
        req({
            type: 'post',
            url: url,
            data: formData,
            processData: false,
            contentType: false
        }).done(function(res) {
            if (res.status == 200){
                var msg = res.data.remark+'\n';
                msg = msg + '成功条数：'+res.data.successCount+'\n';
                msg = msg + '失败条数：'+res.data.failedCount+'\n';
                msg = msg + '失败行号：';
                for(var i =0; i<res.data.failedList.length; i++){
                    msg = msg + res.data.failedList[i]+',';
                }

                alert(msg);
            location.reload([false]);
            }if(res .status == 422){
             alert(res.data);
             location.reload([false]);
            }
        }).fail(function(err){
             alert('服务器故障，请稍候再试');
             location.reload([false]);
        });
    }

    /*
    ** bootstrap日期时间组件
    */
    function datePicker(){

        // 设置起始时间
        $startDate.datetimepicker({
            language:  'zh-CN',
            format: "yyyymmdd",
            weekStart: 1,
            todayBtn:  1,
            autoclose: 1,
            todayHighlight: 1,
            startView: 2,
            minView: 2,
            forceParse: 0
        })
        // // 设置默认开始时间
        // var dBeginTime = new Date($('.default-start-date').val())
        // $startDate.datetimepicker('setDate',dBeginTime);

        // // 将开始时间戳设置到页面内
        // setTimeStamp($startDate, $('.start-time-stamp'));

        // // 初始化限制开始和结束时间
        // $startDate.datetimepicker('setEndDate',new Date($('.end-time-stamp').val()));
    }

    /*
    ** 设置时间戳
    */
    function setTimeStamp(date, stampDom){
        var dataVal = date.val();

        stampDom.val(dataVal);
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










