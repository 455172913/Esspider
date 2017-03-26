<#assign pageConfig = {
    "title": "结算查询"
}>
<#include "/core/frame.ftl">

<@html css="/css/page/payment/billing_search.css">
	<div class="wrap clearfix">
		<#include "/common/sidebar.ftl">
		<div class="content">
			<h1>结算查询</h1>

			<div class="search-order">

				<!-- 赔付时间 -->
				<div class="form-horizontal order-search-box">
					<span>交易时间</span>
					<input type="text" readonly  id="start-date" class="form_datetime" style="width:135px;height:30px;border-radius: initial;">
					<input type="hidden" class="start-time-stamp">
					<span>至</span>
					<input type="text" readonly  id="end-date" class="form_datetime" style="width:135px;height:30px;border-radius: initial;">
					<input type="hidden" class="end-time-stamp">
					<span class="alert">一次查询范围最多为三个月</span>
				</div>

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

				<!-- 分店名称补全 -->
				<div class="form-horizontal order-search-box clearfix">
					<span>付款状态</span>
					<select class="choose-state">
						<option value="">
							全部 
						</option>
						<option value="1">
							新建 
						</option>
						<option value="2">
							付款中
						</option>
						<option value="3">
							失败
						</option>
						<option value="4">
							成功
						</option>
						<option value="7">
							只记录不进行付款
						</option>
					</select>
				</div>

				<a href="javascript:;" class="search-btn">查询</a>
<#-- 				<a href="javascript:;" class="to-detail download">下载生成excel</a>
 -->			</div>
			<div>
				<table class="table table-bordered">
					<thead>
						<tr>
							<th>付款状态</th>
							<th>交易日期</th>
							<th>付款日期</th>
							<th>设备编号</th>
							<th>结算渠道</th>
							<th>实付金额</th>
							<th>应付金额</th>
						</tr>
					</thead>
					<tbody>
						<tr><td colspan="8">暂无数据</td></tr>
					</tbody>
				</table>

				<#-- 载入分页 -->
				<input type="hidden" class="total-page" value="${page.totalCount}">
				<#include "/page/payment/tpl/billing_search.ftl">
				<div class="pagination"></div>
			</div>
		</div>
	</div>
	<input type="hidden" class="default-start-date" value="${beginDate}">
	<input type="hidden" class="default-end-date" value="${endDate}">

	<script type="text/javascript">
	    require(['/js/page/payment/billing_search.js'], function(page){
	        page.init();
	    });
	</script>
</@html>











