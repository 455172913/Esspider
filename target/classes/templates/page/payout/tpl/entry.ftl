<script id="template" type="text/html">

		{@each data.depositList as item}
			<tr data-shopid={{item.shopId}} data-ruleid={{item.ruleId}}>
				<td>{{item.shopName}}</td>
				<td>{{item.deviceSn}}</td>
				<td><span class="entry-money">{{item.money}}</span>元</td>
				<td>
					<select class="entry-type">
						<option value="2">转账</option>
						<option value="1">现金</option>
					</select>
				</td>
				<td><input type="text" class="entry-time"></td>
				<td class="entry-deviceid hide">{{item.deviceId}}</td>
			</tr>
		{@/each}
</script>