<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="JilinUniversity.Home" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <title>主页</title>
    <link href="css/home.css" rel="stylesheet" />
    <link href="css/easyui.css" rel="stylesheet" />
    <link href="css/jquery-accordion-menu.css" rel="stylesheet" />
    <script src="js/jquery.min.js"></script>
    <script type="text/javascript" src="js/html5shiv.js"></script>
    <script src="js/jquery.easyui.min.js"></script>
    <script src="js/jquery-accordion-menu.js"></script>
    <script>
        function addTab(title, url) {
            if ($('#tt').tabs('exists', title)) {
                $('#tt').tabs('select', title);
            } else {
                var height = $(document).height();
                var content_height = height;
                var lala = content_height - 40;
                var styles = "width:100%;height:" + lala + "px";
                var content = '<iframe scrolling="yes" frameborder="0"  src="' + url + '" style="' + styles + '"></iframe>';
                $('#tt').tabs('add', {
                    title: title,
                    content: content,
                    closable: true
                });
            }
        }
        function tabsClose() {
            var tab = $('#tt').tabs('getSelected');//获取当前选中tabs  
            var index = $('#tt').tabs('getTabIndex', tab);//获取当前选中tabs的index  
            $('#tt').tabs('close', index);//关闭对应index的tabs  
        }
    </script>
    <style type="text/css">
        .auto-style1 {
            left: 0;
            top: 41px;
            bottom: -20px;
        }

        .auto-style2 {
            position: absolute;
            left: 202px; /*top: 35px;*/
            top: 45px;
            right: 0;
            bottom: 0;
            overflow: hidden;
            min-width: 1100px;
            width: auto;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="logo3" style="background-color: cornflowerblue">
            <div style="margin: 1px auto; width: 300px; color: aqua">
                <%--<img src="image/background" style="width: 400px;position:center" />--%>
            </div>
            <a href="Login.aspx" class="rightup" style="color: black">退出登录</a>
        </div>
        <div>
            <aside id="box_left">
                <div class="picture">
                    <img src="image/background.jpg" style="width: 80%; height: 80%; margin-left: 10%;" />
                    <div class="username" style="text-align: center">
                        <h5>用户名：<b><asp:Label runat="server" ID="Label_userName" Text=""></asp:Label></b></h5>
                    </div>
                </div>
                <div>
                    <div id="jquery-accordion-menu" class="jquery-accordion-menu red">
                        <ul id="demo_list" runat="server">
                        </ul>
                    </div>
                </div>
            </aside>
            <section class="auto-style2" id="box_right">
                <div class="con">
                    <div id="tt" class="easyui-tabs">
                        <div title="主页">
                        </div>
                    </div>
                </div>
            </section>
        </div>
    </form>
</body>
</html>
