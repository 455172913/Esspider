<script id="template" type="text/html">
    {@if data.refundModelList.length == "0"}
        <tr><td colspan="11">暂无数据</td></tr>
    {@/if}
	{@each data.refundModelList as redund}
        <tr>
            <td><input type="checkbox" class="select-flag" data-id={{redund.id}} ></td>
            <td>{{redund.outMerchantId}}</td>
            <td>{{redund.shopId}}</td>
            <td>{{redund.shopName}}</td>
            <td>
                {@if redund.paymentDate == null}
                    --
                {@else}
                    {{redund.paymentDate|setDate}} 
                {@/if}
            </td>
            <td>{{redund.perPay}}</td>
            <td>{{redund.periodLastDay|setDate}}</td>
            <td>
                {@if redund.id!=null}
                    <a href="javascript:;" data-id={{redund.id}} class="to-detail">查看详情</a>
                {@/if}
            </td>
            <td>
                {@if redund.treat_status ==0}
                    待通知
                {@/if}
                {@if redund.treat_status ==1}
                    已通知BD
                {@/if}
                {@if redund.treat_status ==2}
                    已提交合作机构
                {@/if}
                {@if redund.treat_status ==3}
                    处理完毕
                {@/if}
             </td>
            <td>{{redund.noticeCount}}</td>
            <td>
                {@if redund.lastNoticeTime == null}
                    --
                {@else}
                    {{redund.lastNoticeTime|setDateSecond}}
                {@/if}
            </td>
        </tr>
	{@/each}
</script>