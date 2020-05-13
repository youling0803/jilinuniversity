<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SelfMessage.aspx.cs" Inherits="JilinUniversity.user.SelfMessage" %>

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
    <link href="../css/searchStyle.css" rel="stylesheet" />
    <%--<link type="text/css" href="../css/login/password.css" rel="stylesheet" />--%>
    <script src="../js/jquery.min.js"></script>
    <script src="../js/tablebase.js"></script>
    <script src="../js/xcConfirm.js"></script>
    <script src="../js/alert.js"></script>
    <script src="../js/cookie.js"></script>
    <script src="../js/showHide.js"></script>

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

        //function deleteclick() {
        //    var hiddenbuttonOffdata = document.getElementById("hiddenbuttonOffdata");
        //    hiddenbuttonOffdata.click();
        //}

    </script>
    <script type="text/javascript">
		var btns = document.getElementsByClassName("top-navs");
		var subnavs = document.getElementsByClassName("top-navlist");
		var titleNavs = document.getElementsByClassName("title-navs");
		var titleOptions = document.getElementsByClassName("title-option");
		var tableSort = document.getElementsByClassName("table-sort");
		//var imgs = document.getElementById('imgs').src;
		window.onload = function() {
			showHide(btns, subnavs);
			showHide(titleNavs, titleOptions);
			Onclick(tableSort);
			
		}
	</script>
</head>
<body>
    <div class="content_top">
        <div class="position">
            <div class="position_content">
                <i class="glyphicon glyphicon-home" style="cursor: pointer;"></i>
                <span>></span>
                <span>个人信息</span>
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
            <%--<input type="button" id="hiddenbuttonOffdata" runat="server" onserverclick="hiddenbuttonOffdata_Click" style="display: none" />--%>

            <div class="modal fade" id="myModal" tabindex="-1" role="dialog" runat="server" aria-labelledby="myModalLabel" aria-hidden="true" data-backdrop="static" data-keyboard="false">
                <div class="modal-dialog" style="width: 40%; margin-top: 100px">
                    <div class="modal-content">
                        <div class="modal-header">
                            <!-- 右侧 退出 按钮-->
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                                &times;</button>
                            <h4 class="modal-title" id="myModalLabel">填写申请作废的原因
                            </h4>
                        </div>
                        <div id="divDepart" class="modal-body" runat="server">
                            <table class="table table-bordered">
                                <tr>
                                    <td class="tit" style="height: 50px;">作废原因<span class="star">*</span></td>
                                    <td>
                                        <input type="text" class="reg_sign" runat="server" style="height: 100px;" id="InvalidReason" name="backReason" />
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
