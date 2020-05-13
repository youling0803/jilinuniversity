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
                 <div style="width:430px;">
                    <h1 align="center" style="color:#fff;position:absolute;left:0;right:0;margin:0 auto;font-size:50px;font-family:STXingkai">用户登录</h1>
                 </div>
                 <div style=" padding-top: -5px; height:370px;width:430px;border:1px solid rgba(255,255,255,1); background-color: rgba(255, 255, 255, 0.3); margin-top:50px;position:absolute;top:20%;left:0;right:0;margin:0 auto;" id="LoginBox" ; > 
                        <div class="login-div-display" >
                           <div id="div2" class="login-title-div" style="padding-top:12%;color:#fff;font-size:18px;">
                                <p>用户帐号:</p>
                            </div>
                            <div id="div3" class="login-input-div" style="padding-top:10%;">
                                <asp:TextBox ID="mUserNameTbx" runat="server" Style="width: 280px; height: 40px; border-radius: 3px; background-color: #E8F0FE; font-size: 18px; text-align:center" BorderStyle="None"></asp:TextBox>
                            </div>
                        </div>
                        <div class="login-div-display">
                           <div id="div4" class="login-title-div"style="padding-top:12%;color:#fff;font-size:18px;">
                               <p> 用户密码:</p>
                            </div>
                            <div id="div5" class="login-input-div" style="padding-top:10%;">
                                <asp:TextBox ID="mPassWordTbx" runat="server" TextMode="Password" Style="width: 280px; border-radius: 3px; height: 40px; background-color: #E8F0FE; font-size: 18px; font-size: 16px; text-align:center"  BorderStyle="None"></asp:TextBox>
                                </div>
                            </div>
                        <div class="login-div-display" style="vertical-align: middle;">
                            <div style="text-align: right; width: 100%" padding-left:"120px" class="login-div-footer">
                              <!-- <input type="button" value="登录" runat="server" onclick="window.location.href('Home.aspx')"/>-->
                                <div style="float:right;padding-top:10%;padding-right:40px">
                                    <asp:Button ID="LoginBtn" runat="server" Text="登录" OnClick="LoginBtn_Click"  BorderStyle="None" style="border-radius:3px;color:#FFFFFF;background-color:#0AADE9;width:150px;height:40px;font-size:18px;" />
                                </div>
                                <div  style="float:left;padding-top:10%;padding-left:30px">
                                <asp:Button ID="LoginBtn2" runat="server" Text="管理员" OnClick="LoginBtn2_Click" BorderStyle="None" style="border-radius:3px;color:#FFFFFF;background-color:#0AADE9;width:150px;height:40px;font-size:18px;" />
                                </div>
                            </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
