<html>
<head>
    <title></title>
</head>
<body>


<#if success==0>
操作失败！${msg}

<#else>
操作成功！新的付款流水：${newPaymentNo}，状态为0（新建）。请刷新付款列表，并点击该付款流水的 "付款" 按钮触发。
</#if>


</body>
</html>
