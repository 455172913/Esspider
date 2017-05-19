<#include "/core/frame.ftl">
<@html >

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <title>用户管理</title>
    <link rel="stylesheet" href="/css/common/layui/css/layui.css">
</head>
<body>
<!-- 选项卡 -->
<div class="layui-tab layui-tab-card">

    <div class="layui-tab-content">

        <div class="layui-tab-item layui-show">
            <form class="layui-form layui-form-pane" action="">
                <div class="layui-form-item">
                    <label class="layui-form-label">用户名</label>
                    <div class="layui-input-block">
                        <input type="text" name="username" lay-verify="required" autocomplete="off" placeholder="请输入名称" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">昵称</label>
                    <div class="layui-input-block">
                        <input type="text" name="name" lay-verify="required" autocomplete="off" placeholder="请输入昵称" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">密码</label>
                    <div class="layui-input-inline">
                        <input type="password" name="password" placeholder="请输入密码" autocomplete="off" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">确认密码</label>
                    <div class="layui-input-inline">
                        <input type="password" name="repassword" lay-verify="required" placeholder="请输入" autocomplete="off" class="layui-input">
                    </div>
                </div>

                <div class="layui-form-item">
                    <div class="layui-input-block">
                        <button class="layui-btn" lay-submit="" lay-filter="demo1">立即提交</button>
                        <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                    </div>
                </div>
            </form>
        </div>

    </div>
</div>
<script type="text/javascript" src="/css/common/js/jquery-3.1.1.min.js"></script>
<script src="/css/common/layui/layui.js"></script>
<script>
    //查询全部
    function tea(){
        $.ajax({
            url:"/login/selectAllTeacher",
            type:"get",
            success:function(data){
                $("#content1").empty();
                console.log(data);
                for(i=0;i<data.data.result.length;i++){
                    if(data.data.result[i].root==0){
                        var root = "普通用户";
                    }else if(data.data.result[i].root==1){
                        var root = "管理员";
                    }
                    $("#content1").append('<tr><td><input type="checkbox" name="'+data.data.result[i].id+'" lay-skin="primary"></td><td>'+data.data.result[i].username+'</td><td>'+data.data.result[i].password+'</td><td>'+data.data.result[i].teachername+'</td><td>'+root+'</td><td><button class="bj layui-btn" oid="'+data.data.result[i].id+'" uname="'+data.data.result[i].username+'" pwd="'+data.data.result[i].password+'" tname="'+data.data.result[i].teachername+'" root="'+data.data.result[i].root+'" style="padding:0 32px;">编辑</button></td> </tr>');
                }
            }
        })
    }
    tea();
    //删除
    function delkc() {
        var index = $("#content1 .layui-form-checked").length;
        var tt = 0;
        for(i=0;i<index;i++){
            var id = $("#content1 .layui-form-checked:eq("+i+")").prev("input").attr("name");
//            alert(id);
            $.ajax({
                url:"/login/delete",
                type:"get",
                data:{"id":id},
                success:function(data){
                    tt++;
                    if(tt==index){
                        alert("删除成功");
                        window.location.reload();
                    }
                }
            })
        }
    }
    $("#delkc").click(function(){
        delkc();
    })
    //查询
    function kccx(name){
        $.ajax({
            url:"/login/selectTeacherByName",
            type:"get",
            data:{"teacherName":name},
            success:function(data){
                console.log(data);
//                alert(data.data.result[0].lessonname);
                $("#content1").empty();
                for(i=0;i<data.data.result.length;i++){
                    if(data.data.result[i].root==0){
                        var root = "普通用户";
                    }else if(data.data.result[i].root==1){
                        var root = "管理员";
                    }
                    $("#content1").append('<tr><td><input type="checkbox" name="'+data.data.result[i].id+'" lay-skin="primary"></td><td>'+data.data.result[i].username+'</td><td>'+data.data.result[i].password+'</td><td>'+data.data.result[i].teachername+'</td><td>'+root+'</td><td><button class="bj layui-btn" oid="'+data.data.result[i].id+'" uname="'+data.data.result[i].username+'" pwd="'+data.data.result[i].password+'" tname="'+data.data.result[i].teachername+'" root="'+data.data.result[i].root+'" style="padding:0 32px;">编辑</button></td> </tr>');
                }
            }
        })
    }
    $("#kccx").click(function(){
        var name = $("#kccxbox").val();
        if(name==""||name ==null){
            alert("您还未输入内容");
            return false;
        }
        kccx(name);
    })
    $("#kccxbox").keydown(function(){
        if(event.keyCode==13){
            $("#kccx").click();
        }
    })
    //修改
    $("#content1").on("click",".bj",function(){
        $("#tcid").val($(this).attr("oid"));
        $("#tcroot").val($(this).attr("root"));
        $("#tcun").val($(this).attr("uname"));
        $("#tcpw").val($(this).attr("pwd"));
        $("#tcnm").val($(this).attr("tname"));
        $(".layui-tab li:eq(2)").click();
    })
</script>
<script>
    layui.use('form', function(){
        var $ = layui.jquery, form = layui.form();

        //全选
        form.on('checkbox(allChoose)', function(data){
            var child = $(data.elem).parents('table').find('tbody input[type="checkbox"]');
            child.each(function(index, item){
                item.checked = data.elem.checked;
            });
            form.render('checkbox');
        });
    });

    layui.use('element', function(){
        var $ = layui.jquery
                ,element = layui.element(); //Tab的切换功能，切换事件监听等，需要依赖element模块

        //触发事件
        var active = {
            tabAdd: function(){
                //新增一个Tab项
                element.tabAdd('demo', {
                    title: '新选项'+ (Math.random()*1000|0) //用于演示
                    ,content: '内容'+ (Math.random()*1000|0)
                    ,id: new Date().getTime() //实际使用一般是规定好的id，这里以时间戳模拟下
                })
            }
            ,tabDelete: function(othis){
                //删除指定Tab项
                element.tabDelete('demo', '44'); //删除：“商品管理”


                othis.addClass('layui-btn-disabled');
            }
            ,tabChange: function(){
                //切换到指定Tab项
                element.tabChange('demo', '22'); //切换到：用户管理
            }
        };

        $('.site-demo-active').on('click', function(){
            var othis = $(this), type = othis.data('type');
            active[type] ? active[type].call(this, othis) : '';
        });

        element.on('tab(test)', function(elem){
            location.hash = 'test='+ $(this).attr('lay-id');
        });

    });

    // 表单JS
    layui.use(['form', 'layedit', 'laydate'], function(){
        var form = layui.form()
                ,layer = layui.layer
                ,layedit = layui.layedit
                ,laydate = layui.laydate;

        //创建一个编辑器
        var editIndex = layedit.build('LAY_demo_editor');
        var editIndex = layedit.build('LAY_demo_editor2');

        //自定义验证规则
        form.verify({
            title: function(value){
                if(value.length < 5){
                    return '标题至少得5个字符啊';
                }
            }
            ,pass: [/(.+){6,12}$/, '密码必须6到12位']
            ,content: function(value){
                layedit.sync(editIndex);
            }
        });

        //监听指定开关
        form.on('switch(switchTest)', function(data){
            layer.msg('开关checked：'+ (this.checked ? 'true' : 'false'), {
                offset: '6px'
            });
            layer.tips('温馨提示：请注意开关状态的文字可以随意定义，而不仅仅是ON|OFF', data.othis)
        });

        //监听提交
        form.on('submit(demo1)', function(data){
//            layer.alert(JSON.stringify(data.field), {
//                title: '最终的提交信息'
//            })
            $.ajax({
                url:"/admin/insert",
                type:"get",
                data:data.field,
                success:function(da){
                    alert("添加成功");
                    window.location.href="/admin/loginPage";
                }
            })
            return false;
        });
        form.on('submit(demo2)', function(data){
            if(data.field.root==""){
                data.field.root=$("#tcroot").val();
            }
            layer.alert(JSON.stringify(data.field), {
                title: '最终的提交信息'
            })
            $.ajax({
                url:"/login/update",
                type:"get",
                data:data.field,
                success:function(da){
                    layer.alert("修改成功");
                    window.location.reload();
                }
            })
            return false;
        });
    });
</script>
</@html>