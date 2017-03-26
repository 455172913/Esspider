<script id="template" type="text/html">
	{@each allowanceApplyModelList as item}
		<tr>
			<td>{{item.id}}</td>
			<td>{{item.allowanceMoney}}</td>
			<td>{{item.applyUserName}}</td>
			<td>{{item.createTime}}</td>
			<td>
				<a href="/admin/allowance/compensate/detail?allowanceApplyId={{item.id}}&applyId={{item.applyId}}" class="to-detail">审核</a>
			</td>
		</tr>
	{@/each}
</script>