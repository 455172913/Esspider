<#assign pageConfig = {
    "title": "押金审核"
}>
<#include "/core/frame.ftl">

<@html css="/css/page/deposit/check.css">
	<div class="wrap clearfix">
		<#include "/common/sidebar.ftl">
		<div class="content">
			<h1>押金审核</h1>

			<#-- 列表切换 -->
			<ul class="pay-type">
				<li><a href="/admin/settle/deposit/check">待审核</a><div class="line-block"></div>
				<li><a href="/admin/settle/deposit/checkpass">审核通过</a><div class="line-block">
				<li class="active">审核未通过<div class="line-block">
			</ul>

			<#-- 审核未通过 -->
			<div class="search-order">
				
				<!-- 合同ID -->
				<div class="form-horizontal order-search-box clearfix">
					<span class="choose-contract">合同id</span>
					<input type="text" class="contract-num">
				</div>

				<!-- 选择分店 -->
				<div class="form-horizontal order-search-box clearfix">
					<span class="choose-shop">选择分店</span>
					<div class="ac-wrapper">
			            	<input type="text" placeholder="" id="sign-shop-fail">
			            	<div class="form-error hide"></div>
						<div class="ac-outer hide">
						    <ul class="ac-ul">
						    </ul>
						</div>
			        </div>
				</div>

				<a href="javascript:;" class="search-btn" data-val="fail">查询</a>
			</div>
			<div class="search-order">
				<table class="table table-bordered">
					<thead>
						<tr>
							<th>申请id</th>
							<th>申请类型</th>
							<th>申请状态</th>
							<th>申请日期</th>
							<th>申请人</th>
							<th>审批人</th>
							<th>审核日期</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody>
						<tr><td colspan="8">暂无数据</td></tr>
					</tbody>
				</table>

				<#-- 载入分页 -->
				<#include "/page/deposit/tpl/checkfail.ftl">
				<div class="pagination"></div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
	    require(['/js/page/deposit/checkfail.js'], function(page){
	        page.init();
	    });
	</script>
</@html>











