<script id="template" type="text/html">
	{@each deviceDepositVOList as item}
		<tr>
			<td>{{item.shopName}}</td>
			<td>{{item.deviceSn}}</td>
            <td>{{item.depositMoney}}元</td>
			<td>{{item.currentDepositMoney}}元</td>
			<td>{{item.deviceUsedDay}}</td>
			<td>{{item.tradeSum}}元</td>
			<td>
				{@if item.deductStatus == 0}
                    未扣款
				{@else if item.deductStatus == 1}
					扣款中
				{@else if item.deductStatus == 2}
                    已完成
				{@/if}
			</td>
			<td>
				{@if item.deductType == 1}
                    扣流水
				{@else if item.deductType == 2}
					线下打款
				{@/if}
			</td>
			<td>{{item.paymentDay}}</td>
		</tr>
	{@/each}
</script>