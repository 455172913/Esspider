define(['/js/lib/juicer.js', '/js/common/ajax.js', '/js/common/page.js', '/js/common/autoComplete.js'], function(juicer, req, pagenation, autoCmp) {

	/*
	 ** 初始化函数
	 */
	function init(){
        initSearch();
        initAutoCmps($('#sign-shop'));
		bindEvent();
	}

	/*
	 ** 事件绑定函数
	 */
	function bindEvent(){
		var wrap = $('.wrap');

        wrap.on('click', '.search-btn', search);
	}

    /*
     ** 页面载入查询一次
     */
    function initSearch(){
        var param = {
            "shopId": "",
            "coopId": ""
        };
        var url = "/admin/settle/deposit/rejectList";

        searchReq(param, url);
    }
    
   /*
	** 查询
	*/
	function search(){
        var param = {
            "shopId": $('#sign-shop').data('shopId'),
            "coopId": $('.contract-num').val()
        };
        var url = "/admin/settle/deposit/rejectList";

        searchReq(param, url);
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

            param.totalPage = res.page.totalPage;
            $('.table tbody').empty().html(html);

            // 初始化分页
            initPage(param, url);
        }).fail(function(err){
            alert('服务器故障，请稍候再试');
        });
    }

    /**
     * 初始化列表分页
     * @return {[type]} [description]
     */
    function initPage(param, url){
        pagenation.init({
            totalPage: param.totalPage,
            currentPage: 1,
            param: {
                "shopId": param.shopId,
                "coopId": param.contractId
            },
            url: url,
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

	return {
        init: init
    }
});










