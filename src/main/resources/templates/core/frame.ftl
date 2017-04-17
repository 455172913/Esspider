<#--
    页面主题框架
    params:
        script[ftl]: 页面内嵌的script地址
        style[ftl]: 页面内嵌样式表的地址
        css[css]: 页面外联的css地址，注意此地址不能以斜杠开头
-->
<#macro html script="" style="" css="">
    <#include "/core/head.ftl">
    <#if css != "">
        <#local cssPath= css />
        <link rel="stylesheet" href="${cssPath}"/>
    </#if>
    <#if style != "">
        <#include style >
    </#if>
    <#compress>
    <#nested>
    </#compress>
<#--     <#if script != "">
        <#include script >
    </#if>
 -->    
    <#include "/core/foot.ftl">
</#macro>
