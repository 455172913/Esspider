define(['/js/lib/juicer.js', '/js/common/ajax.js', '/js/common/page.js', '/js/common/autoComplete.js', '/js/lib/bootstrap.min.js'], function(juicer, req, pagenation, autoCmp, bootstrap) {

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
        datePicker();
        selectCheckBox();
        initAutoCmps();
        //initPage(params);
		bindEvent();
	}

	/*
	 ** 事件绑定函数
	 */
	function bindEvent(){
		var wrap = $('.wrap');

		wrap.on('click', '.query' , search)
            .on('click','.notice-bd',noticeBD)
            .on('click', '.change-state' , changeStatus)
            .on('click', '.to-detail', showDetail)
            .on('click', '.download' , downLoadExcel);
	}

    /*
    ** 全选
    */
    function selectCheckBox(){
        $(".check-all").click(function() {  
            if (this.checked) {  
                $(".select-flag").each(function() { 
                    $(this).attr("checked", true);  
                })  
            }else{  
                $(".select-flag").each(function() { 
                    $(this).attr("checked", false);  
                })  
            }  
        })  
        $('.wrap').on('click', '.select-flag', function(){
            var _this = $(this),
                checkAttr = $(this).attr("checked");

            if(checkAttr === undefined){
                $(".check-all").attr("checked", false);
            }
        })
    }

    /*
    ** 获取选中的id
    */
    function getCheckIds(){
        var checkBox = $('.select-flag');
        var arr = [];
        
        checkBox.each(function(){
            var _this = $(this);

            checkAttr = $(this).attr("checked")
            if(checkAttr === undefined){
                return;
            }else{
                arr.push(_this.data('id'));
            }
        })
        return arr.join(',');
    }

    /*
    ** 查询
    */
    function search(){
        var branch = $('#shop-id').val();
        var outerMerchantId = $('#out-merchant-id').val();
        var organizationNo = $('.organizationNo').val();
        var treatStatus = $('.treatStatus').val();
        var params = {
            "shopId": branch,
            "outerMerchantId": outerMerchantId,
            "organizationNo": organizationNo
        };

        if(treatStatus != ''){
            params = {
                "shopId": branch,
                "outerMerchantId": outerMerchantId,
                "organizationNo": organizationNo,
                "treatStatus": treatStatus
            };
        }

        req({
            type: 'get',
            url: "/admin/refund/queryRefund",
            data: params
        }).done(function(res){

            // 重新计算日期(无时分秒)
            function setDate(data) {
                var date = new Date(data);

                Y = date.getFullYear() + '-';
                M = (date.getMonth()+1 < 10 ? '0'+(date.getMonth()+1) : date.getMonth()+1) + '-';
                D = date.getDate() + ' ';
                h = date.getHours() + ':';
                m = date.getMinutes() + ':';
                s = date.getSeconds(); 
                date = Y+M+D;

                return date;
            };

            // 重新计算日期(有时分秒)
            function setDateSecond(data) {
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
            juicer.register('setDateSecond', setDateSecond);
            var tpl = $('#template').html();
            var html = juicer(tpl, res);
            var totalPage = res.data.page.totalPage;

            params.totalPage = totalPage;
            $('.table tbody').empty().html(html);

            // 初始化分页
            initPage(params);
        }).fail(function(err){
            alert('服务器故障，请稍候再试');
        });
    }

    /*
    ** 通知bd
    */
    function noticeBD(){
        var idList = getCheckIds();
        var params = {
            "refundIds": idList,
        };

        if(idList == ''){
            alert('请进行选择');
            return;
        }
        req({
            type: 'get',
            url: "/admin/refund/noticeSelectedBD",
            data: params
        }).done(function(res){
            alert('通知已发送');
            window.location.reload();
        }).fail(function(err){
            alert('服务器故障，请稍候再试');
        });
    }

    /*
    ** 状态变更
    */
    function changeStatus(){
        var idList = getCheckIds();

        if(idList == ''){
            alert('请进行选择');
            return;
        }

        // 触发弹层
        $('#change-state-modal').modal();
        $('#change-status').off('click');
        $('#change-status').on('click', function(){
            var changeTreatStatus = $('.changeTreatStatus').val();
            var startDate = $('.start-time-stamp').val();
            var idList = getCheckIds();
            var params = {
                "refundIds": idList,
                "treatStatus": changeTreatStatus,
                "modifyTime": startDate
            };

            req({
                type: 'get',
                url: "/admin/refund/changeTreatStatus",
                data: params
            }).done(function(res){
                alert('状态更改成功')
                window.location.reload();
            }).fail(function(err){
                alert('服务器故障，请稍候再试');
            });
        })
    }

    /*
    ** 查看详情
    */
    function showDetail(){
        var refundId = $(this).data('id');
        var params = {
            "refundId": refundId,
        };

        req({
            type: 'get',
            url: "/admin/refund/queryByRefundId",
            data: params
        }).done(function(res){
            var tpl = $('#refund-detail').html();
            var html = juicer(tpl, res.data);

            $('.refund-modal-body').empty().html(html);
            $('#refund-info-modal').modal();
        }).fail(function(err){
            alert('服务器故障，请稍候再试');
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
        }).on('changeDate', function(ev){

            // 重置开始时间
            setTimeStamp($startDate, $('.start-time-stamp'))
        });

        // 设置默认开始时间
        var dBeginTime = new Date()
        $startDate.datetimepicker('setDate',dBeginTime);

        // 将开始时间戳设置到页面内
        setTimeStamp($startDate, $('.start-time-stamp'));
    }

   /*
    ** 设置时间戳      
    */
    function setTimeStamp(date, stampDom){
        var dataVal = date.val();

        stampDom.val(dataVal);
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
                $('#shop-id').val(obj.shopId)
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
                "status": params.status,
                "outerMerchantId": params.outerMerchantId,
                "organizationNo": params.organizationNo,
                "treatStatus": params.treatStatus
            },
            url: '/admin/refund/queryRefund',
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










