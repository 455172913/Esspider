<html>
<head>
    <title></title>
    <style type="text/css">
        body, table {
            font-size: 12px;
        }

        table {
            table-layout: auto;
            empty-cells: show;
            border-collapse: collapse;
        }

        td {
            height: 100px;
        }

        h1, h2, h3 {
            font-size: 12px;
            margin: 0;
            padding: 0;
        }

        .table {
            border: 1px solid #cad9ea;
            color: #666;
        }

        .table th {
            background-repeat: repeat-x;
            height: 30px;
        }

        .table td, .table th {
            border: 1px solid #cad9ea;
            padding: 0 1em 0;
        }

        .table tr.alter {
            background-color: #f5fafe;
        }
    </style>
</head>
<body>

<p>
    成功付款:
</p>

<table  width="10%" class="table">
<tr>
    <th>id</th>
</tr>

<#if successPaymentIds?exists>
    <#list successPaymentIds as successPaymentId>
    <tr>
        <td>${successPaymentId?c}</td>
    </tr>
    </#list>
</#if>
</table>


<br><br><br><br>
<p>
    失败付款:
</p>


<table width="60%" class="table">
<tr>
    <th>id</th>
    <th>失败原因</th>
</tr>

<#if failedPaymentMap?exists>
    <#list failedPaymentMap?keys as failedPaymentId>
    <tr>
        <td>${failedPaymentId}</td>
        <td>${failedPaymentMap[failedPaymentId]}</td>
    </tr>
    </#list>
</#if>
</table>


</body>
</html>
