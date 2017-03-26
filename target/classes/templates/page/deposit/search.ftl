<#assign pageConfig = {
    "title": "押金查询"
}>
<#include "/core/frame.ftl">

<@html css="/css/page/deposit/search.css">
	<div class="wrap clearfix">
		<#include "/common/sidebar.ftl">
		<div class="content">
			<h1>押金查询</h1>
			<div class="search-order">
				<div class="form-horizontal order-search-box clearfix">
					<span class="choose-shop">选择分店</span>
					<div class="ac-wrapper">
			            	<input type="text" placeholder="" id="sign-shop">
			            	<div class="form-error hide"></div>
						<div class="ac-outer hide">
						    <ul class="ac-ul">
						    </ul>
						</div>
			        </div>
				</div>

				<!-- 设备编号 -->
				<div class="form-horizontal order-search-box">
					<span>设备编号</span>
					<select class="bill-select choose-device" style="border-radius: initial;"></select>
				    <input type="hidden" class="cur-deviceId" value="0">
				</div>
				<a href="javascript:;" class="search-btn">查询</a>
			</div>
			<div>
				<table class="table table-bordered">
					<thead>
						<tr>
							<th>门店名称</th>
							<th>设备编号</th>
							<th>应收押金</th>
							<th>已收押金</th>
							<th>设备使用时间</th>
							<th>设备总流水</th>
							<th>押金状态</th>
							<th>押金收取方式</th>
							<th>押金收取日期</th>
						</tr>
					</thead>
					<tbody>
						<#if deviceDepositVOList?size == 0>
							<tr><td colspan="9">暂无数据</td></tr>
						<#else>
							<#list deviceDepositVOList as item>
								<tr>
									<td>${item.shopName}</td>
									<td>${item.deviceSn}</td>
                                    <td>${item.depositMoney}元</td>
                                    <td>${item.currentDepositMoney}元</td>
									<td>${item.deviceUsedDay}</td>
									<td>${item.tradeSum}元</td>
									<td>
										<#if item.deductStatus == 0>
                                            未扣款
										<#elseif item.deductStatus == 1>
											扣款中
										<#elseif item.deductStatus == 2>
                                            已完成
										</#if>
									</td>
									<td>
										<#if item.deductType == 1>
											扣流水
										<#elseif item.deductType == 2>
										    线下打款
										</#if>
									</td>
									<td>${item.paymentDay}</td>
								</tr>
							</#list>
						</#if>
					</tbody>
				</table>

				<#-- 载入分页 -->
				<#include "/page/deposit/tpl/search.ftl">
				<div class="pagination"></div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
	    require(['/js/page/deposit/search.js'], function(page){
	        page.init();
	    });
	</script>
</@html>











