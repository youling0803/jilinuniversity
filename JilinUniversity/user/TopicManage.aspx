<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TopicManage.aspx.cs" Inherits="JilinUniversity.user.TopicManage" %>

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
                <span>课题管理</span>
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
            <div class="functionbtn">
                <span>
                    <button type="button" class="btn btn-info btnpos" runat="server" id="add" onchange="jump(this);" onserverclick="NewAddTopic" style="background-color:#3383b4;border:1px solid #3383b4;">
                        新增课题申请
                    <span class="glyphicon glyphicon-plus"></span>
                    </button>
                </span>
            </div>
            <div>
                <%--可能会修改，实现难度较大--%>
                <div class="person-list-title" style="background-color:#3383b4;">
                    <span>查询条件</span>
                    <ul class="title-select">
                        <li class="title-navs">
                            <input type="text" id="ktStateSort" name="ktStateSort" style="visibility: hidden; display: none" value="0">
                            <a class="title-link">状态 : 全部</a>
                            <ul class="title-option" style="display: none;">
                                <li><a href="#" onclick="javascript:queryState('1');">编辑中</a></li>
                                <li><a href="#" onclick="javascript:queryState('2');">审核中</a></li>
                                <li><a href="#" onclick="javascript:queryState('3');">已结题</a></li>
                                <li><a href="#" onclick="javascript:queryState('4');">审核通过</a></li>
                                <li><a href="#" onclick="javascript:queryState('5');">审核不通过</a></li>
                                <li><a href="#" onclick="javascript:queryState('0');">全部</a></li>
                            </ul>
                        </li>
                    </ul>
                    <ul class="title-select">
                        <li class="title-navs">
                            <input type="text" id="ktRoleSort" name="ktRoleSort" style="visibility: hidden; display: none" value="0">
                            <a class="title-link">角色 : 全部</a>
                            <ul class="title-option" style="display: none;">
                                <li><a href="#" onclick="javascript:queryRole(1);">课题负责人</a></li>
                                <li><a href="#" onclick="javascript:queryRole(2);">课题参与人</a></li>
                                <li><a href="#" onclick="javascript:queryRole(0);">全部</a></li>
                            </ul>

                        </li>
                    </ul>
                </div>
                <asp:GridView ID="GridViewDetection" runat="server" AllowPaging="True" AutoGenerateColumns="False" Width="100%" PageSize="5" Font-Size="10pt" CssClass="mGrid"
                    DataKeyNames="ID"
                    OnDataBound="GridViewDetection_DataBound"
                    OnRowDataBound="GridViewDetection_RowDataBound"
                    OnPageIndexChanging="GridViewDetection_PageIndexChanging" BorderColor="#C1C1C1">
                    <%-- 样式设定 --%>
                    <AlternatingRowStyle BackColor="#F9F9F9" HorizontalAlign="Left" VerticalAlign="Middle" />
                    <Columns>
                        <%-- 全选列 --%>
                        <asp:TemplateField>
                            <HeaderTemplate>
                                <asp:CheckBox ID="CheckAll" runat="server" Text="" AutoPostBack="False" onclick="SelectAllCheckboxes(this)" />
                            </HeaderTemplate>
                            <ItemTemplate>
                                <asp:CheckBox ID="CheckBox" runat="server" />
                                <asp:Label ID="CBCheck" Text='<%# Eval("ID") %>' Visible="false" runat="server"></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle VerticalAlign="Middle" />
                            <ItemStyle HorizontalAlign="Center" Width="70px" />
                        </asp:TemplateField>

                        <%--                        <asp:TemplateField HeaderText="id" Visible="false">
                            <ItemTemplate>
                                <asp:Label Text='<%# Eval("DelID")%>' runat="server"></asp:Label>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:TemplateField>--%>

                        <asp:TemplateField HeaderText="课题编码">
                            <ItemTemplate>
                                <asp:Label ID="LabelTopicCode" Text='<%# Eval("TopicCode") %>' runat="server" CssClass="mlength4"></asp:Label>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:TemplateField>


                        <asp:TemplateField HeaderText="课题PDF文件">
                            <ItemTemplate>
                                <asp:Label ID="LabelPDFFile" Text='<%# Eval("PDFFile") %>' runat="server" CssClass="mlength"></asp:Label>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="课题名">
                            <ItemTemplate>
                                <asp:Label ID="LabelTopicName" Text='<%# Eval("TopicName") %>' runat="server" CssClass="mlength"></asp:Label>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="申请设施">
                            <ItemTemplate>
                                <asp:Label ID="LabelFacilityName" Text='<%# Eval("FacilityName") %>' runat="server" CssClass="mlength"></asp:Label>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="线站/设备/终端">
                            <ItemTemplate>
                                <asp:Label ID="LabelEquipment" Text='<%# Eval("Equipment")%>' runat="server" CssClass="mlength"></asp:Label>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="角色">
                            <ItemTemplate>
                                <asp:Label ID="LabelUserRole" Text='<%# Eval("UserRole")%>' runat="server" CssClass="mlength"></asp:Label>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="审核状态">
                            <ItemTemplate>
                                <asp:Label ID="LabelAuditStatus" Text='<%# Eval("AuditStatus")%>' runat="server" CssClass="mlength"></asp:Label>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:TemplateField>


                        <asp:TemplateField HeaderText="批复机时">
                            <ItemTemplate>
                                <asp:Label ID="LabelApprovedTime" Text='<%# Eval("ApprovedTime")%>' runat="server" CssClass="mlength"></asp:Label>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="剩余机时">
                            <ItemTemplate>
                                <asp:Label ID="LabelLeftTime" Text='<%# Eval("LeftTime") %>' runat="server" CssClass="mlength"></asp:Label>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="到期日">
                            <ItemTemplate>
                                <asp:Label ID="LabelEndDate" Text='<%# Bind("EndDate","{0:yyyy/MM/dd}")%>' runat="server" CssClass="mlength2"></asp:Label>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="操作">
                            <ItemTemplate>
                                <asp:LinkButton ID="LBedit" runat="server" CausesValidation="False" CommandName="Edit" ForeColor="#3486B8" CommandArgument='<%# Eval("ID")%>' OnCommand="LBdownload_Command" Text="编辑"></asp:LinkButton>
                                <asp:LinkButton ID="LBcheck" runat="server" CausesValidation="False" CommandName="Select" ForeColor="#3486B8" CommandArgument='<%# Eval("ID")%>' OnCommand="LBdownload_Command" Text="提交"></asp:LinkButton>
                                <asp:LinkButton ID="LBdelete" runat="server" CausesValidation="False" CommandName="Offdata" ForeColor="#3486B8" CommandArgument='<%# Eval("ID")%>' OnCommand="LBdownload_Command" Text="删除"></asp:LinkButton>
                                <asp:LinkButton ID="LBdownload" runat="server" CausesValidation="False" CommandName="Download" ForeColor="#3486B8" CommandArgument='<%# Eval("ID")%>' OnCommand="LBdownload_Command" Text="复制课题"></asp:LinkButton>
                            </ItemTemplate>
                            <ControlStyle Width="56px" />
                            <ItemStyle ForeColor="#0066CD" HorizontalAlign="Center" Width="250px" />
                        </asp:TemplateField>
                    </Columns>

                    <%--数据显示的列结束--%>
                    <%-- 分页行 --%>
                    <PagerTemplate>
                        <table class="pos">
                            <tr id="pos">
                                <td style="white-space: nowrap; border: none;"><span>第</span><asp:Label ID="lblPageIndex" runat="server" Text="<%#((GridView)Container.Parent.Parent).PageIndex + 1 %>"></asp:Label>页  
                                        共<asp:Label ID="Label1" runat="server" Text="<%# ((GridView)Container.Parent.Parent).PageCount %>"></asp:Label>页   
                                        <asp:LinkButton ID="btnFirst" runat="server" CausesValidation="False" CommandArgument="First" CommandName="Page" Visible='<%#((GridView)Container.NamingContainer).PageIndex != 0 %>' Text="首页"></asp:LinkButton>
                                    <asp:LinkButton ID="btnPrev" runat="server" CausesValidation="False" CommandArgument="Prev"
                                        CommandName="Page" Visible='<%# ((GridView)Container.NamingContainer).PageIndex != 0 %>' Text="上一页"></asp:LinkButton>
                                    <asp:LinkButton ID="btnNext" runat="server" CausesValidation="False" CommandArgument="Next"
                                        CommandName="Page" Visible='<%# ((GridView)Container.NamingContainer).PageIndex != ((GridView)Container.NamingContainer).PageCount - 1 %>' Text="下一页"></asp:LinkButton>
                                    <asp:LinkButton ID="btnLast" runat="server" CausesValidation="False" CommandArgument="Last"
                                        CommandName="Page" Visible='<%# ((GridView)Container.NamingContainer).PageIndex != ((GridView)Container.NamingContainer).PageCount - 1 %>' Text="尾页"></asp:LinkButton>
                                </td>
                            </tr>
                        </table>
                    </PagerTemplate>
                    <%-- 分页行结束 --%>
                    <%-- 样式设定 --%>
                    <PagerStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                    <EditRowStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                    <HeaderStyle BackColor="#eff1f0" Height="40px" HorizontalAlign="Center" VerticalAlign="Middle" Font-Italic="False" />
                    <RowStyle Height="32px" HorizontalAlign="Left" VerticalAlign="Middle" ForeColor="black" />
                    <AlternatingRowStyle BackColor="#eff1f0" />
                    <%-- 样式设定结束 --%>
                </asp:GridView>
            </div>

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
