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
            <li><a href="/admin/settle/payment/list">打款查询</a></li>
            <li class="active" >补贴查询</li>
            <li><a href="/admin/allowance/compensateList">赔偿查询</a></li>
        </ul>
        <!--/span-->
        <div class="span12">
            <div class="row-fluid">
                <div id="legend1">
                    <legend>查询补贴</legend>
                </div>

                <div class="span1">
                </div>
                <!--/span-->
                <div class="span9">
                    <form id="searchForm" class="form-horizontal" action="/admin/allowance/detailList" role="form">
                        <div class="control-group date form_datetime">
                            <div class="controls">
                                门店名称：
                                <input id="shopName" name="shopName" type="text" class="input-medium"
                                       value="<#if shopName?exists>${shopName}</#if>">
                                <button type="submit" class="btn btn-primary">查询</button>
                            </div>

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
                                状态
                            </th>
                            <th style="background-color: #faf2cc">
                                设备id
                            </th>
                            <th style="background-color: #faf2cc">
                                poiId
                            </th>
                            <th style="background-color: #faf2cc">
                                门店名称
                            </th>
                            <th style="background-color: #faf2cc">
                                merchant id
                            </th>
                            <th style="background-color: #faf2cc">
                                付款单号
                            </th>



                            <th style="background-color: #faf2cc">
                                补贴开始时间
                            </th>
                            <th style="background-color: #faf2cc">
                                补贴结束时间
                            </th>

                            <th style="background-color: #faf2cc">
                                补贴金额
                            </th>
                            <th style="background-color: #faf2cc">
                                应打款日期
                            </th>

                        </tr>

                    <#if allownaceList?exists>
                        <#list allownaceList as allownace>
                            <tr>
                            <td>
                                <#if allownace.status==0>
                                    <img src="/admin/img/neww.png" height="40" width="40"/>

                                <#elseif allownace.status==3>
                                    <img src="/admin/img/error.png" height="40" width="40"/>

                                <#elseif allownace.status==5>
                                    <img src="/admin/img/error.png" height="40" width="40"/>


                                <#elseif allownace.status==2>
                                    <img src="/admin/img/question.png" height="40" width="40"/></td>

                                <#elseif allownace.status==4>
                                    <img src="/admin/img/check.png" height="40" width="40"/></td>

                                </#if>
                                </td>

                                <td>
                                    <#if allownace.status?exists>
                                        <#if allownace.status==0>未打款（0）
                                        <#elseif allownace.status==1>待付（1）
                                        <#elseif allownace.status==2>付款请求发送成功（2）
                                        <#elseif allownace.status==3>付款请求发送失败（3）
                                        <#elseif allownace.status==4>付款成功（4）
                                        <#elseif allownace.status==5>付款失败（5）
                                        <#elseif allownace.status==6>付款异常（6）
                                        <#else>未知
                                        </#if>
                                    </#if>
                                </td>
                                <td><#if allownace.deviceId?exists>${allownace.deviceId?c}</#if></td>
                                <td><#if allownace.shopId?exists>${allownace.shopId?c}</#if></td>
                                <td><#if allownace.shopName?exists>${allownace.shopName}</#if></td>
                                <td><#if allownace.merchantId?exists>${allownace.merchantId?c}</#if></td>
                                <td><#if allownace.paymentNo?exists>
                                ${allownace.paymentNo}
                                    <#if allownace.status==4>
                                        <button onclick="javascript:window.open('http://mpay.sankuai.com/mis/funds/query?partnerCode=smart-pos&init=false&outNo=&payTaskId=&merchantNo=' + '${allownace.paymentNo}');"
                                                type="button" class="btn btn-info btn-small">查看详情
                                        </button>
                                    </#if>
                                </#if>
                                </td>

                                <td><#if allownace.allowanceBegin?exists>${allownace.allowanceBegin?c}</#if></td>
                                <td><#if allownace.allowanceEnd?exists>${allownace.allowanceEnd?c}</#if></td>


                                <td><#if allownace.allowance?exists>${allownace.allowance?c}</#if></td>

                                <td><#if allownace.paymentDate?exists>${allownace.paymentDate?c}</#if></td>

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
