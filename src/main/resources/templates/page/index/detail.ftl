<#include "/core/frame.ftl">
<@html css="/css/lib/bootstrap.css">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>list</title>
    <style type="text/css">
        *{
            margin:0;
            padding:0;
            text-decoration:none;
        }
        body{
            background: url("/img/picjumbo-bg5.jpg") 0% 0% / 100% no-repeat fixed;
        }
        ul,li{
            list-style:none;
            display:inline-block;
        }
        i,em{font-style: normal;font-size:14px;}
        .backbg-color{
            width: 100%;
            height:auto;
            float: left;
            background-color: rgba(37, 35, 50, 0.67);
            padding-bottom: 50px;
        }
        .header{
            margin-top:50px;
            width:100%;
        }
        .header .navbar{
            background:#fff;
            width:80%;
            margin:0 10%;
            padding:15px 0;
        }
        .logo{
            font-size: 24px;
            line-height: 20px;
            font-weight: 300;
            padding:15px;
            display:inline-block;
        }
        .mynav{
            float:right;
            margin-top:15px;
        }
        .mynav li{
            padding:0 10px;
        }
        .mynav li a{
            padding:15px;
            font-size: 12px;
            cursor:pointer;
            color: #777;
        }
        .mynav li a:hover{
            color:red;
        }
        .active{
            color:#8FA5AF!important;
        }
        .main{
            background:rgba(255,255,255,0.3);
            width:80%;
            margin:10px 10% 0 10%;
            padding-bottom:20px;
        }
        .nav{
            border-bottom:1px solid #ddd;
        }
        .nav span{
            display: inline-block;
            width:80px;
            padding:9px 0;
            background:#fff;
            font-size:16px;
            font-weight:300;
            font-family: "Microsoft Yahei";
            text-align:center;
            cursor:pointer;
        }
        .nav span:hover{
            color: red;
        }
        .red{
            color:#fff !important;
            background:red !important;
        }
        .nav-list{
            padding-bottom:10px;
            background:#fff;
            display:none;
        }
        .nav2,.nav3{
            border-bottom:1px solid #ddd;
        }
        .nav2 span,.nav3 span{
            display: inline-block;
            width:60px;
            padding:9px 0;
            background:#fff;
            font-size:14px;
            font-weight:300;
            font-family: "Microsoft Yahei";
            text-align:center;
            cursor:pointer;
        }
        .nav2 span:hover,.nav3 span:hover{
            color: red;
        }
        .red2{
            color:red !important;
        }
        .title{
            border-bottom: 1px solid #ddd;
        }
        .title i{
            display: block;
            float:left;
            width:50%;
            text-align: center;
            padding:5px 0;
        }
        .content1 i,.content1 a{
            display: block;
            float:left;
            width:50%;
            text-align: center;
            padding:5px 0;
            color:#3a3a3a;
        }
    </style>
</head>
<body>
<div class="backbg-color">
    <div class="header">
        <div class="navbar">
            <div class="logo"><a  href="/admin/index"><span style="color:red;">影视</span>爬虫 </a></div>
            <ul class="mynav">
                <li><a href="#" class="active">待定</a></li>
                <li><a href="#">待定</a></li>
                <li><a href="#">待定</a></li>
                <li><a href="#">待定</a></li>
                <li><a href="#">待定</a></li>
                <li><a href="#">待定</a></li>
            </ul>
        </div>
    </div>
    <div class="main">
        <!-- 内容列表 -->
        <div class="nav">
            <span  oid="0"><a href="/admin/detail?type=1">播放量</a></span>
            <span style="margin-left:-8px;" oid="1"><a href="/admin/detail?type=3">评分</a></span>
        </div>
        <div class="nav-list" style="display:block;">
            <div class="nav2">
                <span class="red2" oid="0"><a href="/admin/detail?type=1">优酷</a></span>
                <span style="margin-left:-8px;" oid="1"><a href="/admin/detail?type=2">搜狐</a></span>
            </div>
            <!-- 内容1 -->
            <div class="title">
                <i>片名</i>
                <i>播放量</i>
                <div style="clear:both;"></div>
            </div>
            <!-- 内容1 -->
            <div class="content1">
                <#list result.list as temp>
                    <div class="detial">
                        <a href="${temp.url}">${temp.name}</a>
                        <i><#if temp.count?exists>${temp.count}</#if>
                           <#if temp.rate?exists>${temp.rate}</#if> </i>
                        <div style="clear:both;"></div>
                    </div>
                </#list>
            </div>
        </div>
        <div class="nav-list">
            <div class="nav3">
                <span class="red2" oid="4">豆瓣</span>
            </div>
            <!-- 内容2 -->
        </div>
        <!-- 内容列表 -->
    </div>
</div>
<script type="text/javascript" src="js/jquery-1.9.1.min.js"></script>
<script type="text/javascript">
    // 预加载
    $(function(){
        // 获取屏幕高度,设置阴影背景高度
        var aliheight = document.documentElement.clientHeight;
        var bgheight = $(".backbg-color").height();
        if(aliheight>bgheight){
            $(".backbg-color").css("height",aliheight-50);
        }
    })
    //设置点击菜单触发特效
    $(".mynav").on("click","li a",function(){
        var _this = $(this);
        $(".mynav li a").removeClass("active");
        _this.addClass("active");
    })
    // 播放量和评分切换
    $(".nav span").click(function(){
        var index = $(this).attr("oid");
        $(".nav span").removeClass("red");
        $(this).addClass("red");
        $(".nav-list").css("display","none");
        $(".nav-list:eq("+index+")").show();
    })
    $(".nav2 span").click(function(){
        $(".nav2 span").removeClass("red2");
        $(this).addClass("red2");
    })
    $(".nav3 span").click(function(){
        $(".nav3 span").removeClass("red2");
        $(this).addClass("red2");
    })
</script>
</@html>