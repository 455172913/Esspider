<#include "/core/frame.ftl">
<@html >

<head xmlns="http://www.w3.org/1999/xhtml" xmlns:th="http://www.thymeleaf.org" xmlns:sec="http://www.thymeleaf.org/thymeleaf-extras-springsecurity3"
>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width,initial-scale=1"/>
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
            background:#fff;
            width:80%;
            margin:10px 10% 0 10%;
            padding-bottom:20px;
        }
        .movie{
            margin-top:20px;
            width:15%;
            padding:0 2.5%;
            float:left;
            position: relative;
        }
        .pic{
            display: block;
            width:100%;
        }
        .pic img{
            width:100%;
            height: 300px;
        }
        .info{
            position:absolute;
            width:75%;
            height:auto;
            background:rgba(220,20,60,0.6);
            bottom:0;
            left:0;
            right:0;
            z-index: 5;
            margin:0 auto;
            text-align: center;
            color:#fff;
            font-size:14px;
            padding:10px 0;
            font-weight:300;
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
            <#list result.list as temp>
                    <div class="movie">
                        <a class="pic" href="${temp.play_url}">
                            <img src="${temp.img_url}">
                            <div class="info">
                                <p>${temp.name}</p>
                                <p>${temp.domain}</p>
                            </div>
                        <#--</a>-->
                    </div>
            </#list>
        <!-- 内容列表 -->

        <!-- 清除浮动 -->
        <div style="clear:both;"></div>
        <!-- 清除浮动 -->
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
</script>

</@html>