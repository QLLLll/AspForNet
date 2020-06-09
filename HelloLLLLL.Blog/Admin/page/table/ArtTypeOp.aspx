<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ArtTypeOp.aspx.cs" Inherits="HelloLLLLL.Blog.Admin.page.table.ArtTypeOp" %>

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
<div style="width: 650px; position: relative; left:25%;">
<div class="layui-form layuimini-form">
    <div class="layui-form-item">
        <label class="layui-form-label required">分类名称</label>
        <div class="layui-input-block" >
            <input type="hidden" id="typeId" value="" name="TypeId" />
            <input type="text" id="typeTitle" name="TypeTitle"  lay-verify="required" lay-reqtext="名称不能为空" placeholder="请输入名称" value="" class="layui-input"/>            
        </div>
    </div>
     <div class="layui-form-item layui-form-text">
                <label class="layui-form-label">分类描述</label>
                <div class="layui-input-block">
                    <textarea placeholder="请输入内容" id="typeDetail" name="TypeDetail" class="layui-textarea"></textarea>
                </div>
            </div>
    <div class="layui-form-item" >
                <label class="layui-form-label">是否可见</label>
                <div class="layui-input-block">
                    <select name="TypeIsHidden" id="typeIsHidden" lay-filter="aihao">
                        <option value=""></option>
                        <option value="0"selected="selected">显示</option>
                        <option value="1" >隐藏</option>                        
                    </select><div class="layui-unselect layui-form-select"><div class="layui-select-title"><input type="text" placeholder="请选择" value="阅读" readonly="" class="layui-input layui-unselect"><i class="layui-edge"></i></div><dl class="layui-anim layui-anim-upbit"><dd lay-value="" class="layui-select-tips">请选择</dd><dd lay-value="0" class="">写作</dd><dd lay-value="1" class="layui-this">阅读</dd><dd lay-value="2" class="">游戏</dd><dd lay-value="3" class="">音乐</dd><dd lay-value="4" class="">旅行</dd></dl></div>
                </div>
            </div>
    <div class="layui-form-item">
                    <label class="layui-form-label">创建日期</label>
                    <div class="layui-input-inline">
                        <input type="text" id="typeCTime" name="TypeCTime"  lay-verify="datetime" placeholder="yyyy-MM-dd" autocomplete="off" class="layui-input"/>
                    </div>
                </div>
    <div class="layui-form-item">
        <div class="layui-input-block">
            <button class="layui-btn layui-btn-normal" lay-submit lay-filter="saveBtn">确认保存</button>
        </div>
    </div>
</div>
</div>
<script src="../../lib/layui-v2.5.5/layui.js" charset="utf-8"></script>
<script src="../../js/lay-config.js?v=1.0.4" charset="utf-8"></script>
<script>
    layui.use(['form',  'layer', 'laydate'], function () {
        var form = layui.form,
            layer = layui.layer,          
            laydate = layui.laydate,
            $ = layui.$;

       var id= $("#typeId").val();
        if (id != "" || id >= "0") {
            $("#typeCTime").attr("readonly", "readonly");
        } else {
            laydate.render({
                elem: '#typeCTime'
                , type: 'datetime'
            });
        }
      
        //监听提交
        form.on('submit(saveBtn)', function (data) {
            $.ajax(
                {
                    url: "/Admin/AdminPostData.ashx?action=artTypeAE",
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
                                parent.

                            });
                        }
                        else {
                            layer.msg(dd.msg);
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
