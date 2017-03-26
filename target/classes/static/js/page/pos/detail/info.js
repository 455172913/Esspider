define([], function(initEcomm) {

	/*
	 ** 初始化函数
	 */
	function init(){
		bindEvent();
	}

	/*
	 ** 事件绑定函数
	 */
	function bindEvent(){
		var wrap = $('.wrap');

		wrap.on('click', '.pay-type li', tab);
	}

	/*
	 ** tab切换
	 */
	function tab(){
		var _this = $(this);
		var payType = $('.pay-type li');
		var liType = _this.data('type');
		var table = $('.table');

		// 激活当前位置
		payType.removeClass('active');
		_this.addClass('active');

		// 激活对应的table数据
		table.each(function(){
			var _this = $(this);
			var tableType = _this.data('type');

			if(liType == tableType){
				table.addClass("hide");
				table.eq(liType-1).removeClass('hide')
			}
		})
	}

	/*
     ** 获取url中的参数(callback专用)
     */
    function getUrlParam(name){
        //构造一个含有目标参数的正则表达式对象
        var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)"); 

        //匹配目标参数
        var r = window.location.search.substr(1).match(reg); 

        //返回参数值 
        if(r != null){
            return unescape(r[2]);
        }else{
            return null;  
        }   
    }

    /*
     ** 回退到上一页
     */
    function goBack(){
    	window.history.go(-1);
    }
	return {
        init: init
    }
});







