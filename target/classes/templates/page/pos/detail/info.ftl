<#assign pageConfig = {
    "title": "查看明细"
}>
<#include "/core/frame.ftl">

<@html css="/zcm/css/pos/detail/info.css">
	<#if isDianping == "true">
		<#include "/common/sidebar.ftl">
	</#if>
	<div class="wrap clearfix">
		<h1>${PayDate}结算明细</h1>
		<div class="content">
			<ul class="pay-type">
				<li class="active" data-type="1">结算明细</li>
				<li data-type="2">结算汇总</li>
			</ul>

			<!-- 结算明细 -->
			<div>
				<table class="table table-bordered" data-type="1">
					<thead>
						<tr>
                            <th>设备编号</th>
							<th>交易时间</th>
                            <th>应付款时间</th>
							<th>交易单号</th>
							<th>收银渠道</th>
                            <th>交易卡种</th>
							<th>交易金额</th>
                            <th>手续费</th>
                            <th>结算金额</th>
							<th>结算状态</th>
						</tr>
					</thead>
					<tbody>
						<#if FlowList?size == 0>
							<tr><td colspan="10">暂无数据</td></tr>
						<#else>
							<#list FlowList as item>
								<tr>
                                    <td>${item.deviceSn}</td>
									<td>${item.payTime}</td>
                                    <td>${item.paymentDay}</td>
									<td>${item.tradeno}</td>
									<td>${item.payTypeName}</td>
                                    <td>${item.cardTypeName}</td>
									<td>${item.fee}元</td>
                                    <td>${item.poundageMoney}元</td>
                                    <td>${item.settleMoney}元</td>
									<td>已结算</td>
								</tr>
							</#list>
						</#if>
					</tbody>
				</table>
			</div>

			<#-- 结算汇总 -->
			<div>
				<table class="table table-bordered hide" data-type="2">
					<thead>
						<tr>
							<th>门店名称</th>
							<th>结算渠道</th>
							<th>结算类型</th>
							<th>设备编号</th>
							<th>结算时间</th>
							<th>交易金额</th>
							<th>手续费/抵扣</th>
                            <th>借记卡手续费</th>
                            <th>贷记卡手续费</th>
                            <th>境外卡手续费</th>
							<th>结算金额</th>
						</tr>
					</thead>
					<tbody>
						<#if settleInfoVoList?size == 0>
							<tr><td colspan="11">暂无数据</td></tr>
						<#else>
							<#list settleInfoVoList as item>
								<tr>
									<td>${item.shopName}</td>
									<td>${item.paytypeName}</td>
									<td>${item.settleTypeName}</td>
									<td>${item.deviceSn}</td>
									<td>${item.settleDate}</td>
									<td>${item.perPay}元</td>
									<td>${item.poundageMoney}元</td>
                                    <td><#if item.debitPoundageMoney == null>---<#else>${item.debitPoundageMoney}元</#if></td>
                                    <td><#if item.creditPoundageMoney == null>---<#else>${item.creditPoundageMoney}元</#if></td>
                                    <td><#if item.foreignPoundageMoney == null>---<#else>${item.foreignPoundageMoney}元</#if></td>
									<td>${item.realPay}元</td>
								</tr>
							</#list>
						</#if>
					</tbody>
					<tfoot>
				        <tr>
				            <td colspan="11">合计付款金额(元)：${settleSum}</td>
				        </tr>
				    </tfoot>
				</table>
			</div>
		</div>
	</div>
	<input type="hidden" class="is-dianping" value="${isDianping}">

<script type="text/javascript">
    require(['/zcm/js/pos/detail/info.js'], function(page){
        page.init();
    });
</script>
</@html>











