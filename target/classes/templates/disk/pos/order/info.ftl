<#assign pageConfig = {"title": "付款历史"}><#include "/core/frame.ftl"><@html css="/disk/css/pos/orderManger/info-c11c190008.css"><div class="wrap clearfix"><h1>付款历史</h1><div class="content"><div class="search-order"><div class="form-horizontal order-search-box"><span>交易日期</span><input type="text" readonly  id="start-date" class="form_datetime" style="width:82px;height:30px;border-radius: initial;"><input type="hidden" class="start-time-stamp"><span>至</span><input type="text" readonly  id="end-date" class="form_datetime" style="width:82px;height:30px;border-radius: initial;"><input type="hidden" class="end-time-stamp"><span class="alert">一次查询范围最多为三个月</span></div><div class="form-horizontal order-search-box"><span>选择分店</span><select class="choose-shop" style="border-radius: initial;"><option value="0">全部</option><#list shopList as item><option value="${item.shopId?c}">${item.name}</option></#list></select><input type="hidden" class="cur-shop" value="${shopId?c}"></div><a href="javascript:;" class="search-btn">查询</a><a href="javascript:;" class="to-detail download">下载生成excel</a></div><div><table class="table table-bordered"><thead><tr><th>交易日期</th><th>付款编号</th><th>结算渠道</th><th>付款状态</th><th>结算金额</th><th>总交易额</th><th>手续费</th><th>操作</th></tr></thead><tbody><#if paylist?size == 0><tr><td colspan="8">暂无数据</td></tr><#else><#list paylist as item><tr><td>${item.settleDate}</td><td>${item.paymentNo}</td><td>${item.paytypeName}</td><td>${item.statusName}</td><td>${item.realPay}元</td><td>${item.perPay}元</td><td>${item.poundageMoney}元</td><td><a href="/payinfo/detail?paydate=${item.settleDate}&deviceid=${item.deviceId?c}" class="to-detail">查看明细</a></td></tr></#list></#if></tbody></table></div></div></div><input type="hidden" class="merchantId" value="${merchantId?c}"><input type="hidden" class="default-start-date" value="${begin}"><input type="hidden" class="default-end-date" value="${end}"><script type="text/javascript">require(["/disk/js/pos/order/info-fe69e24aa6.js"],function(i){i.init()});</script></@html>