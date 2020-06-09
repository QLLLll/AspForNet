<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LLNotice.aspx.cs" Inherits="HelloLLLLL.Blog.Admin.page.LLArticle" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8">
    <title>layui</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="../lib/layui-v2.5.5/css/layui.css" media="all">
    <link rel="stylesheet" href="../css/public.css" media="all">
</head>
<body>
<div class="layuimini-container">
    <div class="layuimini-main">

        <fieldset class="table-search-fieldset">
            <legend>搜索信息</legend>
            <div style="margin: 10px 10px 10px 10px">
                <form class="layui-form layui-form-pane" >
                    <div class="layui-form-item">
                        <div class="layui-inline">
                            <label class="layui-form-label">公告标题</label>
                            <div class="layui-input-inline">
                                <input type="text" name="NoticeTitle" autocomplete="off" class="layui-input"/>
                            </div>
                        </div>
                  <div class="layui-inline">
                    <label class="layui-form-label">公告日期</label>
                    <div class="layui-input-inline">
                        <input type="text" name="DataStart" id="date" lay-verify="date" placeholder="yyyy-MM-dd" autocomplete="off" class="layui-input"/>
                    </div>
                </div>
                        
                         <div class="layui-inline">
                    <div class="layui-input-inline">
                        <input type="text" name="DataEnd" id="date2" lay-verify="date" placeholder="yyyy-MM-dd" autocomplete="off" class="layui-input"/>
                    </div>
                </div>
                        <div class="layui-inline">
                            <button type="submit" class="layui-btn layui-btn-primary"  lay-submit lay-filter="data-search-btn"><i class="layui-icon"></i> 搜 索</button>
                        </div>
                    </div>
                </form>
            </div>
        </fieldset>

        <script type="text/html" id="toolbarDemo">
            <div class="layui-btn-container">
                <button class="layui-btn layui-btn-normal layui-btn-sm data-add-btn" lay-event="add"> 添加 </button>
                <button class="layui-btn layui-btn-sm layui-btn-danger data-delete-btn" lay-event="delete"> 删除 </button>
            </div>
        </script>

        <table class="layui-hide" id="currentTableId" lay-filter="currentTableFilter"></table>

        <script type="text/html" id="currentTableBar">
            <a class="layui-btn layui-btn-normal layui-btn-xs data-count-edit" lay-event="edit">编辑</a>
            <a class="layui-btn layui-btn-xs layui-btn-danger data-count-delete" lay-event="delete">删除</a>
        </script>

    </div>
</div>
    <script src="../lib/jquery-3.4.1/jquery-3.4.1.min.js"></script>
<script src="../lib/layui-v2.5.5/layui.js" charset="utf-8"></script>
<script>
    layui.use(['form', 'table',], function () {
        var $ = layui.jquery,
            form = layui.form,
            table = layui.table;

        table.render({
            elem: '#currentTableId',
            url: '/Admin/AdminPostData.ashx?action=notice',
            toolbar: '#toolbarDemo',
            defaultToolbar: ['filter' , {
                title: '提示',
                layEvent: 'LAYTABLE_TIPS',
                icon: 'layui-icon-tips'
            }],
            cols: [[
                {type: "checkbox", width: 50},
                {field: 'Id', width: 80, title: 'ID', sort: true},
                {field: 'Title', width: 200, title: '公告标题'},
                { field: 'NoticeTime', width: 160, title: '公告时间', sort: true},
                { field: 'NoticeContent', width: 400, title: '公告类容'},
                {title: '操作', minWidth: 150, toolbar: '#currentTableBar', align: "center"}
            ]],
            limits: [10, 15, 20, 25, 50, 100],
            limit: 5,
            page: true,
            skin: 'line'
        });

        // 监听搜索操作
        form.on('submit(data-search-btn)', function (data) {
            var result = JSON.stringify(data.field);
            layer.alert(result, {
                title: '最终的搜索信息'
            });

            //执行搜索重载
            table.reload('currentTableId', {
                page: {
                    curr: 1
                }
                , where: {
                    searchParams: result
                }
            }, 'data');

            return false;
        });

        /**
         * toolbar监听事件
         */
        table.on('toolbar(currentTableFilter)', function (obj) {
            if (obj.event === 'add') {  // 监听添加操作
                var index = layer.open({
                    title: '添加公告',
                    type: 2,
                    shade: 0.2,
                    maxmin:true,
                    shadeClose: true,
                    area: ['100%', '100%'],
                    content: '../page/table/NoticeEdit.aspx',
                });
                $(window).on("resize", function () {
                    layer.full(index);
                });
            } else if (obj.event === 'delete') {  // 监听删除操作
                var checkStatus = table.checkStatus('currentTableId')
                    , data = checkStatus.data;
                layer.alert(JSON.stringify(data));
            }
        });

        //监听表格复选框选择
        table.on('checkbox(currentTableFilter)', function (obj) {
            console.log(obj)
        });

        table.on('tool(currentTableFilter)', function (obj) {
            var data = obj.data;
            if (obj.event === 'edit') {

                var index = layer.open({
                    title: '编辑公告',
                    type: 2,
                    shade: 0.2,
                    maxmin:true,
                    shadeClose: true,
                    area: ['100%', '100%'],
                    content: '../page/table/NoticeEdit.aspx',
                    success: function (layero, index) {
                        console.log(data.username);
                        var body = layer.getChildFrame('body', index);
                        console.log(body); 
                        console.log(body.find('#noticeTitle').val()); 
                        body.find('#noticeId').val(data.Id);
                        body.find('#noticeTitle').val(data.Title);
                        body.find('#noticeTime').val(data.NoticeTime);
                        body.find('.w-e-text').html(data.NoticeContent);
                    }           
                });
                $(window).on("resize", function () {
                    layer.full(index);
                });
                return false;
            } else if (obj.event === 'delete') {
                layer.confirm('真的删除行么', function (index) {
                    obj.del();
                    layer.close(index);
                });
            }
        });

    });
</script>

</body>
</html>
