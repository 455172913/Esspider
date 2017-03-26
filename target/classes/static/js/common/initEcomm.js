define(function() {

	/**
	* ECOMM初始化
	* @param  {[type]} menuName [description]
	* @return {[type]}          [description]
	*/
	function initEcomm(menuName){
	   if(window != window.top){
	       // 设置与父页面同域（meituan.com/sankuai.com）
	       // if(__DEV__){  //开发环境
	       //     document.domain = 'sankuai.com';
	       // }else if(__PDT__){  //生产环境
	       document.domain = 'meituan.com';
	       // }
	       window.top.location.hash = location.href;
	       var innerHeight=$('iframe',window.parent.document).attr('height');
	       var clientHeight=document.body.clientHeight;
	       window.top.resizeIframeHeight(Math.max(innerHeight,clientHeight));
	       window.top.document.body.scrollTop = 0;

	       if(menuName){ //调用ECOM高亮菜单接口
	           window.top.updateSidebar(menuName);
	       }
	   }
	}
    return initEcomm;
});