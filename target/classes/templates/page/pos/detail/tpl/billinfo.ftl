<script id="template" type="text/html">
    {@if FlowList.length == "0"}
        <tr><td colspan="10">暂无数据</td></tr>
    {@/if}
    {@each FlowList as item}
        <tr>
            <td>{{item.deviceSn}}</td>
            <td>{{item.payTime}}</td>
            <td>{{item.paymentDay}}</td>if
            <td>{{item.tradeno}}</td>
            <td>{{item.payTypeName}}</td>
            <td>{{item.cardTypeName}}</td>
            <td>{{item.fee}}元
                {@if item.activityMoney!=0}</br>原金额{{item.orderFee}}元，优惠{{item.activityMoney}}元
                {@/if}
            </td>
            <td>{{item.poundageMoney}}元</td>
            <td>{{item.settleMoney}}元</td>
            <td>
                {@if item.payStatus==1 || item.payStatus == 2}已退款
                {@else}已结算
                {@/if}
            </td>
        </tr>
    {@/each}
</script>
