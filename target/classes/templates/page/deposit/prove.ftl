<#assign pageConfig = {
    "title": "付款凭证"
}>
<#include "/core/frame.ftl">

<@html css="/css/page/deposit/prove.css">
	<div class="wrap clearfix">
		<#include "/common/sidebar.ftl">
		<div class="content">
			<h1>付款凭证</h1>

			<#-- 商户列表 -->
			<div class="search-order">
				<table class="table table-bordered">
					<thead>
						<tr>
							<th>门店名称</th>
							<th>设备编号</th>
							<th>应收金额</th>
							<th>收取方式</th>
							<th>收取日期</th>
						</tr>
					</thead>
					<tbody>
						<#list depositList as item>
							<tr>
								<td>${item.shopName}</td>
								<td>${item.deviceSn}</td>
								<td>${item.moneyStr}元</td>
								<td>
									<#if item.type == 1>
										现金
									<#elseif item.type == 2>
									    转账
									</#if>
								</td>
								<td>${item.depositDate}</td>
								<td class="hide">${item.deviceId}</td>
							</tr>
						</#list>
					</tbody>
				</table>
			</div>

			<#-- 付款凭证上传 -->
			<div class="search-order">
				<div class="form-horizontal clearfix">
					<p>付款凭证</p>
			 		<ul class="photo-list" data-max="6" id="payment-prove">
			 			<#list depositOffline.imageList as img>
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

			<#-- 经办备注 -->
			<div class="search-order">
				<div class="form-horizontal clearfix">
					<p>经办备注</p>
					<textarea name="" id="" cols="30" rows="10" class="remark" readonly>
						${apply.applyOperationLogDOs[0].remark}
					</textarea>
				</div>
			</div>

			<#-- 备注 -->
			<div class="search-order">
				<div class="form-horizontal clearfix">
					<p>备注</p>
					<textarea name="" id="" cols="30" rows="10" class="remark must-remark">
						${apply.applyOperationLogDOs[0].reason}
					</textarea>
				</div>
			</div>

			<#-- 审核状态 -->
			<div class="search-order check-status">
				<div class="form-horizontal clearfix">
					<p>审核状态</p>
					<div class="radio">
						<input type="radio" name="optionsRadios" class="check-radio" value="1" checked>
						审核通过
					</div>
					<div class="radio">
						<input type="radio" name="optionsRadios" class="check-radio" value="2">
						审核未通过
					</div>
					<h5 class="alert check-pass hide ">
						审核通过
					</h5>
					<h5 class="alert check-fail hide">
						审核未通过
					</h5>
				</div>
			</div>
			<a href="javascript:;" class="submit-btn check-status">提交</a>
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
	    require(['/js/page/deposit/prove.js'], function(page){
	        page.init();
	    });
	</script>
</@html>