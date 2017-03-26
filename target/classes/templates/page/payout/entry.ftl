<#assign pageConfig = {
    "title": "资金申请"
}>
<#include "/core/frame.ftl">
<@html css="/css/page/payout/entry.css">
	<div class="wrap clearfix">
		<#include "/common/sidebar.ftl">
		<div class="content">
			<h1>资金申请</h1>

			<#-- 搜索模块 -->
			<div class="search-order">
				
				<!-- 申请类型 -->
				<div class="form-horizontal order-search-box clearfix">
					<span>申请类型</span>
					<select class="payout-type bill-select">
						<option value="3">赔付</option>
						<option value="2">补贴</option>
					</select>
				</div>

				<!-- 门店补全 -->
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

				<!-- 合同ID -->
				<div class="form-horizontal clearfix"> 
					<p>赔付原因</p>
					<div class="payout">
						<div class="radio">
							<input type="radio" name="optionsRadios" class="check-radio reversal" value="200" checked="checked">
							交易冲正，未出签购单，持卡人拒绝另付
						</div>
						<div class="radio">
							<input type="radio" name="optionsRadios" class="check-radio" value="3">
							其他
						</div>
					</div>
					<div class="subsidy hide">
						<div class="radio">
							<input type="radio" name="optionsRadios" class="check-radio fee" value="101">
							返还手续费
						</div>
						<div class="radio">
							<input type="radio" name="optionsRadios" class="check-radio" value="102">
							押金返还
						</div>
					</div>
				</div>
				
				<div class="reason-order">

					<#-- 订单编号 -->
					<div class="form-horizontal order-search-box clearfix">
						<span>订单编号</span>
						<input type="text" class="order-num" maxlength="15">
					</div>
					<a href="javascript:;" class="search-btn">查询</a>

					<#-- 表格展示 -->
					<div class="search-order">
						<table class="table table-bordered">
							<thead>
								<tr>
									<th>订单编号</th>
									<th>交易金额</th>
									<th>订单状态</th>
									<th>支付渠道</th>
									<th>支付时间</th>
									<th>审核状态</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td colspan="6">暂无数据</td>
								</tr>
							</tbody>
						</table>
						<script id="template" type="text/html">
							{@if result.code == '500000'}
								<tr>
									<td colspan="5">暂无数据</td>
								</tr>
							{@else}
								<tr>
									<td class="order-id" data-id="{{data.orderList[0].id}}">{{data.orderList[0].id}}</td>
									<td class="money">{{data.orderList[0].orderTotalFee}}</td>
									<td>{{data.orderList[0].orderStatus}}</td>
									<td>{{data.orderList[0].orderPayTypes}}</td>
									<td>{{data.orderList[0].payTime|setDate}}</td>
									<td class="payout-status" data-status="{{data.orderSubmit}}">
										{@if data.orderSubmit == 0}
						                    未赔付
										{@else if data.orderSubmit == 1}
											已赔付
										{@else if data.orderSubmit == 2}
						                    赔付中
										{@/if}
									</td>
								</tr>
							{@/if}
						</script>
					</div>
				</div>

				<!-- 订单编号 -->
				<div class="form-horizontal order-search-box clearfix">
					<span>赔付金额</span>
					<input type="text" class="payout-money" readonly>
					<em class="alert">最多支持两位小数</em>
					<p class="error hide">格式不正确</p>
				</div>

				<!-- 交易单号 -->
				<div class="form-horizontal order-search-box clearfix tran-box">
					<span>task编号</span>
					<input type="text" class="tran-num" maxlength="64">
				</div>

				<#-- 详情描述 -->
				<div class="search-order">
					<div class="form-horizontal clearfix">
						<p>详情描述</p>
						<textarea name="" id="" cols="30" rows="10" class="detail"></textarea>
					</div>
				</div>
			</div>

			<div class="alert">相关凭证（三件缺一不可）</div>

			<#-- 系统截图 -->
			<div class="search-order">
				<div class="form-horizontal clearfix">
					<p>系统截图（请提供内容完整，清晰可见的凭证）</p>
					<p>订单、商家后台、POS收银界面等相关系统截图</p>
			 		<ul class="photo-list" data-max="10000" id="sys-img">
			                <li class="photo-wrapper">
							<div class="img">
								<div class="mask"></div>
							</div>
						</li>
			        </ul>
				</div>
			</div>

			<#-- 持卡人消费证明 -->
			<div class="search-order">
				<div class="form-horizontal clearfix">
					<p>持卡人消费证明（请提供内容完整，清晰可见的凭证）</p>
					<p>证明持卡人发生消费的任何单据，包含但不限于结账单、入账单等，有持卡人签名；如有持卡人签字的签购单，也一并上传</p>
			 		<ul class="photo-list" data-max="10000" id="cost-img">
			                <li class="photo-wrapper">
							<div class="img">
								<div class="mask"></div>
							</div>
						</li>
			        </ul>
				</div>
			</div>
			
			<!-- 持卡人联系方式 -->
			<div class="search-order">
				<div class="form-horizontal order-search-box clearfix">
					<p>持卡人联系方式</p>
					<span class="choose-contract">姓名</span>
					<input type="text" class="user-name">
				</div>
				<div class="form-horizontal order-search-box clearfix">
					<span class="choose-contract">手机号码</span>
					<input type="text" class="user-phone" max-length=11>
				</div>
			</div>

			<a href="javascript:;" class="submit-btn true-submit">提交</a>
			<a href="javascript:;" class="submit-btn false-submit" style="display: none">提交</a>
		</div>
	</div>

	<!-- 隐藏的file -->
	<input type="file" id="upload" class="hide" accept="image/*">
	
	<!-- 预览原图 -->
	<div class="previewWrapper hide">
		<div class="previewContent">
			<img src="" alt="原图">
			<span class="close"></span>
		</div>
	</div>
	
	<script type="text/javascript">
	    require(['/js/page/payout/entry.js'], function(page){
	        page.init();
	    });
	</script>
</@html>