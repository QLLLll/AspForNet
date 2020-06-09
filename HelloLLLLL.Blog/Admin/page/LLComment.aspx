<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LLComment.aspx.cs" Inherits="HelloLLLLL.Blog.Admin.page.LLComment" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8" />
    <title>layui</title>
    <meta name="renderer" content="webkit" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
    <link rel="stylesheet" href="../lib/layui-v2.5.5/css/layui.css" media="all" />
    <link rel="stylesheet" href="../css/public.css" media="all" />
</head>
<body>
  
<div class="layui-form">
      <table class="layui-table" lay-skin="line">
  <colgroup>
    <col width="450">
    <col width="90">
    <col width="180">
    <col width="80">
  </colgroup>
  <thead>
    <tr>
      <th>标题</th>
      <th>作者</th>
      <th>日期</th>
      <th>操作</th>
    </tr> 
  </thead>
  <tbody>
      <%for (int i = 0; i < ListPingLuns.Count; i++){%>
      
      <tr style="background: #e5eef7;">
      <td>Re:<a href="/html/detail.html?Id=<%=ListPingLuns[i].ArtId%>" target='_blank'><%=ListPingLuns[i].ArtTitle %></a></td>
      <td><%=ListPingLuns[i].Pubnisher %></td>
      <td><%=ListPingLuns[i].PubnishTime.ToString() %></td>
      <td><a href="javascript:void(0);" targetID="<%=ListPingLuns[i].Id%>" class="ll_Delete">删除</a></td>
    </tr>

       <tr style="display: inline-block;">
          <td colspan="4" style="margin-left:100px; display: inline-block;">
              <%=ListPingLuns[i].Content%>
          </td>
      </tr>

      <%} %>

    
     
    <tr>
      <td>Re:ASP.NET身份验证机制membership入门——配置篇(1)</td>
      <td>HelloLLLLL</td>
      <td>1989-10-14</td>
      <td>删除</td>
    </tr>
       <tr style="width: 850px; display: inline-block;">
          <td colspan="4" style="margin-left:100px; display: inline-block;">
              <p>可以结合这篇文章看看，自定义的membershipprovider<br/>
<a href = 'https://www.cnblogs.com/liuyu7177/archive/2013/05/07/3065052.html' target = 'blank' > https://www.cnblogs.com/liuyu7177/archive/2013/05/07/3065052.html</a>
              </p>
          </td>
      </tr>
  </tbody>
</table>   
  </div>
    <%--<div class="layuimini-container">
    <div class="layuimini-main">

        <script type="text/html" id="toolbarDemo">
            <div class="layui-btn-container"> 
                <button class="layui-btn layui-btn-sm layui-btn-danger data-delete-btn" lay-event="delete"> 删除 </button>
            </div>
        </script>

        <table class="layui-hide" id="currentTableId" lay-filter="currentTableFilter"></table>

        <script type="text/html" id="currentTableBar">
            <a class="layui-btn layui-btn-xs layui-btn-danger data-count-delete" lay-event="delete">删除</a>
        </script>

    </div>
</div>--%>
    <script src="../lib/jquery-3.4.1/jquery-3.4.1.min.js"></script>
    <script src="../lib/layui-v2.5.5/layui.js" charset="utf-8"></script>
    <script>
        layui.use(['form', 'table',], function () {
            var $ = layui.jquery,
                form = layui.form,
                table = layui.table;

            table.render({
                elem: '#currentTableId',
                url: '/Admin/AdminPostData.ashx?action=article',
                toolbar: '#toolbarDemo',
                defaultToolbar: ['filter', {
                    title: '提示',
                    layEvent: 'LAYTABLE_TIPS',
                    icon: 'layui-icon-tips'
                }],
                cols: [[
                    { type: "checkbox", width: 50 },
                    { field: 'Id', width: 80, title: 'ID', sort: true },
                    { field: 'Title', width: 300, title: '文章标题' },
                    { field: 'ReadCount', width: 100, title: '阅读数', sort: true },
                    { field: 'CommentCount', width: 100, title: '评论数', sort: true },
                    { field: 'PresentCount', width: 100, title: '点赞数', sort: true },
                    { field: 'Content', width: 180, title: '内容', display: 'none' },
                    { field: 'Digest', width: 180, title: '摘要', display: 'none' },
                    { field: 'ReadPwd', width: 180, title: '密码', display: 'none' },
                    { title: '操作', minWidth: 150, toolbar: '#currentTableBar', align: "center" }
                ]],
                limits: [10, 15, 20, 25, 50, 100],
                limit: 5,
                page: true,
                skin: 'line'
            });



            /**
             * toolbar监听事件
             */
            table.on('toolbar(currentTableFilter)', function (obj) {
                if (obj.event === 'delete') {  // 监听删除操作
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
                if (obj.event === 'delete') {
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
