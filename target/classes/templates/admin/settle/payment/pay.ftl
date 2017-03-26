<html>
<head>
    <title></title>
</head>
<body>


<#if success==1>
操作成功！付款id：${paymentId}，状态为1（待付），请等待触发。
<#else>
操作失败！${msg}
</#if>


</body>
</html>
