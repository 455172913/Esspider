define(['/js/lib/juicer.js', '/js/common/ajax.js', '/js/common/page.js', '/js/common/autoComplete.js'], function(juicer, req, pagenation, autoCmp) {

	/*
	 ** 初始化函数
	 */
	function init(){
        // getDevice();
        initAutoCmps();
        // initPage();
		bindEvent();
	}

	/*
	 ** 事件绑定函数
	 */
	function bindEvent(){
		var wrap = $('.wrap');

		wrap.on('click', '.search-btn', search)
            .on('blur', '#sign-shop', getDevice)
			.on('click', '.download', downLoadExcel);
	}

   /*
	** 查询
	*/
	function search(){
		var branch = $('#sign-shop').data('shopId');
        var deviceId = $('.choose-device').val();

        var param = {
            "deviceId": deviceId,
            "shopId": branch
        };

        req({
            type: 'post',
            url: "/admin/device/depositAjax",
            data: param
        }).done(function(res){
            var tpl = $('#template').html();
            var html = juicer(tpl, res);
            var totalPage = res.page.totalPage;

            $('.table tbody').empty().html(html);

            // 初始化分页
            initPage(totalPage);
        }).fail(function(err){
            alert('服务器故障，请稍候再试');
        });
	}

   /*
	** 下载excel
	*/
	function downLoadExcel(){
        var branch = $('#sign-shop').data('shopId');
        var deviceId = $('.choose-device').val();

		window.location.href="/payinfo/exportBillList?shopId=" + branch + "&deviceId=" + deviceId;
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

	/**
     * 初始化列表分页
     * @return {[type]} [description]
     */
    function initPage(totalPage){
        pagenation.init({
            totalPage: totalPage,
            currentPage: 1,
            param: {
                "deviceId": $('.choose-device').val(),
                "shopId": $('#sign-shop').data('shopId')
            },
            url: '/admin/device/depositAjax',
            cb:function(result){
               	var tpl = $('#template').html();
				var html = juicer(tpl, result);

				$('.table tbody').empty().html(html);
            },
            error:function(err){
                console.log(err);
            }
        });
    }

	return {
        init: init
    }
});










