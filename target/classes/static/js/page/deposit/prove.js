define(['/js/common/ajax.js', '/js/common/upload.js'], function(req, upload) {

	/*
	 ** 初始化函数
	 */
	function init(){
		bindEvent();
		upload.init();
        dealInfo();
	}

	/*
	 ** 事件绑定函数
	 */
	function bindEvent(){
		var wrap = $('.wrap');

		wrap.on('click', '.submit-btn', submitCheck)
            .on('click', '.check-radio', chooseRadio);
	}

    /*
     ** 标志radio
     */
    function chooseRadio(){
        var _this = $(this);

        $('.check-radio').attr('checked', false);
        _this.attr('checked', true);
    }

    /*
     ** 提交审核
     */
    function submitCheck(){
        var remark = $('.must-remark').val();
        var applyId = queryString('applyId');
        var radioStatus = $("input[name='optionsRadios'][checked]").val();

        var param = {
            "applyId": applyId,
            "reason": remark,
            "status": radioStatus
        }

        if(remark == ""){
            alert('请填写备注信息')
        }else{
            req({
                type: 'post',
                url: "/admin/settle/deposit/approveApply",
                data: param
            }).done(function(res){
                if(res.status == 200){
                    window.location.href="/admin/settle/deposit/check";
                }else{
                    alert(res.data);
                }
            }).fail(function(err){
                alert('服务器故障，请稍候再试');
            });
        }
    }

    /*
     ** 处理审核不同入口的查看展示
     */
    function dealInfo(){
        var checkState = queryString('checkState');
        var submitBtn = $('.submit-btn');
        var mustRemark = $('.must-remark');
        var radio = $('.radio');

        if(checkState == 'pass'){
            radio.hide();
            submitBtn.hide();
            mustRemark.attr('readonly', true);
            $('.check-pass').show();
        }else if(checkState == 'fail'){
            radio.hide();
            submitBtn.hide();
            mustRemark.attr('readonly', true);
            $('.check-fail').show();
        }else{
            return
        }
    }

    /*
     ** 获取url中的参数
     */
    function queryString(name){
        var allParams = window.location.search.substring(1);
        var paramArr = allParams.split("&");

        for (i = 0; i < paramArr.length; i++){
            var param = paramArr[i].split("=");

            if (param[0] == name){
                return param[1];
            } 
        }
        return "";
    }


	return {
        init: init
    }
});










