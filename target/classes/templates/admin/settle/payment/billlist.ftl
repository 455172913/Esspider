<html xmlns="http://www.w3.org/1999/html">
<head>
    <title></title>
    <link type="text/css" href="/admin/css/bootstrap.min.css" rel="stylesheet"/>
    <link type="text/css" href="/admin/css/bootstrap-datetimepicker.min.css" rel="stylesheet"/>

    <!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
    <script src="http://cdn.bootcss.com/jquery/1.11.1/jquery.min.js"></script>
    <script type="text/javascript" src="/admin/js/bootstrap-paginator.min.js"></script>
    <script type="text/javascript" src="/admin/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="/admin/js/bootstrap-datetimepicker.min.js"></script>

    <style type="text/css">
        body, table {
            font-size: 12px;
        }

        .table td {
            height: 100px;
            text-align: center;
            vertical-align: middle;
        }

        .table th {
            text-align: center;
            vertical-align: middle;
        }
        .sim-nav{
            font-size: 20px;
            margin-top: 15px;
        }
        .sim-nav li{
            display: inline;
            list-style: none;
            border: 1px solid #ccc;
            padding: 10px 15px;
        }
        .active{
            background: #006dcc;
            color: #fff;
        }

    </style>
</head>
<body>

<div class="container-fluid">
    <div class="row-fluid">
        <!--/span-->
        <div class="span12">
            <div class="row-fluid">
                <div id="legend1">
                    <legend>查询付款</legend>
                </div>

                <div class="span1">
                </div>
                <!--/span-->
                <div class="span9">
                    <form id="searchForm" class="form-horizontal" action="/admin/settle/payment/list" role="form">
                        <div class="control-group date form_datetime">
                            <div class="controls">
                                查询支付日期：
                                <input id="paymentDateDD" name="paymentDateDD" type="text" class="input-medium"
                                       value="<#if paymentDateDDStr?exists>${paymentDateDDStr}</#if>">
                                <span class="add-on"><i class="icon-th"></i></span>
                                &nbsp;&nbsp;&nbsp;
                                <button type="submit" class="btn btn-primary">查询</button>
                            </div>
                            <script type="text/javascript">
                                $(".form_datetime").datetimepicker({
                                    format: "yyyy-mm-dd",
                                    autoclose: true,
                                    todayBtn: true,
                                    minView: 2,
                                    pickerPosition: "bottom-left"
                                });
                            </script>
                        </div>

                    </form>
                </div>
                <!--/span-->
                <div class="span1">
                </div>

            </div>

            <div class="row-fluid">
                <div id="span11">
                    <div>
                        <#--<button type="button" class="btn btn-small btn-warning" onclick="btn_allpay('${paymentDate}')">-->
                            <#--批量付款-->
                        <#--</button>-->
                    </div>
                </div>
                <div class="span1">
                </div>
            </div>


            <div class="row-fluid">
                <div class="span12">
                    <table class="table table-bordered table-striped">
                        <tr>
                            <th style="background-color: #faf2cc">
                                所属公司
                            </th>
                            <th style="background-color: #faf2cc">
                                商户名称
                            </th>
                            <th style="background-color: #faf2cc">
                                商户ID
                            </th>
                            <th style="background-color: #faf2cc">
                                支付类型
                            </th>
                            <th style="background-color: #faf2cc">
                                总金额
                            </th>

                            <th style="background-color: #faf2cc">
                                手续费
                            </th>

                            <th style="background-color: #faf2cc">
                                结算商家费用
                            </th>
                            <th style="background-color: #faf2cc">
                                时间
                            </th>
                        </tr>

                    <#if billList?exists>
                        <#list billList as payment>
                            <tr>
                                <td><#if payment.company?exists>${payment.company}</#if></td>
                                <td><#if payment.merchantName?exists>${payment.merchantName}</#if></td>
                                <td><#if payment.merchantId?exists>${payment.merchantId?c}</#if></td>
                                <td><#if payment.payTypeName?exists>${payment.payTypeName}</#if></td>
                                <td><#if payment.totalMoney?exists>${payment.totalMoney}</#if></td>
                                <td><#if payment.commissionMoney?exists>${payment.commissionMoney}</#if></td>
                                <td><#if payment.settleMoney?exists>${payment.settleMoney}</#if></td>
                                <td><#if payment.payTime?exists>${payment.payTime}</#if></td>
                            </tr>
                        </#list>
                    </#if>

                    </table>
                </div>

            </div>
        </div>
    </div>
</div>
<p>


</p>


</body>
</html>
