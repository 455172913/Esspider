define(['/js/lib/juicer.js', '/js/common/ajax.js', '/js/common/autoComplete.js', '/js/common/upload.js'], function(juicer, req, autoCmp, upload) {

	/*
	 ** 初始化函数
	 */
	function init(){
        initAutoCmps();
		bindEvent();
		upload.init();
	}

	/*
	 ** 事件绑定函数
	 */
	function bindEvent(){
		var wrap = $('.wrap');

		wrap.on('change', '.payout-type', choosePayoutType)
            .on('click', '.check-radio', chooseReason)
            .on('click', '.search-btn', search)
            .on('blur', '#sign-shop', getDevice)
            .on('blur', '.payout-money', validateMoney)
            .on('click', '.true-submit', paymentEntry);
	}

    /*
     ** 选择申请类型
     */
    function choosePayoutType(){
        var _this = $(this);
        var typeValue = _this.val();
        var reasonOrder = $('.reason-order');
        var payoutMoney =  $('.payout-money');

        $('.check-radio').attr('checked', false);
        if(typeValue == "3"){
            $('.payout').show();
            $('.subsidy').hide();
            $('.reversal').attr('checked', true);
            reasonOrder.show();
            payoutMoney.attr('readonly', true);
            resetForm();
        }else if(typeValue == "2"){
            $('.payout').hide();
            $('.subsidy').show();
            $('.fee').attr('checked', true);
            reasonOrder.hide();
            payoutMoney.attr('readonly', false);
            resetForm();
        }else{
            return
        }
    }

    /*
     ** 选择赔付
     */
    function chooseReason(){
        var _this = $(this);
        var radioVal = _this.val();
        var reasonOrder = $('.reason-order');
        var payoutMoney =  $('.payout-money');

        if(radioVal == 200){
            reasonOrder.show();
            payoutMoney.attr('readonly', true);
            resetForm();
        }else if(radioVal == 101){
            reasonOrder.hide();
            payoutMoney.attr('readonly', false);
            resetForm();
        }else if(radioVal == 102){
            reasonOrder.hide();
            payoutMoney.attr('readonly', false);
            resetForm();
        }else if(radioVal == 3){
            reasonOrder.hide();
            payoutMoney.attr('readonly', false);
            resetForm();
        }else{
            return;
        }

        // 标志radio
        $('.check-radio').attr('checked', false);
        _this.attr('checked', true);
    }

   /*
    ** 重置交易单号和金额模板
    */
    function resetForm(){
        var tpl = $('#template').html();
        var res = {
            "result": {
                "code": 500000
            }
        }
        var html = juicer(tpl, res);

        $('.table tbody').empty().html(html);
        $('.payout-money').attr('value', '');
        $('.tran-num').attr('value', '');
        $('.order-num').attr('value', '');
    }

   /*
    ** 验证赔付金额
    */
    function validateMoney(){
        var _this = $(this);
        var inputVal = _this.val();
        var reg = /^-?\d+(\.\d{1,2})?$/;
        var errorMsg = _this.parent().find('.error');

        if(inputVal == ""){
            return
        }else{
            if(reg.test(inputVal)){
                errorMsg.addClass('hide');
                $('.false-submit').css('display', 'none');
                $('.true-submit').css('display', 'block');
            }else{
                errorMsg.removeClass('hide');
                $('.false-submit').css('display', 'block');
                $('.true-submit').css('display', 'none');
            }
        }
    }

   /*
	** 查询
	*/
	function search(){
        var orderNum = $('.order-num').val();
        var payoutMoney =  $('.payout-money');
        var deviceId = $('.choose-device').val();            
        var reg = /^[0-9]*$/;

        var param = {
            "orderId": orderNum,
            "deviceId": deviceId
        };
        
        if(reg.test(param.orderId)){

            // 获取列表数据
            req({
                type: 'get',
                url: "/admin/allowance/compensate/query/order",
                data: param
            }).done(function(res){
                if(res.result.code == "500000"){
                    var tpl = $('#template').html();
                    var html = juicer(tpl, res);

                    $('.table tbody').empty().html(html);
                    payoutMoney.attr("value", "");
                }else{

                    // 判断可用的赔付状态
                    if(res.data.orderSubmit == "1" || res.data.orderSubmit == "2"){
                        var tpl = $('#template').html();
                        var res = {
                            "result": {
                                "code": 500000
                            }
                        }
                        var html = juicer(tpl, res);

                        $('.table tbody').empty().html(html);
                        payoutMoney.attr("value", "");
                        alert("已提交过赔付申请，无法再次提交")
                    }else if(res.data.orderSubmit == "0"){

                        // 重新计算日期
                        function setDate(data) {
                            var date = new Date(data);

                            Y = date.getFullYear() + '-';
                            M = (date.getMonth()+1 < 10 ? '0'+(date.getMonth()+1) : date.getMonth()+1) + '-';
                            D = date.getDate() + ' ';
                            h = date.getHours() + ':';
                            m = date.getMinutes() + ':';
                            s = date.getSeconds(); 
                            date = Y+M+D+h+m+s;

                            return date;
                        };
                        juicer.register('setDate', setDate);

                        var tpl = $('#template').html();
                        var html = juicer(tpl, res);

                        $('.table tbody').empty().html(html);

                        // 将数据中的金额写入input
                        payoutMoney.val($('.money').text());

                    }
                }


            }).fail(function(err){
                alert('服务器故障，请稍候再试');
            });
        }else{
            alert('请输入正确格式');
        }

	}

   /*
    ** 提交表单信息
    */
    function paymentEntry(){
        var sysImgUrlArr = [];
        var costImgUrlArr = [];
        var sysImgList = $('#sys-img').find('.img');
        var costImgList = $('#cost-img').find('.img');
        var payoutReason = $("input[name='optionsRadios'][checked=checked]").val();
        var payoutMoney =  $('.payout-money').val();
        var tranNum = $('.tran-num').val();
        var orderNum = $('.order-id').data('id');
        var shopId = $('#sign-shop').data('shopId');
        var deviceId = $('.choose-device').val();            
        var detail = $('.detail').val();                                                            
        var userName = $('.user-name').val();                                               
        var userPhone = $('.user-phone').val();

        // 系统截图
        sysImgList.each(function(){
            var _this = $(this);
            var url = _this.data('src');

            if(_this.find('img').length) {
                sysImgUrlArr.push(url);
            }
        })

        // 持卡人消费证明
        costImgList.each(function(){
            var _this = $(this);
            var url = _this.data('src');

            if(_this.find('img').length) {
                costImgUrlArr.push(url);
            }
        })

        // 收集到的参数
        var params = {
            "shopId": shopId,
            "allowanceSubType": payoutReason,
            "deviceId": deviceId,
            "allowanceMoney": payoutMoney,
            "remark": $.trim(detail),
            "systemImg": sysImgUrlArr.join(','),
            "consumptionProof": costImgUrlArr.join(','),
            "cardName": $.trim(userName),
            "cardPhone": $.trim(userPhone),
            "taskNo": $.trim(tranNum),
            "orderNo": $.trim(orderNum)
        };
        console.log(params)
        if(params.taskNo == "" || params.shopId === undefined || params.deviceId == null || params.allowanceMoney == ""  || params.remark == "" || params.systemImg == "" || params.consumptionProof == "" || params.cardName == "" || params.cardPhone == ""){
            alert("请将信息填写完整");
            return;
        }

        // 解除事件防止多次提交
        $('.wrap').off("click", ".true-submit", paymentEntry); 

        // 提交信息
        req({
            type: 'post',
            url: "/admin/allowance/compensate/submit",
            data: params
        }).done(function(res){
            
            // 成功跳转到待审核页面
            window.location.href="/admin/allowance/compensate/checkIndex";
        }).fail(function(err){
            alert('服务器故障，请稍候再试');

            // 重新绑定事件
            $('.wrap').on("click", ".true-submit", paymentEntry); 
        });
    }


	/**
     * 初始化自动补全
     * @return {[type]} [description]
     */
    function initAutoCmps() {
    	var $signShop = $('#sign-shop');

        //分店自动完成
        var shopCmp = new autoCmp({
            dom: $signShop,
            url: '/admin/shop/query',
            key:'shopName',
            dataIdKey:'shopId',
            buildList: function(res) {
                var htmlstr = '';
                for (var i = 0; i < res.data.length; i++) {
                    htmlstr = htmlstr + '<li obj=' + trim(JSON.stringify(res.data[i])) + '>' + res.data[i].name + '</li>';                    
                }
                var $parent = $signShop.parent();
                $parent.find('.ac-ul').html(htmlstr)
                $parent.find('.ac-outer').removeClass('hide');
                $signShop.next('.form-error').addClass('hide');
            },
            selectCb:function(obj){
                $signShop.data('shopId',obj.shopId);
            }
        });
    }

    /**
     * 去空格
     * @return {[type]} [description]
     */
    function trim(str){
        var arr = str.split(""),
            result = "";

        for (var i=0; i < arr.length; i++) {
            var test = arr[i];

            if(" "!=test && null != test && " " != test){
                result+=test;
            }
        };
        return result;
    }


   /*
    ** 获取门店对应的设备
    */
    function getDevice(){   
        var chooseDevice = $('.choose-device');
        var poiId = $('#sign-shop').data('shopId');
        var deviceId = $('.cur-deviceId').val();

        var param = {
            "poiId": poiId
        };

        req({
            type: 'post',
            url: "/admin/device/getDeviceListByPoiId",
            data: param
        }).done(function(res){
            var data = res;

            chooseDevice.find('option').remove();
            for(var i = 0; i<data.length; i++){
                chooseDevice.append("<option value=" + data[i].deviceId + ">" + data[i].deviceSn + "</option>")
            }

            // 设置选择后的默认值
            chooseDevice.attr("value",data[0].deviceId);
        }).fail(function(err){
            alert('服务器故障，请稍候再试');
        });
    }

	return {
        init: init
    }
});










