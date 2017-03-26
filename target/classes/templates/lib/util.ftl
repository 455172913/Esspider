<#--
    组建方法库
    调用规则：${Util.fnName(arguments)}
    命名规则：正常是驼峰状格式，有return时加一个get
    注明：
        1. 在定义内部变量时，请使用<#local var1=value1 var2=value2 >替代<#assign ...>
        2. 每次在lib下新建一个xxx.ftl，需要在../common/head.ftl最上方加上<#import './lib/xxx.ftl' as XxxHelper>
-->

<#--
/**
 * 获取加星的手机号码
 * @namespace Util
 * @method getMaskMobile
 * @param {String} mobile 带入的手机号码
 * @returns {String} 返回加星号的手机号码
 */
-->
<#function getMaskMobile mobile=''>
    <#if (mobile?length > 7)>
        <#return mobile?substring(0, 4) + '****' + mobile?substring(7)>
    <#else>
        <#return mobile>
    </#if>
</#function>

<#--
/**
 * 获取加星的美团券
 * @namespace Util
 * @method getMaskCode
 * @param {String} code 带入的美团券号码
 * @returns {String} 返回加星号的美团券号码
 */
-->
<#function getMaskCode code=''>
    <#return code?substring(0, 4) + "****" + code?substring(code?length - 4) >
</#function>

<#--
/**
 * 格式化输出美团券
 * @namespace Util
 * @method formatCoupon
 * @param {String} code 带入的美团券号码
 * @returns {String} 返回加空格分段后的美团券号码
 */
-->
<#function formatCoupon code=''>
    <#if code?length == 12 >
        <#return code?substring(0, 4) + " " + code?substring(4, 8) + " " + code?substring(code?length - 4)>
    <#else>
        <#return code>
    </#if>
</#function>

<#function formatMM date>
    <#return date?string("yyyy-MM-dd HH:mm") />
</#function>

<#function formatDate originDate pattern="yyyy-MM-dd HH:mm:ss">
    <#-- 2011-05-16T21:32:13Z -->
    <#-- 01234567890123456789 -->
    <#local
        year = originDate?iso("UTC")?substring(0, 3)
        month = originDate?iso("UTC")?substring(5, 6)
        date = originDate?iso("UTC")?substring(8, 9)
        hour = originDate?iso("UTC")?substring(11, 12)
        minute = originDate?iso("UTC")?substring(14,15)
        second = originDate?iso("UTC")?substring(17, 18)
    >

    <#local ret = pattern?replace('yyyy', year)?replace('MM', month)?replace('dd', date)?replace('HH', hour)?replace('mm', minute)?replace('ss', second) >

    <#return ret>
</#function>

<#function formatDateString originDate pattern="yyyy-MM-dd HH:mm:ss">
<#-- 2015-05-29 23:59:59 -->
<#-- 0123456789012345678 -->
    <#local
    year = originDate?number_to_datetime?substring(0, 4)
    month = originDate?number_to_datetime?substring(5, 7)
    date = originDate?number_to_datetime?substring(8, 10)
    hour = originDate?number_to_datetime?substring(11, 13)
    minute = originDate?number_to_datetime?substring(14, 16)
    second = originDate?number_to_datetime?substring(17, 19)
    >

    <#local ret = pattern?replace('yyyy', year)?replace('MM', month)?replace('dd', date)?replace('HH', hour)?replace('mm', minute)?replace('ss', second) >

    <#return ret>
</#function>

<#--构造拼接了QueryString的URL-->
<#function makeUrl url params >
    <#local paramsArr=[]
            keys = params?keys
            ret="">

    <#list keys as key>
        <#--<#local ret=key + "=" + params[key]>-->
        <#local paramsArr = paramsArr + [key + "=" + params[key]]>
    </#list>

    <#list paramsArr as param>
        <#if !param_has_next>
            <#local ret=ret + param />
        <#else>
            <#local ret=ret + param + "&"/>
        </#if>
    </#list>

    <#return url + '?' + ret>
</#function>

<#--打印数组的内容，数组的元素必须为String类型或数值类型-->
<#function echoArray arr separator=", ">
    <#local
        arrSize = arr?size
        ret = ""
    >
    <#if (arrSize < 1)>
        <#return false>
    </#if>

    <#list arr as item>
        <#if item_has_next>
            <#local ret = ret + item + separator>
        <#else>
            <#local ret = ret + item>
        </#if>
    </#list>

    <#return ret>
</#function>

<#function min first second>
    <#if (first > second)>
        <#return second>
    <#else>
        <#return first>
    </#if>
</#function>

<#function convertToWebviewUrl uri GLOBAL>
    <#if GLOBAL.isWebview>
        <#local encodedUri = uri?url>
        <#if !uri?starts_with("http://")>
            <#local encodedUri = "http://" + GLOBAL.host + uri?url>
        </#if>
        <#return "imeituan://www.meituan.com/web?url=" + encodedUri>
    <#else>
        <#return uri>
    </#if>
</#function>

<#function convertToWebviewUrlWithDP uri GLOBAL>
   <#if GLOBAL.isWebview>
       <#local encodedUri = uri?url>
       <#if !uri?starts_with("http://")>
           <#local encodedUri = "http://" + GLOBAL.host + uri?url>
       </#if>
       <#if GLOBAL.thirdPartService.value == "dianpingapp">
         <#return "dianping://web?url=" + encodedUri>
       <#else>
         <#return "imeituan://www.meituan.com/web?url=" + encodedUri>
       </#if>

   <#else>
       <#return uri>
   </#if>
</#function>

<#--
/**
 * 格式化创建时间
 * @namespace Util
 * @method formateCreateTime
 * @author tianyang02
 * @param {int} timstamp 时间戳
 * @returns {String} '刚刚', '*分钟前', '*小时前', '*天前', or yyyy-mm-dd
 */
-->
<#function formateCreateTime timestamp >
   <#local pastTime = .now?long - timestamp?long >

   <#if (pastTime < 1000*60)>
       <#return '刚刚'>
   <#elseif (pastTime > 1000*60 && pastTime < 1000*60*60)>
       <#return (pastTime/(1000*60))?floor + '分钟前'>
   <#elseif (pastTime > 1000*60*60 && pastTime < 1000*60*60*24)>
       <#return (pastTime/(1000*60*60))?floor + '小时前'>
   <#elseif (pastTime > 1000*60*60*24 && pastTime < 1000*60*60*24*6)>
       <#return (pastTime/(1000*60*60*24))?floor + '天前'>
   <#elseif (pastTime > 1000*60*60*24*6)>
       <#return timestamp?number_to_date?string("yyyy-MM-dd")>
   </#if>
</#function>

<#--
/**
 * 校验url中是否有问号
 * @url url链接
 * @returns true or false
 */
-->
<#function checkQuestionMark url >
    <#if url?? && url?index_of("?") != -1>
        <#return true>
    <#else>
        <#return false>
    </#if>
</#function>