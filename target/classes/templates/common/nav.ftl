<#macro posNav curName="">
	<div class="pos-nav-block">
		<ul class="pos-nav">
			<li <#if curName == "billList">class="active"</#if> ><a href="/payinfo/billList">结算历史</a></li>
			<li <#if curName == "settleDetailList">class="active"</#if>><a href="/payinfo/settleDetailList">结算明细</a></li>
			<li <#if curName == "orderList">class="active"</#if>><a href="/order/list">实时交易查询</a></li>
		</ul>
	</div>
</#macro>
