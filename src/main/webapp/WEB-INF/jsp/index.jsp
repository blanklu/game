<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>开始使用layui</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/lib/layui/css/layui.css">
    <style type="text/css" >
        .weadmin-body {
            padding: 20px;
        }
        .weadmin-nav {
            padding: 0 20px;
            position: relative;
            z-index: 99;
            border-bottom: 1px solid #e5e5e5;
            line-height: 39px;
            height: 39px;
            overflow: hidden;
        }
    </style>
</head>
<body>
<div class="weadmin-nav">


<span class="layui-breadcrumb">
  <a><cite>论坛列表</cite></a>
</span>
</div>
<div class="weadmin-body">
    <table id="demo"></table>
</div>


<script src="${pageContext.request.contextPath}/lib/layui/layui.js"></script>
<script>

    layui.use(['table', 'element', 'form', 'jquery'], function () {
        var table = layui.table;
        var element = layui.element;
        var form = layui.form;
        var $ = layui.jquery;
        table.render({
            elem: '#demo',
            url: 'forums',
            page: true,
            cols: [[
                {field: "id", title: "编号"},
                {field: "forumName", title: "论坛名称"},
                {field: "focus", title: "关注人数"},
                {field: 'caozuo', title: '操作', templet: '#caozuo'}
            ]]

        })

        form.on('submit(sss)', function (data) {
            console.log("进来了");
            var datas = $(data.elem);
            // console.log(datas.parents('tr').first().find('td').eq(0).text());
            var id = datas.parents('tr').first().find('td').eq(0).text();

            $.get(
                './toarticle',
                {'id': id},
                function (data) {
                    // console.log(data);
                    window.location.href = "article?id=" + id;
                    /* if (data > 0){
                         // $('.layui-laypage-btn').click();
                         // layer.msg("删除成功");
                     }*/
                }
            );
        });
    });

</script>

<script type="text/html" id="caozuo">
    <div class="layui-form">
        <button class="layui-btn  layui-btn-sm" lay-filter="sss" lay-submit type="submit">
                进入论坛
        </button>
    </div>
</script>
</body>
</html>
