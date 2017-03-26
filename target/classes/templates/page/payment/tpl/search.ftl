<script id="template" type="text/html">
	{@each payments as payment}
        <tr>
            <td>
                {@if payment.status==0}新建
                {@else if payment.status==1}待付
                {@else if payment.status==2}付款请求发送成功
                {@else if payment.status==3}付款请求发送失败
                {@else if payment.status==4}成功
                {@else if payment.status==5}失败
                {@else if payment.status==6}异常
                {@else if payment.status==7}不打款
                {@else}未知
				{@/if}
            </td>
            <td>{{payment.deviceSn}}</td>
            <td>{{payment.shopName}}</td>
            <td>
                {@if payment.paymentType==0}付款
                {@else if payment.paymentType==1}赔偿
                {@else if payment.paymentType==2}设备押金返还
                {@else if payment.paymentType==3}{{payment.paymentDesc}}
                {@else if payment.paymentType==5}手续费返还
                {@else if payment.paymentType==8}{{payment.paymentDesc}}
                {@else if payment.paymentType==9}{{payment.paymentDesc}}
                {@else}未知
                {@/if}
            </td>
            <td>{{payment.outno}}</td>
            <td>{{payment.payChannelName}}</td>
            <td>{{payment.realPayStr}}</td>
            <td>{{payment.settleDate}}</td>
            <td>{{payment.paymentDate}}</td>
            <td>
                {@if payment.status==0}

                {@else if payment.status==3}
                    <a onclick="javascript:window.open('http://mpay.sankuai.com/mis/funds/query?partnerCode=smart-pos&init=false&outNo=&payTaskId=&merchantNo={{payment.paymentNo}}');"
                            type="button" class="to-detail">查看详情
                    </a>
                {@else if payment.status==5}
                    <a onclick="javascript:window.open('http://mpay.sankuai.com/mis/funds/query?partnerCode=smart-pos&init=false&outNo=&payTaskId=&merchantNo={{payment.paymentNo}}');"
                            type="button" class="to-detail">查看详情
                    </a>
                    <a onclick="btn_repay({{payment.id}})" class="to-detail">重新付款
                    </a>
                {@else if payment.status==2}
                    <a onclick="javascript:window.open('http://mpay.sankuai.com/mis/funds/query?partnerCode=smart-pos&init=false&outNo=&payTaskId=&merchantNo={{payment.paymentNo}}');"class="to-detail">查看详情
                    </a>
                {@else if payment.status==4}
                    <a onclick="javascript:window.open('http://mpay.sankuai.com/mis/funds/query?partnerCode=smart-pos&init=false&outNo=&payTaskId=&merchantNo={{payment.paymentNo}}');"class="to-detail">查看详情
                    </a>
                {@/if}
            </td>
        </tr>
	{@/each}
</script>