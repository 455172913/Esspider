<#assign sideConfig = {
    "sidebar":[
        {
            "cate": "结算查询",
            "list": [
                {
                    "name": "付款查询",
                    "href": "/admin/settle/payment/list"
                },
                {
                    "name": "结算查询",
                    "href": "/admin/settle/allPayment/list"
                },
                {
                    "name":"结算明细",
                    "href":"/admin/settle/queryDetail/listIndex"
                }
            ]
        },
        {
            "cate": "押金管理",
            "list": [
                {
                    "name": "押金查询",
                    "href": "/admin/device/deposit"
                },
                {
                    "name": "押金录入",
                    "href": "/admin/settle/deposit/query"
                },
                {
                    "name": "押金审核",
                    "href": "/admin/settle/deposit/check"
                }
            ]
        },
        {
            "cate": "资金申请",
            "list": [
                {
                    "name": "补贴查询",
                    "href": "/admin/allowance/allowanceList"
                },
                {
                    "name": "赔付查询",
                    "href": "/admin/allowance/compensateList"
                },
                {
                    "name": "资金申请",
                    "href": "/admin/allowance/compensate/submitPage"
                },
                {
                    "name": "资金审核",
                    "href": "/admin/allowance/compensate/checkIndex"
                }
            ]
        },
        {
            "cate": "撤机返款",
            "list": [
                {
                    "name": "撤机审核",
                    "href": "/admin/deviceRevoke/checkIndex"
                }
            ]
        },
        {
            "cate": "退票管理",
            "list": [
                {
                    "name": "退票登记",
                    "href": "/admin/refund/refundPage"
                },
                {
                    "name": "退票查询",
                    "href": "/admin/refund/refundSearch"
                }
            ]
        }
    ]
}>
<div class="sidebar">
    <div class="nav">
		<#list sideConfig.sidebar as item>
            <ul>
                <li>
                    <h4>${item.cate}</h4>
                </li>
                <#list item.list as second>
                    <li <#if second.name == pageConfig.title>class="active"</#if> >
                        <a href="${second.href}" >${second.name}</a>
                    </li>
                </#list>
            </ul>
        </#list>
    </div>
</div>