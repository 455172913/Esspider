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
        <ul class="sim-nav">
            <li class="active">打款查询</li>
            <li><a href="/admin/allowance/detailList">补贴查询</a></li>
            <li><a href="/admin/allowance/compensateList">赔偿查询</a></li>
        </ul>
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

                            </th>
                            <th style="background-color: #faf2cc">
                                id
                            </th>
                            <th style="background-color: #faf2cc">
                                状态
                            </th>
                            <th style="background-color: #faf2cc">
                                设备id
                            </th>
                            <th style="background-color: #faf2cc">
                                商户名称
                            </th>
                            <th style="background-color: #faf2cc">
                                merchant id
                            </th>
                            <th style="background-color: #faf2cc">
                                付款单号
                            </th>

                            <th style="background-color: #faf2cc">
                                外部单号
                            </th>

                            <th style="background-color: #faf2cc">
                                打款结果
                            </th>
                            <th style="background-color: #faf2cc">
                                task id
                            </th>
                            <th style="background-color: #faf2cc">
                                打款请求时间
                            </th>
                            <th style="background-color: #faf2cc">
                                打款响应时间
                            </th>

                            <th style="background-color: #faf2cc">
                                应付
                            </th>
                            <th style="background-color: #faf2cc">
                                实付
                            </th>
                            <th style="background-color: #faf2cc">
                                结算日期
                            </th>
                            <th style="background-color: #faf2cc">
                                结算id
                            </th>
                            <th style="background-color: #faf2cc">
                                付款明细
                            </th>
                            <th style="background-color: #faf2cc">
                                账单明细
                            </th>

                        </tr>

                    <#if payments?exists>
                        <#list payments as payment>
                            <tr>
                            <td>
                                <#if payment.status==0>
                                    <img src="/admin/img/neww.png" height="40" width="40"/>

                                <#elseif payment.status==3>
                                    <img src="/admin/img/error.png" height="40" width="40"/>

                                <#elseif payment.status==5>
                                    <img src="/admin/img/error.png" height="40" width="40"/>


                                <#elseif payment.status==2>
                                    <img src="/admin/img/question.png" height="40" width="40"/></td>

                                <#elseif payment.status==4>
                                    <img src="/admin/img/check.png" height="40" width="40"/></td>

                                </#if>
                                </td>

                                <td><#if payment.id?exists>${payment.id?c}</#if></td>
                                <td>
                                    <#if payment.status?exists>
                                        <#if payment.status==0>新建（0）
                                        <#elseif payment.status==1>待付（1）
                                        <#elseif payment.status==2>付款请求发送成功（2）
                                        <#elseif payment.status==3>付款请求发送失败（3）
                                        <#elseif payment.status==4>付款成功（4）
                                        <#elseif payment.status==5>付款失败（5）
                                        <#elseif payment.status==6>付款异常（6）
                                        <#else>未知
                                        </#if>
                                    </#if>
                                </td>
                                <td><#if payment.deviceId?exists>${payment.deviceId?c}</#if></td>
                                <td><#if payment.shopName?exists>${payment.shopName}</#if></td>
                                <td><#if payment.merchantId?exists>${payment.merchantId?c}</#if></td>
                                <td><#if payment.paymentNo?exists>${payment.paymentNo}</#if></td>

                                <td><#if payment.outno?exists>${payment.outno}</#if></td>
                                <td><#if payment.reason?exists>${payment.reason}</#if></td>
                                <td><#if payment.taskId?exists>${payment.taskId?c}</#if></td>
                                <td><#if payment.paymentReqTime?exists>${payment.paymentReqTimeStr}</#if></td>
                                <td><#if payment.paymentConfirmTime?exists>${payment.paymentConfirmTimeStr}</#if></td>


                                <td><#if payment.perPay?exists>${payment.perPay?c}</#if></td>
                                <td><#if payment.realPay?exists>${payment.realPay?c}</#if></td>

                                <td><#if payment.settleDate?exists>${payment.settleDate?c}</#if></td>
                                <td><#if payment.settleId?exists>${payment.settleId?c}</#if></td>
                                <td><#if payment.payDetailUrl?exists>${payment.payDetailUrl}</#if></td>


                                <td>
                                    <#if payment.status==0>
                                        <#--<button onclick="btn_pay(${payment.id?c})" type="button"-->
                                                <#--class="btn btn-warning btn-small">付款-->
                                        <#--</button>-->

                                    <#elseif payment.status==3>
                                        <button onclick="javascript:window.open('http://mpay.sankuai.com/mis/funds/query?partnerCode=smart-pos&init=false&outNo=&payTaskId=&merchantNo=' + '${payment.paymentNo}');"
                                                type="button" class="btn btn-info btn-small">查看详情
                                        </button>
                                        <#--<button onclick="btn_repay(${payment.id?c})" type="button"-->
                                                <#--class="btn btn-danger btn-small">重新付款-->
                                        <#--</button>-->

                                    <#elseif payment.status==5>
                                        <button onclick="javascript:window.open('http://mpay.sankuai.com/mis/funds/query?partnerCode=smart-pos&init=false&outNo=&payTaskId=&merchantNo=' + '${payment.paymentNo}');"
                                                type="button" class="btn btn-info btn-small">查看详情
                                        </button>
                                        <button onclick="btn_repay(${payment.id?c})" type="button"
                                                class="btn btn-danger btn-small">重新付款
                                        </button>


                                    <#elseif payment.status==2>
                                        <button onclick="javascript:window.open('http://mpay.sankuai.com/mis/funds/query?partnerCode=smart-pos&init=false&outNo=&payTaskId=&merchantNo=' + '${payment.paymentNo}');"
                                                type="button" class="btn btn-info btn-small">查看详情
                                        </button>


                                    <#elseif payment.status==4>
                                        <button onclick="javascript:window.open('http://mpay.sankuai.com/mis/funds/query?partnerCode=smart-pos&init=false&outNo=&payTaskId=&merchantNo=' + '${payment.paymentNo}');"
                                                type="button" class="btn btn-info btn-small">查看详情
                                        </button>

                                    </#if>

                                </td>


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


<script type='text/javascript' language='javascript'>
    function btn_repay(paymentId) {
        if (paymentId.length <= 0) {
            alert("请输入paymentId");
            return false;
        }


        if (confirm("请务必点击'查看详情'确认该付款之前没有成功。如果之前的确没有付款成功，请点击'确认'来重复付款")) {
            window.open('/admin/settle/payment/repay?paymentId=' + paymentId);
        } else
            return false;

    }
</script>

<script type='text/javascript' language='javascript'>
    function btn_pay(paymentId) {
        if (paymentId.length <= 0) {
            alert("请输入paymentId");
            return false;
        }


        if (confirm("该操作会将本付款流水状态设置为1(待付款)。确认操作？")) {
            window.open('/admin/settle/payment/pay?paymentId=' + paymentId);
        } else
            return false;

    }
</script>


<script type='text/javascript' language='javascript'>
    function btn_allpay(paymentDate) {
        if (paymentDate.length <= 0) {
            alert("请输入paymentDate");
            return false;
        }


        if (confirm("该操作会将该天所有新建(状态0)付款流水状态设置为1(待付款)。确认操作？")) {
            window.open('/admin/settle/payment/allpay?paymentDate=' + paymentDate);
        } else
            return false;

    }
</script>
