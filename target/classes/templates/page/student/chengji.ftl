<#include "/core/frame.ftl">
<@html >
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <title>考试成绩统计</title>
    <link rel="stylesheet" href="/css/common/layui/css/layui.css">
</head>
<body>
<div style="height:10px;"></div>
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

<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
    <legend>学生列表</legend>
</fieldset>

<table class="layui-table" lay-skin="line">
    <colgroup>
        <col width="200">
        <col width="200">
        <col width="200">
        <col width="200">
        <col width="200">
    </colgroup>
    <thead>
    <tr>
        <th>姓名</th>
        <th>学号</th>
        <th>实到次数/应到次数</th>
        <th>平时分</th>
        <th>成绩</th>
    </tr>
    </thead>
    <tbody id="content1">
    <#--<tr>-->
        <#--<td>贤心</td>-->
        <#--<td>汉族</td>-->
        <#--<td></td>-->
        <#--<td>人生似修行</td>-->
    <#--</tr>-->
    </tbody>
</table>
<button class="layui-btn" style="padding:0 32px;" id="tijiao">提交</button>
<script type="text/javascript" src="/css/common/js/jquery-3.1.1.min.js"></script>
<script src="/css/common/layui/layui.js"></script>
<script>
    var arr=[];
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
                    var tt = parseInt(data.data.result[i].id);
                    arr[tt]=data.data.result[i].callcount;
                }
                console.log(arr);
            }
        })
    }
    kcc();
    //提交
    var num = 0;
    function tijiao(id,usualScore,examScore,all){
        $.ajax({
            url:"/student/addScore",
            type:"get",
            data:{"studentId":id,"usualScore":usualScore,"examScore":examScore},
            success:function(data){
                num++;
                if(num==all){
                    alert("提交成功！");
                    window.location.reload();
                }
            }
        })
    }
    $("#tijiao").click(function(){
        var all = $("#content1 tr").length;
        for(i=0;i<all;i++){
            var id = $("#content1 tr:eq("+i+")").attr("oid");
            var usualScore = $(".stuu"+id).val();
            var examScore = $(".stue"+id).val();
            tijiao(id,usualScore,examScore,all);
        }
    })
</script>
<script>
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
            layer.alert(JSON.stringify(data.field), {
                title: '最终的提交信息'
            })
            return false;
        });
        form.on('submit(demo3)', function(data){
//            layer.alert(JSON.stringify(data.field), {
//                title: '最终的提交信息'
//            })
//            console.log(data.field.lessonId);
            lessonId = data.field.lessonId;
            var count = arr[lessonId];
            $.ajax({
                url:"/student/selectByLesson",
                type:"get",
                data:data.field,
                success:function(data){
                    console.log(data);
                    $("#content1").empty();
                    for(i=0;i<data.data.result.length;i++){
                       $("#content1").append('<tr oid="'+data.data.result[i].id+'"><td>'+data.data.result[i].studentname+'</td><td>'+data.data.result[i].studentnumber+'</td><td>'+data.data.result[i].attendcount+'/'+count+'</td><td><input class="layui-input stuu'+data.data.result[i].id+'" type="text" name="usualScore" value="'+data.data.result[i].usualscore+'" placeholder="0"></td><td><input class="layui-input stue'+data.data.result[i].id+'" type="text" name="examScore" value="'+data.data.result[i].examscore+'" placeholder="0"></td> </tr>');
                    }
                }
            })
            return false;
        });
    });
</script>
</@html>