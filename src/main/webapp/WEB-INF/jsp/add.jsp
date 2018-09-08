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
    <a href="index">论坛列表</a>
    <a href="article?id=${sessionForumId}">${sessionFroumName}</a>
  <a><cite>添加文章</cite></a>
</span>
</div>

<div class="weadmin-body">
    <form onsubmit="return false;">
        <div class="layui-form-item">
            <label for="title" class="layui-form-label">
                <span class="we-red">*</span>文章标题
            </label>
            <div class="layui-input-inline">
                <input type="text" id="title" lay-filter="demo" autocomplete="off" class="layui-input">
            </div>
            <label for="title" class="layui-form-label">
                <span class="we-red" style="color: red" id="mess1"></span>
            </label>

        </div>


        <div class="layui-form-item layui-form-text">
            <label for="hah" class="layui-form-label">*文章内容</label>
            <div class="layui-input-block">
                <textarea placeholder="请输入文章内容" id="hah" name="sellPoint" class="layui-textarea" style="height: 300px"></textarea>
            </div>
        </div>




        <div>
            <label for="add" class="layui-form-label">
            </label>
            <button id="add" class="layui-btn" >增加</button>
            <button id="back" class="layui-btn" >返回</button>
        </div>
    </form>
</div>



<script src="${pageContext.request.contextPath}/lib/layui/layui.js"></script>
<script>

    layui.use(['table','element','form','jquery'], function() {

        var $ = layui.jquery;
        // var layer = layui.layer;

        $("#back").on("click",function () {

            window.history.back();

        });





        $("#add").on('click',function () {

            var title = $("#title").val();
            var content = $("#hah").val();
            var forum_id = ${sessionForumId};

            if (title == '' || title == null) {
                // alert("进来了")
                layer.msg("标题不能为空");
                // $("#mess1").html("不能为空");

            }else if(content == '' || content == null) {
                layer.msg("内容不能为空");
            }else {
                $.post(
                    './article/add',
                    {
                        'title':title,
                        'content':content,
                        'likeNum':0,
                        'good':0,
                        'collect':0,
                        'commentNum':0,
                        'isadmin':1,
                        'author_id':1,
                        'flg':0,
                        'isessence':0,
                        'forum_id':forum_id,
                        'readeNum':0
                    },
                    function (data) {
                        if (data > 0) {
                            // alert("jinlaie")
                            layer.msg("添加成功");
                            setTimeout(function () { this.location.href = "article?id="+forum_id}, 1000);
                            // window.location.href="article?id="+forum_id;

                        }else {
                            layer.msg("添加失败");
                        }
                    }

                )
            }


        })

    })





</script>




</body>
</html>
