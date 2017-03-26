<script id="template" type="text/html">
	{@each allowanceApplyModelList as item}
		<tr>
			<td>{{item.id}}</td>
			<td>{{item.allowanceMoney}}</td>
			<td class="allowance-time">
				{@if item.allowanceTime==null}

                {@else}
                    {{item.allowanceTime}}
                {@/if}
			</td>
			<td>{{item.applyUserName}}</td>
			<td>{{item.createTime}}</td>
			<td>{{item.approveTime}}</td>
			<td class="payment-date">
				{@if item.payStatus == 0}
					
				{@else}
					{{item.paymentDate}}
				{@/if}
			</td>
			<td class="pay-state">
				{@if item.payStatus == 0}
                    新建
				{@else if item.payStatus == 1}
					待付
				{@else if item.payStatus == 2}
                    付款请求发送
                {@else if item.payStatus == 3}
                    付款失败
                {@else if item.payStatus == 4}
                    付款成功
                {@else if item.payStatus == 6}
                    付款异常
				{@/if}
			</td>
			<td data-applyId="{{item.applyId}}" data-allowanceApplyId="{{item.id}}" data-allowanceSubType="{{item.allowanceSubType}}">
				{@if item.payStatus == 0}
					<button class="pay">支付</button>
				{@else}
					<button disabled>已支付</button>
				{@/if}
				<a href="/admin/allowance/compensate/detail?allowanceApplyId={{item.id}}&applyId={{item.applyId}}&checkState=pass" class="to-detail">查看详情</a>
			</td>
		</tr>
	{@/each}
</script>