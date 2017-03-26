<#assign pageConfig = {
    "title": "结算明细"
}>

<#include "/core/frame.ftl">
<@html css="/css/page/pos/detail/billinfo.css">
	<div class="wrap clearfix">
		<#include "/common/sidebar.ftl">

		<div class="content">
			<div class="search-order">

                <!-- 选择交易类型 -->
                <div class="form-horizontal order-search-box clearfix">
                    <span class="control-label" style="width: 90px; margin-left: 2px;">交易单号</span>
                    <input type="text" class="bill-num" style="border-radius: initial;" value="${tradeno}"/>
                </div>

				<!-- 交易时间 -->
				<div class="form-horizontal order-search-box">
					<span class="control-label" style="width: 90px;margin-top: 4px;">交易时间</span>
					<input type="text" readonly  id="start-date" class="form_datetime" style="width: 135px;height:30px;border-radius: initial;">
					<input type="hidden" class="start-time-stamp">
					<span>至</span>
					<input type="text" readonly  id="end-date" class="form_datetime" style="width: 135px;height:30px;border-radius: initial;">
					<input type="hidden" class="end-time-stamp">
					<span class="alert">一次查询范围最多为三个月</span>
				</div>
                
                <!-- 选择交易类型 -->
                <div class="form-horizontal order-search-box clearfix">
                    <span class="control-label" style="width: 90px; float: left">选择分店</span>
                    <div class="ac-wrapper" style="float: left">
                        <input type="text" placeholder="" class="choose-shop" id="sign-shop">
                        <div class="form-error hide"></div>
                        <div class="ac-outer hide">
                            <ul class="ac-ul">
                            </ul>
                        </div>
                    </div>

                    <span class="control-label" style="width: 90px; float: left;">设备编号</span>
                    <select class="bill-select choose-device" style="border-radius: initial;float: left; "></select>
                    <input type="hidden" class="cur-deviceId">

                    <span class="control-label" style="width: 90px;float: left;">交易类型</span>
                    <select class="bill-select choose-bill-type" style="border-radius: initial; float: left">
                        <option value="0">全部</option>
                        <option value="2">银行</option>
                        <option value="1">微信</option>
                        <option value="4">支付宝</option>
                    </select>
                    <input type="hidden" class="cur-bill-type"/>
				</div>

				<a href="javascript:;" class="search-btn" style="margin: 20px 0 0 34px;">查询</a>
			</div>


            <!-- 交易总金额统计 -->
            <div class="summary clearfix"></div>
            <script id="summary-tpl" type="text/html">
                <div class="sum-content transaction">
                    <div class="ctrol-box clearfix">
                        <h4>交易总金额（元）</h4>
                        <ul>
                            <li>银行卡</li>
                            <li class="sum-money">{@if settleDetailCount.bankCardTransactionCount == '0'}--{@else}{{settleDetailCount.bankCardTransactionCount}}{@/if}</li>
                            <li>手续费<span>{@if settleDetailCount.bankCardPoundageCount == '0'}--{@else}{{settleDetailCount.bankCardPoundageCount}}{@/if}元</span></li>
                        </ul>
                        <ul class="seg-line">
                            <li>微信</li>
                            <li class="sum-money">{@if settleDetailCount.weiXinTransactionCount == '0'}--{@else}{{settleDetailCount.weiXinTransactionCount}}{@/if}</li>
                            <li>手续费<span>{@if settleDetailCount.weiXinPoundageCount == '0'}--{@else}{{settleDetailCount.weiXinPoundageCount}}{@/if}元</span></li>
                        </ul>
                        <ul>
                            <li>支付宝</li>
                            <li class="sum-money">{@if settleDetailCount.zhiFuBaoTransactionCount == '0'}--{@else}{{settleDetailCount.zhiFuBaoTransactionCount}}{@/if}</li>
                            <li>手续费<span>{@if settleDetailCount.zhiFuBaoPoundageCount == '0'}--{@else}{{settleDetailCount.zhiFuBaoPoundageCount}}{@/if}元</span></li>
                        </ul>
                    </div>
                </div>
                <div class="summary-line"></div>
                <div class="sum-content billing">
                    <div class="ctrol-box clearfix">
                        <h4>结算总金额（元）</h4>
                        <ul>
                            <li>银行卡</li>
                            <li class="sum-money">{@if settleDetailCount.bankCardSettleCount == '0'}--{@else}{{settleDetailCount.bankCardSettleCount}}{@/if}</li>
                        </ul>
                        <ul class="seg-line">
                            <li>微信</li>
                            <li class="sum-money">{@if settleDetailCount.weiXinSettleCount == '0'}--{@else}{{settleDetailCount.weiXinSettleCount}}{@/if}</li>
                        </ul>
                        <ul>
                            <li>支付宝</li>
                            <li class="sum-money">{@if settleDetailCount.zhiFuBaoSettleCount == '0'}--{@else}{{settleDetailCount.zhiFuBaoSettleCount}}{@/if}</li>
                        </ul>
                    </div>
                </div>
            </script>

            <!-- 结算信息 -->
			<div>
				<table class="table table-bordered">
					<thead>
						<tr>
                            <th>设备编号</th>
							<th>交易时间</th>
                            <th>应付款时间</th>
							<th>交易单号</th>
							<th>收银渠道</th>
                            <th>交易卡种</th>
							<th>交易金额</th>
                            <th>手续费</th>
                            <th>结算金额</th>
							<th>结算状态</th>
						</tr>
					</thead>
					<tbody>
						<tr><td colspan="9">暂无数据</td></tr>
					</tbody>
				</table>
				<#include "/page/pos/detail/tpl/billinfo.ftl">
			</div>
		</div>
	</div>


	<input type="hidden" class="default-start-date" value="${begin}">
	<input type="hidden" class="default-end-date" value="${end}">

	<script type="text/javascript">
	    require(['/js/page/pos/detail/billinfo.js'], function(page){
	        page.init();
	    });
	</script>
</@html>










