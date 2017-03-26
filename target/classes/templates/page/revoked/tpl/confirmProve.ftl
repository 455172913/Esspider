<script id="template" type="text/html">
	{@each revokeList as item}
		<tr>
                  <td>{{item.shopName}}</td>
                  <td>{{item.deviceId}}</td>
                  <td>{{item.receivedMoney}}</td>
                  <td>{{item.restMoney}}</td>
                  <td>{{item.reason}}</td>
                  <td>{{item.realMoney}}</td>
                  <td>
                        {@if item.payDate == "0"}
                              --
                        {@else}
                             {{item.payDate}}
                        {@/if}
                  </td>
                  <td>
                        {@if item.approveUserName == null}
                              --
                        {@else}
                             {{item.approveUserName}}
                        {@/if}
                  </td>
                  <td>{{item.statusStr}}</td>
                  <td>
                        {@if item.approveUserName == null || item.statusStr =="支付中"}
                              --
                        {@else}
                              <a href="http://mpay.sankuai.com/mis/funds/query?partnerCode=smart-pos&init=false&outNo=&payTaskId=&merchantNo={{item.paymentNo}}" class="to-detail">查看回单</a>
                        {@/if}
                  </td>
		</tr>
	{@/each}
</script>