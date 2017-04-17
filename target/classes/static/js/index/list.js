define(["/js/common/ajax.js", '/js/common/autoComplete.js','/js/lib/juicer.js'], function(req, autoCmp, juicer) {

	/*
	 ** 全局变量
	 */
	var $startDate = $('#start-date');
	var $endDate = $('#end-date');

	/*
	 ** 初始化函数
	 */
	function init(){
		datePicker();
		setDefaultShop();
		bindEvent();
		getDevice();
        initAutoCmps();
	}

	/*
	 ** 事件绑定函数
	 */
	function bindEvent(){
		var wrap = $('.wrap');

		wrap.on('click', '.search-btn', search)
            .on('blur', '#sign-shop', getDevice);
	}

   /*
	** 设置表单默认项
	*/
	function setDefaultShop(){
		var shopId = $('.cur-shop').val();
		var billTypeId = $('.cur-bill-type').val();

		$('.choose-shop').attr("value",shopId);
		$('.choose-bill-type').attr("value",billTypeId);
	}

   /*
	** bootstrap日期时间组件
	*/
	function datePicker(){

		// 初始化起始时间插件
		$startDate.datetimepicker({
	        language:  'zh-CN',  
	        format: "yyyy-mm-dd hh:ii:ss",
	        weekStart: 1,  
	        todayBtn:  1,  
	        autoclose: 1,  
	        todayHighlight: 1,  
	        startView: 2,  
	        forceParse: 0 
		}).on('changeDate', function(ev){

			// 重置开始时间
			setTimeStamp($startDate, $('.start-time-stamp'))

			// 限制截止时间
			$endDate.datetimepicker('setStartDate',new Date($('.start-time-stamp').val()));
		});

		// 初始化结束时间插件
		$endDate.datetimepicker({
	        language:  'zh-CN',  
	        format: "yyyy-mm-dd hh:ii:ss",
	        weekStart: 1,  
	        todayBtn:  1,  
	        autoclose: 1,  
	        todayHighlight: 1,  
	        startView: 2,  
	        forceParse: 0 
		}).on('changeDate', function(ev){

			// 重置截止时间
			setTimeStamp($endDate, $('.end-time-stamp'))

			// 限制开始时间
			$startDate.datetimepicker('setEndDate',new Date($('.end-time-stamp').val()));
		});

		// 设置默认开始时间
		var dBeginTime = new Date($('.default-start-date').val())
		$startDate.datetimepicker('setDate',dBeginTime);

		// 设置默认截止时间
		var dEndTime = new Date($('.default-end-date').val())
		$endDate.datetimepicker('setDate',dEndTime);

		// 将开始时间戳设置到页面内
		setTimeStamp($startDate, $('.start-time-stamp'));

		// 将截止时间戳设置到页面内
		setTimeStamp($endDate, $('.end-time-stamp'))

		// 初始化限制开始和结束时间
		$startDate.datetimepicker('setEndDate',new Date($('.end-time-stamp').val()));
		$endDate.datetimepicker('setStartDate',new Date($('.start-time-stamp').val()));
	}

   /*
	** 设置时间戳
	*/
	function setTimeStamp(date, stampDom){
		var dataVal = date.val();

		stampDom.val(dataVal);
	}

   /*
	** 查询
	*/
	function search(){
        var param = {
            "shopId": $('#sign-shop').data('shopId'),
            "shopName": $('#sign-shop').val(),
        	"begin": $('.start-time-stamp').val(),
			"end":$('.end-time-stamp').val(),
			"payChannel": $('.choose-bill-type').val(),
            "tradeno":$('.bill-num').val(),
            "deviceId": $('.choose-device').val()
        };

        var url = "/admin/settle/queryDetail/list";

        if(param.shopName == "" && param.tradeno == ""){
        	alert('请输入交易单号或是门店名称')
        	return;
        }
        searchReq(param, url)
	}

	/*
	 ** 查询接口抽象
	 * param 接口参数
	 * url 接口url
	 * curState 当前审核状态
	 */
    function searchReq(param, url){
        req({
            type: 'post',
            url: url,
            data: param
        }).done(function(res){
                var tpl = $('#template').html();
                var html = juicer(tpl, res);
                $('.table tbody').empty().html(html);


                var sumTpl = $('#summary-tpl').html();
                var sumHtml = juicer(sumTpl, res);
                $('.summary').empty().html(sumHtml);

        }).fail(function(err){
        	console.log("奇怪的错误")
            //alert('服务器故障，请稍候再试');
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
                console.log(obj)
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


    return {
        init: init
    }
});














