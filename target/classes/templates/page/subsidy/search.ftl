<#assign pageConfig = {
    "title": "补贴查询"
}>
<#include "/core/frame.ftl">

<@html css="/css/page/subsidy/search.css">
	<div class="wrap clearfix">
		<#include "/common/sidebar.ftl">
		<div class="content">
			<h1>补贴查询</h1>

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
                            <th>状态</th>
                            <th>设备id</th>
                            <th>poiId</th>
                            <th>门店名称</th>
                            <th>付款单号</th>
                            <th>补贴开始时间</th>
                            <th>补贴结束时间</th>
                            <th>补贴金额</th>
                            <th>应打款日期</th>
                            <th>操作</th>
						</tr>
					</thead>
					<tbody>
						<tr><td colspan="10">暂无数据</td></tr>
					</tbody>
				</table>

				<#-- 载入分页 -->
				<input type="hidden" class="total-page" value="${page.totalCount}">
				<#include "/page/subsidy/tpl/search.ftl">
				<div class="pagination"></div>
			</div>
		</div>
	</div>
	<input type="hidden" class="default-start-date" value="${beginDate}">
	<input type="hidden" class="default-end-date" value="${endDate}">

	<script type="text/javascript">
	    require(['/js/page/subsidy/search.js'], function(page){
	        page.init();
	    });
	</script>
</@html>











