<#assign pageConfig = {
    "title": "资金审核"
}>
<#include "/core/frame.ftl">

<@html css="/css/page/payout/check.css">
	<div class="wrap clearfix">
		<#include "/common/sidebar.ftl">
		<div class="content">
			<h1>赔付审核</h1>

			<#-- 列表切换 -->
			<ul class="pay-type">
				<li class="active">待审核<div class="line-block"></div>
				<li><a href="/admin/allowance/compensate/passIndex">审核通过</a><div class="line-block">
				<li><a href="/admin/allowance/compensate/rejectIndex">审核未通过</a><div class="line-block">
			</ul>
			<div class="search-order">

				<!-- 选择分店 -->
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
			<div class="search-order">
				<table class="table table-bordered">
					<thead>
						<tr>
							<th>赔付ID</th>
							<th>赔付金额</th>
							<th>经办人</th>
							<th>申请日期</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody>
							<tr><td colspan="6">暂无数据</td></tr>
					</tbody>
				</table>

				<#-- 载入分页 -->
				<#include "/page/payout/tpl/check.ftl">
				<div class="pagination"></div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
	    require(['/js/page/payout/check.js'], function(page){
	        page.init();
	    });
	</script>
</@html>











