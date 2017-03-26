<script id="template" type="text/html">
	{@each revokeList as item}
		<tr>
                  <td>{{item.shopName}}</td>
                  <td>{{item.deviceId}}</td>
                  <td>{{item.receivedMoney}}</td>
                  <td>{{item.restMoney}}</td>
                  <td>{{item.depreciationMoney}}</td>
                  <td>{{item.reason}}</td>
                  <td>{{item.revokeDate}}</td>
                  <td><a href="javascript:;" class="to-detail to-rebate" data-id="{{item.id}}">发起返款</td>
		</tr>
	{@/each}
</script>
