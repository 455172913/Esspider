<#assign pageConfig = {
    "title": "押金录入"
}>
<#include "/core/frame.ftl">

<@html css="/css/page/deposit/entry.css">
	<div class="wrap clearfix">
		<#include "/common/sidebar.ftl">
		<div class="content">
			<h1>押金录入</h1>

			<#-- 搜索模块 -->
			<div class="search-order">

				<!-- 合同ID -->
				<div class="form-horizontal order-search-box clearfix">
					<span class="choose-contract">合同id</span>
					<input type="text" class="contract-num">
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
				<a href="javascript:;" class="search-btn">查询</a>
			</div>

			<#-- 表格展示 -->
			<div class="search-order">
				<div class="form-horizontal clearfix">
				<span class="alert">日期格式为yyyy-MM-dd</span>
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
						<tr>
							<td colspan="5">暂无数据</td>
						</tr>
					</tbody>
				</table>

				<#-- 载入表格模板 -->
				<#include "/page/deposit/tpl/entry.ftl">
				<div class="pagination"></div>
			</div>
			</div>

			<#-- 付款凭证上传 -->
			<div class="search-order">
				<div class="form-horizontal clearfix">
					<p>付款凭证上传</p>
			 		<ul class="photo-list" data-max="6" id="payment-prove">
			                <li class="photo-wrapper">
							<div class="img">
								<div class="mask"></div>
							</div>
						</li>
			        </ul>
				</div>
			</div>

			<#-- 备注 -->
			<div class="search-order">
				<div class="form-horizontal clearfix">
					<p>备注</p>
					<textarea name="" id="" cols="30" rows="10" class="remark"></textarea>
				</div>
			</div>
			<a href="javascript:;" class="submit-btn">提交</a>
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
	    require(['/js/page/deposit/entry.js'], function(page){
	        page.init();
	    });
	</script>
</@html>