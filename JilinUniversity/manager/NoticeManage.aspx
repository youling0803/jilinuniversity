<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="NoticeManage.aspx.cs" Inherits="JilinUniversity.manager.NoticeManage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <link href="../css/gridviewStyle.css" rel="stylesheet" />
    <link href="../css/gridview.css" rel="stylesheet" />
    <link href="../css/tableBase.css" rel="stylesheet" />
    <link href="../css/bootstrap.min.css" rel="stylesheet" />
    <link href="../css/xcConfirm.css" rel="stylesheet" />
    <%--<link type="text/css" href="../css/login/password.css" rel="stylesheet" />--%>
    <script src="../js/jquery.min.js"></script>
    <script src="../js/tablebase.js"></script>
    <script src="../js/xcConfirm.js"></script>
    <script src="../js/alert.js"></script>
    <script src="../js/cookie.js"></script>

    <%-- 中英文切换--%>
    <script src="../js/jquery.min.js"></script>
    <script type="text/javascript" src="../js/i18next-1.6.3.min.js"></script>
    <%-- 控制表格中全选按钮的位置--%>
    <script type="text/javascript">
        function SelectAlles(spanChk) {
            elm = document.forms[0];

            for (i = 0; i < elm.length; i++) {
                if (elm[i].type == "checkbox" && elm[i].id != spanChk.id) {
                    if (elm.elements[i].checked != spanChk.checked)
                        elm.elements[i].click();
                }
            }
        }

        function shownewsclick() {
            var shownews = document.getElementById("shownews");
            shownews.click();
        }
        function clickNews(i) {
            document.getElementById("<%= HiddenFieldDetail.ClientID %>").value = i;
            shownewsclick();
        }

    </script>
</head>
<body>
    <div class="content_top">
        <div class="position">
            <div class="position_content">
                <i class="glyphicon glyphicon-home" style="cursor: pointer;"></i>
                <span>></span>
                <span>公告管理</span>
            </div>
            <div class="position_bottom">
                <a onclick="renovates()" data-i18n="General.refresh">刷新</a>
                <i class="glyphicon glyphicon-repeat" style="cursor: pointer; color: #32e184" onclick="renovates()"></i>&nbsp&nbsp&nbsp
           <a onclick="close_tab()" data-i18n="General.close">关闭</a>
                <i class="glyphicon glyphicon-remove" style="cursor: pointer; color: #e13233" onclick="close_tab()"></i>
            </div>
        </div>
    </div>
    <form id="Form" runat="server" method="post">
        <div class="tab-content table_num">

            <asp:HiddenField ID="HiddenFieldDetail" runat="server" />
            <input type="button" id="shownews" runat="server" onserverclick="ShowNews_ServerClick" style="display: none" />
            <div class="functionbtn">
                <span>
                    <button type="button" class="btn btn-primary btnpos" runat="server" id="add" onchange="jump(this);" onserverclick="NewAddNotice">
                        新增公告
                    <span class="glyphicon glyphicon-plus"></span>
                    </button>
                </span>
            </div>
            <div>
                <div>
                    <%--搜索框--%>
                </div>
                <div>
                    <ul id="notice_list" runat="server">
                        <%--<li><a onclick="clickNews(4)" href="#">测试用连接</a></li>--%>
                    </ul>
                </div>
            </div>

            <div class="modal fade" id="myModal" tabindex="-1" role="dialog" runat="server" aria-labelledby="myModalLabel" aria-hidden="true" data-backdrop="static" data-keyboard="false">
                <div class="modal-dialog" style="width: 40%; margin-top: 100px">
                    <div class="modal-content">
                        <div class="modal-header">
                            <!-- 右侧 退出 按钮-->
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                                &times;</button>
                            <h4 class="modal-title" id="myModalLabel">公告管理
                            </h4>
                        </div>
                        <div id="divDepart" class="modal-body" runat="server">
                            <table class="table table-bordered">
                                <tr>
                                    <td class="tit" style="height: 50px;">标题<span class="star"></span></td>
                                    <td>
                                        <input type="text" class="reg_sign" runat="server" maxlength="20" id="UsrName" name="backReason" />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="tit" style="height: 50px;">内容<span class="star"></span></td>
                                    <td>
                                        <input type="text" class="reg_sign" runat="server" maxlength="200" id="Pwd" name="backReason" />
                                    </td>
                                </tr>
                            </table>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-primary" data-dismiss="modal">
                                    关闭
                                </button>
                                <button type="button" class="btn btn-primary" runat="server" id="savebutton" onserverclick="GetReason_Invalid">
                                    提交
                                </button>
                            </div>
                        </div>
                        <!-- /.modal-content -->
                    </div>
                    <!-- /.modal -->
                </div>
            </div>
            <script src="../js/jquery.min.js"></script>
            <script src="../js/bootstrap.min.js"></script>
            <script type="text/javascript">
                function show_modal() {
                    //alert(1);
                    $('#myModal').modal("show");

                    //禁用enter键
                    $(document).keydown(function (event) {
                        if (event.keyCode == 13) {
                            $('form').each(function () {
                                event.preventDefault();
                            });
                        }
                    });
                }
            </script>
        </div>
    </form>
</body>
</html>
