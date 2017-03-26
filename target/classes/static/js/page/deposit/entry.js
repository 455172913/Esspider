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

		wrap.on('click', '.search-btn', search)
            .on('blur', '#sign-shop', getDevice)
			.on('blur', '.entry-time', RegTime)
            .on('click', '.submit-btn', depositEntry);
	}

    /*
     ** 校验日期格式
     * yyyy-mm-dd
     */
    function RegTime(){
        var _this = $(this);
        var reg = /^(\d{4})-(0\d{1}|1[0-2])-(0\d{1}|[12]\d{1}|3[01])$/;
        var dateVal = _this.val();

        if(reg.test(dateVal)){
            _this.parent().parent().addClass('allow')
        }else{
            alert('日期格式应为yyyy-mm-dd');
            _this.val('');
            _this.parent().parent().removeClass('allow')
        }
    }

   /*
	** 查询
	*/
	function search(){
		var branch = $('#sign-shop').data('shopId');
        var deviceId = $('.choose-device').val();
        var contractId = $('.contract-num').val();

        var param = {
            "deviceId": deviceId,
            "shopId": branch,
            "coopId": contractId,
            "applyId": 0
        };

        req({
            type: 'get',
            url: "/admin/settle/deposit/query",
            data: param
        }).done(function(res){
            var tpl = $('#template').html();
            var html = juicer(tpl, res);

            $('.table tbody').empty().html(html);
        }).fail(function(err){
            alert('服务器故障，请稍候再试');
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

    /**
     * 初始化自动补全
     * @return {[type]} [description]
     */
    function initAutoCmps(jqObj) {
        var $signShop = jqObj;

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
                console.log(obj)
                $signShop.data('shopId',obj.shopId);
            }
        });
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
            chooseDevice.append("<option value='0'>全部</option>")
            for(var i = 0; i<data.length; i++){
                chooseDevice.append("<option value=" + data[i].deviceId + ">" + data[i].deviceSn + "</option>")
            }

            // 设置选择后的默认值
            chooseDevice.attr("value",deviceId);
        }).fail(function(err){
            alert('服务器故障，请稍候再试');
        });
    }

   /*
    ** 提交表单信息
    */
    function depositEntry(){
        var entryMap = [];
        var imgUrlArr = [];
        var allowTr = $(".allow");
        var imgList = $('#payment-prove').find('.img')
        var remark = $('.remark').val();
        var branch = $('#sign-shop').data('shopId');
        var contractId = $('.contract-num').val();

        // 收集表格内的数据
        allowTr.each(function(){
            var _this = $(this);
            var type = _this.find('.entry-type').val();
            var time = _this.find('.entry-time').val();
            var shopId = _this.data('shopid');
            var ruleId = _this.data('ruleid');
            var money = _this.find('.entry-money').data('money');
            var deviceId = _this.find('.entry-deviceid').text();

            var buildDate = {
                "ruleId": ruleId,
                "shopId": shopId,
                "deviceId": deviceId,
                "money": money,
                "type": type,
                "depositDate": time
            }
            entryMap.push(buildDate);
        })

        // 收集图片数据
        imgList.each(function(){
            var _this = $(this);
            var url = _this.data('src');

            if(_this.find('img').length) {
                imgUrlArr.push(url);
            }
        })

        // 收集到的参数
        var params = {
            "applyId": 0,            
            "coopId": contractId,
            "shopId": branch,
            "modelList": JSON.stringify(entryMap),
            "imgs": imgUrlArr.join(','),
            "remark": remark
        }

        // 提交信息
        req({
            type: 'post',
            url: "/admin/settle/deposit/save",
            data: params
        }).done(function(res){

            // 成功跳转到待审核页面
            window.location.href="/admin/settle/deposit/check";
        }).fail(function(err){
            alert('服务器故障，请稍候再试');
        });
    }

	return {
        init: init
    }
});











