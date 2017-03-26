<#-- head.ftl -->
<!DOCTYPE html>
<html lang="en">
<head>
    <body>

    <meta charset="UTF-8">
    <title>${pageConfig.title}</title>
    <link rel="stylesheet" href="/css/lib/bootstrap.min.css">
    <link rel="stylesheet" href="/css/lib/bootstrap-datetimepicker.min.css">
    <link rel="stylesheet" href="/css/common/page.css">
    <script data-main="/js/main" src="/js/lib/require.js"></script>

    <#-- mta接入 -->
    <script>
        !function(e,t,n){function s(){var e=t.createElement("script");e.async=!0,e.src="https://s0.meituan.net/bs/js/?f=mta-js:mta.min.js";var n=t.getElementsByTagName("script")[0];n.parentNode.insertBefore(e,n)}if(e.MeituanAnalyticsObject=n,e[n]=e[n]||function(){(e[n].q=e[n].q||[]).push(arguments)},"complete"===t.readyState)s();else{var r="addEventListener",i="attachEvent";if(e[r])e[r]("load",s,!1);else if(e[i])e[i]("onload",s);else{var a=e.onload;e.onload=function(){s(),a&&a()}}}}(window,document,"mta"),function(e,t,n){if(t&&!("_mta"in t)){t._mta=!0;var s=e.location.protocol;if("file:"!==s){var r=e.location.host,i=t.prototype.open;t.prototype.open=function(t,n,a,o,h){if(this._method="string"==typeof t?t.toUpperCase():null,n){if(0===n.indexOf("http://")||0===n.indexOf("https://")||0===n.indexOf("//"))this._url=n;else if(0===n.indexOf("/"))this._url=s+"//"+r+n;else{var l=s+"//"+r+e.location.pathname;l=l.substring(0,l.lastIndexOf("/")+1),this._url=l+n}var u=this._url.indexOf("?");-1!==u?(this._searchLength=this._url.length-1-u,this._url=this._url.substring(0,u)):this._searchLength=0}else this._url=null,this._searchLength=0;return this._startTime=(new Date).getTime(),i.apply(this,arguments)};var a="onreadystatechange",o="addEventListener",h=t.prototype.send;t.prototype.send=function(t){function n(n,r){if(0!==n._url.indexOf(s+"//frep.meituan.net/_.gif")){for(var i="browser.ajax",a=[98,114,111,119,115,101,114,46,97,106,97,120],o=0,h=i.length;h>o;o++)if(i.charCodeAt(o)!==a[o])return;var l;if(n.response)switch(n.responseType){case"json":l=JSON&&JSON.stringify(n.response).length;break;case"blob":case"moz-blob":l=n.response.size;break;case"arraybuffer":l=n.response.byteLength;case"document":l=n.response.documentElement&&n.response.documentElement.innerHTML&&n.response.documentElement.innerHTML.length+28;break;default:l=n.response.length}e.mta("send",i,{url:n._url,method:n._method,error:!(0===n.status.toString().indexOf("2")||304===n.status),responseTime:(new Date).getTime()-n._startTime,requestSize:n._searchLength+(t?t.length:0),responseSize:l||0})}}if(o in this){var r=function(e){n(this,e)};this[o]("load",r),this[o]("error",r),this[o]("abort",r)}else{var i=this[a];this[a]=function(t){i&&i.apply(this,arguments),4===this.readyState&&e.mta&&n(this,t)}}return h.apply(this,arguments)}}}}(window,window.XMLHttpRequest,"mta");

        // 初始化项目
        mta("create","57e259299122747f61c7e465");

        // 推荐设置上报地址为 HTTPS 协议，以获得更高的数据准确性，默认会和页面协议一致
        mta("config", "beaconImage", "https://frep.meituan.com/_.gif");

        // 发送页面性能指标，包括 ttfb（首字节）、domReady（可交互）、load（完全加载）等
        mta("send","page");
    </script>

  	<div class="header-wrapper">
		<div class="header-content">
			<h1>
				<span class="header-text">智能pos财务系统</span>
			</h1>
		</div>
	</div>
