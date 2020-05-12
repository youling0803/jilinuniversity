<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="JilinUniversity.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>登录</title>
    <link href="css/UserLogin.css" rel="stylesheet" type="text/css" />
    <link href="../css/xcConfirm.css" rel="stylesheet" />
    <link href="../css/bootstrap.min.css" rel="stylesheet" />
    <script src="../js/jquery.min.js"></script>
    <script src="../js/bootstrap.min.js"></script>
    <script src="../js/xcConfirm.js"></script>
    <script src="../js/alert.js"></script>
    <style>
        /*#all body {
            -moz-background-size: cover;
            -webkit-background-size: cover;
            -o-background-size: coverl;
        }*/

        #LoginBox div {
            -webkit-box-sizing: content-box;
            -moz-box-sizing: content-box;
            box-sizing: content-box;
        }
    </style>

</head>
<script language="javascript" type="text/javascript">
    function SetCode() {
        var obj = document.getElementById("CodeImg");
        obj.src = obj.src + '?';
    }
</script>
<body id="all" style="background: url('image/login.jpg') no-repeat; background-size: cover;">
    <form runat="Server" defaultbutton="LoginBtn">
        <div>
            <div id="login-box">
                <center>
            <!--<div >
                <img src="image/title.png" class="title" style="position:center"/>
             </div>-->
                </center>
                <div style="background-color:#FFFFFF; padding-top: -5px; height:300px;width:350px; margin-top:50px;position:absolute;top:20%;left:0;right:0;margin:0 auto;" id="LoginBox" ; >
                    <!--<div style="float: right; width: 360px; padding-right: 80px; padding-top: 80px;">-->
                        <div class="login-div-display">
                        </div>
                        <div class="login-div-display">
                            <div id="div2" class="login-title-div">
                                用户帐号:
                            </div>
                            <div id="div3" class="login-input-div">
                                <asp:TextBox ID="mUserNameTbx" runat="server"></asp:TextBox>
                                <%--<input name="q" title="Username" value="" />--%>
                            </div>
                        </div>
                        <div class="login-div-display">
                            <div id="div4" class="login-title-div">
                                密码:
                            </div>
                            <div id="div5" class="login-input-div">
                                <asp:TextBox ID="mPassWordTbx" runat="server" TextMode="Password"></asp:TextBox>
                            </div>
                        </div>
                        <br />
                        <br />
                       <br />
                       <br />
                    <br />
                       <br />
                        <div class="login-div-display" style="vertical-align: middle;">
                            <div style=" text-align: right; width: 100%" padding-left:"120px" class="login-div-footer">
                              <!-- <input type="button" value="登录" runat="server" onclick="window.location.href('Home.aspx')"/>-->
                                <asp:Button ID="LoginBtn" runat="server" Text="登录" OnClick="LoginBtn_Click" Width="300px" BackColor="#1C94D1" ForeColor="white"
                                    Font-Size="Large"
                                    font-weight="400" boder-radius="50px" BorderWidth="0px" Height="35px"  />
                            </div>
                            <%-- <div style="float: right; text-align: center; vertical-align: middle; width: 50%"
                            class="login-div-footer">
                            <asp:Button ID="mCancleBtn" runat="server" Text="重置" OnClick="mCancleBtn_Click" />
                            <%--<input type="button" value="重置" />
                        </div>--%>
                        </div>
                    </div>
                </div>
            </div>
            <%--版权提示--%>
           <!-- <div id="login-footer">
                不建议使用360安全浏览器及谷歌浏览器
            </div>-->
        </div>
    </form>
</body>
</html>
