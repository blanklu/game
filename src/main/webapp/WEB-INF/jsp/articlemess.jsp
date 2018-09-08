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
<span class="layui-breadcrumb" style="font-size: 18px">
    <a href="../index">论坛列表</a>
  <a href="../article?id=${sessionForumId}">${sessionFroumName}</a>
  <a><cite>文章详情</cite></a>
</span>
</div>
<div class="weadmin-body">



    <h1>${mess.title}</h1>
<br>

    <%--<div style="color: #2E2D3C">
        <span>作者:${mess.author.name}</span>
        <span>发布时间:${mess.updatatime}</span>
    </div>
    <span>喜欢数:${mess.likeNum}</span>
    <span>点赞数:${mess.good}</span>
    <span>收藏数:${mess.collect}</span>
    <span>评论数:${mess.commentNum}</span>--%>
    <div class="layui-row">
        <div class="layui-col-md4">
            <span>作者:${mess.author.name}</span>
            &nbsp;&nbsp;
            <span>更新时间:${mess.updatatime}</span>
        </div>
        <div class="layui-col-md4 layui-col-md-offset4" style="text-align: right;color: #8D8D8D">
            <span><i class="layui-icon ">&#xe6af;</i>  ${mess.likeNum}</span>
            <span><i class="layui-icon ">&#xe6c6;</i>  ${mess.good}</span>
            <span><i class="layui-icon ">&#xe600;</i>  ${mess.collect}</span>
            <span><i class="layui-icon ">&#xe63a;</i>  ${mess.commentNum}</span>
        </div>

    </div>
<hr>
<br>
<p>${mess.content}</p>


</div>
<script src="${pageContext.request.contextPath}/lib/layui/layui.js"></script>
<script>

    layui.use(['table','element','form','jquery'], function(){
        var table = layui.table;
        var element = layui.element;
        var form = layui.form;
        var $ = layui.jquery;
        /*table.render({
            elem:'#demo',
            url:'articles',
            page:true,
            cols:[[
                {field:"article_id",title:"编号"},
                {field:"title",title:"文章标题"},
                // {field:"author.name",title:"作者"},
                {field:"readeNum",title:"阅读量"},
                {field:"likeNum",title:"喜欢数"},
                {field:"good",title:"点赞"},
                {field:"collect",title:"收藏量"},
                {field: 'caozuo', title: '操作', templet: '#caozuo'}
            ]]

        })*/

       /* form.on('submit(sss)',function (data) {
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
                   /!* if (data > 0){
                        // $('.layui-laypage-btn').click();
                        // layer.msg("删除成功");
                    }*!/
                }
            );
        });*/

        /*form.on('submit(sss)',function (data) {
                console.log("进来了");
                var datas = $(data.elem);
                // console.log(datas.parents('tr').first().find('td').eq(0).text());
                var id = datas.parents('tr').first().find('td').eq(0).text();

                $.post(
                    './article/mess',
                    {'id':id},
                    function (data) {
                        layer.msg("跳转了");
                    }
                )
            }
        );*/

        /*form.on('submit(hhh)',function (data) {
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
        });*/

        /*$("#search").on('click', function () {
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

        $("#add").on('click',function () {

            location.href="add"

        });*/


    });

</script>

<%--<script type="text/html" id="caozuo">
    <div class="layui-form">
        <button class="layui-btn  layui-btn-sm" lay-filter="sss" lay-submit type="submit">查看详情</button>
        <button class="layui-btn  layui-btn-sm" lay-filter="hhh" lay-submit type="submit">删除</button>
    </div>
</script>--%>

<script>

</script>
</body>
</html>
