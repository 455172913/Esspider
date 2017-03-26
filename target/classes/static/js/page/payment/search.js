define(['/js/lib/juicer.js', '/js/common/ajax.js', '/js/common/page.js', '/js/common/autoComplete.js'], function(juicer, req, pagenation, autoCmp) {

    /*
     ** 全局变量
     */
    var $startDate = $('#start-date');
    var $endDate = $('#end-date');
    var params = {
        "beginDate": $('.default-start-date').val(),
        "endDate": $('.default-end-date').val(),
        "totalPage": $('.total-page').val()
    };

	/*
	 ** 初始化函数
	 */
	function init(){
        initAutoCmps();
        // initPage(params);
        datePicker();
		bindEvent();
	}

	/*
	 ** 事件绑定函数
	 */
	function bindEvent(){
		var wrap = $('.wrap');

		wrap.on('click', '.search-btn', search)
            .on('click', '.download', downLoadExcel);

	}

   /*
	** 查询
	*/
	function search(){
		var branch = $('#sign-shop').data('shopId');
        var startTimeStamp = $('.start-time-stamp').val();
        var endTimeStamp = $('.end-time-stamp').val();
        var state = $('.choose-state').val();

        var params = {
            "shopId": branch,
            "beginDate": startTimeStamp,
            "endDate": endTimeStamp,
            "status": state
        };

        req({
            type: 'post',
            url: "/admin/settle/payment/listAjax",
            data: params
        }).done(function(res){
            var tpl = $('#template').html();
            var html = juicer(tpl, res);
            var totalPage = res.page.totalPage;

            params.totalPage = totalPage;
            $('.table tbody').empty().html(html);

            // 初始化分页
            initPage(params);
        }).fail(function(err){
            alert('服务器故障，请稍候再试');
        });
	}

   /*
    ** 下载excel
    */
    function downLoadExcel(){
        var branch = $('#sign-shop').data('shopId') || 0;
        var startTimeStamp = $('.start-time-stamp').val();
        var endTimeStamp = $('.end-time-stamp').val();
        var state = $('.choose-state').val();

        window.location.href="/admin/settle/payment/exportList?beginDate=" + startTimeStamp + "&endDate=" + endTimeStamp + "&shopId=" + branch + "&status=" + state ;
    }

   /*
    ** bootstrap日期时间组件
    */
    function datePicker(){

        // 设置起始时间
        $startDate.datetimepicker({
            language:  'zh-CN',  
            format: "yyyy-mm-dd",
            weekStart: 1,  
            todayBtn:  1,  
            autoclose: 1,  
            todayHighlight: 1,  
            startView: 2,  
            minView: 2,  
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
            format: "yyyy-mm-dd",
            weekStart: 1,
            todayBtn:  1,
            autoclose: 1,
            todayHighlight: 1,
            startView: 2,
            minView: 2,
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
                console.log(obj)
                $signShop.data('shopId',obj.shopId);
            }
        });
    }

	/**
     * 初始化列表分页
     * @return {[type]} [description]
     */
    function initPage(params){
        pagenation.init({
            totalPage: params.totalPage,
            currentPage: 1,
            param: {
                "shopId": params.shopId,
                "beginDate": params.beginDate,
                "endDate": params.endDate,
                "status": params.status
            },
            url: '/admin/settle/payment/listAjax',
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










