<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ArticleOp.aspx.cs" Inherits="HelloLLLLL.Blog.Admin.page.table.ArticleOp" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8" />
    <title>layui</title>
    <meta name="renderer" content="webkit" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
    <link rel="stylesheet" href="../../lib/layui-v2.5.5/css/layui.css" media="all" />
    <link rel="stylesheet" href="../../css/public.css" media="all" />
    <script src="../../lib/jquery-3.4.1/jquery-3.4.1.min.js"></script>
    <script src="/kindEditor/kindeditor-all-min.js"></script>
    <style>
        body {
            background-color: #ffffff;
        }
    </style>
    <script>
        $(function () {
            $.fn.serializeObject = function () {
                var o = {};
                var a = this.serializeArray();
                var $radio = $('input[type=radio],input[type=checkbox]', this);
                var temp = {};

                $.each(a, function () {
                    if (o[this.name] !== undefined) {
                        if (!o[this.name].push) {
                            o[this.name] = [o[this.name]];
                        }
                        o[this.name].push(this.value || '');
                    } else {
                        o[this.name] = this.value || '';
                    }
                });

                $.each($radio, function () {
                    if (!temp.hasOwnProperty(this.name)) {
                        if ($("input[name='" + this.name + "']:checked").length == 0) {
                            temp[this.name] = "";
                            if (o[this.name] !== undefined) {
                                if (!o[this.name].push) {
                                    o[this.name] = [o[this.name]];
                                }
                                o[this.name].push('');
                            } else {
                                o[this.name] = '';
                            }
                        }
                    }
                });
                return o;
                //console.log(a);
                //return jQuery.param(a);
            }
        })


        KindEditor.ready(function (K) {
            window.editor = K.create('#content1', {
                cssPath: '/kindEditor/plugins/code/prettify.css',
                uploadJson: '/admin/AdminPostData.ashx?action=uploadImg1',
                fileManagerJson: '/admin/AdminPostData.ashx?action=uploadFile',
                allowFileManager: false
            });
        });
    </script>
</head>
<body>
    <div class="layui-form layuimini-form">
        <form id="artForm">
            <div class="layui-form-item">
                <label class="layui-form-label required">文章标题</label>
                <div class="layui-input-block">
                    <input type="hidden" id="artId" value="" name="ArtId" />
                    <input type="text" id="artTitle" name="ArtTitle" lay-verify="required" lay-reqtext="标题不能为空" placeholder="请输入标题" value="" class="layui-input" />
                </div>
            </div>

            <textarea id="content1" style="width: 90%; height: 250px; visibility: hidden;"></textarea>

            <div class="layui-form-item">
                <label class="layui-form-label">文章类别</label>
                <div class="layui-input-block">
                    <%--<input type="checkbox" name="ArtType" title="写作" value="1"/>
      <input type="checkbox" name="ArtType" title="阅读" value="2"/>
      <input type="checkbox" name="ArtType" title="发呆" value="3"/>--%>
                    <% for (int j = 0; j < ListType.Count; j++){%>
                    <%if (null!=ListSelectType&&ListSelectType.Contains(ListType[j].Id))
                        {%>
                    <input type="checkbox" name="ArtType" title="<%=ListType[j].TypeName %>" value="<%=ListType[j].Id%>" checked="checked"/>
                    <%}else{ %>
                    <input type="checkbox" name="ArtType" title="<%=ListType[j].TypeName %>" value="<%=ListType[j].Id%>" />
                    <%}%>
                    <%} %>
                </div>
            </div>


            <div class="layui-form-item layui-form-text">
                <label class="layui-form-label">文章摘要</label>
                <div class="layui-input-block">
                    <textarea placeholder="请输入内容" id="digest" name="Digest" class="layui-textarea"></textarea>
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label required">密码保护</label>
                <div class="layui-input-block">

                    <input type="text" name="ArtPwd" id="artPwd" placeholder="请输入阅读密码" value="" class="layui-input" />
                </div>
            </div>

            <div class="layui-form-item">
                <div class="layui-input-block">
                    <button class="layui-btn layui-btn-normal" lay-submit lay-filter="saveBtn">确认保存</button>
                </div>
            </div>
        </form>
    </div>

    <script src="../../lib/layui-v2.5.5/layui.js" charset="utf-8"></script>
    <script src="../../js/lay-config.js?v=1.0.4" charset="utf-8"></script>

    <script>


        layui.use(['form', 'layer', 'laydate'], function () {
            var form = layui.form,
                layer = layui.layer,
                laydate = layui.laydate,
                $ = layui.$;

            //监听提交
            form.on('submit(saveBtn)', function (data) {

                var obj = $("#artForm").serializeObject();
                obj.Content = window.editor.html();
                var arr = obj.ArtType;
                if (arr != null && arr != undefined && arr != "") {
                    str = arr.join(',');
                    obj.ArtType = str;
                }
                //    alert(JSON.stringify(obj));
                //    var index = layer.alert(JSON.stringify(obj), {
                //        title: '最终的提交信息'
                //    }, function () {
                //});
                $.ajax(
                    {
                        url: "/Admin/AdminPostData.ashx?action=ArticleAE",
                        type: "post",
                        data: obj,
                        dataType: "JSON",
                        success: function (dd) {
                            console.log(dd.IsOk);

                            if (dd.IsOk == "Ok") {
                                layer.alert(dd.msg, { title: '操作提示' }, function () {
                                    window.close();
                                });
                            }
                            else {
                                layer.msg(dd.msg);
                            }
                        }
                    }
                )
                return false;
            });

        });
    </script>
</body>
</html>

