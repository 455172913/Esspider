<#include "/core/frame.ftl">
<@html >

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <title>课程管理</title>
    <link rel="stylesheet" href="/css/common/layui/css/layui.css">
</head>
<body>
<!-- 选项卡 -->
<div class="layui-tab layui-tab-card">
    <ul class="layui-tab-title">
        <li class="layui-this">课程查询</li>
        <li>课程添加</li>
        <li>课程修改</li>
    </ul>
    <div class="layui-tab-content">
        <div class="layui-tab-item layui-show">
            <button class="layui-btn" style="padding:0 32px;" id="kcsh">搜索</button>
            <div class="layui-input-block" style="margin:-38px 0 0 95px;"><input id="shbox" type="text" name="title" lay-verify="title" autocomplete="off" placeholder="请输入课程名称" class="layui-input"></div>
            <div class="layui-form">
                <table class="layui-table">
                    <colgroup>
                        <col width="50">
                        <col width="200">
                        <col width="200">
                        <col width="200">
                        <col width="400">
                        <col>
                    </colgroup>
                    <thead>
                    <tr>
                        <th><input type="checkbox" name="" lay-skin="primary" lay-filter="allChoose"></th>
                        <th>课程</th>
                        <th>上课周数</th>
                        <th>上课时间</th>
                        <th>教学大纲</th>
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
            <form class="layui-form" action="">
                <div class="layui-form-item">
                    <label class="layui-form-label">课程名称</label>
                    <div class="layui-input-block">
                        <input type="text" name="lessonName" lay-verify="required" autocomplete="off" placeholder="请输入名称" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">开课时间</label>
                    <div class="layui-input-inline">
                        <select name="lessonStart" lay-verify="required">
                            <option value="">开始周数</option>
                            <option value="1">1</option>
                            <option value="2">2</option>
                            <option value="3">3</option>
                            <option value="4">4</option>
                            <option value="5">5</option>
                            <option value="6">6</option>
                            <option value="7">7</option>
                            <option value="8">8</option>
                            <option value="9">9</option>
                            <option value="10">10</option>
                            <option value="11">11</option>
                            <option value="12">12</option>
                            <option value="13">13</option>
                            <option value="14">14</option>
                            <option value="15">15</option>
                            <option value="16">16</option>
                        </select>
                    </div>
                    <div class="layui-input-inline">
                        <select name="lessonEnd" lay-verify="required">
                            <option value="">结束周数</option>
                            <option value="1">1</option>
                            <option value="2">2</option>
                            <option value="3">3</option>
                            <option value="4">4</option>
                            <option value="5">5</option>
                            <option value="6">6</option>
                            <option value="7">7</option>
                            <option value="8">8</option>
                            <option value="9">9</option>
                            <option value="10">10</option>
                            <option value="11">11</option>
                            <option value="12">12</option>
                            <option value="13">13</option>
                            <option value="14">14</option>
                            <option value="15">15</option>
                            <option value="16">16</option>
                        </select>
                    </div>
                    <div class="layui-input-inline">
                        <select name="weekDay" lay-verify="required">
                            <option value="">星期</option>
                            <option value="一">一</option>
                            <option value="二">二</option>
                            <option value="三">三</option>
                            <option value="四">四</option>
                            <option value="五">五</option>
                            <option value="六">六</option>
                            <option value="日">日</option>
                        </select>
                    </div>
                    <div class="layui-input-inline">
                        <select name="lessonNum" lay-verify="required">
                            <option value="">节数</option>
                            <option value="1-2">1-2</option>
                            <option value="3-4">3-4</option>
                            <option value="5-6">5-6</option>
                            <option value="7-8">7-8</option>
                            <option value="9-12">9-12</option>
                        </select>
                    </div>
                </div>
                <div class="layui-form-item layui-form-text">
                    <label class="layui-form-label">教学大纲</label>
                    <div class="layui-input-block">
                        <textarea class="layui-textarea layui-hide" name="teachPro" lay-verify="content" id="LAY_demo_editor"></textarea>
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
            <form class="layui-form" action="">
                <input type="hidden" id="kcid2" value="" name="id">
                <input type="hidden" id="lestr" value="">
                <input type="hidden" id="leend" value="">
                <input type="hidden" id="week" value="">
                <input type="hidden" id="lenum" value="">
                <input type="hidden" id="teapro" value="">
                <div class="layui-form-item">
                    <label class="layui-form-label">课程名称</label>
                    <div class="layui-input-block">
                        <input type="text" name="lessonName" lay-verify="required" autocomplete="off" placeholder="请输入名称" class="layui-input" id="kcname2">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">开课时间</label>
                    <div class="layui-input-inline">
                        <select name="lessonStart" id="kcstart2">
                            <option value="">开始周数</option>
                            <option value="1">1</option>
                            <option value="2">2</option>
                            <option value="3">3</option>
                            <option value="4">4</option>
                            <option value="5">5</option>
                            <option value="6">6</option>
                            <option value="7">7</option>
                            <option value="8">8</option>
                            <option value="9">9</option>
                            <option value="10">10</option>
                            <option value="11">11</option>
                            <option value="12">12</option>
                            <option value="13">13</option>
                            <option value="14">14</option>
                            <option value="15">15</option>
                            <option value="16">16</option>
                        </select>
                    </div>
                    <div class="layui-input-inline">
                        <select name="lessonEnd" id="kcend2">
                            <option value="">结束周数</option>
                            <option value="1">1</option>
                            <option value="2">2</option>
                            <option value="3">3</option>
                            <option value="4">4</option>
                            <option value="5">5</option>
                            <option value="6">6</option>
                            <option value="7">7</option>
                            <option value="8">8</option>
                            <option value="9">9</option>
                            <option value="10">10</option>
                            <option value="11">11</option>
                            <option value="12">12</option>
                            <option value="13">13</option>
                            <option value="14">14</option>
                            <option value="15">15</option>
                            <option value="16">16</option>
                        </select>
                    </div>
                    <div class="layui-input-inline">
                        <select name="weekDay" id="kcxq2">
                            <option value="">星期</option>
                            <option value="一">一</option>
                            <option value="二">二</option>
                            <option value="三">三</option>
                            <option value="四">四</option>
                            <option value="五">五</option>
                            <option value="六">六</option>
                            <option value="日">日</option>
                        </select>
                    </div>
                    <div class="layui-input-inline">
                        <select name="lessonNum" id="kcj2">
                            <option value="">节数</option>
                            <option value="1-2">1-2</option>
                            <option value="3-4">3-4</option>
                            <option value="5-6">5-6</option>
                            <option value="7-8">7-8</option>
                            <option value="9-12">9-12</option>
                        </select>
                    </div>
                </div>
                <div class="layui-form-item layui-form-text">
                    <label class="layui-form-label">教学大纲</label>
                    <div class="layui-input-block">
                        <textarea class="layui-textarea layui-hide" name="teachpro" lay-verify="content" id="LAY_demo_editor2"></textarea>
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
    //查询遍历信息
    function cxajax(){
        $.ajax({
            url:"/lesson/selectByTeacherId",
            type:"get",
            success:function(data){
                console.log(data);
//                alert(data.data.result[0].lessonname);
                $("#content1").empty();
                for(i=0;i<data.data.result.length;i++){
                    $("#content1").append('<tr><td><input type="checkbox" lay-skin="primary" name="'+data.data.result[i].id+'"></td><td>'+data.data.result[i].lessonname+'</td> <td>'+data.data.result[i].lessonstart+'——'+data.data.result[i].sessonend+'</td> <td>星期'+data.data.result[i].weekday+'第'+data.data.result[i].lessonnum+'节</td> <td>'+data.data.result[i].teachpro+'</td><td><button class="bj layui-btn" oid="'+data.data.result[i].id+'" kcname="'+data.data.result[i].lessonname+'" kcst="'+data.data.result[i].lessonstart+'" kcend="'+data.data.result[i].sessonend+'" kcxq="'+data.data.result[i].weekday+'" kcj="'+data.data.result[i].lessonnum+'" dagang="'+data.data.result[i].teachpro+'" style="padding:0 32px;">编辑</button></td></tr>');
                }
            }
        })
    }
    cxajax();
    //删除课程
    function delkc() {
        var index = $("#content1 .layui-form-checked").length;
        var tt = 0;
        for(i=0;i<index;i++){
            var id = $("#content1 .layui-form-checked:eq("+i+")").prev("input").attr("name");
//            alert(id);
            $.ajax({
                url:"/lesson/deleteById",
                type:"get",
                data:{"lessonId":id},
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

    //查询课程
    function kccx(name){
        $.ajax({
            url:"/lesson/selectByLessonName",
            type:"get",
            data:{"name":name},
            success:function(data){
                console.log(data);
//                alert(data.data.result[0].lessonname);
                $("#content1").empty();
                for(i=0;i<data.data.result.length;i++){
                    $("#content1").append('<tr><td><input type="checkbox" lay-skin="primary" name="'+data.data.result[i].id+'"></td><td>'+data.data.result[i].lessonname+'</td> <td>'+data.data.result[i].lessonstart+'——'+data.data.result[i].sessonend+'</td> <td>星期'+data.data.result[i].weekday+'第'+data.data.result[i].lessonnum+'节</td> <td>'+data.data.result[i].teachpro+'</td><td><button class="bj layui-btn" oid="'+data.data.result[i].id+'" kcname="'+data.data.result[i].lessonname+'" kcst="'+data.data.result[i].lessonstart+'" kcend="'+data.data.result[i].sessonend+'" kcxq="'+data.data.result[i].weekday+'" kcj="'+data.data.result[i].lessonnum+'" dagang="'+data.data.result[i].teachpro+'" style="padding:0 32px;">编辑</button></td></tr>');
                }
            }
        })
    }
    $("#kcsh").click(function(){
        var name = $("#shbox").val();
        if(name==""||name ==null){
            alert("您还未输入内容");
            return false;
        }
        kccx(name);
    })
    $("#shbox").keydown(function(){
        if(event.keyCode==13){
            $("#kcsh").click();
        }
    })
    //编辑修改
    $("#content1").on("click",".bj",function(){
        $("#kcid2").val($(this).attr("oid"));
        $("#kcname2").val($(this).attr("kcname"));
        $("#lestr").val($(this).attr("kcst"));
        $("#leend").val($(this).attr("kcend"));
        $("#week").val($(this).attr("kcxq"));
        $("#lenum").val($(this).attr("kcj"));
        $("#teapro").val($(this).attr("dagang"));
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
        var editIndex2 = layedit.build('LAY_demo_editor2');

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
                layedit.sync(editIndex2);
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
            console.log(data.field);
//            layer.alert(JSON.stringify(data.field), {
//                title: '最终的提交信息'
//            })
            $.ajax({
                url:"/lesson/insert",
                type:"get",
                data:data.field,
                success:function(da){
                    window.location.reload();
                }
            })
            return false;
        });
        form.on('submit(demo2)', function(data){
            console.log(data.field);
            if(data.field.lessonStart==''){
                data.field.lessonStart = $("#lestr").val();
            }
            if(data.field.lessonEnd==''){
                data.field.lessonEnd = $("#leend").val();
            }
            if(data.field.weekDay==''){
                data.field.weekDay = $("#week").val();
            }
            if(data.field.lessonNum==''){
                data.field.lessonNum = $("#lenum").val();
            }
            if(data.field.teachpro==''){
                data.field.teachpro = $("#teapro").val();
            }
//            layer.alert(JSON.stringify(data.field), {
//                title: '最终的提交信息'
//            })
            $.ajax({
                url:"/lesson/update",
                type:"get",
                data:data.field,
                success:function(da){
                    window.location.reload();
                }
            })
            return false;
        });
    });
</script>
</@html>