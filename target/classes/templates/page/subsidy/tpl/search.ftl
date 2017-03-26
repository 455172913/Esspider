<script id="template" type="text/html">
	{@each allownaceList as allownace}
		<tr>
            <td>
                {@if allownace.status==0}未打款
                    {@else if allownace.status==1}待付
                    {@else if allownace.status==2}付款请求发送成功
                    {@else if allownace.status==3}付款请求发送失败
                    {@else if allownace.status==4}付款成功
                    {@else if allownace.status==5}付款失败
                    {@else if allownace.status==6}付款异常
                {@/if}
            </td>
            <td>{{allownace.deviceId}}</td>
            <td>{{allownace.shopId}}</td>
            <td>{{allownace.shopName}}</td>
            <td>{{allownace.paymentNo}}</td>
            <td>{{allownace.allowanceBegin}}</td>
            <td>{{allownace.allowanceEnd}}</td>
            <td>{{allownace.allowance}}</td>
            <td>{{allownace.paymentDate}}</td>
            <td>
                {@if allownace.status==4}
                    <a href='http://mpay.sankuai.com/mis/funds/query?partnerCode=smart-pos&init=false&outNo=&payTaskId=&merchantNo={{allownace.paymentNo}}' class="to-detail">查看回单
                    </a>&nbsp&nbsp
                {@/if}
                {@if allownace.allowanceApplyId==null}
                {@else}
                    <a href="/admin/allowance/compensate/detail?allowanceApplyId={{allownace.allowanceApplyId}}&applyId={{allownace.applyId}}&checkState=pass" class="to-detail">查看详情</a>
                {@/if}
            </td>
		</tr>
	{@/each}
</script>