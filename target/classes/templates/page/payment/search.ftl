<#assign pageConfig = {
    "title": "付款查询"
}>
<#include "/core/frame.ftl">

<@html css="/css/page/payment/search.css">
	<div class="wrap clearfix">
		<#include "/common/sidebar.ftl">
		<div class="content">
			<h1>付款查询</h1>
			<div class="search-order">

				<!-- 赔付时间 -->
				<div class="form-horizontal order-search-box">
					<span>付款时间</span>
					<input type="text" readonly  id="start-date" class="form_datetime" style="width:135px;height:30px;border-radius: initial;">
					<input type="hidden" class="start-time-stamp">
					<span>至</span>
					<input type="text" readonly  id="end-date" class="form_datetime" style="width:135px;height:30px;border-radius: initial;">
					<input type="hidden" class="end-time-stamp">
					<span class="alert">一次查询范围最多为三个月</span>
				</div>
						
				<!-- 自动补全 -->
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

				<!-- 付款状态 -->
				<div class="form-horizontal order-search-box clearfix">
					<span class="choose-shop">付款状态</span>
					<select class="bill-select choose-state" style="border-radius: initial;">
						<option value="">全部</option>
						<option value="3">失败</option>
				    </select>
				</div>

				<a href="javascript:;" class="search-btn">查询</a>
				<a href="javascript:;" class="to-detail download">下载生成excel</a>
			</div>
			<div>
				<table class="table table-bordered">
					<thead>
						<tr>
                            <th>状态</th>
                            <th>设备编号</th>
                            <th>门店名称</th>
                            <th>类型</th>
                            <th>外部单号</th>
                            <th>渠道</th>
                            <th>实付</th>
                            <th>结算日期</th>
                            <th>付款时间</th>
                            <th>账单明细</th>
						</tr>
					</thead>
					<tbody>
<#-- 						<#if payments?size == 0>
 -->							<tr><td colspan="10">暂无数据</td></tr>
		<#-- 				<#else>
	                        <#list payments as payment>
	                            <tr>
	                                <td>
	                                    <#if payment.status?exists>
	                                        <#if payment.status==0>新建
	                                        <#elseif payment.status==1>待付
	                                        <#elseif payment.status==2>付款请求发送成功
	                                        <#elseif payment.status==3>付款请求发送失败
	                                        <#elseif payment.status==4>成功
	                                        <#elseif payment.status==5>失败
	                                        <#elseif payment.status==6>异常
											<#elseif payment.status==7>不打款
	                                        <#else>未知
	                                        </#if>
	                                    </#if>
	                                </td>
	                                <td><#if payment.deviceId?exists>${payment.deviceSn}</#if></td>
	                                <td><#if payment.shopName?exists>${payment.shopName}</#if></td>
	                                <td><#if payment.outno?exists>${payment.outno}</#if></td>
                                    <td><#if payment.perPay?exists>${payment.payChannelName}</#if></td>
	                                <td><#if payment.realPay?exists>${payment.realPay?c}</#if></td>
	                                <td><#if payment.settleDate?exists>${payment.settleDate?c}</#if></td>
	                                <td><#if payment.paymentDate?exists>${payment.paymentDate?c}</#if></td>
	                                <td>
	                                    <#if payment.status==0>

	                                    <#elseif payment.status==3>
	                                        <a onclick="javascript:window.open('http://mpay.sankuai.com/mis/funds/query?partnerCode=smart-pos&init=false&outNo=&payTaskId=&merchantNo=' + '${payment.paymentNo}');"
	                                                type="button" class="to-detail">查看详情
	                                        </a>
	                                    <#elseif payment.status==5>
	                                        <a onclick="javascript:window.open('http://mpay.sankuai.com/mis/funds/query?partnerCode=smart-pos&init=false&outNo=&payTaskId=&merchantNo=' + '${payment.paymentNo}');"
	                                                type="button" class="to-detail">查看详情
	                                        </a>

	                                    <#elseif payment.status==2>
	                                        <a onclick="javascript:window.open('http://mpay.sankuai.com/mis/funds/query?partnerCode=smart-pos&init=false&outNo=&payTaskId=&merchantNo=' + '${payment.paymentNo}');"
	                                                type="button" class="to-detail">查看详情
	                                        </a>
	                                    <#elseif payment.status==4>
	                                        <a onclick="javascript:window.open('http://mpay.sankuai.com/mis/funds/query?partnerCode=smart-pos&init=false&outNo=&payTaskId=&merchantNo=' + '${payment.paymentNo}');"
	                                                type="but ton" class="to-detail">查看详情
	                                        </a>
	                                    </#if>
	                                </td>
	                            </tr>
	                        </#list>
						</#if> -->
					</tbody>
				</table>

				<#-- 载入分页 -->
				<#include "/page/payment/tpl/search.ftl">
				<div class="pagination"></div>
			</div>
		</div>
	</div>
	<input type="hidden" class="total-page", value="${page.totalPage}">
	<input type="hidden" class="default-start-date" value="${beginDate}">
	<input type="hidden" class="default-end-date" value="${endDate}">

	<script type="text/javascript">
	    require(['/js/page/payment/search.js'], function(page){
	        page.init();

	        // 这些代码不是前端写的不背锅
			function btn_repay(paymentId) {
		        if (paymentId.length <= 0) {
		            alert("请输入paymentId");
		            return false;
		        }
		        if (confirm("请务必点击'查看详情'确认该付款之前没有成功。如果之前的确没有付款成功，请点击'确认'来重复付款")) {
		            window.open('/admin/settle/payment/repay?paymentId=' + paymentId);
		        } else
		            return false;
		    }
		    function btn_pay(paymentId) {
		        if (paymentId.length <= 0) {
		            alert("请输入paymentId");
		            return false;
		        }
		        if (confirm("该操作会将本付款流水状态设置为1(待付款)。确认操作？")) {
		            window.open('/admin/settle/payment/pay?paymentId=' + paymentId);
		        } else
		            return false;
		    }
		    function btn_allpay(paymentDate) {
		        if (paymentDate.length <= 0) {
		            alert("请输入paymentDate");
		            return false;
		        }
		        if (confirm("该操作会将该天所有新建(状态0)付款流水状态设置为1(待付款)。确认操作？")) {
		            window.open('/admin/settle/payment/allpay?paymentDate=' + paymentDate);
		        } else
		            return false;
		    }
	    });
	</script>
</@html>











