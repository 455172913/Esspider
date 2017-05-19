<#include "/core/frame.ftl">
<@html >
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <meta name="keywords" content="scclui框架">
    <meta name="description" content="scclui为轻量级的网站后台管理系统模版。">
    <title>首页</title>

    <link rel="stylesheet" href="/css/common/layui/css/layui.css">
    <link rel="stylesheet" href="/css/common/css/sccl.css">

</head>

<body class="login-bg">
<div class="login-box">
    <header>
        <h1>爬虫影视</h1>
    </header>
    <div class="login-main">
        <form action="/admin/register" class="layui-form" method="post">
            <div class="layui-form-item">
                <label class="login-icon">
                    <i class="layui-icon"></i>
                </label>
                <input type="text" name="username" lay-verify="username" autocomplete="off" placeholder="这里输入登录名" class="layui-input">
            </div>
            <div class="layui-form-item">
                <label class="login-icon">
                    <i class="layui-icon"></i>
                </label>
                <input type="password" name="password" lay-verify="password" autocomplete="off" placeholder="这里输入密码" class="layui-input">
            </div>
            <div class="layui-form-item">
                <label class="login-icon">
                    <i class="layui-icon"></i>
                </label>
                <input type="repassword" name="repassword" lay-verify="repassword" autocomplete="off" placeholder="确认密码" class="layui-input">
            </div>
            <div class="layui-form-item">
                <div class="pull-left login-remember">

                </div>
                <div class="pull-right">
                    <button class="layui-btn layui-btn-primary" lay-submit="" lay-filter="login">
                        <i class="layui-icon"></i> 注册
                    </button>
                </div>
                <div class="clear"></div>
            </div>
        </form>
    </div>
    <footer>

    </footer>
</div>
<script type="text/html" id="code-temp">
    <div class="login-code-box">
        <input type="text" class="layui-input" id="code" />
        <img id="valiCode" src="/manage/validatecode?v=636150612041789540" alt="验证码" />
    </div>
</script>
<script src="/css/common/layui/layui.js"></script>
<script>
    layui.use(['layer', 'form'], function () {
        var layer = layui.layer,
                $ = layui.jquery,
                form = layui.form();

        form.verify({
            userName: function (value) {
                if (value === '')
                    return '请输入用户名';
            },
            password: function (value) {
                if (value === '')
                    return '请输入密码';
            }
            repassword: function (value) {
                if (value === '')
                    return '请输入确认密码';
            }
        });

        var errorCount = 0;
        form.on('submit(demo1)', function(data){
            layer.alert(JSON.stringify(data.field), {
                title: '最终的提交信息'
            })
            $.ajax({
                url:"/login/insert",
                type:"get",
                data:data.field,
                success:function(da){
                    layer.alert("添加成功");
                    window.location.reload();
                }
            })
            return false;
        });
        form.on('submit(login)', function (data) {
            window.location.href = "..common/page/index.html";
            /*if (errorCount > 5) {
                layer.open({
                    title: '<img src="' + location.origin + '/Plugins/layui/images/face/7.gif" alt="[害羞]">输入验证码',
                    type: 1,
                    content: document.getElementById('code-temp').innerHTML,
                    btn: ['确定'],
                    yes: function (index, layero) {
                        var $code = $('#code');
                        if ($code.val() === '') {
                            layer.msg('输入验证码啦，让我知道你是人类。');
                            isCheck = false;
                        } else {
                            $('input[name=verifyCode]').val();
                            var params = data.field;
                            params.verifyCode = $code.val();
                            submit($,params);
                            layer.close(index);
                        }
                    },
                    area: ['250px', '150px']
                });
                $('#valiCode').off('click').on('click', function () {
                    this.src = '/manage/validatecode?v=' + new Date().getTime();
                });
            }else{
                submit($,data.field);
            }

            return false;*/
        });

    });

    /*function submit($,params){
        $.post('/manage/login',params , function (res) {
            if (!res.success) {
                if (res.data !== undefined)
                    errorCount = res.data.errorCount
                layer.msg(res.message,{icon:2});
            }else
            {
                layer.msg(res.message,{icon:1},function(index){
                    layer.close(index);
                    location.href='/manage';
                });
            }
        }, 'json');
    }*/
</script>
</@html>