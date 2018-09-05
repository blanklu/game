<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>开始使用layui</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/lib/layui/css/layui.css">
</head>
<body>
<span class="layui-breadcrumb" style="font-size: 18px">
    <a href="index">论坛列表</a>
  <a><cite>${sessionFroumName}</cite></a>
</span>
<br>
<br>

<div class="layui-row">
    <form class="layui-form layui-col-md12 we-search" onsubmit="return false;">
        商品搜索：
        <div class="layui-inline">
            <input type="text" id="title" name="title" placeholder="请输入文章标题" autocomplete="off" class="layui-input">
        </div>
        <button id = "search" class="layui-btn" lay-submit="" lay-filter="search" data-type="reload"><i class="layui-icon">&#xe615;</i></button>
        <button class="layui-btn" onclick="WeAdminShow('添加商品','./add',600,500)"><i class="layui-icon">&#xe61f;</i>添加</button>
    </form>
</div>
<div class="weadmin-block demoTable">

</div>


<table id="demo" ></table>

<script src="${pageContext.request.contextPath}/lib/layui/layui.js"></script>
<script>

    layui.use(['table','element','form','jquery'], function(){
        var table = layui.table;
        var element = layui.element;
        var form = layui.form;
        var $ = layui.jquery;
        table.render({
            elem:'#demo',
            url:'articles',
            page:true,
            cols:[[
                {field:"article_id",title:"编号"},
                {field:"title",title:"文章标题"},
                {field:"readeNum",title:"阅读量"},
                {field:"like",title:"喜欢数"},
                {field:"good",title:"点赞"},
                {field:"collect",title:"收藏量"},
                {field: 'caozuo', title: '操作', templet: '#caozuo'}
            ]]

        })

        form.on('submit(sss)',function (data) {
            console.log("进来了");
            var datas = $(data.elem);
            // console.log(datas.parents('tr').first().find('td').eq(0).text());
            var id = datas.parents('tr').first().find('td').eq(0).text();

            $.get(
                './toarticle',
                {'id':id},
                function (data) {
                    // console.log(data);
                    window.location.href="article?id="+id;
                   /* if (data > 0){
                        // $('.layui-laypage-btn').click();
                        // layer.msg("删除成功");
                    }*/
                }
            );
        });

        form.on('submit(hhh)',function (data) {
            console.log("进来了");
            var datas = $(data.elem);
            // console.log(datas.parents('tr').first().find('td').eq(1).text());
            var id = datas.parents('tr').first().find('td').eq(0).text();
            // alert(id);

            $.post(
                './article/del',
                {'id':id},
                function (data) {
                    console.log(data);
                    if (data > 0){
                        $('.layui-laypage-btn').click();
                        layer.msg("删除成功");
                    }
                }
            );
        });

        $("#search").on('click', function () {
            //为了获取按钮的data-type属性

                //模糊查询，提交一个异步请求到后台 {title}
                //val() 文本框 单选按钮 复选按钮
                //text()  html()
                var title = $.trim($("#title").val());
                //不为空
                if(title.length > 0 ){
                    //文本框中有内容，表格重载
                    table.reload("demo",{
                        page:{curr:1},
                        where:{title:title}
                    });
                }else {
                    table.reload("demo",{
                        page:{curr:1},
                        where:{title:""}
                    });
                }


        });


    });

</script>

<script type="text/html" id="caozuo">
    <div class="layui-form">
        <button class="layui-btn  layui-btn-sm" lay-filter="sss" lay-submit type="submit">查看详情</button>
        <button class="layui-btn  layui-btn-sm" lay-filter="hhh" lay-submit type="submit">删除</button>
    </div>
</script>
</body>
</html>
