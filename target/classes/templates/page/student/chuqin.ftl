<#include "/core/frame.ftl">
<@html >
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <title>出勤管理</title>
    <link rel="stylesheet" href="/css/common/layui/css/layui.css">
</head>
<body>
<div style="height:10px;"></div>
<form class="layui-form" action="">
    <div class="layui-inline">
        <label class="layui-form-label">课程选择</label>
        <div class="layui-input-inline">
            <select name="lessonId" lay-verify="required" lay-search="" id="sou">
                <#--<option value="">直接选择或搜索选择</option>-->
                <#--<option value="1">layer</option>-->
            </select>
        </div>
    </div>
    <button class="layui-btn" lay-submit="" lay-filter="demo1">立即提交</button>
</form>

<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
    <legend>上课学生列表</legend>
</fieldset>

<div class="layui-form">
    <table class="layui-table">
        <colgroup>
            <col width="50">
            <col width="200">
            <col width="200">
            <col width="200">
            <col>
        </colgroup>
        <thead>
        <tr>
            <th><input type="checkbox" name="" lay-skin="primary" lay-filter="allChoose"></th>
            <th>姓名</th>
            <th>班级</th>
            <th>学号</th>
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
<button class="layui-btn" style="padding:0 32px;" id="delkc">提交</button>
<script type="text/javascript" src="/css/common/js/jquery-3.1.1.min.js"></script>
<script src="/css/common/layui/layui.js"></script>
<script>
    var lessonId = '';
    function kccx(){
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
            }
        })
    }
    kccx();
    //提交签到
    function delkc() {
        var index = $("#content1 .layui-form-checked").length;
        var tt = 0;
        var ids ;
        for(i=0;i<index;i++){
            var id = $("#content1 .layui-form-checked:eq("+i+")").prev("input").attr("name");
            if (i == 0 ){
                ids = id;
            }else {
                ids = ids + "," +id;
            }
        }
        alert(ids);

        $.ajax({
            url:"/student/addAttendCount",
            type:"get",
            data:{"lessonId":lessonId,"studentIds":ids},
            success:function(data){
                tt++;
                if(tt==index){
                    alert("提交成功！");
                    window.location.reload();
                }
            }
        })
    }
    $("#delkc").click(function(){
        delkc();
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
    layui.use(['form', 'layedit', 'laydate'], function(){
        var form = layui.form()
                ,layer = layui.layer
                ,layedit = layui.layedit
                ,laydate = layui.laydate;

        //创建一个编辑器
        var editIndex = layedit.build('LAY_demo_editor');

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
//            console.log(data.field.lessonId);
            lessonId = data.field.lessonId;
            $.ajax({
                url:"/student/selectByLesson",
                type:"get",
                data:data.field,
                success:function(data){
//                    console.log(data);
                    for(i=0;i<data.data.result.length;i++){
                        $("#content1").append('<tr><td><input type="checkbox" name="'+data.data.result[i].id+'" lay-skin="primary"></td><td>'+data.data.result[i].studentname+'</td><td>'+data.data.result[i].classname+'</td><td>'+data.data.result[i].studentnumber+'</td></tr>');
                    }
                }
            })
            return false;
        });
    });
</script>
</@html>