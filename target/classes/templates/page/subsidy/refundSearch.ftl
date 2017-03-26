<#assign pageConfig = {
    "title": "退票查询"
}>
<#include "/core/frame.ftl">
<@html css="/css/page/subsidy/refundSearch.css">
	<div class="wrap clearfix">
		<#include "/common/sidebar.ftl">
		<div class="content">
			<h1>退票查询</h1>

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
				<div class="form-horizontal order-search-box clearfix">
				    <span>门店id</span>
				    <input type="text" placeholder="" id="shop-id">
				</div>
                <div class="form-horizontal order-search-box clearfix">
				    <span>外部商户编号</span>
				    <input type="text" placeholder="" id="out-merchant-id">
				</div>
                <div class="form-horizontal order-search-box clearfix">
                	<span>外部合作机构</span>
                	<select class="organizationNo">
                		<option value="" selected="selected">全部</option>
                		<option value="1">兴业银行</option>
                	    <!-- <option value="2">上海华势</option> -->
                	    <option value="3">钱袋宝</option>
                	</select>
                </div>
                <div class="form-horizontal order-search-box clearfix">
                	<span>处理状态</span>
                	<select class="treatStatus">
                		<option value='' selected="selected">全部</option>
                		<option value="0" >待通知</option>
                	    <option value="1">已通知BD</option>
                	    <option value="2">已提交合作机构</option>
                	    <option value="3">处理完毕</option>
                	</select>
                </div>
                <div class="btn-box">
	                <a href="javascript:;" class="search-btn query">查询</a>
					<a href="javascript:;" class="search-btn notice-bd">通知BD</a>
					<a href="javascript:;" class="search-btn change-state">更改处理状态</a>
                </div>

				<table class="table table-bordered">
					<thead>
						<tr>
						    <th><input type="checkbox" class="check-all"></th>
							<th>外部商户编号</th>
							<th>门店id</th>
							<th>门店名称</th>
							<th>交易日期</th>
							<th>付款金额</th>
							<th>退款日期</th>
							<th>操作</th>
							<th>处理状态</th>
							<th>通知次数</th>
							<th>最后通知时间</th>
						</tr>
					</thead>
					<tbody>
						<tr><td colspan="11">暂无数据</td></tr>
					</tbody>
				</table>

				<#-- 载入分页 -->
				<input type="hidden" class="total-page" value="${page.totalCount}">
				<#include "/page/subsidy/tpl/refundSearch.ftl">
				<div class="pagination"></div>
			</div>
		</div>
	</div>
	
	<#-- 批量更改处理状态 -->
	<div class="modal fade hide" id="change-state-modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
						&times;
					</button>
					<h4 class="modal-title" id="myModalLabel">
						更改状态
					</h4>
				</div>

				<!-- 内容：-->
				<div class="modal-body">
	                <div class="modal-block">
	                	<span>状态类型</span>
	                	<select class="changeTreatStatus">
	                		<option value="2" selected="selected">已提交合作机构</option>
	                	    <option value="3">处理完毕</option>
	                	</select>
	                </div>

					<div class="modal-block">
	                	<span>登记日期</span>
	                    <input type="text" readonly  id="start-date" class="form_datetime" style="width:135px;border-radius: initial;">
	                    <input type="hidden" class="start-time-stamp">
	                </div>
                </div>

	            <!--内容结束-->
				<div class="modal-footer">
					<button type="button" class="btn btn-primary" id="change-status">
						提交更改
					</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">
						关闭
					</button>
				</div>
			</div>
		</div>
	</div>

	<#-- 查看退票详情 -->
	<div class="modal fade hide" id="refund-info-modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
						&times;
					</button>
					<h4 class="modal-title" id="myModalLabel">
						退票详情
					</h4>
				</div>
				<div class="modal-body refund-modal-body">

				</div>
				
				<!-- 内容：-->	
				<script id="refund-detail" type="text/html">
						<div>
							<p>收款户名：{{refundModel.name}}</p>
							<p>付款银行：{{refundModel.bankName}}</p>
							<p>银行卡号：{{refundModel.cardNo}}</p>
		                </div>
		                
		                <div>
							<p>失败原因：{{refundModel.reason}}</p>
						</div>
			            <div>
							<span>BD：{{refundModel.bdname}}
							<span>大象：{{refundModel.bdelephant}}
							<span>手机号：{{refundModel.bdtel}}
						</div>
				</script>
				
	            <!--内容结束-->
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">
						关闭
					</button>
				</div>
			</div>
		</div>
	</div>

	<script type="text/javascript">
	    require(['/js/page/subsidy/refundSearch.js'], function(page){
	        page.init();
	    });
	</script>
</@html>











