<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="NoticeEdit.aspx.cs" Inherits="HelloLLLLL.Blog.Admin.page.table.NoticeEdit" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8"/>
    <title>layui</title>
    <meta name="renderer" content="webkit"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1"/>
    <link rel="stylesheet" href="../../lib/layui-v2.5.5/css/layui.css" media="all"/>
    <link rel="stylesheet" href="../../css/public.css" media="all"/>
    <style>
        body {
            background-color: #ffffff;
        }
    </style>
</head>
<body>
<div class="layui-form layuimini-form">
    <div class="layui-form-item" style="width: 350px;">
        <label class="layui-form-label required">公告标题</label>
        <div class="layui-input-block" >
            <input type="hidden" id="noticeId" value="" name="noticeId" />
            <input type="text" id="noticeTitle" name="NoticeTitle"  lay-verify="required" lay-reqtext="用户名不能为空" placeholder="请输入标题" value="" class="layui-input"/>
            <tip>填写自己管理账号的名称。</tip>
        </div>
    </div>
    <div class="layui-form-item">
                    <label class="layui-form-label">公告日期</label>
                    <div class="layui-input-inline">
                        <input type="text" id="noticeTime" name="DataStart"  lay-verify="date" placeholder="yyyy-MM-dd" autocomplete="off" class="layui-input"/>
                    </div>
                </div>
    <div id="editor" style="margin: 50px 0 50px 0">
            <p>欢迎使用 <b>wangEditor</b> 富文本编辑器</p>
        </div>

    <div class="layui-form-item">
        <div class="layui-input-block">
            <button class="layui-btn layui-btn-normal" lay-submit lay-filter="saveBtn">确认保存</button>
        </div>
    </div>
</div>

<script src="../../lib/layui-v2.5.5/layui.js" charset="utf-8"></script>
<script src="../../js/lay-config.js?v=1.0.4" charset="utf-8"></script>
<script>
    layui.use(['form', 'wangEditor', 'layer', 'laydate'], function () {
        var form = layui.form,
            layer = layui.layer,
            wangEditor = layui.wangEditor,
            laydate = layui.laydate,
            $ = layui.$;

       var id= $("#noticeId").val();
        if (id != "" || id >= "0") {
            $("#noticeTime").attr("readonly", "readonly");
        } else {
            laydate.render({
                elem: '#noticeTime'
            });
        }
         var  editor = new wangEditor('#editor');
        editor.customConfig.uploadImgServer = "/admin/AdminPostData.ashx?action=uploadImg";
        //editor.customConfig.uploadFileName = 'image';
        editor.customConfig.pasteFilterStyle = false;
        editor.customConfig.uploadImgMaxSize = 10 * 1024 * 1024;
        editor.customConfig.uploadImgMaxLength = 5;
        editor.customConfig.uploadImgHooks = {
            // 上传超时
            timeout: function (xhr, editor) {
                layer.msg('上传超时！')
            },
            // 如果服务器端返回的不是 {errno:0, data: [...]} 这种格式，可使用该配置
            customInsert: function (insertImg, result, editor) {
                console.log(result);
                if (result.code == 1) {
                    var url = result.data;
                    url.forEach(function (e) {
                        insertImg(e);
                    })
                } else {
                    layer.msg(result.msg);
                }
            }
        };
        editor.customConfig.customAlert = function (info) {
            layer.msg(info);
        };
        editor.create();



        //监听提交
        form.on('submit(saveBtn)', function (data) {

            var content = editor.txt.html();
            data.field.NoticeContent = content;


            $.ajax(
                {
                    url: "/Admin/AdminPostData.ashx?action=noticeAE",
                    type: "post",
                    data: data.field,
                    dataType: "JSON",
                    success: function (dd) {
                        console.log(dd.IsOk);

                        if (dd.IsOk == "Ok") {
                            layer.alert(dd.msg, { title: '操作提示'},function () {
                                // 关闭弹出层
                                layer.close(index);

                                var iframeIndex = parent.layer.getFrameIndex(window.name);
                                parent.layer.close(iframeIndex);
                            });
                        }
                        else {
                            //layer.msg(dd.msg);
                        }
                    }

                }
            )



            var index = layer.alert(JSON.stringify(data.field), {
                title: '最终的提交信息'
            }, function () {

               

            });

            return false;
        });

    });
</script>
</body>
</html>
