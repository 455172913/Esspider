<#include "/core/frame.ftl">
<@html >

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <title>学生信息管理</title>
    <link rel="stylesheet" href="/css/common/layui/css/layui.css">
</head>
<body>
<!-- 选项卡 -->
<div class="layui-tab layui-tab-card">
    <ul class="layui-tab-title">
        <li class="layui-this">学生列表</li>
        <li>学生信息添加</li>
        <li>学生信息修改</li>
    </ul>
    <div class="layui-tab-content">
        <div class="layui-tab-item layui-show">
            <form class="layui-form" action="" style="padding-bottom: 10px;">
                <div class="layui-inline">
                    <label class="layui-form-label">课程选择</label>
                    <div class="layui-input-inline">
                        <select name="lessonId" lay-verify="required" lay-search="" id="sou">
                        <#--<option value="">直接选择或搜索选择</option>-->
                <#--<option value="1">layer</option>-->
                        </select>
                    </div>
                </div>
                <button class="layui-btn" lay-submit="" lay-filter="demo3">立即提交</button>
            </form>
            <div class="layui-form">
                <table class="layui-table">
                    <colgroup>
                        <col width="50">
                        <col width="200">
                        <col width="200">
                        <col width="200">
                        <col width="200">
                        <col width="200">
                    </colgroup>
                    <thead>
                    <tr>
                        <th><input type="checkbox" name="" lay-skin="primary" lay-filter="allChoose"></th>
                        <th>姓名</th>
                        <th>班级</th>
                        <th>学号</th>
                        <th>所选课程</th>
                        <th></th>
                    </tr>
                    </thead>
                    <tbody id="content1">
                    <#--<tr>-->
                        <#--<td><input type="checkbox" name="" lay-skin="primary"></td>-->
                        <#--<td>贤心</td>-->
                        <#--<td>汉族</td>-->
                        <#--<td>1989-10-14</td>-->
                        <#--<td>人生似修行</td>-->
                    <#--</tr>-->
                    </tbody>
                </table>
            </div>
            <button class="layui-btn" style="padding:0 32px;" id="delkc">删除</button>
        </div>
        <div class="layui-tab-item">
            <form class="layui-form layui-form-pane" action="">
                <div class="layui-form-item">
                    <label class="layui-form-label">姓名</label>
                    <div class="layui-input-block">
                        <input type="text" name="studentName" lay-verify="required" autocomplete="off" placeholder="请输入名称" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">学号</label>
                    <div class="layui-input-block">
                        <input type="text" name="studentNumber" lay-verify="required" autocomplete="off" placeholder="请输入名称" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">班级</label>
                    <div class="layui-input-inline">
                        <input type="text" name="className" lay-verify="required" placeholder="请输入" autocomplete="off" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">所选课程</label>
                    <div class="layui-input-inline">
                        <select name="lessonId" id="sel1">
                            <option value="">请选择权限</option>
                            <#--<option value="1">管理员</option>-->
                            <#--<option value="0">普通用户</option>-->
                        </select>
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
        <div class="layui-tab-item">
            <form class="layui-form layui-form-pane" action="">
                <input type="hidden" name="studentId" id="tcid">
                <div class="layui-form-item">
                    <label class="layui-form-label">姓名</label>
                    <div class="layui-input-block">
                        <input type="text" name="studentName" id="stuname" lay-verify="required" autocomplete="off" placeholder="请输入名称" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">学号</label>
                    <div class="layui-input-block">
                        <input type="text" name="studentNumber" id="stunum" lay-verify="required" autocomplete="off" placeholder="请输入名称" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">班级</label>
                    <div class="layui-input-inline">
                        <input type="text" name="className" id="claname" lay-verify="required" placeholder="请输入" autocomplete="off" class="layui-input">
                    </div>
                </div>

                <div class="layui-form-item">
                    <div class="layui-input-block">
                        <button class="layui-btn" lay-submit="" lay-filter="demo2">立即提交</button>
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
    function kcc(){
        $.ajax({
            url:"/lesson/selectByTeacherId",
            type:"get",
            success:function(data){
                console.log(data);
                $("#sou").empty();
                $("#sou").append('<option value="">直接选择或搜索选择</option>');
                for(i=0;i<data.data.result.length;i++){
                    $("#sou").append('<option value="'+data.data.result[i].id+'">'+data.data.result[i].lessonname+'</option>');
                }
                $("#sel1").empty();
                $("#sel1").append('<option value="">请选择课程</option>');
                for(i=0;i<data.data.result.length;i++){
                    $("#sel1").append('<option value="'+data.data.result[i].id+'">'+data.data.result[i].lessonname+'</option>');
                }
            }
        })
    }
    kcc();
    //删除
    function delkc() {
        var index = $("#content1 .layui-form-checked").length;
        var tt = 0;
        for(i=0;i<index;i++){
            var id = $("#content1 .layui-form-checked:eq("+i+")").prev("input").attr("name");
//            alert(id);
            $.ajax({
                url:"/student/delete",
                type:"get",
                data:{"studentId":id},
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
            url:"",
            type:"get",
            data:{"":name},
            success:function(data){
                console.log(data);
//                alert(data.data.result[0].lessonname);
                $("#content1").empty();
                for(i=0;i<data.data.result.length;i++){
                    $("#content1").append('');
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
        $("#stuname").val($(this).attr("stuname"));
        $("#claname").val($(this).attr("claname"));
        $("#stunum").val($(this).attr("stunum"));
        $("#lesid").val($(this).attr("lesid"));
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
            var studentname = $("input[name=studentName]:eq(0)").val();
            var classname = $("input[name=className]:eq(0)").val();
            var studentnum = $("input[name=studentNumber]:eq(0)").val();
            var lessonid = $("#sel1").val();
            $.ajax({
                url:"/student/insert",
                type:"get",
                data:{"studentName":studentname,"className":classname,"studentNumber":studentnum,"lessonId":lessonid},
                success:function(da){
                    layer.alert("添加成功");
                    window.location.reload();
                }
            })
            return false;
        });
        form.on('submit(demo2)', function(data){
            var studentid = $("#tcid").val();
            var studentname = $("#stuname").val();
            var classname = $("#claname").val();
            var studentnum = $("#stunum").val();
            var lessonid = $("#lesid").val();
            $.ajax({
                url:"/student/updateStudentInfo",
                type:"get",
                data:{"studentId":studentid,"studentName":studentname,"className":classname,"studentNumber":studentnum,"lessonId":lessonid},
                success:function(da){
                    layer.alert("修改成功");
                    window.location.reload();
                }
            })
            return false;
        });
        form.on('submit(demo3)', function(data){
//            layer.alert(JSON.stringify(data.field), {
//                title: '最终的提交信息'
//            })
//            console.log(data.field.lessonId);
            lessonId = data.field.lessonId;
            $.ajax({
                url:"/student/selectByLesson",
                type:"get",
                data:data.field,
                success:function(data){
                    console.log(data);
                    $("#content1").empty();
                    for(i=0;i<data.data.result.length;i++){
                        $("#content1").append('<tr><td><input type="checkbox" name="'+data.data.result[i].id+'" lay-skin="primary"></td><td>'+data.data.result[i].studentname+'</td><td>'+data.data.result[i].classname+'</td><td>'+data.data.result[i].studentnumber+'</td><td>'+data.data.result[i].lessonname+'</td><td><button class="layui-btn bj" oid="'+data.data.result[i].id+'" stuname="'+data.data.result[i].studentname+'" claname="'+data.data.result[i].classname+'" stunum="'+data.data.result[i].studentnumber+'" lesid="'+data.data.result[i].lessonid+'" style="padding:0 32px;">编辑</button></td></tr>');
                    }
                }
            })
            return false;
        });
    });
</script>
</@html>