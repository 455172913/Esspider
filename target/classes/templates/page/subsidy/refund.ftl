<#assign pageConfig = {
    "title": "退票登记"
}>
<#include "/core/frame.ftl">

<@html css="/css/page/subsidy/refund.css">
	<div class="wrap clearfix">
		<#include "/common/sidebar.ftl">
		<div class="content">
			<h1>退票登记</h1>

			<div class="search-order">

				<div class="alert">
					<p>Excel格式：表格请都存放在sheet1、不要有完全空的一行 </p>
					<p>兴业Excel格式：交易时间 | 流水号 | 商户/渠道名称 | 商户编号/渠道编号 | 所属渠道 | 清分类型 | 清分日期 | 收款账号是否行内 | 收款银行 | 收款账户名 | 收款账号 | 清分金额 | 清分状态 | 失败原因 | 支付类型 | 是否修改账户 | 处理 </p>
					<p>注意 兴业： 交易时间  |  流水号  |  商户编号/渠道编号  |  清分类型 | 清分日期  收款银行  |  收款账户名  |  收款账号 | 清分金额 | 失败原因  |  处理  ，是必填的，其他列可以空着，但是要有这几列。 </p>
					<p>华势Excel格式：清算退回日期 | 商户编号 | 商户名称 | 结算金额 | 开户行 | 开户户名 | 结算账号 | 备注 </p>
					<p>钱袋宝Excel格式：清算退回日期 | 用户编号 | 商户名称 | 结算金额 | 开户行 | 开户户名 | 结算账号 | 失败原因 </p>
					<p>华势暂时不可用 </p>
				</div>

				<!-- 申请类型 -->
                <div class="form-horizontal order-search-box clearfix">
                	<span>合作机构</span>
                	<select class="organizationNo bill-select">
                		<option value="1" selected="selected">兴业银行</option>
                	    <!-- <option value="2">上海华势</option> -->
                	    <option value="3">钱袋宝</option>
                	</select>
                </div>

				<div class="form-horizontal order-search-box">
                	<span>登记日期</span>
                    <input type="text" readonly  id="start-date" class="form_datetime" style="width:135px;height:20px;border-radius: initial;">
                    <input type="hidden" class="start-time-stamp">
                </div>

                <!-- bd大象通知-->
                <div class="form-horizontal order-search-box clearfix">
					<input id="needNotify" type="checkbox" value="" />需要通知bd
				</div>

                <!-- 文件名称 -->
                <div class="form-horizontal order-search-box clearfix">
				    <span>文件名称</span>
					<input type="text" class="file-name" placeHolder="文件名称" disabled>
					<input type="file" id="upload" class="hide">
				</div>

				<a href="javascript:;" class="search-btn">选择文件</a>
			</div>
		</div>
	</div>

	<script type="text/javascript">
	    require(['/js/page/subsidy/refund.js'], function(page){
	        page.init();
	    });
	</script>
</@html>










