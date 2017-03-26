<#--分页组件arguments:url: 分页button上的url,只包含协议、host和path三部分params: Get请求的请求参数，为JSON格式，如{"currentPage" : 3, "data": "hello world"}curPage: 当前的页码数totalCount: 总共的页码数showPageCount: 当前显示多少个页码button--><#import "../lib/util.ftl" as utils><#macro pagination url params curPage totalCount showPageCount><#localpageCount = []count = (showPageCount / 2)?int/><#if (totalCount <= showPageCount)><#local pageCount = 1..totalCount /><#elseif (curPage > count && curPage <= totalCount - count)><#localnumBefore = ( curPage - count)..( curPage - 1)numAfter = ( curPage + 1)..( curPage + count)pageCount = numBefore + [curPage] + numAfter/><#elseif (curPage == 1)><#localpageCount = 1..showPageCount/><#elseif (curPage == totalCount )><#localpageCount = totalCount-showPageCount + 1..totalCount/><#elseif (curPage <= count)><#localnumBefore = 1..( curPage - 1)sizeOfNumBefore = numBefore?sizenumAfter = (curPage + 1)..(showPageCount - sizeOfNumBefore -1)pageCount = numBefore + [curPage] + numAfter/><#elseif (curPage > totalCount - count)><#localnumAfter = (curPage +1 )..totalCountsizeOfNumAfter = numAfter?sizenumBefore = (curPage - (showPageCount - sizeOfNumAfter -1))..( curPage - 1)pageCount = numBefore + [curPage] + numAfter/></#if><#-- pageCount: ${utils.echoArray(pageCount)}test:${utils.echoArray(11..9)}--><div class="pagination"><#local firstPage = params + {"currentPage" : 1} /><ul><li><a href="${utils.makeUrl(url, firstPage)}">首页</a></li><#local params = params + {"currentPage" : "${curPage - 1}"} /><#if 1 != curPage><li><a href="${utils.makeUrl(url, params)}">上一页</a></li></#if><#list 1..totalCount as item><#localparams = params + {"currentPage" : "${item}"}className = ""/><#if curPage == item > <#local className = className + " active" /></#if><#if -1 == pageCount?seq_index_of(item)> <#local className = className + " hide" /> </#if><li class="${className}"><a href="${utils.makeUrl(url, params)}">${params.currentPage}</a></li></#list><#local params = params + {"currentPage" : "${curPage + 1}"} /><#if totalCount != curPage><li><a href="${utils.makeUrl(url, params)}">下一页</a></li></#if></ul></div></#macro>${utils.makeUrl("/test", {"data": "good", "second": "well"})}