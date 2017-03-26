<script id="template" type="text/html">{@each orderList as item}
<tr>
<td>{{item.orderTime}}</td>
<td>{{item.tradeNo}}</td>
<td>{{item.payTypeName}}</td>
<td>{{item.transactionMoney}}元</td>
<td>{{item.realArriveMoney}}元</td>
<td>{{item.discountMoney}}元</td>
<td>{{item.refundMoney}}元</td>
<td>{{item.status}}</td>
</tr>
{@/each}</script>