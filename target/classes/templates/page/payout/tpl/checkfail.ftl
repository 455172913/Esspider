<script id="template" type="text/html">
	{@each allowanceApplyModelList as item}
		<tr>
			<td>{{item.id}}</td>
			<td>{{item.allowanceMoney}}</td>
			<td>{{item.approveUserName}}</td>
			<td>{{item.createTime}}</td>
			<td>{{item.approveTime}}</td>
			<td>
				<a href="/admin/allowance/compensate/detail?allowanceApplyId={{item.id}}&applyId={{item.applyId}}&checkState=fail" class="to-detail">查看详情</a>
			</td>
		</tr>
	{@/each}
</script>