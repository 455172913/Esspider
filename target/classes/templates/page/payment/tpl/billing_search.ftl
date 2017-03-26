<script id="template" type="text/html">
	{@each payments as item}
        <tr>
            <td>
                {@if item.status==0}新建
                {@else if item.status==1}待付
                {@else if item.status==2}付款请求发送成功
                {@else if item.status==3}付款请求发送失败
                {@else if item.status==4}成功
                {@else if item.status==5}失败
                {@else if item.status==6}异常
                {@else if item.status==7}不打款
                {@else}未知
                {@/if}
            </td>
            <td>{{item.settleDate}}</td>
            <td>{{item.paymentDate}}</td>
            <td>{{item.deviceSn}}</td>
            <td>{{item.paytypeMerge}}</td>
            <td>{{item.realPayStr}}元</td>
            <td>{{item.perPayStr}}元</td>
        </tr>
	{@/each}
</script>