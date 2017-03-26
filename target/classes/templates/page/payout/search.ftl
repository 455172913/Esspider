<#assign pageConfig = {
    "title": "赔付查询"
}>
<#include "/core/frame.ftl">

<@html css="/css/page/deposit/search.css">
	<div class="wrap clearfix">
		<#include "/common/sidebar.ftl">
		<div class="content">
			<h1>赔付查询</h1>

			<div class="search-order">

				<!-- 赔付时间 -->
<#-- 				<div class="form-horizontal order-search-box">
					<span>赔付时间</span>
					<input type="text" readonly  id="start-date" class="form_datetime" style="width:135px;height:30px;border-radius: initial;">
					<input type="hidden" class="start-time-stamp">
					<span>至</span>
					<input type="text" readonly  id="end-date" class="form_datetime" style="width:135px;height:30px;border-radius: initial;">
					<input type="hidden" class="end-time-stamp">
					<span class="alert">一次查询范围最多为三个月</span>
				</div> -->

				<!-- 分店名称补全 -->
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

				<a href="javascript:;" class="search-btn">查询</a>
			</div>
			<div>
				<table class="table table-bordered">
					<thead>
						<tr>
							<th>付款日期</th>
							<th>付款金额</th>
							<th>门店名称</th>
							<th>付款发起时间</th>
							<th>付款响应时间</th>
							<th>付款状态</th>
							<th>操作</th>	
						</tr>
					</thead>
					<tbody>
						<tr><td colspan="8">暂无数据</td></tr>
					</tbody>
				</table>

				<#-- 载入分页 -->
				<input type="hidden" class="total-page" value="${page.totalCount}">
				<#include "/page/payout/tpl/search.ftl">
				<div class="pagination"></div>
			</div>
		</div>
	</div>
	<input type="hidden" class="default-start-date" value="${beginDate}">
	<input type="hidden" class="default-end-date" value="${endDate}">

	<script type="text/javascript">
	    require(['/js/page/payout/search.js'], function(page){
	        page.init();
	    });
	</script>
</@html>











