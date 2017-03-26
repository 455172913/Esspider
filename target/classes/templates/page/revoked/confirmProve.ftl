<#assign pageConfig = {
    "title": "撤机审核"
}>
<#include "/core/frame.ftl">

<@html css="/css/page/revoked/prove.css">
	<div class="wrap clearfix">
		<#include "/common/sidebar.ftl">
		<div class="content">
			<h1>撤机审核</h1>

			<#-- 列表切换 -->
			<ul class="pay-type">
				<li><a href="/admin/deviceRevoke/checkIndex">待确认列表</a><div class="line-block"></div>
				<li class="active">已确认列表<div class="line-block">
			</ul>
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
							<th>设备id</th>
							<th>已收POS款</th>
							<th>应付POS款</th>
							<th>撤机原因</th>
							<th>实付POS款</th>
							<th>退款时间</th>
							<th>操作人</th>
							<th>付款状态</th>
							<th>详情</th>
						</tr>
					</thead>
					<tbody>
						<tr><td colspan="10">暂无数据</td></tr>
					</tbody>
				</table>

				<#-- 载入分页 -->
				<input type="hidden" class="total-page" value="${page.totalCount}">
				<#include "/page/revoked/tpl/confirmProve.ftl">
				<div class="pagination"></div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
	    require(['/js/page/revoked/confirmProve.js'], function(page){
	        page.init();
	    });
	</script>
</@html>











