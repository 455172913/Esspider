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
            position:relative;
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
        .title2 i{
            display: block;
            float:left;
            width:33%;
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
        .content2 i,.content2 a{
            display: block;
            float:left;
            width:50%;
            text-align: center;
            padding:5px 0;
            color:#3a3a3a;
        }
        .content3 i,.content3 a{
            display: block;
            float:left;
            width:33%;
            text-align: center;
            padding:5px 0;
            color:#3a3a3a;
        }
        .chaxun{
            width:235px;
            height:30px;
            position:absolute;
            top:3px;
            right:50px;
            background:#fff;
            padding-left:10px;
            border-radius: 3px;
            border:1px solid #999;
        }
        #cx1{
            width:200px;
            height:28px;
            border:0;
            outline:none;
            position:absolute;
            top:0;
        }
        #cx2{
            width: 35px;
            height:30px;
            background:red;
            position: absolute;
            top:0;
            left:210px;
            border-radius: 0 3px 3px 0;
        }
    </style>
</head>
<body>
<div class="backbg-color">
    <div class="header">
        <div class="navbar">
            <div class="logo"><a  href="/admin/index"><span style="color:red;">影视</span>爬虫 </a></div>
            <ul class="mynav">
                <li><a href="/admin/detailPage" class="active">日常采集结果</a></li>
                <li><a href="/crawler/detailCrawler" class="active">进行日常采集</a></li>

            </ul>
        </div>
    </div>
    <div class="main">
        <!-- 内容列表 -->
        <div class="nav">
            <span  oid="0" class="red">播放量</span>
            <span style="margin-left:-8px;" oid="1">评分</span>
            <div class="chaxun">
                <input type="text" name="title" placeholder="请输入需要搜索的内容" id="cx1">
                <img src="/img/cx.png" id="cx2">
            </div>
        </div>
        <div class="nav-list" style="display:block;">
            <div class="nav2">
                <span class="red2" oid="0">优酷</span>
                <span style="margin-left:-8px;" oid="1">搜狐</span>
            </div>
            <!-- 内容1 -->
            <div class="title">
                <i>片名</i>
                <i>播放量</i>
                <div style="clear:both;"></div>
            </div>
            <!-- 内容1 -->
            <div class="content1">
                <#--<#list result.list as temp>-->
                    <#--<div class="detial">-->
                        <#--<a href="${temp.url}">${temp.name}</a>-->
                        <#--<i><#if temp.count?exists>${temp.count}</#if>-->
                           <#--<#if temp.rate?exists>${temp.rate}</#if> </i>-->
                        <#--<div style="clear:both;"></div>-->
                    <#--</div>-->
                <#--</#list>-->
            </div>
        </div>
        <div class="nav-list">
            <div class="nav3">
                <span class="red2" oid="4">豆瓣</span>
            </div>
            <div class="title">
                <i>片名</i>
                <i>评分</i>
                <div style="clear:both;"></div>
            </div>
            <!-- 内容2 -->
            <div class="content2"></div>
        </div>
        <div class="nav-list">
            <div class="title2">
                <i>片名</i>
                <i>来源</i>
                <i>推荐系数</i>
                <div style="clear:both;"></div>
            </div>
            <div class="content3"></div>
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
        if(index==0){
            var oid = 1;
            getajax(oid);
            $(".nav2 span").removeClass("red2");
            $(".nav2 span:eq(0)").addClass("red2");
        }else{
            var oid = 3;
            getajax2(oid);
        }

    })
    $(".nav2 span").click(function(){
        var index = $(this).attr("oid");
        $(".nav2 span").removeClass("red2");
        $(this).addClass("red2");
        if(index==0){
            var oid = 1;
        }else{
            var oid = 2;
        }
        getajax(oid);
    })
    $(".nav3 span").click(function(){
        $(".nav3 span").removeClass("red2");
        $(this).addClass("red2");
    })
    function getajax(oid){
//        alert(oid);
        $.ajax({
            url:"/admin/detail",
            type:"get",
            data:{"type":oid},
            success:function(data){
//                console.log(data);
                $(".content1").empty();
//                alert(data.data.result.length);
                for(i=0;i<data.data.result.length;i++){
                    $(".content1").append('<div class="detial"><a href="'+data.data.result[i].url+'">'+data.data.result[i].name+'</a> <i>'+data.data.result[i].count+'</i> <div style="clear:both;"></div> </div>');
//                    $(".content1").append(data.data.result[i].name);
                }
            }
        })
    }
    getajax(1);
    function getajax2(oid){
//        alert(oid);
        $.ajax({
            url:"/admin/detail",
            type:"get",
            data:{"type":oid},
            success:function(data){
//                console.log(data);
                $(".content2").empty();
//                alert(data.data.result.length);
                for(i=0;i<data.data.result.length;i++){
                    $(".content2").append('<div class="detial"><a href="'+data.data.result[i].url+'">'+data.data.result[i].name+'</a> <i>'+data.data.result[i].rate+'</i> <div style="clear:both;"></div> </div>');
//                    $(".content1").append(data.data.result[i].name);
                }
            }
        })
    }
//    点击搜索
    $("#cx2").click(function(){
        var name = $("#cx1").val();
        if(name==''||name==null){
            alert("请输入您想要搜索的内容");
            return false;
        }
        $.ajax({
            url:"/crawler/crawlerSearch",
            type:"get",
            data:{"name":name},
            success:function(data){
                console.log(data);
                $(".content3").empty();
//                alert(data.data.result.length);
                for(i=0;i<data.data.result.length;i++){
                    if(data.data.result[i].rate==null){
                        data.data.result[i].rate = data.data.result[i].count;
                    }
                    $(".content3").append('<div class="detial"><a href="'+data.data.result[i].url+'">'+data.data.result[i].name+'</a> <i>'+data.data.result[i].domain+'</i> <i>'+data.data.result[i].rate+'</i><div style="clear:both;"></div> </div>');
//                    $(".content1").append(data.data.result[i].name);
                }
            }
        })
        $(".nav span").removeClass("red");
        $(".nav-list").css("display","none");
        $(".nav-list:eq(2)").show();
    })


    $("#cx1").keydown(function(){
        if(event.keyCode==13){
            $("#cx2").click();
        }
    });
</script>
</@html>