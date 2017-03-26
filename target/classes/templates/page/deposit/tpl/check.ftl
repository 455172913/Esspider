<script id="template" type="text/html">
	{@each applyDOList as item}
		<tr>
			<td>{{item.id}}</td>
			<td>{{item.applyType}}</td>
			<td>
				{@if item.status == 0}
                    新建
				{@else if item.status == 1}
					通过
				{@else if item.status == 2}
                    驳回
				{@/if}
			</td>
			<td>{{item.applyTime}}</td>
			<td>{{item.applyUserName}}</td>
			<td>
				<a href="/admin/settle/deposit/prove?applyId={{item.id}}" class="to-detail">审核</a>
			</td>
		</tr>
	{@/each}
</script>