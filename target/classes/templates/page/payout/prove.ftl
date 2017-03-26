<#assign pageConfig = {
    "title": "资金凭证"
}>
<#include "/core/frame.ftl">

<@html css="/css/page/payout/entry.css">
	<div class="wrap clearfix">
		<#include "/common/sidebar.ftl">
		<div class="content">
			<h1>赔付凭证</h1>

			<#-- 搜索模块 -->
			<div class="search-order">
				
				<!-- 合同ID -->
				<div class="form-horizontal">
					<span class="choose-contract">赔付原因</span>
					<strong class="payout-reason">
						<#if allowanceApplyModel.allowanceSubType == "3">
							其他
						<#elseif allowanceApplyModel.allowanceSubType == "200">	
							交易冲正，未出签购单，持卡人拒绝另付
						<#elseif allowanceApplyModel.allowanceSubType == "101">	
							返还手续费
						<#elseif allowanceApplyModel.allowanceSubType == "102">	
							押金返还
						</#if>
					</strong>
				</div>

				<!-- 赔付金额 -->
				<div class="form-horizontal order-search-box clearfix">
					<span class="choose-contract">赔付金额</span>
					<input type="text" value="${allowanceApplyModel.allowanceMoney}" readonly>
				</div>

				<!-- 交易单号 -->
				<div class="form-horizontal order-search-box clearfix">
					<span>交易单号</span>
					<input type="text" class="order-num" value="${allowanceApplyModel.orderNo}" readonly>
				</div>

				<!-- task编号 -->
				<div class="form-horizontal order-search-box clearfix">
					<span>task编号</span>
					<input type="text" class="order-num" value="${allowanceApplyModel.taskNo}" readonly>
				</div>

				<!-- 门店补全 -->
				<div class="form-horizontal order-search-box clearfix">
					<span>选择分店</span>
					<input type="text" value="${allowanceApplyModel.shopName}" readonly>
				</div>

				<!-- 设备编号 -->
				<div class="form-horizontal order-search-box">
					<span>设备编号</span>
					<input type="text" value="${allowanceApplyModel.deviceSn}" readonly>
				</div>

				<#-- 详情描述 -->
				<div class="form-horizontal clearfix">
					<p>详情描述</p>
					<textarea name="" id="" cols="30" rows="10" class="remark" readonly>
						${apply.applyOperationLogDOs[0].remark}
					</textarea>
				</div>
			</div>

			<div class="alert">相关凭证</div>
			
			<#-- 付款凭证上传 -->
			<div class="search-order">
				<div class="form-horizontal clearfix">
					<p>系统截图</p>
					<p>（订单、商家后台、POS收银界面等相关系统截图）</p>
			 		<ul class="photo-list" data-max="6" id="payment-prove">
			 			<#list allowanceApplyModel.systemImg as img>
				            <li class="photo-wrapper">
								<div class="img">
									<div class="imgitem">
										<img src="${img}" alt="">
									</div>
									<div class="mask"></div>
								</div>
							</li>
						</#list>
			        </ul>
				</div>
			</div>

			<#-- 付款凭证上传 -->
			<div class="search-order">
				<div class="form-horizontal clearfix">
					<p>持卡人消费证明</p>
					<p>（证明持卡人发生消费的任何单据，包含但不限于结账单、入账单等，有持卡人签名；如有持卡人签字的签购单，也一并上传）</p>
			 		<ul class="photo-list" data-max="6" id="payment-prove">
			 			<#list allowanceApplyModel.consumptionProof as img>
				            <li class="photo-wrapper">
								<div class="img">
									<div class="imgitem">
										<img src="${img}" alt="">
									</div>
									<div class="mask"></div>
								</div>
							</li>
						</#list>
			        </ul>
				</div>
			</div>

			<!-- 持卡人联系方式 -->
			<div class="search-order">
				<div class="form-horizontal order-search-box clearfix">
					<p>持卡人联系方式</p>
					<span class="choose-contract">姓名</span>
					<input type="text" class="order-num" value="${allowanceApplyModel.cardName}" readonly>
				</div>
				<div class="form-horizontal order-search-box clearfix">
					<span class="choose-contract">手机号码</span>
					<input type="text" class="order-num" value="${allowanceApplyModel.cardPhone}" readonly>
				</div>
			</div>
			
			<#-- 备注 -->
			<div class="form-horizontal clearfix">
				<p>备注</p>
				<textarea name="" id="" cols="30" rows="10" class="must-remark">
					${apply.applyOperationLogDOs[0].reason}
				</textarea>
			</div>

			<!-- 合同ID -->
			<div class="form-horizontal check-box">
				<p>审核状态</p>
				<div class="radio">
					<input type="radio" name="optionsRadios" class="check-radio" value="1" checked>
					审核通过
				</div>
				<div class="radio">
					<input type="radio" name="optionsRadios" class="check-radio" value="2">
					审核不通过
				</div>
				<h5 class="check-pass hide ">
					审核通过
				</h5>
				<h5 class="check-fail hide">
					审核未通过
				</h5>
			</div>
			<a href="javascript:;" class="submit-btn">提交</a>
		</div>
	</div>
	
	<!-- 预览原图 -->
	<div class="previewWrapper hide">
		<div class="previewContent">
			<img src="" alt="原图">
			<span class="close"></span>
		</div>
	</div>

	<script type="text/javascript">
	    require(['/js/page/payout/prove.js'], function(page){
	        page.init();
	    });
	</script>
</@html>